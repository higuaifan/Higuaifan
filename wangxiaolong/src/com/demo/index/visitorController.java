package com.demo.index;

import com.demo.common.model.Visitor;
import com.jfinal.core.Controller;

/**
 * Created by Higuaifan on 2017/3/17.
 * 大道五十,代码四九,bug遁一.
 * 能不能跑,全部看命.
 */
public class visitorController extends Controller {
    Visitor visitor = new Visitor();


    public void index() {
        renderJson(visitor.getVisitor());
    }

    public void login(){
        String user = getPara("user");
        String pwd = getPara("password");

        if(visitor.loginVisitor(user,pwd).size()>0){
            setSessionAttr("user", user);
            setSessionAttr("pwd", pwd);
            render("success");

        }else{
            render("error");
        }

    }


    public void insert() {
        String user_name = getPara("user_name");
        String password = getPara("password");
        String phone = getPara("phone");
        renderJson(visitor.insertVisitor(user_name,password,phone));
    }

    public void update() {
        int id = getParaToInt("id");
        String user_name = getPara("user_name");
        String password = getPara("password");
        String phone = getPara("phone");
        renderJson(visitor.updateVisitor(id,user_name,password,phone));
    }

    public void delete(){
        int id=getParaToInt("id");
        renderJson(visitor.deleteVisitor(id));
    }
}

