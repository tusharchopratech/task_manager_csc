package daoBuild;

import hiberUtil.HiberUtil;

import java.util.ArrayList;
import java.util.List;

import model.BeanBuild;
import model.BeanUser;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class BuildDAOImplementation implements BuildDAOInterface {

	Session session = HiberUtil.getSession();

	@Override
	public BeanBuild insert(BeanBuild beanBuild) {

		Transaction trans = null;
		try {
			trans = session.beginTransaction();
			session.save(beanBuild);
			trans.commit();
			System.out.println("User Record inserted : " + beanBuild);
			return beanBuild;
		} catch (Exception e) {
			if (trans != null) {
				e.printStackTrace();
				trans.rollback();
			}
		}

		return null;
	}

	@Override
	public BeanBuild update(BeanBuild beanBuild) {

		Transaction trans = null;
		try {
			trans = session.beginTransaction();
			session.update(beanBuild);
			trans.commit();
			return beanBuild;
		} catch (Exception e) {
			if (trans != null) {
				e.printStackTrace();
				trans.rollback();
			}
		}

		return null;
	}

	@Override
	public boolean delete(String buildId) {

		boolean flag = false;
		Transaction trans = null;
		try {
			trans = session.beginTransaction();
			String sql = "from BeanBuild where buildId=?";
			Query query = session.createQuery(sql);
			query.setString(0, buildId);
			List<BeanBuild> beanBuildlist = query.list();
			// System.out.println("size : "+beanUserList.size());
			BeanBuild beanBuild;
			if (beanBuildlist.size() == 1) {
				beanBuild = beanBuildlist.get(0);
				session.delete(beanBuild);
				trans.commit();
				System.out.println("One Record Deleted " + beanBuild);
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
	public BeanBuild searchById(String buildId) {
		BeanBuild tmp = null;

		String sql = "from BeanBuild where buildId=?";
		Query query = session.createQuery(sql);
		query.setString(0, buildId);
		List<BeanBuild> beanBuildList = query.list();
		System.out.println("BeanBuild Search List Size : "
				+ beanBuildList.size());
		if (beanBuildList.size() == 1) {
			tmp = beanBuildList.get(0);
		}

		return tmp;
	}

	@Override
	public ArrayList<BeanBuild> showAll() {

		String sql = "from BeanBuild";
		Query query = session.createQuery(sql);
		ArrayList<BeanBuild> beanBuildList = new ArrayList<BeanBuild>(
				query.list());
		return beanBuildList;
	}

}
