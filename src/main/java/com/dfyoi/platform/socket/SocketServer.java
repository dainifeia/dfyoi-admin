package com.dfyoi.platform.socket;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.Channel;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.nio.charset.Charset;

/**
 * @Title 说明
 * @description 描述
 * @author huishen
 * @version 1.0
 * @createAt 2017年12月29日 下午4:26:49
 * @Copyright: Copyright (c) 2017 bjsszt. All Rights Reserved
 */
public class SocketServer {
	// 用于检测所有Channel状态的selector
	private Selector selector = null;
	// 定义编码格式
	private Charset charset = Charset.forName("UTF-8");
	ServerSocketChannel server = null;
	public void init() throws IOException {
		selector = Selector.open();
		// 通过open方法来打开一个未绑定的ServerSocketChannel实例
		server = ServerSocketChannel.open();
		InetSocketAddress isa = new InetSocketAddress("192.168.0.36", 30002);
		// 将该ServerSocketChannel绑定到指定IP地址
		server.socket().bind(isa);
		// 设置ServerSocket以非阻塞方式工作
		server.configureBlocking(false);
		// 将Server注册到指定Selector对象
		server.register(selector, SelectionKey.OP_ACCEPT);

		while (selector.select() > 0) {
			// 依次处理Selector上的每个已选择的SelectionKey
			for (SelectionKey sk : selector.selectedKeys()) {
				// 从selector上的已选择Key集中删除正在处理的SelectionKey
				selector.selectedKeys().remove(sk);
				// 如果sk对应的通道包含客户端的连接请求
				if (sk.isAcceptable()) {
					// 调用accept方法接受连接，产生服务器端对应的SocketChannel
					SocketChannel sc = server.accept();
					// 设置非阻塞方式工作
					sc.configureBlocking(false);
					// 将该SocketChnnel也注册到selector
					sc.register(selector, SelectionKey.OP_READ);
					// 将sk对应的Channel设置成准备接受其它请求
					sk.interestOps(SelectionKey.OP_ACCEPT);
				}
				// 如果sk对应的通道有数据需要读取
				if (sk.isReadable()) {
					// 获取该SelectionKey对应的Channel,该Channnel中有可读的数据
					SocketChannel sc = (SocketChannel) sk.channel();
					// 定义准备执行读取数据的ByteBuffer
					ByteBuffer buff = ByteBuffer.allocate(1024);
					String content = "";
					// 开始读数据
					try {
						while (sc.read(buff) > 0) {
							buff.flip();
							content += charset.decode(buff);
						}
						// 打印从该sk对应的Channel里读到的数据
						System.out.println("====" + content);
						// 将sk对应的Channel设置成准备下一次读取
						sk.interestOps(SelectionKey.OP_READ);
					}
					// 如果捕捉到该sk对应的Channel出现了异常，即表明该Channel对应的Client出现了问题
					// 所以从Selector中取消sk的注册
					catch (IOException ex) {
						// 从Selector中删除指定的SelectionKey
						sk.cancel();
						if (sk.channel() != null) {
							sk.channel().close();
						}
					}
					// 如果content的长度大于0，即聊天信息不为空
					if (content.length() > 0) {
						// 遍历该selector里注册的所有selectionKey
						for (SelectionKey key : selector.keys()) {
							// 获取该channel是SocketChannel对象
							Channel targetChannel = key.channel();
							if (targetChannel instanceof SocketChannel) {
								// 将读到的内容写入该Channel中
								SocketChannel dest = (SocketChannel) targetChannel;
								dest.write(charset.encode(content));
							}
						}
					}
				}
			}
		}
	}
	/*
	 * 关闭socket
	 */
	public void closeSocket() throws IOException
	{
		selector.close();  
        server.close();  
	}
}
