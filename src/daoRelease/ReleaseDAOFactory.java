package daoRelease;

public class ReleaseDAOFactory {

	public static ReleaseDAOInterface getReleaseDao() {
		return new ReleaseDAOImplementation();
	}
}
