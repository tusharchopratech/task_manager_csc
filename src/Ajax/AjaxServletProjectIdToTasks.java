package Ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BeanProject;
import model.BeanTask;
import daoProject.ProjectService;
import daoTask.TaskService;

/**
 * Servlet implementation class AjaxServlet
 */
@WebServlet("/AjaxServletProjectIdToTasks")
public class AjaxServletProjectIdToTasks extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		PrintWriter out = response.getWriter();
		response.setContentType("application/xml");
		String projectId = request.getParameter("projectId");
		System.out.println(projectId);

		TaskService taskService = new TaskService();

		ArrayList<BeanTask> beanTaskList = taskService
				.searchTasksByProjectId(projectId);

		String msg = taskArrayToXML(beanTaskList);

		out.print(msg);
		System.out.println(msg.toString());

		out.close();

	}

	private String taskArrayToXML(ArrayList<BeanTask> beanTaskList) {

		StringBuffer msg = new StringBuffer(50);
		msg.append("<task-info>");

		for (int i = 0; i < beanTaskList.size(); i++) {
			msg.append("<task-id>" + beanTaskList.get(i).getId() + "</task-id>");
			msg.append("<task-taskId>" + beanTaskList.get(i).getTaskId()
					+ "</task-taskId>");
			msg.append("<task-name>" + beanTaskList.get(i).getTaskName()
					+ "</task-name>");
			msg.append("<task-complete>" + beanTaskList.get(i).getCompleteY_N()
					+ "</task-complete>");

			msg.append("<task-description>"
					+ beanTaskList.get(i).getTaskDescription()
					+ "</task-description>");
			msg.append("<task-startDate>" + beanTaskList.get(i).getStartDate()
					+ "</task-startDate>");
			msg.append("<task-finishDate>"
					+ beanTaskList.get(i).getFinishDate()
					+ "</task-finishDate>");
			msg.append("<task-initialEstimate>"
					+ beanTaskList.get(i).getInitialEstimate()
					+ "</task-initialEstimate>");
			msg.append("<task-revisedEstimate>"
					+ beanTaskList.get(i).getRevisedEstimate()
					+ "</task-revisedEstimate>");
			// System.out.println("\n\n\n\n\n\n actual work complete"+beanTaskList.get(i).getActualWorkComplete());
			msg.append("<task-actualWorkComplete>"
					+ beanTaskList.get(i).getActualWorkComplete()
					+ "</task-actualWorkComplete>");
			msg.append("<task-actualStartDate>"
					+ beanTaskList.get(i).getActualStartDate()
					+ "</task-actualStartDate>");
			msg.append("<task-actualCompletionDate>"
					+ beanTaskList.get(i).getActualCompletionDate()
					+ "</task-actualCompletionDate>");
			msg.append("<task-assignedTo>"
					+ beanTaskList.get(i).getAssignedTo()
					+ "</task-assignedTo>");
			msg.append("<task-deleted>" + beanTaskList.get(i).getDeleted()
					+ "</task-deleted>");

			msg.append("<task-buildId>" + beanTaskList.get(i).getBuildId()
					+ "</task-buildId>");
			msg.append("<task-releaseId>" + beanTaskList.get(i).getReleaseId()
					+ "</task-releaseId>");
			msg.append("<task-projectId>" + beanTaskList.get(i).getProjectId()
					+ "</task-projectId>");

		}
		msg.append("</task-info>");
		return msg.toString();
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
