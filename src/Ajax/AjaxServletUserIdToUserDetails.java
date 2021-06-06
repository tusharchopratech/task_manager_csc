package Ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daoUser.UserService;
import model.BeanUser;

/**
 * Servlet implementation class AjaxServletUserIdToUserDetails
 */
@WebServlet("/AjaxServletUserIdToUserDetails")
public class AjaxServletUserIdToUserDetails extends HttpServlet {
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
		System.out.println("User Id in \"AjaxServletUserIdToUserDetails\":"
				+ userId);

		UserService userService = new UserService();
		BeanUser beanUser = userService.searchById(userId);

		StringBuffer msg = new StringBuffer(50);
		msg.append("<user-info>");
		msg.append("<user-userId>" + beanUser.getUserId() + "</user-userId>");
		msg.append("<user-password>" + beanUser.getPassword()
				+ "</user-password>");
		msg.append("<user-name>" + beanUser.getName() + "</user-name>");
		msg.append("<user-gender>" + beanUser.getGender() + "</user-gender>");
		msg.append("<user-email>" + beanUser.getEmail() + "</user-email>");
		msg.append("<user-dob>" + beanUser.getDate() + "</user-dob>");
		msg.append("<user-designation>" + beanUser.getDesignation()
				+ "</user-designation>");
		msg.append("<user-id>" + beanUser.getId() + "</user-id>");
		msg.append("</user-info>");
		out.print(msg);
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
