package com.kangjian.domain;

import java.util.Map;

public class SessionInfo {
	public String ID;
	public String userID;
	public String userCode;
	public String userName;
	public String loginTime;
	public String tempVar1;
	public String tempVar2;
	public String tempVar3;
	public String tempVar4;
	public String tempVar5;
	public Map<Object,Object> map;
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(String loginTime) {
		this.loginTime = loginTime;
	}
	public String getTempVar1() {
		return tempVar1;
	}
	public void setTempVar1(String tempVar1) {
		this.tempVar1 = tempVar1;
	}
	public String getTempVar2() {
		return tempVar2;
	}
	public void setTempVar2(String tempVar2) {
		this.tempVar2 = tempVar2;
	}
	public String getTempVar3() {
		return tempVar3;
	}
	public void setTempVar3(String tempVar3) {
		this.tempVar3 = tempVar3;
	}
	public String getTempVar4() {
		return tempVar4;
	}
	public void setTempVar4(String tempVar4) {
		this.tempVar4 = tempVar4;
	}
	public String getTempVar5() {
		return tempVar5;
	}
	public void setTempVar5(String tempVar5) {
		this.tempVar5 = tempVar5;
	}
	public Map<Object, Object> getMap() {
		return map;
	}
	public void setMap(Map<Object, Object> map) {
		this.map = map;
	}
	@Override
	public String toString() {
		return "SessionInfo [ID=" + ID + ", userID=" + userID + ", userCode=" + userCode + ", userName=" + userName
				+ ", loginTime=" + loginTime + ", tempVar1=" + tempVar1 + ", tempVar2=" + tempVar2 + ", tempVar3="
				+ tempVar3 + ", tempVar4=" + tempVar4 + ", tempVar5=" + tempVar5 + ", map=" + map + "]";
	}


	
}
