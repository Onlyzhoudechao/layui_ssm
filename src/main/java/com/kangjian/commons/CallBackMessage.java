package com.kangjian.commons;

import java.util.Map;

public class CallBackMessage {
	//返回状态
	private int status;
	//返回内容
	private String message;
	//返回结果集
	private Map<Object, Object> map;
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Map<Object, Object> getMap() {
		return map;
	}
	public void setMap(Map<Object, Object> map) {
		this.map = map;
	}
	
}
