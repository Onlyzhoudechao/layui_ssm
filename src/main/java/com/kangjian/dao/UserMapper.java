package com.kangjian.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kangjian.domain.User;

public interface UserMapper {
	int deleteByPrimaryKey(String id);

	int insert(User record);

	int insertSelective(User record);

	String selectMaxUserCode();

	User selectByPrimaryKey(String id);

	User selectByUserCode(String userCode);

	User selectByUserCodeAndPWD(@Param("userCode") String userCode, @Param("userPassword") String userPassword);

	User selectByEmail(String eMail);

	List<User> selectAllUser();

	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKey(User record);
}
