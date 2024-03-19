<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="project.model.TaskListModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>To-Do List</title>
    <style>
      *{
            padding: 0%;
            margin: 0%;
            
        }
        button{
            cursor: pointer;
        }
        .container{
            width: fit-content;
            margin: 20px 50px;
            background-color: antiquewhite;
            font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 30px;
            text-align: center;
            border-radius: 10px;
            position: relative;
        }
        .container h1{
            margin-bottom: 20px;
        }
        .form-task{
            margin-bottom: 20px;
        }
        .form-task input{
            font-size: large;
            outline: none;
            padding: 10px;
            border: 2px solid rgb(110, 105, 105);
            border-radius: 10px;
            max-width: 500px;
            min-width: 220px;
            text-align: center;
        }
        .form-task button{
            width: 150px;
            font-size: large;
            background-color: rgba(0, 0, 255, 0.822);
            border: none;
            color: aliceblue;
            padding: 10px;
            border-radius: 5px ;
        }
        .form-task button:hover{
            box-shadow: 0px 0px 10px  rgba(0, 0, 255, 0.466)
        }
        table,th,td{
            border: 1px solid gray;
            border-collapse: collapse;
            table-layout: fixed;
            height: 50px;
            font-size:larger;
        }
        th{
            background-color: rgba(0, 0, 0, 0.212);
        }
        td.task {
            text-align: justify;
            padding: 10px 25px;
        }
        table button{
            color: white;
            border: none;
            font-size: medium;
            padding: 8px 16px;
            border-radius: 5px;
            margin: 10px;
        }
        table button.del{
            background-color: red;  
        }
        table button.mark{
            background-color: green;
        }
        table button.del:hover{
            box-shadow: 0px 0px 10px  rgba(255, 0, 0, 0.445);
        }
        table button.mark:hover{
            box-shadow: 0px 0px 10px  rgba(0, 255, 21, 0.479);          
        }
        .delete-form ,.status-form{
        display: inline;
        }
        .logout-btn{
            padding: 10px 15px;
            border-radius: 30px;
            color: antiquewhite;
            background-color: rgb(37, 26, 4);
            font-weight: 600;
            font-size: medium;
            letter-spacing: 1px;
            position: absolute;
            right: 30px;
            top: 50px;
        }
        .logout-btn:hover{
            font-size: large;
        }
        .logout-btn:active,table button.del:active,table button.mark:active{
            opacity: 80%; 
        }
        #status{
            font-weight: 600;
        }
        span{
            text-transform: uppercase;
        }
        </style>
</head>
<body>
    <div class="container">
    	
            <button class="logout-btn" onclick="logout()">Logout</button>
        
    <% String username=(String)request.getAttribute("username"); %>
        <h1>Welcome <span><%=username %></span> <br>Your's To-Do List</h1>
        <form class="form-task" action="TaskServlet?username=<%=username %>" method="post">
            <input type="text" placeholder="Write a new task . . ." name="inputtask" oninput="resizeInput(this)" required>
            <input type="text" name="date" id="date" placeholder="Enter Due Date . . ." onfocus="(this.type='date')"required>
            <button type="submit">Add Task</button>
        </form>
        <div class="list">
            <table>
           		<colgroup >
                    <col style="width: 20%;">
                    <col style="width: 10%;">
                    <col style="width: 10%;">
                    <col style="width: 20%;">
                </colgroup>
                <tr>
                    <th>Tasks</th>
                    <th>Due Date</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                <% Object resultListObj = request.getAttribute("resultList");
                if(resultListObj != null){
                	List<TaskListModel> resultList = (List<TaskListModel>) resultListObj;
                for(TaskListModel model : resultList){
                    %>
                    <tr>
                        <td class="task"><%=model.gettask() %></td>
                        <td><%= model.getdate() %> </td>
                        <td id="status"><%= model.getstatus() %> </td>
                        <td>
	                        <form class="status-form" action="StatusServlet?task=<%=model.gettask()%>&username=<%=username %>" method="post">
		                        <%if(model.getstatus().equals("Pending")){%>
		                        <button type="submit" class="mark" >Mark as Completed</button>                    	                       
		                        <%} %>
                         	</form>
                         	<form class="delete-form" onsubmit="confirm(event)" action="DeleteTaskServlet?task=<%=model.gettask()%>&username=<%=username %>" method="post">
                      	  		<button type="submit" class="del" >Delete</button>
                      	  	</form>
                 		 </td>
                    </tr>
                    <%} 
                    }%>
            </table>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
    	function logout(){
    		Swal.fire({
                title: 'Are you sure want to Logout ? ',
                icon: 'warning',
                confirmButtonText: 'Yes',
                showCancelButton: true,
                cancelButtonText: "No",
                confirmButtonColor: "rgb(34, 139, 34)",
                cancelButtonColor: "#d33"
              }).then((result) => {
            	  if (result.isConfirmed) {
            		  window.location.replace("SignIn-SignUpView.jsp");
            		  }
            		});
    	}
    	
        function resizeInput(input){
            input.style.width=Math.max(21.9,input.value.length)+'ch';
        }
        document.querySelectorAll('#status').forEach(function(element) {
            if (element.innerText == "Completed") {
                element.style.color = "green";
            } else {
                element.style.color = "orange";
            }
        });
        
        <% if (request.getAttribute("signinsuccess") != null) { %>
        Swal.fire({
            title: 'Success!!',
            text: 'You are logged in ...',
            icon: 'success',
            showConfirmButton: false,
            timer: 1700
          });
        <% } %>     
        <% if (request.getAttribute("taskadded") != null) { %>
        Swal.fire({
        	  position: "top-end",
        	  icon: "success",
        	  title: "New Task has been Added",
        	  showConfirmButton: false,
        	  timer: 1500
        	});
        <% } %> 
        function confirm(e){
        	e.preventDefault();
        	Swal.fire({
        		  title: "Are you sure want to delete this task ?",
        		  text: "You won't be able to revert this!",
        		  icon: "warning",
        		  showCancelButton: true,
        		  confirmButtonColor: "#3085d6",
        		  cancelButtonColor: "#d33",
        		  confirmButtonText: "Yes, delete it!"
        		}).then((result) => {
        	        if (result.isConfirmed) {
        	            e.target.submit();
        	        }
        	    });      		  
        } 
    </script>
</body>
</html>