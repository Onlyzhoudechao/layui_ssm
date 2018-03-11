package com.kangjian.commons;

public class CommonInfo {
	/************** 回调函数返回值 ***********************/
	// 返回状态：失败
	public static final int state_failure = 0;
	// 返回状态：成功
	public static final int state_success = 1;

	/************** 用户登录校验返回值 *******************/
	public static final String user_code_none = "账号不存在！";
	public static final String user_code_miss = "账号不能为空！";
	public static final String passwd_error = "密码错误！";
	public static final String passwd_miss = "密码不能为空！";
	public static final String save_success = "保存成功！";
	
	/************** 用户注册校验返回值 *******************/
	public static final String email_exist="该邮箱已注册！";
	public static final String reg_success="注册成功！";
	
	/**********************未知错误 *********************/
	public static final String unknow_error="未知错误！";

}
