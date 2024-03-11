package project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import project.controller.SignInController;
import project.model.SignInModel;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class SignInServlet
 */
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignInServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SignInModel model=new SignInModel();
		model.setusername(request.getParameter("username"));
		model.setpassword(request.getParameter("password"));
		SignInController control=new SignInController(model);
		if(control.get()) {
			request.setAttribute("username",model.getusername());
			System.out.println("Login Success");
			if(control.gettodo())
			{
				request.setAttribute("resultList", control.resultList);
				request.setAttribute("signinsuccess","");
				request.getRequestDispatcher("ToDoListView.jsp").forward(request, response);
				System.out.println("Sign In Task get Success");
			}
			else {
				System.out.println("Sign In Task get Fail");
			}
			
		}
		else if(control.checkexists()){
			System.out.println("Sign In Fail exists");
			request.setAttribute("signinfailinvalid", "");
			request.getRequestDispatcher("SignIn-SignUpView.jsp").forward(request, response);
		}		
		else {
			System.out.println("Sign In Fail");
			request.setAttribute("signinfail", "");
			request.getRequestDispatcher("SignIn-SignUpView.jsp").forward(request, response);
		}
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
