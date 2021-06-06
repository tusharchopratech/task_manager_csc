package daoTask;

import java.util.ArrayList;

import model.BeanTask;

public interface TaskDAOInterface {
	public BeanTask insert(BeanTask beanTask);

	public BeanTask update(BeanTask beanTask);

	public boolean delete(String userId);

	public BeanTask searchById(String userId);

	public ArrayList<BeanTask> searchTasksByProjectId(String projectId);

	public ArrayList<BeanTask> searchTasksByBuildId(String buildId);

	public ArrayList<BeanTask> showAll();

	public ArrayList<BeanTask> searchSubTasksBtTaskId(String taskId);
}
