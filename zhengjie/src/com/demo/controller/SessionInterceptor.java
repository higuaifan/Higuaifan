package com.demo.controller;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;

public class SessionInterceptor implements Interceptor {
    public void intercept(Invocation ai) {



        Controller controller = ai.getController();
        String name=controller.getSessionAttr("user");
        String pwd=controller.getSessionAttr("pwd");
        String type=controller.getSessionAttr("type");
        String m=ai. getMethodName();
        String c=ai.getControllerKey();


        if ((name!=null&&pwd!=null)||m.equals("login")){

            if(type!=null&&type.equals("student")){
                ai.invoke();
            }

            if(type!=null&&type.equals("admin")){
                ai.invoke();
            }

            if(m.equals("login")){
                ai.invoke();
            }

        }
//        else
//            controller.redirect("/index/userLogin.html");

    }
}
