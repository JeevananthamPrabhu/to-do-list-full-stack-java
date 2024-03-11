package project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import project.controller.SignUpController;
import project.model.SignUpModel;

import java.io.IOException;

/**
 * Servlet implementation class SignUpServlet
 */
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SignUpModel model=new SignUpModel();
		model.setusername(request.getParameter("username"));
		model.setemail(request.getParameter("email"));
		model.setpassword(request.getParameter("password"));
		if(new SignUpController(model).store())
		{
			request.setAttribute("signupsuccess", "");
			request.getRequestDispatcher("SignIn-SignUpView.jsp").forward(request, response);
			System.out.println("SignUp Success");
		}
		else
		{
			System.out.println("SignUp Fail");
			request.setAttribute("username", model.getusername());
			request.setAttribute("signupfail","");
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
