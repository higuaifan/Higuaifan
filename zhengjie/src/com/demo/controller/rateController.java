package com.demo.controller;

import com.demo.common.model.Rate;
import com.jfinal.core.Controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

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
        // TODO: 2017/3/15 获取user session
//        renderJson(rate.insertRate(rater,score));
    }

    public void update() {
        int id = getParaToInt("id");
        int rater = getParaToInt("rater");
        int score = getParaToInt("score");
        renderJson(rate.updateRate(id,rater,score));
    }

    public void delete(){
        int id=getParaToInt("id");
        renderJson(rate.deleteRate(id));
    }
}

