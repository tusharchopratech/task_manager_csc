package daoRelease;

import java.util.ArrayList;

import model.BeanRelease;
import model.BeanUser;

public interface ReleaseDAOInterface {
	public BeanRelease insert(BeanRelease beanRelease);

	public boolean delete(String releaseId);

	public BeanRelease update(BeanRelease beanRelease);

	public BeanRelease searchById(String releaseId);

	public ArrayList<BeanRelease> showAll();
}
