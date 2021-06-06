package daoUser;

public class UserDAOFactory {

	public static UserDAOInterface getUserDao() {
		return new UserDAOImplementation();
	}
}
