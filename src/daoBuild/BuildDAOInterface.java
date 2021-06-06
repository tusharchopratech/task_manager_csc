package daoBuild;

import java.util.ArrayList;

import model.BeanBuild;

public interface BuildDAOInterface {
	public BeanBuild insert(BeanBuild beanBuild);

	public BeanBuild update(BeanBuild beanBuild);

	public boolean delete(String buildId);

	public BeanBuild searchById(String buildId);

	public ArrayList<BeanBuild> showAll();
}
