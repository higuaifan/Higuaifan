package com.demo.index;

import com.demo.common.model.Admin;
import com.jfinal.core.Controller;

import java.util.List;

/**
 * Created by Higuaifan on 2017/3/23.
 * 大道五十,代码四九,bug遁一.
 * 能不能跑,全部看命.
 */
public class adminController extends Controller {
    Admin admin = new Admin();


    public void index() {
        renderJson(admin.getAdmin());
    }


    public void insert() {
        String name = getPara("name");
        String password = getPara("password");
        renderJson(admin.insertAdmin(name,password));
    }

    public void update() {
        int id = getParaToInt("id");
        String name = getPara("name");
        String password = getPara("password");
        renderJson(admin.updateAdmin(id,name,password));
    }

    public void delete(){
        int id=getParaToInt("id");
        renderJson(admin.deleteAdmin(id));
    }


    public void login(){
        String user = getPara("user");
        String pwd = getPara("password");
        List U=admin.loginAdmin(user,pwd);
        if(U.size()>0){
            setSessionAttr("user", user);
            setSessionAttr("pwd", pwd);
            setSessionAttr("type", "admin");
            Object V= U.get(0);
            setSessionAttr("id", ((Admin) V).getId());
            renderJson("{\"data\":\"success\"}");
        }else{
            renderJson("{\"data\":\"error\"}");
        }
    }

    public void logout(){
        setSessionAttr("user", null);
        setSessionAttr("pwd", null);
        setSessionAttr("type", null);
        renderJson("{\"data\":\"success\"}");
    }

}

