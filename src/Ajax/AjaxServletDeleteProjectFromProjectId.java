package Ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BeanProject;

import daoProject.ProjectService;

/**
 * Servlet implementation class AjaxServletDeleteProjectFromProjectId
 */
@WebServlet("/AjaxServletDeleteProjectFromProjectId")
public class AjaxServletDeleteProjectFromProjectId extends HttpServlet {
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

		String projectId = request.getParameter("projectId");
		System.out.println("Project id for deleting project  :   " + projectId);

		ProjectService projectService = new ProjectService();
		boolean tmp = projectService.delete(Integer.parseInt(projectId));
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
