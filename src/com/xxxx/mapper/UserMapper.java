package com.xxxx.mapper;

import com.xxxx.entity.MainMenu;
import com.xxxx.entity.SMenu;
import com.xxxx.entity.User;

import java.util.List;

/**
 * 用户接口类
 */
public interface UserMapper {
    public User queryUserByName(String userName);
    public List<SMenu> smenu(int id);
}

