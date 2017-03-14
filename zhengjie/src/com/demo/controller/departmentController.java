package com.demo.controller;

import com.demo.common.model.Department;
import com.jfinal.core.Controller;

/**
 * Created by Higuaifan on 2017/3/14.
 * 大道五十,代码四九,bug遁一.
 * 能不能跑,全部看命.
 */
public class departmentController extends Controller {
    Department department = new Department();


    public void index() {
        renderJson(department.getsDepartment());
    }


    public void insert() {
        String departments = getPara("department");
        renderJson(department.insertDepartment(departments));
    }

    public void update() {
        int id = getParaToInt("id");
        String departments = getPara("department");
        renderJson(department.updateDepartment(id,departments));
    }

    public void delete(){
        int id=getParaToInt("id");
        renderJson(department.deleteDepartment(id));
    }
}
