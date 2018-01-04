package com.dfyoi.platform.shiro;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.session.SessionException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.LogoutFilter;

public class SystemLogoutFilter extends LogoutFilter {
	@Override
	protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {
		// 在这里执行退出系统前需要清空的数据
		Subject subject = getSubject(request, response);
		String redirectUrl = getRedirectUrl(request, response, subject);
		ServletContext context = request.getServletContext();
		try {
			subject.logout();
			context.removeAttribute("error");
		} catch (SessionException e) {
			e.printStackTrace();
		}
		issueRedirect(request, response, redirectUrl);
		return false;
	}
}
