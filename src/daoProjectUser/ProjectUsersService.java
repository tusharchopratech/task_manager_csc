package daoProjectUser;

import java.util.ArrayList;

import model.BeanProjectUsers;
import daoUser.UserDAOFactory;
import daoUser.UserDAOInterface;

public class ProjectUsersService {

	ProjectUserDAOInterface dao = ProjectUsersDAOFactory.getProjectUsersDao();

	public BeanProjectUsers insert(BeanProjectUsers beanProjectUsers) {
		return dao.insert(beanProjectUsers);
	}

	public BeanProjectUsers update(BeanProjectUsers beanProjectUsers) {
		return dao.update(beanProjectUsers);
	}

	public boolean delete(String userId) {
		return dao.delete(userId);
	}

	public ArrayList<BeanProjectUsers> searchByProjectsByUserId(String userId) {
		return dao.searchByProjectsByUserId(userId);
	}

	public ArrayList<BeanProjectUsers> searchByUsersByProjectId(String projectId) {
		return dao.searchByUsersByProjectId(projectId);
	}

	public ArrayList<BeanProjectUsers> showAll() {
		return dao.showAll();
	}

}
