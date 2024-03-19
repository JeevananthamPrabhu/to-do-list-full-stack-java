package project.controller;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import project.Connect;
import project.model.TaskListModel;

public class TaskListController {
	TaskListModel model;
	public List<TaskListModel> resultList = new ArrayList<>();
	public TaskListController(TaskListModel model){
		this.model=model;
	}
public boolean store() {
		try {
			Statement st=Connect.connectionStatement();
			String sql="insert into "+model.getusername()+"(Task,Status,DueDate) values('"+model.gettask()+"','"+model.getstatus()+"','"+model.getdate()+"')";
			st.execute(sql);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
public boolean get() {
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
