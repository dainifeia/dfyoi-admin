package com.dfyoi.platform.socket;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * @Title 说明
 * @description 描述
 * @author huishen
 * @version 1.0
 * @createAt 2017年12月29日 下午4:38:29
 * @Copyright: Copyright (c) 2017 bjsszt. All Rights Reserved
 */
public class SocketServiceLoader implements ServletContextListener {
	// socket server 线程
	private SocketThread socketThread;

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		if (null != socketThread && !socketThread.isInterrupted()) {
			socketThread.closeSocketServer();
			socketThread.interrupt();
		}
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		if (null == socketThread) {
			// 新建线程类
			socketThread = new SocketThread(null);
			// 启动线程
			socketThread.start();
		}
	}
}
