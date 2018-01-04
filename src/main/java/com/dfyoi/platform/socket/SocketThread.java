package com.dfyoi.platform.socket;

import java.io.IOException;

/**
 * @Title 说明
 * @description 描述
 * @author huishen
 * @version 1.0
 * @createAt 2017年12月29日 下午4:52:41
 * @Copyright: Copyright (c) 2017 bjsszt. All Rights Reserved
 */
public class SocketThread extends Thread {
	SocketServer serverSocket = null;

	@Override
	public void run() {
		// TODO Auto-generated method stub
		super.run();
	}

	public SocketThread(SocketServer serverScoket) {
		try {
			serverScoket.init();
		} catch (Exception e) {
			System.out.println("SocketThread创建socket服务出错");
			e.printStackTrace();
		}
	}

	public void closeSocketServer() {
		try {
			if (null != serverSocket) {
				serverSocket.closeSocket();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
