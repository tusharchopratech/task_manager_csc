package Ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BeanBuild;
import model.BeanTask;
import model.BeanUser;
import daoBuild.BuildService;
import daoTask.TaskService;
import daoUser.UserService;

/**
 * Servlet implementation class AjaxServletToGetBuild
 */
@WebServlet("/AjaxServletToGetBuild")
public class AjaxServletToGetBuild extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		response.setContentType("application/xml");
		String buildId = request.getParameter("buildId");
		System.out.println("\n\n\n\n\n\nSubtask : " + buildId);

		BuildService buildService = new BuildService();
		BeanBuild beanBuild = buildService.searchById(buildId);

		System.out.println(beanBuild);

		TaskService taskService = new TaskService();
		ArrayList<BeanTask> beanTaskArrayList = taskService
				.searchTasksByBuildId(buildId);

		StringBuffer msg = new StringBuffer(50);
		msg.append("<build-info>");

		msg.append("<buildId>" + beanBuild.getBuildId() + "</buildId>");
		msg.append("<startDate>" + beanBuild.getStartDate() + "</startDate>");
		msg.append("<endDate>" + beanBuild.getEndDate() + "</endDate>");
		msg.append("<isActive>" + beanBuild.getIsActive() + "</isActive>");
		msg.append("<projectId>" + beanBuild.getProjectId() + "</projectId>");

		msg.append("<buildName>" + beanBuild.getBuildName() + "</buildName>");
		msg.append("<buildStatus>" + beanBuild.getBuildStatus()
				+ "</buildStatus>");
		msg.append("<comments>" + beanBuild.getComments() + "</comments>");
		msg.append("<buildWorkerId>" + beanBuild.getBuildWorkerId()
				+ "</buildWorkerId>");
		msg.append("<taskListSize>" + beanTaskArrayList.size()
				+ "</taskListSize>");

		for (int i = 0; i < beanTaskArrayList.size(); i++) {
			msg.append("<beanTaskName>"
					+ beanTaskArrayList.get(i).getTaskName()
					+ "</beanTaskName>");
			msg.append("<beanTaskId>" + beanTaskArrayList.get(i).getTaskId()
					+ "</beanTaskId>");
		}

		msg.append("</build-info>");

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
