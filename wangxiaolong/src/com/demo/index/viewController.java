package com.demo.index;

import com.demo.common.model.Views;
import com.jfinal.core.Controller;

/**
 * Created by Higuaifan on 2017/3/16.
 * 大道五十,代码四九,bug遁一.
 * 能不能跑,全部看命.
 */
public class viewController extends Controller {

    Views views = new Views();


    public void index() {
        renderJson(views.getViews());
    }


    public void insert() {
        String view = getPara("view");
        String message = getPara("message");
        String address = getPara("address");
        String pic = getPara("pic");
        renderJson(views.insertViews(view,message,address,pic));
    }

    public void update() {
        int id = getParaToInt("id");
        String view = getPara("view");
        String message = getPara("message");
        String address = getPara("address");
        String pic = getPara("pic");
        renderJson(views.updateViews(id,view,message,address,pic));
    }

    public void delete(){
        int id=getParaToInt("id");
        renderJson(views.deleteViews(id));
    }
}
