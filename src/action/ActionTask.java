package action;

import java.beans.Beans;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BeanProject;
import model.BeanProjectUsers;
import model.BeanTask;
import model.BeanUser;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import computation.ComputeWork;

import daoProject.ProjectService;
import daoProjectUser.ProjectUsersService;
import daoTask.TaskService;
import daoUser.UserService;

public class ActionTask extends DispatchAction {

	public ActionForward insertTask(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) throws Exception {

		String msg = "CreateTask2";
		BeanTask beanTask = (BeanTask) form;

		// Database Entry Code
		System.out.println(beanTask.getTaskName());
		System.out.println(beanTask.getTaskDescription());
		System.out.println(beanTask.getStartDate());
		System.out.println(beanTask.getInitialEstimate());

		String projectId = req.getParameter("projectId");
		System.out.println("Task ID " + projectId);

		HttpSession httpSession = req.getSession();
		String userId = (String) httpSession.getAttribute("userId");

		beanTask.setActualCompletionDate("--");
		beanTask.setActualStartDate("--");
		beanTask.setActualWorkComplete("0");
		beanTask.setAssignedTo("--");
		beanTask.setBuildId("--");
		beanTask.setCompleteY_N("n");
		beanTask.setDeleted("--");
		beanTask.setFinishDate("--");
		beanTask.setProjectId(projectId);
		beanTask.setReleaseId("--");
		beanTask.setRevisedEstimate("--");
		beanTask.setTaskId(projectId + "T");

		TaskService taskService = new TaskService();
		BeanTask tmp = taskService.insert(beanTask);
		if (tmp != null) {
			System.out.println("Task Id : " + tmp.getId());
			beanTask.setTaskId(beanTask.getTaskId() + beanTask.getId());
			BeanTask tmp2 = taskService.update(beanTask);
			if (tmp2 != null) {
				System.out.println("Success in TaskTable Key Insertion");

				System.out.println("\n\n\n\n\n\n" + tmp2 + "\n\n\n\n\n\n");

				ComputeWork.computeProjectFromNewTask(tmp2.getTaskId());
			} else {
				System.out.println("Error in TaskTable Key Insertion");
			}
		} else {
			System.out.println("Error in TaskTable Insertion");
		}

		res.sendRedirect("tabtask.jsp?projectId=" + projectId);
		return mapping.findForward(msg);

	}

	public ActionForward insertSubTask(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) throws Exception {

		String msg = "CreateTask2";
		BeanTask beanTask = (BeanTask) form;

		// Database Entry Code
		System.out.println(beanTask.getTaskName());
		System.out.println(beanTask.getTaskDescription());
		System.out.println(beanTask.getStartDate());
		System.out.println(beanTask.getInitialEstimate());
		System.out.println(beanTask.getAssignedTo());

		String taskId = req.getParameter("taskId");
		System.out.println("Task ID in insertSubTask() : " + taskId);

		String projectId = taskId.substring(0, taskId.indexOf("T"));
		System.out.println("Project Id by Cutting : " + projectId);

		/*
		 * HttpSession httpSession=req.getSession(); String userId=(String)
		 * httpSession.getAttribute("userId");
		 */

		beanTask.setActualCompletionDate("--");
		beanTask.setActualStartDate("--");
		beanTask.setActualWorkComplete("0");
		// beanTask.setAssignedTo("--");
		beanTask.setBuildId("--");
		beanTask.setCompleteY_N("No");
		beanTask.setDeleted("--");
		beanTask.setFinishDate("--");
		beanTask.setProjectId(projectId);
		beanTask.setReleaseId("--");
		beanTask.setRevisedEstimate("--");
		beanTask.setTaskId(taskId + "ST");

		// System.out.println("Users Id : "+beanTask.getAssignedTo());

		// Insertion of Subtask in Task table
		TaskService taskService = new TaskService();
		BeanTask tmp = taskService.insert(beanTask);
		if (tmp != null) {
			// Subtask key insertion
			System.out.println("SubTask Id : " + tmp.getId());
			beanTask.setTaskId(beanTask.getTaskId() + beanTask.getId());
			BeanTask tmp2 = taskService.update(beanTask);
			if (tmp2 != null) {
				System.out.println("Success in SubTaskTable Key Insertion");

				// Insertion ProjectUsers Table
				String assignedUserId = beanTask.getAssignedTo();

				UserService userService = new UserService();
				BeanUser beanUser = userService.searchById(assignedUserId);
				String role = beanUser.getDesignation();

				ProjectUsersService projectUserService = new ProjectUsersService();
				BeanProjectUsers beanProjectUsers = new BeanProjectUsers(
						assignedUserId, projectId, role);
				BeanProjectUsers tmp3 = projectUserService
						.insert(beanProjectUsers);

				if (tmp3 != null) {
					// msg="TabProject";
					System.out
							.println("Success IN Insertion ProjectUsers table");
					System.out.println(tmp2);
				} else {
					req.setAttribute("message",
							"Error In Insertion. Please try again or Refresh the page.");
					System.out.println("Error in Insertion ProjectUsers Table");
					// return mapping.findForward(msg);
				}

			} else {
				System.out.println("Error in SubTaskTable Key Insertion");
			}
		} else {
			System.out.println("Error in SubTaskTable Insertion");
		}

		System.out.println("Task id : " + taskId + "     Project Id : "
				+ projectId);

		res.sendRedirect("tabsubtask.jsp?projectId=" + projectId + "&taskId="
				+ taskId);

		return mapping.findForward(msg);

	}

	public ActionForward computeSubTaskWork(ActionMapping mapping,
			ActionForm form, HttpServletRequest req, HttpServletResponse res)
			throws Exception {

		// System.out.println("\n\n\n\n**************\n\n\n\n");
		String actualWorkComplete = req.getParameter("actualWorkComplete");
		String subTaskId = req.getParameter("subTaskId");
		String url = "openSubTask.jsp?subTaskId=" + subTaskId;

		System.out.println("computeSubTaskWork : " + actualWorkComplete);
		System.out.println("computeSubTaskWork : " + subTaskId);

		TaskService taskService = new TaskService();
		BeanTask tmp = taskService.searchById(subTaskId);
		tmp.setActualWorkComplete(actualWorkComplete);
		if (tmp != null) {
			BeanTask tmp2 = taskService.update(tmp);
			if (tmp2 != null) {
				System.out.println("Success in TaskTable Key Updation");
				ComputeWork.computeWorkFromSubTask(subTaskId);
			} else {
				System.out.println("Error in TaskTable Key Updation");
			}
		} else {
			System.out.println("Error in TaskTable Search");
		}

		res.sendRedirect(url);

		return mapping.findForward("");

	}

	public ActionForward computeTaskWork(ActionMapping mapping,
			ActionForm form, HttpServletRequest req, HttpServletResponse res)
			throws Exception {

		// System.out.println("\n\n\n\n**************\n\n\n\n");
		String actualWorkComplete = req.getParameter("actualWorkComplete");
		String taskId = req.getParameter("taskId");
		String url = "openTask.jsp?taskId=" + taskId;

		System.out.println("computeTaskWork : " + actualWorkComplete);
		System.out.println("computeTaskWork : " + taskId);

		TaskService taskService = new TaskService();
		BeanTask tmp = taskService.searchById(taskId);
		tmp.setActualWorkComplete(actualWorkComplete);

		System.out.println("\n\n\n\n" + tmp + "\n\n\n\n");

		if (tmp != null) {
			BeanTask tmp2 = taskService.update(tmp);
			if (tmp2 != null) {
				System.out.println("Success in TaskTable Key Updation");
				// ComputeWork.computeWorkFromSubTask(subTaskId);
				ComputeWork.computeProjectFromNewTask(taskId);
			} else {
				System.out.println("Error in TaskTable Key Updation");
			}
		} else {
			System.out.println("Error in TaskTable Search");
		}

		res.sendRedirect(url);

		return mapping.findForward("");

	}

	public ActionForward updateTask(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) throws Exception {

		String msg = "EditTask";
		BeanTask beanTask = (BeanTask) form;

		// System.out.println("\n\n\n\n\n"+beanTask+"\n\n\n\n");

		// Update in Project Table ************************

		TaskService taskService = new TaskService();
		BeanTask tmp = taskService.update(beanTask);
		if (tmp != null) {
			msg = "TabTask";
			System.out.println("Success IN Updation Project table");
			System.out.println(tmp);
			res.sendRedirect("tabtask.jsp?projectId=" + beanTask.getProjectId());
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
