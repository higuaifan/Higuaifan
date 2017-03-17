package com.demo.index;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;

/**
 * Created by Higuaifan on 2017/3/17.
 * 大道五十,代码四九,bug遁一.
 * 能不能跑,全部看命.
 */
public class SessionInterceptor  implements Interceptor {

    public void intercept(Invocation ai) {


        Controller controller = ai.getController();
        String name=controller.getSessionAttr("user");
        String pwd=controller.getSessionAttr("pwd");
        String m=ai. getMethodName();


        if ((name!=null&&pwd!=null)||m.equals("login")||m.equals("checksession"))
            ai.invoke();
        else
            controller.redirect("/index/index.html");

    }
}