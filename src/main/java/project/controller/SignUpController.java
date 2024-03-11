package project.controller;
import java.sql.Statement;

import project.Connect;
import project.model.SignUpModel;
public class SignUpController {
	SignUpModel model;
	public SignUpController(SignUpModel model)
	{
		this.model=model;
	}
	public boolean store() {
		
		try {
			Statement st=Connect.connectionStatement();
			String sql="insert into user_data(Username,Email,Password) values('"+model.getusername()+"','"+model.getemail()+"','"+model.getpassword()+"')";
			st.execute(sql);
			sql="create table "+model.getusername()+"(Task varchar(50),Status varchar(20))";
			st.execute(sql);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
