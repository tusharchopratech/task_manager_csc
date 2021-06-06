package daoRelease;

import java.util.ArrayList;

import model.BeanRelease;

public class ReleaseService {

	ReleaseDAOInterface dao = ReleaseDAOFactory.getReleaseDao();

	public BeanRelease insert(BeanRelease beanRelease) {
		return dao.insert(beanRelease);
	}

	public BeanRelease update(BeanRelease beanRelease) {
		return dao.update(beanRelease);
	}

	public boolean delete(String releaseId) {
		return dao.delete(releaseId);
	}

	public BeanRelease searchById(String releaseId) {
		return dao.searchById(releaseId);
	}

	public ArrayList<BeanRelease> showAll() {
		return dao.showAll();
	}

}
