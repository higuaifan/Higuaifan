package com.demo.controller;

import com.demo.common.model.Admin;
import com.jfinal.core.Controller;

import java.util.List;



public class adminController extends Controller {
    Admin admin = new Admin();

    public void index() {
        renderJson(admin.getAdmin());
    }

    public void login() {
        String user=getPara("user");
        String pwd=getPara("password");

        List A = admin.login(user, pwd);
        if (A.size() > 0) {
            setSessionAttr("type", "admin");
            setSessionAttr("user", user);
            setSessionAttr("pwd", pwd);
            Object V = A.get(0);
            setSessionAttr("id", ((Admin) V).getId());
            renderJson("{\"data\":\"success\"}");

        } else {
            renderJson("{\"data\":\"error\"}");
        }
    }
}
