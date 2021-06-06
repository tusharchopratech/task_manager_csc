package Ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BeanUser;
import daoUser.UserService;

/**
 * Servlet implementation class AjaxServletToCheckNewUserId
 */
@WebServlet("/AjaxServletToCheckNewUserId")
public class AjaxServletToCheckNewUserId extends HttpServlet {
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

		String userId = request.getParameter("userId");

		System.out.println("\n\n\n\n\n" + userId + "\n\n\n\n");

		UserService userService = new UserService();
		BeanUser tmp = userService.searchById(userId);
		if (tmp != null) {
			msg = "exists";
			System.out.println("\n\n" + tmp + "\n\n");
		} else {
			msg = "new";
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
