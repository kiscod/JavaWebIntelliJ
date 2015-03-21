package com.dao;

import com.po.Users;

/**
 * Created with IntelliJ IDEA.
 * User: QiuShiLe
 * Date: 2015/3/21.
 * Time: 13:39
 * Project: JavaWebIntelliJ
 * 用户的业务逻辑类
 */
public class UsersDAO {

    public boolean userLogin(Users u){
        if("admin".equals(u.getUsername())&& "admin".equals(u.getPassword())) {
            return true;
        }
        else{
            return false;
        }
    }
}
