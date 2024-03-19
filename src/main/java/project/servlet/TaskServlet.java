package project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import project.controller.SignUpController;
import project.controller.TaskListController;
import project.model.TaskListModel;

import java.io.IOException;

/**
 * Servlet implementation class TaskServlet
 */
public class TaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaskServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//String mark=request.getParameter("");
		
		
		String username=request.getParameter("username");
		String task=request.getParameter("inputtask");
		String datearray[]=request.getParameter("date").split("-");
		String date=datearray[2]+"-"+datearray[1]+"-"+datearray[0];
		TaskListModel model=new TaskListModel();
  
        model.settask(task); 
        model.setusername(username);
        model.setdate(date);
     //   System.out.println(request.getParameter("username"));
        TaskListController control=new TaskListController(model);
        if(control.store())
		{
			System.out.println("task set Success");
			if(control.get())
			{
				request.setAttribute("username", username);
				request.setAttribute("resultList", control.resultList);
				request.setAttribute("taskadded", "");
				request.getRequestDispatcher("ToDoListView.jsp").forward(request, response);
				System.out.println("Task get Success");
			}
			else {
				System.out.println("Task get Fail");
			}
		}
		else
		{
			System.out.println("task set Fail");
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
