package com.dfyoi.platform.shiro;

import java.util.Collection;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.apache.shiro.util.ByteSource;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.springframework.stereotype.Component;

import com.dfyoi.admin.pojo.SysPower;
import com.dfyoi.admin.pojo.SysUser;
import com.dfyoi.admin.service.SysPowerService;
import com.dfyoi.admin.service.SysUserService;

@Component
public class AdminUserRealm extends AuthorizingRealm {
	private SysUserService userService;
	private SysPowerService powerService;

	public SysUserService getUserService() {
		return userService;
	}

	public void setUserService(SysUserService userService) {
		this.userService = userService;
	}

	public SysPowerService getPowerService() {
		return powerService;
	}

	public void setPowerService(SysPowerService powerService) {
		this.powerService = powerService;
	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
		// 获取登录时输入的用户名
		String loginName = (String) principalCollection.fromRealm(getName()).iterator().next();
		// 到数据库查是否有此对象
		SysUser user = userService.getUserByUserName(loginName);
		if (user != null) {
			// 权限信息对象info,用来存放查出的用户的所有的角色（role）及权限（permission）
			SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
			// 用户的角色集合 
			info.addRole(user.getRoleName());
			// 用户的角色对应的所有权限，如果只使用角色定义访问权限，下面的四行可以不要,1代表是功能
			List<SysPower> listPower = powerService.listPowerByRoleSym(user.getRoleSym(), 1);
			for (SysPower power : listPower) {
				info.addStringPermission(power.getSym());
			}
			return info;
		}
		return null;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken)
			throws AuthenticationException {
		// UsernamePasswordToken对象用来存放提交的登录信息
		UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
		// 查出是否有此用户
		SysUser user = userService.getUserByUserName(token.getUsername());
		
		if (user != null) {
			// 处理session，T出去在别处登录的信息
			DefaultWebSecurityManager securityManager = (DefaultWebSecurityManager) SecurityUtils.getSecurityManager();
			DefaultWebSessionManager sessionManager = (DefaultWebSessionManager) securityManager.getSessionManager();
			Collection<Session> sessions = sessionManager.getSessionDAO().getActiveSessions();// 获取当前已登录的用户session列表
			for (Session session : sessions) {
				// 清除该用户以前登录时保存的session
				if (user.getUserName()
						.equals(String.valueOf(session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY)))) {
					sessionManager.getSessionDAO().delete(session);
				}
			}
			ByteSource credentialsSalt = ByteSource.Util.bytes(user.getUserName());
			AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(user.getUserName(), user.getUserPwd(),
					credentialsSalt,this.getName());
			setSession("user", user);
			// 若存在，将此用户存放到登录认证info中
			return authcInfo;
		}
		return null;
	}
	/**
	 * 将一些数据放到ShiroSession中,以便于其它地方使用
	 */
	private void setSession(Object key, Object value) {
		Subject subject = SecurityUtils.getSubject();
		if (subject != null) {
			Session session = subject.getSession();
			if (session != null) {
				session.setAttribute(key, value);
			}
		}
	}
}
