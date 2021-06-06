package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BeanUser;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import daoUser.UserService;

public class ActionUser extends DispatchAction {

	public ActionForward insert(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) throws Exception {

		String msg = "";
		BeanUser beanUser = (BeanUser) form;
		// Database Entry Code

		UserService userService = new UserService();
		BeanUser tmp = userService.insert(beanUser);
		if (tmp != null) {
			HttpSession httpSession = req.getSession();
			httpSession.setAttribute("userId", tmp.getUserId());
			httpSession.setAttribute("userDesignation", tmp.getDesignation());

			/*
			 * String uuuu=(String) httpSession.getAttribute("userDesignation");
			 * System.out.println(
			 * "\n\n\n\n\nUserId in Action User Insert from httpsession : "
			 * +uuuu+"\n\n\n\n\n\n");
			 */
			msg = "HomePage";
			System.out.println("Success IN Insertion");
			System.out.println(tmp);
		} else {
			req.setAttribute("message",
					"Error In Insertion. Please try again or Refresh the page.");
			System.out.println("Error in Insertion");
			msg = "Register";
		}

		return mapping.findForward(msg);

	}

	public ActionForward validate(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) throws Exception {

		String msg = "HomePage";
		BeanUser beanUser = (BeanUser) form;

		String userId = beanUser.getUserId();
		String password = beanUser.getPassword();

		System.out.println(userId);
		System.out.println(password);

		UserService userService = new UserService();
		boolean tmp = userService.validate(beanUser.getUserId(),
				beanUser.getPassword());

		System.out.println(tmp);

		if (tmp == true) {
			msg = "HomePage";

			HttpSession httpSession = req.getSession();
			httpSession.setAttribute("userId", userId);

			BeanUser tmp2 = userService.searchById(userId);
			httpSession.setAttribute("userDesignation", tmp2.getDesignation());

		} else {
			msg = "Index";
			req.setAttribute("message", "Incorrect UserID or Password");
		}

		return mapping.findForward(msg);

	}

	public ActionForward invalidateSession(ActionMapping mapping,
			ActionForm form, HttpServletRequest req, HttpServletResponse res)
			throws Exception {

		HttpSession httpSession = req.getSession();
		httpSession.removeAttribute("userId");
		httpSession.removeAttribute("userDesignation");
		httpSession.invalidate();

		res.sendRedirect("index.jsp");

		return mapping.findForward("");

	}

	public ActionForward update(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) throws Exception {

		String msg = "UpdateProfile";
		BeanUser beanUser = (BeanUser) form;
		// Database Entry Code

		System.out.println("\n\n\n\n\n\n" + beanUser + "\n\n\n");

		UserService userService = new UserService();
		BeanUser tmp = userService.update(beanUser);
		if (tmp != null) {
			msg = "TabProject";
			System.out.println("Success IN Updation");
			System.out.println(tmp);
		} else {
			req.setAttribute("message",
					"Error In Updation. Please try again or Refresh the page.");
			System.out.println("Error in Updation");
			msg = "UpdateProfile";
		}

		return mapping.findForward(msg);

	}

}
