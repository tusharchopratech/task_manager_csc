package daoTask;

import java.util.ArrayList;

import model.BeanTask;

public class TaskService {

	TaskDAOInterface dao = TaskDAOFactory.getTaskDao();

	public BeanTask insert(BeanTask beanTask) {
		return dao.insert(beanTask);
	}

	public BeanTask update(BeanTask beanTask) {
		return dao.update(beanTask);
	}

	public boolean delete(String userId) {
		return dao.delete(userId);
	}

	public BeanTask searchById(String taskID) {
		return dao.searchById(taskID);
	}

	public ArrayList<BeanTask> showAll() {
		return dao.showAll();
	}

	public ArrayList<BeanTask> searchTasksByProjectId(String projectId) {
		return dao.searchTasksByProjectId(projectId);
	}

	public ArrayList<BeanTask> searchSubTasksBtTaskId(String taskId) {
		return dao.searchSubTasksBtTaskId(taskId);
	}

	public ArrayList<BeanTask> searchTasksByBuildId(String buildId) {
		return dao.searchTasksByBuildId(buildId);
	}

}
