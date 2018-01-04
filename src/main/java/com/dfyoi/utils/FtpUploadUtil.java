package com.dfyoi.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;

public class FtpUploadUtil {
	static PropUtil propUtil = new PropUtil();
	public final static String hostname = propUtil.getProperty("ftpHostname");
	public final static int port = Integer.valueOf(propUtil.getProperty("ftpPort"));
	public final static String username = propUtil.getProperty("ftpUserName");
	public final static String password = propUtil.getProperty("ftpPassWord");

	/**
	 * 上传文件（可供Action/Controller层使用）
	 * 
	 * @param pathname
	 *            FTP服务器保存目录
	 * @param fileName
	 *            上传到FTP服务器后的文件名称
	 * @param inputStream
	 *            输入文件流
	 * @return
	 */
	public static HashMap<String, Object> uploadFile(String pathname, String fileName, InputStream inputStream) {
		boolean flag = false;
		String url = propUtil.getProperty("ftpService") + pathname + "/" + fileName;
		HashMap<String, Object> map = new HashMap<String, Object>();
		FTPClient ftpClient = new FTPClient();
		ftpClient.setControlEncoding("UTF-8");
		try {
			// 连接FTP服务器
			ftpClient.connect(hostname, port);
			// 登录FTP服务器
			ftpClient.login(username, password);
			// 是否成功登录FTP服务器
			int replyCode = ftpClient.getReplyCode();
			if (!FTPReply.isPositiveCompletion(replyCode)) {
				flag = false;
			} else {
				ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
				ftpClient.makeDirectory(pathname);
				ftpClient.changeWorkingDirectory(pathname);
				ftpClient.storeFile(fileName, inputStream);
				inputStream.close();
				ftpClient.logout();
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			url = e.getMessage();
		} finally {
			if (ftpClient.isConnected()) {
				try {
					ftpClient.disconnect();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		map.put("success", flag);
		map.put("url", url);
		return map;
	}

	/**
	 * 上传文件（可对文件进行重命名）
	 * 
	 * @param pathname
	 *            FTP服务器保存目录
	 * @param filename
	 *            上传到FTP服务器后的文件名称
	 * @param originfilename
	 *            待上传文件的名称（绝对地址）
	 * @return
	 */
	public static HashMap<String, Object> uploadFileFromProduction(String pathname, String filename,
			String originfilename) {
		boolean flag = false;
		String url = "上传失败";
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			InputStream inputStream = new FileInputStream(new File(originfilename));
			map = uploadFile(pathname, filename, inputStream);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", flag);
			map.put("url", url);
		}
		return map;
	}

	/**
	 * 上传文件（不可以进行文件的重命名操作）
	 * 
	 * @param pathname
	 *            FTP服务器保存目录
	 * @param originfilename
	 *            待上传文件的名称（绝对地址）
	 * @return
	 */
	public static HashMap<String, Object> uploadFileFromProduction(String pathname, String originfilename) {
		boolean flag = false;
		String url = "上传失败";
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			String fileName = new File(originfilename).getName();
			String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
			String timepoint = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
			String dateFolder = new SimpleDateFormat("yyyyMMdd").format(new Date());
			InputStream inputStream = new FileInputStream(new File(originfilename));
			map = uploadFile(pathname + "/" + dateFolder, timepoint + "." + suffix, inputStream);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", flag);
			map.put("url", url);
		}
		return map;
	}

	/**
	 * 删除文件
	 * 
	 * @param pathname
	 *            FTP服务器保存目录
	 * @param filename
	 *            要删除的文件名称
	 * @return
	 */
	public static boolean deleteFile(String pathname, String filename) {
		boolean flag = false;
		FTPClient ftpClient = new FTPClient();
		try {
			// 连接FTP服务器
			ftpClient.connect(hostname, port);
			// 登录FTP服务器
			ftpClient.login(username, password);
			// 验证FTP服务器是否登录成功
			int replyCode = ftpClient.getReplyCode();
			if (!FTPReply.isPositiveCompletion(replyCode)) {
				return flag;
			}
			// 切换FTP目录
			ftpClient.changeWorkingDirectory(pathname);
			ftpClient.dele(filename);
			ftpClient.logout();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ftpClient.isConnected()) {
				try {
					ftpClient.logout();
				} catch (IOException e) {

				}
			}
		}
		return flag;
	}

	/**
	 * 下载文件
	 * 
	 * @param pathname
	 *            FTP服务器文件目录
	 * @param filename
	 *            文件名称
	 * @param localpath
	 *            下载后的文件路径
	 * @return
	 */
	public static boolean downloadFile(String hostname, int port, String username, String password, String pathname,
			String filename, String localpath) {
		boolean flag = false;
		FTPClient ftpClient = new FTPClient();
		try {
			// 连接FTP服务器
			ftpClient.connect(hostname, port);
			// 登录FTP服务器
			ftpClient.login(username, password);
			// 验证FTP服务器是否登录成功
			int replyCode = ftpClient.getReplyCode();
			if (!FTPReply.isPositiveCompletion(replyCode)) {
				return flag;
			}
			// 切换FTP目录
			ftpClient.changeWorkingDirectory(pathname);
			FTPFile[] ftpFiles = ftpClient.listFiles();
			for (FTPFile file : ftpFiles) {
				if (filename.equalsIgnoreCase(file.getName())) {
					File localFile = new File(localpath + "/" + file.getName());
					OutputStream os = new FileOutputStream(localFile);
					ftpClient.retrieveFile(file.getName(), os);
					os.close();
				}
			}
			ftpClient.logout();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ftpClient.isConnected()) {
				try {
					ftpClient.logout();
				} catch (IOException e) {

				}
			}
		}
		return flag;
	}

	public static void main(String[] args) {
		String originfilename = "E:\\WorkFile\\电子证照库\\操作手册.docx";
		HashMap<String, Object> map = uploadFileFromProduction("/ueditor", originfilename);
		System.out.println(map.get("success") + "=======");
	}

	public static HashMap<String, Object> uploadFileFromProduction(String pathname, File targetFile) {
		boolean flag = false;
		String url = "上传失败";
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			String fileName = targetFile.getName();
			String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
			String timepoint = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
			String dateFolder = new SimpleDateFormat("yyyyMMdd").format(new Date());
			InputStream inputStream = new FileInputStream(targetFile);
			url = url + pathname + "/" + dateFolder + timepoint + "." + suffix;
			map = uploadFile(pathname + "/" + dateFolder, timepoint + "." + suffix, inputStream);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", flag);
			map.put("url", url);
		}
		return map;
	}
}
