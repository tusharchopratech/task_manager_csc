package daoProject;

import java.util.ArrayList;

import model.BeanProject;

public class ProjectService {

	ProjectDAOInterface dao = ProjectDAOFactory.getProjectDao();

	public BeanProject insert(BeanProject beanProject) {
		return dao.insert(beanProject);
	}

	public BeanProject update(BeanProject beanProject) {
		return dao.update(beanProject);
	}

	public boolean delete(int userId) {
		return dao.delete(userId);
	}

	public BeanProject searchById(String userId) {
		return dao.searchById(userId);
	}

	public ArrayList<BeanProject> showAll() {
		return dao.showAll();
	}

}
