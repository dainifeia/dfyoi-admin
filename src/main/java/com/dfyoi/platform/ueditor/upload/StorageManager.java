package com.dfyoi.platform.ueditor.upload;

import com.dfyoi.platform.ueditor.define.AppInfo;
import com.dfyoi.platform.ueditor.define.BaseState;
import com.dfyoi.platform.ueditor.define.State;
import com.dfyoi.utils.FtpUploadUtil;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;

import org.apache.commons.io.FileUtils;

public class StorageManager {
	public static final int BUFFER_SIZE = 8192;

	public StorageManager() {
		
	}

	public static State saveBinaryFile(byte[] data, String path) {
		File file = new File(path);

		State state = valid(file);

		if (!state.isSuccess()) {
			return state;
		}

		try {
			BufferedOutputStream bos = new BufferedOutputStream(
					new FileOutputStream(file));
			bos.write(data);
			bos.flush();
			bos.close();
		} catch (IOException ioe) {
			return new BaseState(false, AppInfo.IO_ERROR);
		}

		state = new BaseState(true, file.getAbsolutePath());
		state.putInfo( "size", data.length );
		state.putInfo( "title", file.getName() );
		return state;
	}

	public static State saveFileByInputStream(InputStream is, String path,
			long maxSize) {
		State state = null;

		File tmpFile = getTmpFile();

		byte[] dataBuf = new byte[ 2048 ];
		BufferedInputStream bis = new BufferedInputStream(is, StorageManager.BUFFER_SIZE);

		try {
			BufferedOutputStream bos = new BufferedOutputStream(
					new FileOutputStream(tmpFile), StorageManager.BUFFER_SIZE);

			int count = 0;
			while ((count = bis.read(dataBuf)) != -1) {
				bos.write(dataBuf, 0, count);
			}
			bos.flush();
			bos.close();

			if (tmpFile.length() > maxSize) {
				tmpFile.delete();
				return new BaseState(false, AppInfo.MAX_SIZE);
			}

			state = saveTmpFile(tmpFile, path);

			if (!state.isSuccess()) {
				tmpFile.delete();
			}

			return state;
			
		} catch (IOException e) {
		}
		return new BaseState(false, AppInfo.IO_ERROR);
	}

	public static State saveFileByInputStream(InputStream is, String path) {
		State state = null;

		File tmpFile = getTmpFile();

		byte[] dataBuf = new byte[ 2048 ];
		BufferedInputStream bis = new BufferedInputStream(is, StorageManager.BUFFER_SIZE);

		try {
			BufferedOutputStream bos = new BufferedOutputStream(
					new FileOutputStream(tmpFile), StorageManager.BUFFER_SIZE);

			int count = 0;
			while ((count = bis.read(dataBuf)) != -1) {
				bos.write(dataBuf, 0, count);
			}
			bos.flush();
			bos.close();

			state = saveTmpFile(tmpFile, path);

			if (!state.isSuccess()) {
				tmpFile.delete();
			}

			return state;
		} catch (IOException e) {
		}
		return new BaseState(false, AppInfo.IO_ERROR);
	}

	private static File getTmpFile() {
		File tmpDir = FileUtils.getTempDirectory();
		String tmpFileName = (Math.random() * 10000 + "").replace(".", "");
		return new File(tmpDir, tmpFileName);
	}

	private static State saveTmpFile(File tmpFile, String path) {
		State state = null;
		File targetFile = new File(path);

		if (targetFile.canWrite()) {
			return new BaseState(false, AppInfo.PERMISSION_DENIED);
		}
		try {
			FileUtils.moveFile(tmpFile, targetFile);
		} catch (IOException e) {
			return new BaseState(false, AppInfo.IO_ERROR);
		}

		state = new BaseState(true);
		state.putInfo( "size", targetFile.length() );
		state.putInfo( "title", targetFile.getName() );
		
		return state;
	}

	private static State valid(File file) {
		File parentPath = file.getParentFile();

		if ((!parentPath.exists()) && (!parentPath.mkdirs())) {
			return new BaseState(false, AppInfo.FAILED_CREATE_FILE);
		}

		if (!parentPath.canWrite()) {
			return new BaseState(false, AppInfo.PERMISSION_DENIED);
		}

		return new BaseState(true);
	}
	/**
	   * 上传FTP文件
	   * @param is
	   * @param path
	   * @param maxSize
	   * @return
	   */
	  public static State saveFtpFileByInputStream(InputStream is, String remoteDir, String path, long maxSize,boolean keepLocalFile)
	  {
	    State state = null;

	    File tmpFile = getTmpFile();

	    byte[] dataBuf = new byte[2048];
	    BufferedInputStream bis = new BufferedInputStream(is, 8192);
	    try
	    {
	      BufferedOutputStream bos = new BufferedOutputStream(
	        new FileOutputStream(tmpFile), 8192);

	      int count = 0;
	      while ((count = bis.read(dataBuf)) != -1) {
	        bos.write(dataBuf, 0, count);
	      }
	      bos.flush();
	      bos.close();

	      if (tmpFile.length() > maxSize) {
	        tmpFile.delete();
	        return new BaseState(false, 1);
	      }

	      state = saveFtpTmpFile(tmpFile, remoteDir, path, keepLocalFile);

	      if (!state.isSuccess()) {
	        tmpFile.delete();
	      }

	      return state;
	    }
	    catch (IOException localIOException) {
	    }
	    return new BaseState(false, 4);
	  }
	  /**
	   * ftp上传文件
	   * 
	   * */
	  private static State saveFtpTmpFile(File tmpFile, String remoteDir, String path,boolean keepLocalFile) {
	        State state = null;//用来拼装 上传成功后返回的json
	        File targetFile = new File(path);
	        String share_img=null;//得到上传图片路径
	        if (targetFile.canWrite())
	          return new BaseState(false, 2);
	        try
	        {
	          FileUtils.moveFile(tmpFile, targetFile);
	        } catch (IOException e) {
	          return new BaseState(false, 4);
	        }
	        
	        try
	        {
	        	/*String module = "imagesjkzx";
	        	String timepoint = new SimpleDateFormat("yyyyMMddHHmmssSSS")
				.format(new Date());
	        	String[] param = { null, module, timepoint };*/
	        	
				HashMap<String, Object> result= FtpUploadUtil.uploadFileFromProduction("/ueditor", targetFile);/* FtpUploadUtil.ftpUpload(targetFile, param);*/
				share_img = (String) result.get("url");
	        	System.out.println("share_img"+share_img);
	        	
	        }catch (Exception e) {
	        	System.out.println(e.getMessage());
	            return new BaseState(false, 4);
	        }
	        
	        try
	        {
	            if(! keepLocalFile)
	                targetFile.delete();
	        }catch(Exception e){
	            
	        }

	        state = new BaseState(true);
	        state.putInfo("url", share_img);
	        state.putInfo("size", targetFile.length());
	        state.putInfo("title", targetFile.getName());

	        return state;
	  }
}
