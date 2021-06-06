package daoProject;

public class ProjectDAOFactory {

	public static ProjectDAOInterface getProjectDao() {
		return new ProjectDAOImplementation();
	}
}
