package Ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.jmx.snmp.tasks.Task;

import daoProject.ProjectService;
import daoTask.TaskService;

/**
 * Servlet implementation class AjaxServletDeleteTaskFromTaskId
 */
@WebServlet("/AjaxServletDeleteTaskFromTaskId")
public class AjaxServletDeleteTaskFromTaskId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		String msg = "error";

		String taskId = request.getParameter("taskId");
		System.out.println("Task id for deleting task  :  " + taskId);

		TaskService taskService = new TaskService();
		boolean tmp = taskService.delete(taskId);
		// System.out.println("\n\n\n\n\n\n\n"+tmp+"\n\n\n\n\n\n");
		if (tmp == true) {
			msg = "success";
		}

		out.print(msg);
		out.close();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
