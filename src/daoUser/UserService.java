package daoUser;

import java.util.ArrayList;

import model.BeanUser;

public class UserService {

	UserDAOInterface dao = UserDAOFactory.getUserDao();

	public BeanUser insert(BeanUser beanUser) {
		return dao.insert(beanUser);
	}

	public BeanUser update(BeanUser beanUser) {
		return dao.update(beanUser);
	}

	public boolean delete(String userId) {
		return dao.delete(userId);
	}

	public BeanUser searchById(String userId) {
		return dao.searchById(userId);
	}

	public ArrayList<BeanUser> showAll() {
		return dao.showAll();
	}

	public boolean validate(String userId, String password) {
		return dao.validate(userId, password);
	}
}
