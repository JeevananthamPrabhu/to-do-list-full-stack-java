package project.controller;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import project.Connect;
import project.model.SignInModel;
import project.model.TaskListModel;
	
public class SignInController {
	SignInModel model;
	public List<TaskListModel> resultList = new ArrayList<>();
	public SignInController(SignInModel model){
		this.model=model;
	}
	public boolean checkexists() {
		try {
			Statement st=Connect.connectionStatement();
			String sql="select * from user_data where UserName='"+model.getusername()+"'";
			ResultSet r=st.executeQuery(sql);
			if(r.next())
			return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;	
	}
	public boolean get() {
		try {
			Statement st=Connect.connectionStatement();
			String sql="select * from user_data where UserName='"+model.getusername()+"' and Password='"+model.getpassword()+"'";
			ResultSet r=st.executeQuery(sql);
			if(r.next())
			return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;	
	}
	public boolean gettodo() {
		try {
			Statement st=Connect.connectionStatement();
			String sql="select * from "+model.getusername();
			ResultSet r=st.executeQuery(sql);
			while(r.next()) {
				TaskListModel m=new TaskListModel();
				m.settask(r.getString(1));
				m.setstatus(r.getString(2));
				m.setdate(r.getString(3));
				resultList.add(m);
			}
			return true;		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
		
		
	}

}
