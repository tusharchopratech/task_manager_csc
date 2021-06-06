package daoProjectUser;

import java.util.ArrayList;

import model.BeanProjectUsers;

public interface ProjectUserDAOInterface {
	public BeanProjectUsers insert(BeanProjectUsers beanProjectUsers);

	public BeanProjectUsers update(BeanProjectUsers beanProjectUsers);

	public boolean delete(String userId);

	public ArrayList<BeanProjectUsers> searchByProjectsByUserId(String userId);

	public ArrayList<BeanProjectUsers> searchByUsersByProjectId(String projectId);

	public ArrayList<BeanProjectUsers> showAll();

}
