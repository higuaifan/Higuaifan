package com.demo.controller;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;

/**
 * Created by 菩萨蛮 on 2017/3/21.
 */
public class SessionInterceptor implements Interceptor {
    public void intercept(Invocation ai) {


        Controller controller = ai.getController();
        String name=controller.getSessionAttr("user");
        String pwd=controller.getSessionAttr("pwd");
        String m=ai. getMethodName();


        if ((name!=null&&pwd!=null)||m.equals("login")||m.equals("checksession"))
            ai.invoke();
        else
            controller.redirect("/index/userLogin.html");

    }
}
