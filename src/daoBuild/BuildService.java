package daoBuild;

import java.util.ArrayList;

import model.BeanBuild;
import model.BeanUser;

public class BuildService {

	BuildDAOInterface dao = BuildDAOFactory.getBuildDao();

	public BeanBuild insert(BeanBuild beanBuild) {
		return dao.insert(beanBuild);
	}

	public BeanBuild update(BeanBuild beanBuild) {
		return dao.update(beanBuild);
	}

	public boolean delete(String taskId) {
		return dao.delete(taskId);
	}

	public BeanBuild searchById(String taskId) {
		return dao.searchById(taskId);
	}

	public ArrayList<BeanBuild> showAll() {
		return dao.showAll();
	}

}
