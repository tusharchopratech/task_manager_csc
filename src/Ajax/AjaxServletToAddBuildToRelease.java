package Ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BeanBuild;
import model.BeanRelease;
import model.BeanTask;
import daoBuild.BuildService;
import daoRelease.ReleaseService;
import daoTask.TaskService;

/**
 * Servlet implementation class AjaxServletToAddBuildToRelease
 */
@WebServlet("/AjaxServletToAddBuildToRelease")
public class AjaxServletToAddBuildToRelease extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		String msg = "error";

		String buildId = request.getParameter("buildId");

		Date d = new Date();

		BuildService buildService = new BuildService();
		BeanBuild beanBuild = buildService.searchById(buildId);

		ReleaseService releaseService = new ReleaseService();
		BeanRelease beanRelease = new BeanRelease(d.toString(), "--", "yes",
				beanBuild.getProjectId(), buildId);

		// System.out.println("\n\n\n\n"+beanRelease+"\n\n\n\n");

		BeanRelease tmp = releaseService.insert(beanRelease);
		System.out.println("\n\n\n\n" + tmp + "\n\n\n\n");
		if (tmp != null) {
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
