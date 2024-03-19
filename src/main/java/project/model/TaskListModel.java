package project.model;

public class TaskListModel {
	private String username;
	private String task;
	private String date;
	private String status="Pending";
	public void setusername(String username) {
		this.username=username;
	}
	public void settask(String task)
	{
		this.task=task;
	}
	public void setstatus(String status)
	{
		this.status=status;
	}
	public void setdate(String date) {
		this.date=date;
	}
	public String getusername() {
		return username;
	}
	public String gettask() {
		return task;
	}
	public String getstatus() {
		return status;
	}
	public String getdate() {
		return date;
	}
}
