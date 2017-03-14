public class Student extends BaseStudent<Student> {    public List getStudent(){        return Student.dao.find("select * from student");    }    public boolean insertStudent(String user_name,String real_name,String password,String phone,int department) {        return new Student().set("user_name",user_name).set("real_name",real_name).set("password",password).set("phone",phone).set("department",department).save();    }    public boolean updateStudent(int id,String user_name,String real_name,String password,String phone,int department) {        return Student.dao.findById(id).setUser_name(user_name).setReal_name(real_name).setPassword(password).setPhone(phone).setDepartment(department).update();    }    public boolean deleteStudent(int id){        return Student.dao.findById(id).delete();    }}