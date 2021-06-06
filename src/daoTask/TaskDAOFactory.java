package daoTask;

public class TaskDAOFactory {

	public static TaskDAOInterface getTaskDao() {
		return new TaskDAOImplementation();
	}
}
