package daoUser;

import java.util.ArrayList;

import model.BeanUser;

public interface UserDAOInterface {
	public BeanUser insert(BeanUser beanUser);

	public BeanUser update(BeanUser beanUser);

	public boolean delete(String userId);

	public BeanUser searchById(String userId);

	public boolean validate(String userId, String password);

	public ArrayList<BeanUser> showAll();
}
