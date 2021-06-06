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
import model.BeanProject;
import model.BeanProjectUsers;
import daoProject.ProjectService;
import daoProjectUser.ProjectUsersService;

/**
 * Servlet implementation class AjaxServletUserIdToProject
 */
@WebServlet("/AjaxServletUserIdToProjects")
public class AjaxServletUserIdToProjects extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		response.setContentType("application/xml");
		String userId = request.getParameter("userId");
		System.out.println("User Id :" + userId);
		// int id=Integer.parseInt(userid);

		ProjectUsersService projectUsersService = new ProjectUsersService();
		ArrayList<BeanProjectUsers> beanProjectUserList = projectUsersService
				.searchByProjectsByUserId(userId);

		StringBuffer msg = new StringBuffer(50);
		msg.append("<project-info>");

		for (int i = 0; i < beanProjectUserList.size(); i++) {
			ProjectService projectService = new ProjectService();
			BeanProject beanProject = projectService
					.searchById(beanProjectUserList.get(i).getProjectId());

			msg.append("<project-id>" + beanProject.getProjectId()
					+ "</project-id>");
			msg.append("<project-name>" + beanProject.getProjectName()
					+ "</project-name>");
			msg.append("<project-startDate>" + beanProject.getStartDate()
					+ "</project-startDate>");
			msg.append("<project-endDate>" + beanProject.getEndDate()
					+ "</project-endDate>");
			msg.append("<project-isActive>" + beanProject.getIsActive()
					+ "</project-isActive>");
			msg.append("<project-projectComplitionStatus>"
					+ beanProject.getProjectComplitionStatus()
					+ "</project-projectComplitionStatus>");
			msg.append("<project-projectDescripton>"
					+ beanProject.getProjectDescripton()
					+ "</project-projectDescripton>");
			msg.append("<project-projectExtraColumn>"
					+ beanProject.getProjectExtraColumn()
					+ "</project-projectExtraColumn>");
			msg.append("<project-projectHeadId>"
					+ beanProject.getProjectHeadId()
					+ "</project-projectHeadId>");

		}

		msg.append("</project-info>");

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
