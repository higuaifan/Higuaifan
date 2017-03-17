package com.demo.index;

import com.demo.common.model.Hotel;
import com.jfinal.core.Controller;

/**
 * Created by Higuaifan on 2017/3/16.
 * 大道五十,代码四九,bug遁一.
 * 能不能跑,全部看命.
 */
public class hotelController extends Controller {
    private Hotel hotel = new Hotel();


    public void index() {
        renderJson(hotel.getHotel());
    }


    public void insert() {
        String hotel_name = getPara("hotel_name");
        String address = getPara("address");
        String phone = getPara("phone");
        String message = getPara("message");
        String pic = getPara("pic");
        String x = getPara("x");
        String y = getPara("y");
        renderJson(hotel.insertHotel(hotel_name, address, phone, message, pic, x, y));
    }

    public void update() {
        int id = getParaToInt("id");
        String hotel_name = getPara("hotel_name");
        String address = getPara("address");
        String phone = getPara("phone");
        String message = getPara("message");
        String pic = getPara("pic");
        String x = getPara("x");
        String y = getPara("y");
        renderJson(hotel.updateHotel(id, hotel_name, address, phone, message, pic, x, y));
    }

    public void delete() {
        int id = getParaToInt("id");
        renderJson(hotel.deleteHotel(id));
    }
}

