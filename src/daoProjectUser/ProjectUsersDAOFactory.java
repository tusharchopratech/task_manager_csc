package daoProjectUser;

import daoUser.UserDAOImplementation;
import daoUser.UserDAOInterface;

public class ProjectUsersDAOFactory {
	public static ProjectUserDAOInterface getProjectUsersDao() {
		return new ProjectUserDAOImplementation();
	}
}
