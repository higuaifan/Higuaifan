package com.demo.index;

import com.demo.common.model.HotelBook;
import com.jfinal.core.Controller;

import java.util.Date;

/**
 * Created by Higuaifan on 2017/3/19.
 * 大道五十,代码四九,bug遁一.
 * 能不能跑,全部看命.
 */
public class hotelBookController extends Controller {
    HotelBook hotelBook = new HotelBook();


    public void index() {
        renderJson(hotelBook.getHotelBook());
    }


    public void insert() {
        int hotel = getParaToInt("hotel");


        Integer visitor =getSessionAttr("id");


        String time = getPara("time");


        renderJson(hotelBook.insertHotelBook(hotel, visitor.intValue(),time));
    }

    public void update() {
        int id = getParaToInt("id");
        int hotel = getParaToInt("hotel");
        int visitor = getParaToInt("visitor");
        Date time = getParaToDate("time");
        renderJson(hotelBook.updateHotelBook(id,hotel,visitor,time));
    }

    public void delete(){
        int id=getParaToInt("id");
        renderJson(hotelBook.deleteHotelBook(id));
    }
}