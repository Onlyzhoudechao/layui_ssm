package com.kangjian.commons;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class BasicCommons {
	
	/**生成主键*/
	public String generalPrimaryKey() {
		return UUID.randomUUID().toString();
	}
	
	
	public static final String KEY_SHA = "SHA";

	public  String encrypt(String inputStr) {
		BigInteger sha = null;
		System.out.println("=======加密前的数据:" + inputStr);
		byte[] inputData = inputStr.getBytes();
		try {
			MessageDigest messageDigest = MessageDigest.getInstance(KEY_SHA);
			messageDigest.update(inputData);
			sha = new BigInteger(messageDigest.digest());
			System.out.println("SHA加密后:" + sha.toString(32));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sha.toString(32);
	}

	/**获取系统当前时间 （yyyy-MM-dd HH:mm:ss）格式*/
	public String getCurrentTime() {
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date);
		return time;
	}
}
