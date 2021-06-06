package computation;

import java.util.ArrayList;

import model.BeanProject;
import model.BeanTask;
import daoProject.ProjectService;
import daoTask.TaskService;

public class ComputeWork {
	static TaskService taskService;

	public static void computeWorkFromSubTask(String subTaskId) {
		String projectId = subTaskId.substring(0, subTaskId.indexOf("T"));
		// String taskId=subTaskId.substring(0, subTaskId.indexOf("ST"));

		/*
		 * System.out.println("Computation Project Id : "+projectId);
		 * System.out.println("Computation Task Id : "+taskId);
		 * System.out.println("Computation Subtask Id : "+subTaskId);
		 */

		startCompute(projectId);

	}

	public static void computeProjectFromNewTask(String taskId) {
		String projectId = taskId.substring(0, taskId.indexOf("T"));

		taskService = new TaskService();
		ArrayList<BeanTask> beanTaskArrayList = taskService
				.searchTasksByProjectId(projectId);
		float sum = 0;
		for (int i = 0; i < beanTaskArrayList.size(); i++) {
			sum += Double.parseDouble(beanTaskArrayList.get(i)
					.getActualWorkComplete());
		}
		sum = sum / beanTaskArrayList.size();

		ProjectService projectService = new ProjectService();
		BeanProject beanProject = projectService.searchById(projectId);
		beanProject.setProjectComplitionStatus(String.valueOf(sum));

		BeanProject tmp = projectService.update(beanProject);
		if (tmp != null) {
			System.out.println("Project Computed");
		} else {
			{
				System.out.println("Project Not Computed");
			}
		}

	}

	private static void startCompute(String projectId) {

		taskService = new TaskService();

		ArrayList<BeanTask> benaTaskArrayList = taskService
				.searchTasksByProjectId(projectId);
		// Compute Task with subtask
		for (int i = 0; i < benaTaskArrayList.size(); i++) {
			computeAndInsertTaskPercentage(benaTaskArrayList.get(i).getTaskId());
		}

		float sum = 0;
		// Compute Project with Task
		for (int i = 0; i < benaTaskArrayList.size(); i++) {
			sum += Double.parseDouble(benaTaskArrayList.get(i)
					.getActualWorkComplete());
		}
		sum = sum / benaTaskArrayList.size();

		ProjectService projectService = new ProjectService();
		BeanProject beanProject = projectService.searchById(projectId);

		System.out.println("\n\n" + sum + "\n\n");

		beanProject.setProjectComplitionStatus(String.valueOf(sum));

		BeanProject tmp = projectService.update(beanProject);
		if (tmp != null) {
			System.out.println("Project Computed");
		} else {
			{
				System.out.println("Project Not Computed");
			}
		}

	}

	private static void computeAndInsertTaskPercentage(String taskId) {

		System.out.println("Task id : " + taskId);

		ArrayList<BeanTask> benaSubTaskArrayList = taskService
				.searchSubTasksBtTaskId(taskId);

		float sum = 0;
		for (int i = 0; i < benaSubTaskArrayList.size(); i++) {
			sum += Double.parseDouble(benaSubTaskArrayList.get(i)
					.getActualWorkComplete());
		}
		sum = sum / benaSubTaskArrayList.size();

		System.out.println("Sum : " + sum);

		BeanTask beanTask = taskService.searchById(taskId);
		beanTask.setActualWorkComplete(String.valueOf(sum));
		BeanTask tmp = taskService.update(beanTask);
		if (tmp != null) {
			System.out.println("Task ActualWorkComplete Updated");
		} else {
			System.out.println("Task ActualWorkComplete Not Updated");
		}

	}

}
