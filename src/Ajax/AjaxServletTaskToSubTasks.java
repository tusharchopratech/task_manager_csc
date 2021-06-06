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
 * Servlet implementation class AjaxServletTaskToSubTasks
 */
@WebServlet("/AjaxServletTaskToSubTasks")
public class AjaxServletTaskToSubTasks extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		response.setContentType("application/xml");
		String taskId = request.getParameter("taskId");
		System.out.println(taskId);

		TaskService taskService = new TaskService();
		ArrayList<BeanTask> beanSubTaskList = taskService
				.searchSubTasksBtTaskId(taskId);

		String msg = taskArrayToXML(beanSubTaskList);

		out.print(msg);
		System.out.println("\n\n\n\n" + msg + "\n\n\n\n");
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

	private String taskArrayToXML(ArrayList<BeanTask> beanSubTaskList) {

		StringBuffer msg = new StringBuffer(50);
		msg.append("<task-info>");

		UserService userService = new UserService();
		BeanUser beanUser = null;

		for (int i = 0; i < beanSubTaskList.size(); i++) {
			beanUser = userService.searchById(beanSubTaskList.get(i)
					.getAssignedTo());
			String userName = beanUser.getName();
			String userDesignation = beanUser.getDesignation();

			// System.out.println("\n\n\n\n"+beanSubTaskList.get(i)+"\n\n\n\n");

			msg.append("<task-assignedToUserName>" + userName
					+ "</task-assignedToUserName>");
			msg.append("<task-assignedToUserNameDesignation>" + userDesignation
					+ "</task-assignedToUserNameDesignation>");

			msg.append("<task-id>" + beanSubTaskList.get(i).getId()
					+ "</task-id>");
			msg.append("<task-taskId>" + beanSubTaskList.get(i).getTaskId()
					+ "</task-taskId>");
			msg.append("<task-name>" + beanSubTaskList.get(i).getTaskName()
					+ "</task-name>");
			msg.append("<task-complete>"
					+ beanSubTaskList.get(i).getCompleteY_N()
					+ "</task-complete>");

			msg.append("<task-description>"
					+ beanSubTaskList.get(i).getTaskDescription()
					+ "</task-description>");
			msg.append("<task-startDate>"
					+ beanSubTaskList.get(i).getStartDate()
					+ "</task-startDate>");
			msg.append("<task-finishDate>"
					+ beanSubTaskList.get(i).getFinishDate()
					+ "</task-finishDate>");
			msg.append("<task-initialEstimate>"
					+ beanSubTaskList.get(i).getInitialEstimate()
					+ "</task-initialEstimate>");
			msg.append("<task-revisedEstimate>"
					+ beanSubTaskList.get(i).getRevisedEstimate()
					+ "</task-revisedEstimate>");
			// System.out.println("\n\n\n\n\n\n actual work complete"+beanSubTaskList.get(i).getActualWorkComplete());
			msg.append("<task-actualWorkComplete>"
					+ beanSubTaskList.get(i).getActualWorkComplete()
					+ "</task-actualWorkComplete>");
			msg.append("<task-actualStartDate>"
					+ beanSubTaskList.get(i).getActualStartDate()
					+ "</task-actualStartDate>");
			msg.append("<task-actualCompletionDate>"
					+ beanSubTaskList.get(i).getActualCompletionDate()
					+ "</task-actualCompletionDate>");
			msg.append("<task-assignedTo>"
					+ beanSubTaskList.get(i).getAssignedTo()
					+ "</task-assignedTo>");
			msg.append("<task-deleted>" + beanSubTaskList.get(i).getDeleted()
					+ "</task-deleted>");

			msg.append("<task-buildId>" + beanSubTaskList.get(i).getBuildId()
					+ "</task-buildId>");
			msg.append("<task-releaseId>"
					+ beanSubTaskList.get(i).getReleaseId()
					+ "</task-releaseId>");
			msg.append("<task-projectId>"
					+ beanSubTaskList.get(i).getProjectId()
					+ "</task-projectId>");

		}
		msg.append("</task-info>");
		return msg.toString();
	}
}
