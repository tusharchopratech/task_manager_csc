package Ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BeanUser;

import daoUser.UserService;

/**
 * Servlet implementation class AjaxServletGetUsersList
 */
@WebServlet("/AjaxServletGetUsersList")
public class AjaxServletGetUsersList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		response.setContentType("application/xml");

		String msg = getUserDetails();

		out.print(msg);
		// System.out.println(msg.toString());
		out.close();
	}

	private String getUserDetails() {
		StringBuffer msg = new StringBuffer(50);
		msg.append("<user-info>");

		UserService userService = new UserService();
		ArrayList<BeanUser> beanUSerArrayList = userService.showAll();

		msg.append("<user-info-size>" + beanUSerArrayList.size()
				+ "</user-info-size>");

		for (int i = 0; i < beanUSerArrayList.size(); i++) {
			if (!(beanUSerArrayList.get(i).getDesignation().equals("manager") || beanUSerArrayList
					.get(i).getDesignation().equals("team leader"))) {
				msg.append("<user-id>" + beanUSerArrayList.get(i).getUserId()
						+ "</user-id>");
				msg.append("<user-name>" + beanUSerArrayList.get(i).getName()
						+ "</user-name>");
				msg.append("<user-designation>"
						+ beanUSerArrayList.get(i).getDesignation()
						+ "</user-designation>");
			}
		}
		msg.append("</user-info>");
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
