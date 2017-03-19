package com.demo.index;

import com.demo.common.model.ViewHotel;
import com.jfinal.core.Controller;

/**
 * Created by Higuaifan on 2017/3/16.
 * 大道五十,代码四九,bug遁一.
 * 能不能跑,全部看命.
 */
public class viewHotelController extends Controller {
    ViewHotel viewHotel = new ViewHotel();


    public void index() {
        renderJson(viewHotel.getViewHotel());
    }

    public void getHotel() {
        int view = getParaToInt("id");
        renderJson(viewHotel.getViewHotelByView(view));
    }

    public void getHotelByView() {
        int view = getParaToInt("id");
        renderJson(viewHotel.getViewHotelById(view));
    }



    public void insert() {
        int hotel_id = getParaToInt("hotel_id");
        int view_id = getParaToInt("view_id");
        renderJson(viewHotel.insertViewHotel(hotel_id, view_id));
    }

    public void update() {
        int id = getParaToInt("id");
        int hotel_id = getParaToInt("hotel_id");
        int view_id = getParaToInt("view_id");
        renderJson(viewHotel.updateViewHotel(id, hotel_id, view_id));
    }

    public void delete() {
        int id = getParaToInt("id");
        renderJson(viewHotel.deleteViewHotel(id));
    }
}