package daoProjectUser;

import hiberUtil.HiberUtil;

import java.util.ArrayList;
import java.util.List;

import model.BeanProjectUsers;
import model.BeanUser;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class ProjectUserDAOImplementation implements ProjectUserDAOInterface {

	Session session = HiberUtil.getSession();

	@Override
	public BeanProjectUsers insert(BeanProjectUsers beanProjectUsers) {

		Transaction trans = null;
		try {
			trans = session.beginTransaction();
			session.save(beanProjectUsers);
			trans.commit();
			System.out.println("ProjectUsers Record inserted : "
					+ beanProjectUsers);
			return beanProjectUsers;
		} catch (Exception e) {
			if (trans != null) {
				e.printStackTrace();
				trans.rollback();
			}
		}

		return null;
	}

	@Override
	public BeanProjectUsers update(BeanProjectUsers beanProjectUsers) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(String userId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ArrayList<BeanProjectUsers> showAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<BeanProjectUsers> searchByProjectsByUserId(String userId) {
		String sql = "from BeanProjectUsers where userId=?";
		Query query = session.createQuery(sql);
		query.setString(0, userId);
		ArrayList<BeanProjectUsers> beanprojectUsersList = new ArrayList<BeanProjectUsers>(
				query.list());
		return beanprojectUsersList;
	}

	@Override
	public ArrayList<BeanProjectUsers> searchByUsersByProjectId(String projectId) {
		String sql = "from BeanProjectUsers where projectId=?";
		Query query = session.createQuery(sql);
		query.setString(0, projectId);
		ArrayList<BeanProjectUsers> beanprojectUsersList = new ArrayList<BeanProjectUsers>(
				query.list());
		return beanprojectUsersList;
	}

}
