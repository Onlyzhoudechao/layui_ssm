package com.kangjian.domain;

public class ChangePWD {
	private String tempcode;
	private String oldpwd;
	private String newpwd;
	private String confirpwd;
	public String getTempcode() {
		return tempcode;
	}
	public void setTempcode(String tempcode) {
		this.tempcode = tempcode;
	}
	public String getOldpwd() {
		return oldpwd;
	}
	public void setOldpwd(String oldpwd) {
		this.oldpwd = oldpwd;
	}
	public String getNewpwd() {
		return newpwd;
	}
	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}
	public String getConfirpwd() {
		return confirpwd;
	}
	public void setConfirpwd(String confirpwd) {
		this.confirpwd = confirpwd;
	}
	
}
