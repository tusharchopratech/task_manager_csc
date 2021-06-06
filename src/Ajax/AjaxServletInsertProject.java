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
 * Servlet implementation class AjaxServletInsertProject
 */
@WebServlet("/AjaxServletInsertProject")
public class AjaxServletInsertProject extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		String userid = request.getParameter("userId");
		String projectName = request.getParameter("projectName");
		String startingDate = request.getParameter("startingDate");
		String description = request.getParameter("description");

		System.out.println(userid);
		System.out.println(projectName);
		System.out.println(startingDate);
		System.out.println(description);

		ProjectService projectService = new ProjectService();
		BeanProject beanProject = new BeanProject(startingDate, "", "yes",
				"no", "projectDescripton 1", "", projectName, userid);

		BeanProject tmp = projectService.insert(beanProject);
		if (tmp != null) {
			out.print("success");
		} else {
			out.print("error");
		}

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
