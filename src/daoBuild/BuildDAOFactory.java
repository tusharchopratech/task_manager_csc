package daoBuild;

public class BuildDAOFactory {

	public static BuildDAOInterface getBuildDao() {
		return new BuildDAOImplementation();
	}
}
