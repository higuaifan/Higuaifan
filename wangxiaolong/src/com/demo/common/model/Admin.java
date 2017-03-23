package com.demo.common.model;

import com.demo.common.model.base.BaseAdmin;

import java.util.List;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class Admin extends BaseAdmin<Admin> {
    public static final Admin dao = new Admin().dao();

    public List getAdmin() {
        return Admin.dao.find("select * from admin");
    }

    public boolean insertAdmin(String name, String password) {
        return new Admin().set("name", name).set("password", password).save();
    }

    public boolean updateAdmin(int id, String name, String password) {
        return Admin.dao.findById(id).setName(name).setPassword(password).update();
    }

    public boolean deleteAdmin(int id) {
        return Admin.dao.findById(id).delete();
    }

    public List loginAdmin(String user, String password) {
        return Admin.dao.find("select * from admin where name =? and password = ?", user, password);
    }
}
