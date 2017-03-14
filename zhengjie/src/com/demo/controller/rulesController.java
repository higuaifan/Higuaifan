package com.demo.controller;

import com.demo.common.model.Rules;
import com.jfinal.core.Controller;

/**
 * Created by Higuaifan on 2017/3/9.
 * 大道五十,代码四九,bug遁一.
 * 能不能跑,全部看命.
 */
public class rulesController extends Controller {
    Rules rules = new Rules();

    public void index() {
        renderJson(rules.getRules());
    }

    public void insert() {
        String rule=getPara("rule");
        renderJson(rules.insertRules(rule));
    }

    public void update() {
        String rule=getPara("rule");
        int id=getParaToInt("id");
        renderJson(rules.updateRules(id,rule));
    }

    public void delete(){
        int id=getParaToInt("id");
        renderJson(rules.deleteRules(id));
    }

}
