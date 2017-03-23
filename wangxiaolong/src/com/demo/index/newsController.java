package com.demo.index;

import com.demo.common.model.TravelNews;
import com.jfinal.core.Controller;

import java.util.Date;

/**
 * Created by Higuaifan on 2017/3/23.
 * 大道五十,代码四九,bug遁一.
 * 能不能跑,全部看命.
 */
public class newsController extends Controller {
    private TravelNews travelNews = new TravelNews();


    public void index() {
        renderJson(travelNews.getTravelNews());
    }


    public void insert() {
        String title = getPara("title");
        String message = getPara("message");
        String pic = getPara("pic");
        String time = getPara("time");
        int hotel = getParaToInt("hotel");
        renderJson(travelNews.insertTravelNews(title,message,pic,time,hotel));
    }

    public void update() {
        int id = getParaToInt("id");
        String title = getPara("title");
        String message = getPara("message");
        String pic = getPara("pic");
        Date time = getParaToDate("time");
        int hotel = getParaToInt("hotel");
        renderJson(travelNews.updateTravelNews(id,title,message,pic,time,hotel));
    }

    public void delete(){
        int id=getParaToInt("id");
        renderJson(travelNews.deleteTravelNews(id));
    }

    public void getNewsByHotel() {
        int view = getParaToInt("id");
        renderJson(travelNews.getTravelNewsById(view));
    }
}

