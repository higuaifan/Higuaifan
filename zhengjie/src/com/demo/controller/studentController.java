package com.demo.controller;

import com.demo.common.model.Student;
import com.jfinal.core.Controller;

import java.util.List;

/**
 * Created by Higuaifan on 2017/3/12.
 * 大道五十,代码四九,bug遁一.
 * 能不能跑,全部看命.
 */
public class studentController extends Controller {
    Student student = new Student();


    public void index() {
        renderJson(student.getStudent());
    }


    public void insert() {
        String user_name = getPara("user_name");
        String real_name = getPara("real_name");
        String password = getPara("password");
        String phone = getPara("phone");
        int department = getParaToInt("department");
        String pic = getPara("pic");
        renderJson(student.insertStudent(user_name, real_name, password, phone, department, pic));
    }

    public void update() {
        int id = getParaToInt("id");
        String user_name = getPara("user_name");
        String real_name = getPara("real_name");
        String password = getPara("password");
        String phone = getPara("phone");
        int department = getParaToInt("department");
        String pic = getPara("pic");
        renderJson(student.updateStudent(id, user_name, real_name, password, phone, department, pic));
    }

    public void delete() {
        int id = getParaToInt("id");
        renderJson(student.deleteStudent(id));
    }

    public void login() {
        String user = getPara("user");
        String pwd = getPara("password");
        List U = student.loginStudent(user, pwd);
        if (U.size() > 0) {
            setSessionAttr("user", user);
            setSessionAttr("pwd", pwd);
            Object V = U.get(0);
            setSessionAttr("id", ((Student) V).getId());
            renderJson("{\"data\":\"success\"}");

        } else {
            renderJson("{\"data\":\"error\"}");
        }

    }
}

