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
import daoBuild.BuildService;

/**
 * Servlet implementation class AjaxServletGetAllBuilds
 */
@WebServlet("/AjaxServletGetAllBuilds")
public class AjaxServletGetAllBuilds extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		response.setContentType("application/xml");

		BuildService buildService = new BuildService();
		ArrayList<BeanBuild> beanBuildList = buildService.showAll();

		System.out.println("\n\n\n\n\n\n" + beanBuildList + "\n\n\n\n\n");

		StringBuffer msg = new StringBuffer(50);
		msg.append("<build-info>");
		for (int i = 0; i < beanBuildList.size(); i++) {
			msg.append("<build-id>" + beanBuildList.get(i).getBuildId()
					+ "</build-id>");
			msg.append("<build-name>" + beanBuildList.get(i).getBuildName()
					+ "</build-name>");
			msg.append("<build-status>" + beanBuildList.get(i).getBuildStatus()
					+ "</build-status>");
			msg.append("<build-comments>" + beanBuildList.get(i).getComments()
					+ "</build-comments>");
			msg.append("<build-endDate>" + beanBuildList.get(i).getEndDate()
					+ "</build-endDate>");
			msg.append("<build-startDate>"
					+ beanBuildList.get(i).getStartDate()
					+ "</build-startDate>");
			msg.append("<build-projectId>"
					+ beanBuildList.get(i).getProjectId()
					+ "</build-projectId>");
			msg.append("<build-isActive>" + beanBuildList.get(i).getIsActive()
					+ "</build-isActive>");
			msg.append("<build-workerId>"
					+ beanBuildList.get(i).getBuildWorkerId()
					+ "</build-workerId>");
		}
		msg.append("</build-info>");
		out.print(msg.toString());
		// out.print(beanBuildList);

		// System.out.println(msg.toString());

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
