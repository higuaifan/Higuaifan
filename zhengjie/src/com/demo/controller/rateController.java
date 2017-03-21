package com.demo.controller;

import com.demo.common.model.Rate;
import com.jfinal.core.Controller;

/**
 * Created by Higuaifan on 2017/3/15.
 * 大道五十,代码四九,bug遁一.
 * 能不能跑,全部看命.
 */
public class rateController extends Controller {
    Rate rate = new Rate();


    public void index() {
        renderJson(rate.getRate());
    }


    public void insert() {
        int rater = getParaToInt("rater");
        int score = getParaToInt("score");
        int userId= getSessionAttr("id");
        // TODO: 2017/3/15 获取user session
        renderJson(rate.insertRate(rater,score,userId));
    }

    public void update() {
        int id = getParaToInt("id");
        int rater = getParaToInt("rater");
        int score = getParaToInt("score");
        int userId = getSessionAttr("userId");
        // TODO: 2017/3/15 检查user type 是管理员还是用户
        renderJson(rate.updateRate(id,rater,score,userId));
    }

    public void delete(){
        int id=getParaToInt("id");
        renderJson(rate.deleteRate(id));
    }
}

