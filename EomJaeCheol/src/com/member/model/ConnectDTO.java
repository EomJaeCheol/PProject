package com.member.model;

public class ConnectDTO {
	private String loginDay;
	private String ip;
	private boolean success;
	private String loginerror;
	private String remark;
	
	public String getLoginDay() {
		return loginDay;
	}
	public void setLoginDay(String loginDay) {
		this.loginDay = loginDay;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getLoginerror() {
		return loginerror;
	}
	public void setLoginerror(String loginerror) {
		this.loginerror = loginerror;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
