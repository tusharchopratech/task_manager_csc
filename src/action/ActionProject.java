package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BeanProject;
import model.BeanProject;
import model.BeanProjectUsers;
import model.BeanUser;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import daoProject.ProjectService;
import daoProjectUser.ProjectUsersService;
import daoUser.UserService;

public class ActionProject extends DispatchAction {

	public ActionForward insert(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) throws Exception {

		String msg = "CreateProject2";
		BeanProject beanProject = (BeanProject) form;
		// Database Entry Code
		/*
		 * System.out.println(beanProject.getProjectName());
		 * System.out.println(beanProject.getProjectDescripton());
		 * System.out.println(beanProject.getStartDate());
		 */

		HttpSession httpSession = req.getSession();
		String userId = (String) httpSession.getAttribute("userId");
		// System.out.println(userId);

		beanProject.setIsActive("yes");
		beanProject.setEndDate("--");
		beanProject.setProjectComplitionStatus("0");
		beanProject.setProjectHeadId(userId);
		beanProject.setProjectExtraColumn("--");

		// Insert in Project Table ************************

		ProjectService projectService = new ProjectService();
		BeanProject tmp = projectService.insert(beanProject);
		if (tmp != null) {
			// msg="TabProject";
			System.out.println("Success IN Insertion Project table");
			System.out.println(tmp);
		} else {
			req.setAttribute("message",
					"Error In Insertion. Please try again or Refresh the page.");
			System.out.println("Error in Insertion Project table");
			return mapping.findForward(msg);
		}

		// Insert in Project Table Ends **********************

		UserService userService = new UserService();
		BeanUser beanUser = userService.searchById(userId);
		String role = beanUser.getDesignation();

		ProjectUsersService projectUserService = new ProjectUsersService();
		BeanProjectUsers beanProjectUsers = new BeanProjectUsers(userId,
				String.valueOf(tmp.getProjectId()), role);
		BeanProjectUsers tmp2 = projectUserService.insert(beanProjectUsers);

		if (tmp2 != null) {
			msg = "TabProject";
			System.out.println("Success IN Insertion ProjectUsers table");
			System.out.println(tmp2);
		} else {
			req.setAttribute("message",
					"Error In Insertion. Please try again or Refresh the page.");
			System.out.println("Error in Insertion ProjectUsers Table");
			return mapping.findForward(msg);
		}

		return mapping.findForward(msg);

	}

	public ActionForward update(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) throws Exception {

		String msg = "EditProject";
		BeanProject beanProject = (BeanProject) form;

		System.out.println(beanProject);

		// Update in Project Table ************************

		ProjectService projectService = new ProjectService();
		BeanProject tmp = projectService.update(beanProject);
		if (tmp != null) {
			msg = "TabProject";
			System.out.println("Success IN Updation Project table");
			System.out.println(tmp);
			res.sendRedirect("tabproject.jsp");
		} else {
			req.setAttribute("message",
					"Error In Updation. Please try again or Refresh the page.");
			System.out.println("Error in Insertion Project table");
			// return mapping.findForward(msg);
		}

		// Update in Project Table Ends **********************

		return mapping.findForward(msg);

	}

}
