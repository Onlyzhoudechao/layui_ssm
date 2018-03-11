package com.kangjian.dao;

import com.kangjian.domain.OnlineUser;

public interface OnlineUserMapper {
    int deleteByPrimaryKey(String id);

    int insert(OnlineUser record);

    int insertSelective(OnlineUser record);

    OnlineUser selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(OnlineUser record);

    int updateByPrimaryKey(OnlineUser record);
}