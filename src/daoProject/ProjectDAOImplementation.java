package daoProject;

import hiberUtil.HiberUtil;

import java.util.ArrayList;
import java.util.List;

import model.BeanProject;
import model.BeanUser;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class ProjectDAOImplementation implements ProjectDAOInterface {

	Session session = HiberUtil.getSession();

	@Override
	public BeanProject insert(BeanProject beanProject) {

		Transaction trans = null;
		try {
			trans = session.beginTransaction();
			Integer key = (Integer) session.save(beanProject);
			trans.commit();
			System.out.println("Project Record inserted : " + beanProject);
			beanProject.setProjectId(key);
			return beanProject;
		} catch (Exception e) {
			if (trans != null) {
				e.printStackTrace();
				trans.rollback();
			}
		}

		return null;
	}

	@Override
	public BeanProject update(BeanProject beanProject) {

		Transaction trans = null;
		try {
			trans = session.beginTransaction();
			session.update(beanProject);
			trans.commit();
			return beanProject;
		} catch (Exception e) {
			if (trans != null) {
				e.printStackTrace();
				trans.rollback();
			}
		}

		return null;
	}

	@Override
	public boolean delete(int projectId) {
		boolean flag = false;
		Transaction trans = null;
		try {
			trans = session.beginTransaction();
			String sql = "from BeanProject where projectId=?";
			Query query = session.createQuery(sql);
			query.setString(0, String.valueOf(projectId));
			List<BeanProject> beanProjectList = query.list();
			// System.out.println("size : "+beanUserList.size());
			BeanProject beanProject;
			if (beanProjectList.size() == 1) {
				beanProject = beanProjectList.get(0);
				session.delete(beanProject);
				trans.commit();
				System.out.println("One Record Deleted " + beanProject);
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
	public BeanProject searchById(String userId) {

		BeanProject tmp = null;
		;

		String sql = "from BeanProject where projectId=?";
		Query query = session.createQuery(sql);
		query.setString(0, userId);
		List<BeanProject> beanProjectList = query.list();
		// System.out.println("size : "+beanUserList.size());
		if (beanProjectList.size() == 1) {
			tmp = beanProjectList.get(0);
		}

		return tmp;

	}

	@Override
	public ArrayList<BeanProject> showAll() {
		String sql = "from BeanProject";
		Query query = session.createQuery(sql);
		ArrayList<BeanProject> beanUserList = new ArrayList<BeanProject>(
				query.list());
		return beanUserList;
	}

}
