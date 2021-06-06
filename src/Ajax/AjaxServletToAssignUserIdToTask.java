package Ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BeanTask;
import daoTask.TaskService;

/**
 * Servlet implementation class AjaxServletToAssignUserIdToTask
 */
@WebServlet("/AjaxServletToAssignUserIdToTask")
public class AjaxServletToAssignUserIdToTask extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		String msg = "error";

		String userId = request.getParameter("userId");
		String taskId = request.getParameter("taskId");

		TaskService taskService = new TaskService();
		BeanTask tmp = taskService.searchById(taskId);
		if (tmp != null) {
			tmp.setAssignedTo(userId);
			BeanTask tmp2 = taskService.update(tmp);
			if (tmp2 != null) {
				msg = "success";
			}
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
