package daoRelease;

import hiberUtil.HiberUtil;

import java.util.ArrayList;
import java.util.List;

import model.BeanBuild;
import model.BeanRelease;
import model.BeanUser;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class ReleaseDAOImplementation implements ReleaseDAOInterface {

	Session session = HiberUtil.getSession();

	@Override
	public BeanRelease insert(BeanRelease beanRelease) {

		Transaction trans = null;
		try {
			trans = session.beginTransaction();
			session.save(beanRelease);
			trans.commit();
			System.out.println("Release Record inserted : " + beanRelease);
			return beanRelease;
		} catch (Exception e) {
			if (trans != null) {
				e.printStackTrace();
				trans.rollback();
			}
		}

		return null;
	}

	@Override
	public BeanRelease update(BeanRelease beanRelease) {

		Transaction trans = null;
		try {
			trans = session.beginTransaction();
			session.update(beanRelease);
			trans.commit();
			return beanRelease;
		} catch (Exception e) {
			if (trans != null) {
				e.printStackTrace();
				trans.rollback();
			}
		}

		return null;
	}

	@Override
	public boolean delete(String releaseId) {

		boolean flag = false;
		Transaction trans = null;
		try {
			trans = session.beginTransaction();
			String sql = "from BeanRelease where releaseId=?";
			Query query = session.createQuery(sql);
			query.setString(0, releaseId);
			List<BeanRelease> beanReleaseList = query.list();
			// System.out.println("size : "+beanUserList.size());
			BeanRelease beanRelease;
			if (beanReleaseList.size() == 1) {
				beanRelease = beanReleaseList.get(0);
				session.delete(beanRelease);
				trans.commit();
				System.out.println("One Record Deleted " + beanRelease);
				flag = true;
			}
		} catch (Exception e) {
			if (trans != null) {
				e.printStackTrace();
				trans.rollback();
			}
		}

		return flag;

	}

	@Override
	public BeanRelease searchById(String releaseId) {
		BeanRelease tmp = null;

		String sql = "from BeanRelease where releaseId=?";
		Query query = session.createQuery(sql);
		query.setString(0, releaseId);
		List<BeanRelease> beanReleaseList = query.list();
		System.out.println("BeanRelease Search List Size : "
				+ beanReleaseList.size());
		if (beanReleaseList.size() == 1) {
			tmp = beanReleaseList.get(0);
		}

		return tmp;
	}

	@Override
	public ArrayList<BeanRelease> showAll() {

		String sql = "from BeanRelease";
		Query query = session.createQuery(sql);
		ArrayList<BeanRelease> beanReleaseList = new ArrayList<BeanRelease>(
				query.list());
		return beanReleaseList;
	}

}
