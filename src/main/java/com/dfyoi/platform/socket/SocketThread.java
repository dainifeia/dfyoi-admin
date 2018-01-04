package com.dfyoi.platform.socket;

import com.dfyoi.utils.PropUtil;

/**
 * @Title 说明
 * @description 描述
 * @author huishen
 * @version 1.0
 * @createAt 2017年12月29日 下午4:52:41
 * @Copyright: Copyright (c) 2017 bjsszt. All Rights Reserved
 */
public class SocketThread extends Thread {
	ServerManager serverManager=new ServerManager();
	@Override
	public void run() {
		// TODO Auto-generated method stub
		super.run();
	}

	public SocketThread(ServerSocket serverScoket) {
		try {
			//读取配置文件的端口
			PropUtil p = new PropUtil();
			int port = Integer.valueOf(p.getProperty("socketPort"));
			serverManager.Start(port);
		} catch (Exception e) {
			System.out.println("SocketThread创建socket服务出错");
			e.printStackTrace();
		}
	}

	public void closeSocketServer() {
		serverManager.Stop();
	}
}
