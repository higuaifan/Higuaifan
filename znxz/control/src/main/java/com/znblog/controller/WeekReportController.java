package com.znblog.controller;

import com.jfinal.core.Controller;
import com.znblog.weekreports.UserWeekService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by hzqiuxm on 2016/7/21 0021.
 */
public class WeekReportController extends Controller {

    public void index(){
        render("week-report.html");
    }


    /**
     * 登录接口:
     * @return result 1 登录出错
     *                0 登录成功
     *         msg      返回值说明
     */
    public void login(){
        String name=getPara("name");
        String pwd=getPara("pwd");
        Map<String,String> result=new HashMap<String,String>();
        result.put("result","1");
        result.put("msg","login error");

        if(name==null||pwd==null){//如果有值没获取到
            renderJson(result);
            return;
        }

        UserWeekService uc=new UserWeekService(name);
        if(uc.CheckPwd(pwd)!=0){//如果账号密码错误
            renderJson(result);
            return;
        }
        //设置session
        setSessionAttr("name", name);
        setSessionAttr("pwd", pwd);
        result.put("result","0");
        result.put("msg","login success");
        renderJson(result);
    }

    /**
     * 登出接口
     */
    public void logout(){
        removeSessionAttr("id");
        removeSessionAttr("pwd");
        renderJson("success");
    }

    /**
     * 查看session直接登陆接口
     */
    public void checksession(){
        System.out.print(getSessionAttr("name"));
        System.out.print(getSessionAttr("pwd"));
        if(getSessionAttr("name")!=null&&getSessionAttr("pwd")!=null)//如果有session
            renderJson("success");
        else
            renderJson("error");
    }

    /**
     * 获取周报接口 返回n个周报集合，包括评论
     */
    public void getreports(){
        Map<String,Object> result=new HashMap<String,Object>();
        if(getSessionAttr("name")!=null){//如果有session
            String user_name=getSessionAttr("name").toString();
            UserWeekService userweekservice=new UserWeekService(user_name);

            String key_name=getPara("name");
            String time=getPara("time");
            String start=getPara("start");//// TODO: 2016/8/12 null 就变成“0”
            int number=Integer.parseInt(getPara("number"));

            if(start.equals(""))
                start="0";

            List<Map> reports=userweekservice.GetReport(key_name,time,start,number);


            result.put("result","0");
            result.put("msg","load success");
            result.put("data",reports);
            renderJson(result);
        }else{//需要登录

            result.put("result","1");
            result.put("msg","login error");
            renderJson("no session");
        }
    }

    /**
     * 添加周报接口
     */
    public void insertreport(){
        Map<String,Object> result=new HashMap<String,Object>();
        result.put("result","1");
        result.put("msg","没有登录");
        if(getSessionAttr("name")!=null){//如果有session
            String user_name=getSessionAttr("name").toString();
            UserWeekService userweekservice=new UserWeekService(user_name);
            String thisweek=getPara("thisweek").replace("<","&lt;").replace(">","&gt;").replace("\n","<br />");
            String nextweek=getPara("nextweek").replace("<","&lt;").replace(">","&gt;").replace("\n","<br />");
            String difficulty=getPara("difficulty").replace("<","&lt;").replace(">","&gt;").replace("\n","<br />");

            if(thisweek.equals(""))
                thisweek="无";
            if(nextweek.equals(""))
                nextweek="无";
            if(difficulty.equals(""))
                difficulty="无";

            if(userweekservice.InsertReport(thisweek,nextweek,difficulty)){
                result.put("result","0");
                result.put("msg","添加成功");
            }else{
                result.put("result","2");
                result.put("msg","添加错误");
            }
            renderJson(result);
        }else{//需要登录
            renderJson(result);
        }
    }

    /**
     * 删除周报接口
     */
    public void deletereport(){
        Map<String,Object> result=new HashMap<String,Object>();
        result.put("result","1");
        result.put("msg","没有登录");
        if(getSessionAttr("name")!=null){//如果有session
            String user_name=getSessionAttr("name").toString();
            UserWeekService userweekservice=new UserWeekService(user_name);
            String report=getPara("reportid");
            if(userweekservice.DeleteReport(report)){
                result.put("result","0");
                result.put("msg","删除成功");
            }else{
                result.put("result","2");
                result.put("msg","删除错误");
            }
            renderJson(result);
        }else{//需要登录
            renderJson(result);
        }
    }

    /**
     * 添加评论接口
     */
    public void insertcomment(){
        Map<String,Object> result=new HashMap<String,Object>();
        result.put("result","1");
        result.put("msg","没有登录");
        if(getSessionAttr("name")!=null){//如果有session
            String user_name=getSessionAttr("name").toString();
            String replyname=getPara("replyname");
            String message=getPara("message").replace("<","&lt;").replace(">","&gt;").replace("\n","<br />");//评论信息

            UserWeekService userweekservice=new UserWeekService(user_name);
            int reportid=Integer.parseInt(getPara("reportid"));//评论周报id

            if(userweekservice.InsertComment(message,reportid,replyname)){
                result.put("result","0");
                result.put("msg","评论成功");
                List<Map> report=userweekservice.GetReportDependsID(reportid);
                result.put("data",report);
            }else{
                result.put("result","2");
                result.put("msg","评论错误");
            }
            renderJson(result);
        }else{//需要登录
            renderJson(result);
            return ;
        }
    }

    /**
     * 删除评论接口
     */
    public void deletecomment(){
        Map<String,Object> result=new HashMap<String,Object>();
        result.put("result","1");
        result.put("msg","没有登录");
        if(getSessionAttr("name")!=null){//如果有session
            String user_name=getSessionAttr("name").toString();
            String comment_id=getPara("commentid");
            UserWeekService userweekservice=new UserWeekService(user_name);
            if(userweekservice.DeleteComment(comment_id)){
                result.put("result","0");
                result.put("msg","删除成功");
                int reportid=Integer.parseInt(getPara("reportid"));//评论周报id
                List<Map> report=userweekservice.GetReportDependsID(reportid);
                result.put("data",report);
            }else{
                result.put("result","2");
                result.put("msg","删除错误");
            }
            renderJson(result);
        }else{//需要登录
            renderJson(result);
            return ;
        }
    }

    /**
     * 获取周播详细内容接口，用于修改显示
     */
    public void getreport(){
        Map<String,Object> result=new HashMap<String,Object>();
        result.put("result","1");
        result.put("msg","没有登录");
        if(getSessionAttr("name")!=null){//如果有session
            String id=getPara("id");
            result.put("result","0");
            result.put("msg","获取周报");
            String user_name=getSessionAttr("name").toString();
            UserWeekService userweekservice=new UserWeekService(user_name);
            result.put("data",userweekservice.GetReportDetail(id));
            renderJson(result);
        }else{//需要登录
            renderJson(result);
            return ;
        }
    }

    /**
     * 更新周报接口
     */
    public void updatereport(){
        Map<String,Object> result=new HashMap<String,Object>();
        result.put("result","1");
        result.put("msg","没有登录");
        if(getSessionAttr("name")!=null){//如果有session
            String user_name=getSessionAttr("name").toString();
            UserWeekService userweekservice=new UserWeekService(user_name);//// TODO: 2016/8/16 重复代码
            int id=Integer.parseInt(getPara("id"));//周报的id
            String thisweek=getPara("thisweek").replace("<","&lt;").replace(">","&gt;").replace("\n","<br />");
            String nextweek=getPara("nextweek").replace("<","&lt;").replace(">","&gt;").replace("\n","<br />");
            String difficulty=getPara("difficulty").replace("<","&lt;").replace(">","&gt;").replace("\n","<br />");

            if(thisweek.equals(""))
                thisweek="无";
            if(nextweek.equals(""))
                nextweek="无";
            if(difficulty.equals(""))
                difficulty="无";

            if(userweekservice.UpdateReport(thisweek,nextweek,difficulty,id)){
                result.put("result","0");
                result.put("msg","修改成功");
                List<Map> report=userweekservice.GetReportDependsID(id);
                result.put("data",report);
            }else{
                result.put("result","2");
                result.put("msg","修改错误");
            }
            renderJson(result);
        }else{//需要登录
            renderJson(result);
        }
    }

    /**
     * 上周未提交周报显示内容获取接口
     */
    public void lastweek(){
        Map<String,Object> result=new HashMap<String,Object>();
        result.put("result","1");
        result.put("msg","没有登录");
        if(getSessionAttr("name")!=null){//如果有session
            String user_name=getSessionAttr("name").toString();
            UserWeekService userweekservice=new UserWeekService(user_name);
            result.put("result","0");
            result.put("msg","请求成功");
            result.put("data",userweekservice.GetLastWeekNoReportName());
            renderJson(result);
        }else{//需要登录
            renderJson(result);
            return ;
        }
    }

    /**
     * 修改密码接口
     */
    public void changepwd(){
        Map<String,Object> result=new HashMap<String,Object>();
        result.put("result","1");
        result.put("msg","没有登录");
        if(getSessionAttr("name")!=null){//如果有session
            String user_name=getSessionAttr("name").toString();
            String old_pwd=getPara("inputoldpwd");
            String new_pwd=getPara("inputnewpwd");
            String new_pwd2=getPara("inputnewpwd2");
            UserWeekService userweekservice=new UserWeekService(user_name);
            if(new_pwd.equals(new_pwd2)&&userweekservice.ChangePwd(old_pwd,new_pwd)){
                result.put("result","0");
                result.put("msg","修改成功");
                removeSessionAttr("id");
                removeSessionAttr("pwd");
            }else{
                result.put("result","2");
                result.put("msg","修改失败");
            }
            renderJson(result);
        }else{//需要登录
            renderJson(result);
            return ;
        }
    }
}
