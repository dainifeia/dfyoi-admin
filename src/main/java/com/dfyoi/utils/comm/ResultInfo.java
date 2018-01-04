package com.dfyoi.utils.comm;

public class ResultInfo {
	public ResultInfo(boolean succ, String info) {
		setSuccess(succ);
		setMsg(info);
	}
	public ResultInfo() {
	}
	private boolean success = true;
	private String msg = "保存成功";

	public boolean getSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
}
