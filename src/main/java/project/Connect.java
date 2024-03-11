package project;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
public class Connect {
	static String dbUrl="jdbc:mysql://localhost:3306/User_DB";
	static String dbUname="root";
	static String dbPassword="";
	static String dbDriver="com.mysql.cj.jdbc.Driver";
	 public static  Statement connectionStatement() {
		 Statement st=null;
		try {
			Class.forName(dbDriver);
			Connection con=DriverManager.getConnection(dbUrl, dbUname, dbPassword);
			st=con.createStatement();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return st;
	}
	 
}
