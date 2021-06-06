package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BeanBuild;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import daoBuild.BuildService;

public class ActionBuild extends DispatchAction {

	public ActionForward insert(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) throws Exception {

		String msg = "";

		// System.out.println("\n\n\n"+"hello"+"\n\n\n");

		BeanBuild beanBuild = (BeanBuild) form;
		beanBuild.setComments("--");
		beanBuild.setEndDate("--");
		beanBuild.setIsActive("--");
		beanBuild.setProjectId("--");
		beanBuild.setBuildStatus("0");
		// Database Entry Code

		System.out.println("\n\n\n" + beanBuild + "\n\n\n");

		BuildService buildService = new BuildService();
		BeanBuild tmp = buildService.insert(beanBuild);
		if (tmp != null) {
			msg = "TabBuild";
			System.out.println("Success IN Insertion");
			System.out.println(tmp);
		} else {
			req.setAttribute("message",
					"Error In Insertion. Please try again or Refresh the page.");
			System.out.println("Error in Insertion");
			msg = "CreateBuild";
		}

		return mapping.findForward(msg);

	}

	public ActionForward update(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) throws Exception {

		String msg = "";

		// System.out.println("\n\n\n"+"hello"+"\n\n\n");

		BeanBuild beanBuild = (BeanBuild) form;

		// Database Entry Code

		System.out.println("\n\n\n" + beanBuild + "\n\n\n");

		BuildService buildService = new BuildService();
		BeanBuild tmp = buildService.update(beanBuild);
		if (tmp != null) {
			msg = "TabBuild";
			System.out.println("Success IN Updation");
			System.out.println(tmp);
		} else {
			req.setAttribute("message",
					"Error In Updation. Please try again or Refresh the page.");
			System.out.println("Error in Updation");
			res.sendRedirect("editBuild.jsp?buildId=" + beanBuild.getBuildId());
		}

		return mapping.findForward(msg);

	}

	public ActionForward setBuildProgress(ActionMapping mapping,
			ActionForm form, HttpServletRequest req, HttpServletResponse res)
			throws Exception {

		String msg = "error";

		String buildStatus = req.getParameter("actualWorkComplete");
		String buildId = req.getParameter("buildId");

		BuildService buildService = new BuildService();
		BeanBuild beanBuild = buildService.searchById(buildId);

		if (beanBuild != null) {
			beanBuild.setBuildStatus(buildStatus);
			BeanBuild tmp = buildService.update(beanBuild);

			if (tmp != null) {
				res.sendRedirect("openBuildPage.jsp?buildId=" + buildId);
			}

		}

		return mapping.findForward(msg);

	}

}
