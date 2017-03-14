package com.demo.controller;

import com.demo.common.model.Admin;
import com.jfinal.core.Controller;

/**
 * Created by Higuaifan on 2017/3/8.
 * 大道五十,代码四九,bug遁一.
 * 能不能跑,全部看命.
 */

public class adminController extends Controller {
    Admin admin = new Admin();

    public void index() {
        renderJson(admin.getAdmin());
    }

    public void login() {
        String user=getPara("user");
        String password=getPara("password");
        renderJson(admin.login(user,password));
    }
}
