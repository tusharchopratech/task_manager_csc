package Ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BeanTask;
import model.BeanUser;
import daoTask.TaskService;
import daoUser.UserService;

/**
 * Servlet implementation class AjaxServletGetSubTask
 */
@WebServlet("/AjaxServletGetSubTask")
public class AjaxServletGetSubTask extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		response.setContentType("application/xml");
		String subTaskId = request.getParameter("subTaskId");
		System.out.println("\n\n\n\n\n\nSubtask : " + subTaskId);

		TaskService taskService = new TaskService();
		BeanTask beanTask = taskService.searchById(subTaskId);

		System.out.println(beanTask);

		UserService userService = new UserService();
		BeanUser beanUser = userService.searchById(beanTask.getAssignedTo());
		String userName = beanUser.getName();
		String userDesignation = beanUser.getDesignation();

		StringBuffer msg = new StringBuffer(50);
		msg.append("<task-info>");

		msg.append("<task-assignedToUserName>" + userName
				+ "</task-assignedToUserName>");
		msg.append("<task-assignedToUserNameDesignation>" + userDesignation
				+ "</task-assignedToUserNameDesignation>");

		msg.append("<task-id>" + beanTask.getTaskId() + "</task-id>");
		msg.append("<task-name>" + beanTask.getTaskName() + "</task-name>");
		msg.append("<task-complete>" + beanTask.getCompleteY_N()
				+ "</task-complete>");

		msg.append("<task-description>" + beanTask.getTaskDescription()
				+ "</task-description>");
		msg.append("<task-startDate>" + beanTask.getStartDate()
				+ "</task-startDate>");
		msg.append("<task-finishDate>" + beanTask.getFinishDate()
				+ "</task-finishDate>");
		msg.append("<task-initialEstimate>" + beanTask.getInitialEstimate()
				+ "</task-initialEstimate>");
		msg.append("<task-revisedEstimate>" + beanTask.getRevisedEstimate()
				+ "</task-revisedEstimate>");
		// System.out.println("\n\n\n\n\n\n actual work complete"+beanTask.getActualWorkComplete());
		msg.append("<task-actualWorkComplete>"
				+ beanTask.getActualWorkComplete()
				+ "</task-actualWorkComplete>");
		msg.append("<task-actualStartDate>" + beanTask.getActualStartDate()
				+ "</task-actualStartDate>");
		msg.append("<task-actualCompletionDate>"
				+ beanTask.getActualCompletionDate()
				+ "</task-actualCompletionDate>");
		msg.append("<task-assignedTo>" + beanTask.getAssignedTo()
				+ "</task-assignedTo>");
		msg.append("<task-deleted>" + beanTask.getDeleted() + "</task-deleted>");

		msg.append("</task-info>");

		out.print(msg.toString());
		System.out.println(msg.toString());

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
