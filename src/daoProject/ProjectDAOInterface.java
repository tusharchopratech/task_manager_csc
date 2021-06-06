package daoProject;

import java.util.ArrayList;

import model.BeanProject;

public interface ProjectDAOInterface {
	public BeanProject insert(BeanProject beanProject);

	public BeanProject update(BeanProject beanProject);

	public boolean delete(int userId);

	public BeanProject searchById(String userId);

	public ArrayList<BeanProject> showAll();
}
