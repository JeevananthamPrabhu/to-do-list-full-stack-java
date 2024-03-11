package project.model;

public class SignUpModel {
	private String username;
	private String email;
	private String password;
	public void setusername(String username) {
		this.username=username;		
	}
	public void setpassword(String password) {
		this.password=password;		
	}
	public void setemail(String email) {
		this.email=email;		
	}
	public String getusername() {
		return username;		
	}
	public String getpassword() {
		return password;		
	}
	public String getemail() {
		return email;		
	}
}
