package com.demo.common.model;

import com.demo.common.model.base.BaseStudent;

import java.util.List;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class Student extends BaseStudent<Student> {
	public static final Student dao = new Student().dao();
	public List getStudent() {
		return Student.dao.find("select student.id,user_name,real_name,password,phone,student.department as departmentId,department.department,pic from student,department where department.id=student.department");
	}

	public boolean insertStudent(String user_name, String real_name, String password, String phone, int department,String pic) {
		return new Student().set("user_name", user_name).set("real_name", real_name).set("password", password).set("phone", phone).set("department", department).set("pic",pic).save();
	}

	public boolean updateStudent(int id, String user_name, String real_name, String password, String phone, int department,String pic) {
		return Student.dao.findById(id).setUserName(user_name).setRealName(real_name).setPassword(password).setPhone(phone).setDepartment(department).setPic(pic).update();
	}

	public boolean deleteStudent(int id) {
		return Student.dao.findById(id).delete();
	}

	public List loginStudent(String user,String password){
		return Student.dao.find("select * from student where user_name =? and password = ?",user,password);
	}
}
