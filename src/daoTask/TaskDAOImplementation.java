package daoTask;

import hiberUtil.HiberUtil;

import java.util.ArrayList;
import java.util.List;

import model.BeanProject;
import model.BeanTask;
import model.BeanUser;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class TaskDAOImplementation implements TaskDAOInterface {

	Session session = HiberUtil.getSession();

	@Override
	public BeanTask insert(BeanTask beanTask) {
		Transaction trans = null;
		try {
			trans = session.beginTransaction();
			Integer id = (Integer) session.save(beanTask);
			trans.commit();
			beanTask.setId(id);
			System.out.println("Task Record inserted : " + beanTask);
			return beanTask;
		} catch (Exception e) {
			if (trans != null) {
				e.printStackTrace();
				trans.rollback();
			}
		}

		return null;
	}

	@Override
	public BeanTask update(BeanTask beanTask) {

		Transaction trans = null;
		try {
			trans = session.beginTransaction();
			session.update(beanTask);
			trans.commit();
			return beanTask;
		} catch (Exception e) {
			if (trans != null) {
				e.printStackTrace();
				trans.rollback();
			}
		}

		return null;

	}

	@Override
	public boolean delete(String taskId) {
		boolean flag = false;
		Transaction trans = null;
		try {
			trans = session.beginTransaction();
			String sql = "from BeanTask where taskId=?";
			Query query = session.createQuery(sql);
			query.setString(0, taskId);
			List<BeanTask> beanTaskList = query.list();
			// System.out.println("size : "+beanUserList.size());
			BeanTask beanTask;
			if (beanTaskList.size() == 1) {
				beanTask = beanTaskList.get(0);
				session.delete(beanTask);
				trans.commit();
				System.out.println("One Record Deleted " + beanTask);
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
	public BeanTask searchById(String taskId) {

		BeanTask tmp = null;
		;

		String sql = "from BeanTask where taskId=?";
		Query query = session.createQuery(sql);
		query.setString(0, taskId);
		List<BeanTask> beantaskList = query.list();
		// System.out.println("size : "+beanUserList.size());
		if (beantaskList.size() == 1) {
			tmp = beantaskList.get(0);
		}

		return tmp;
	}

	@Override
	public ArrayList<BeanTask> showAll() {
		String sql = "from BeanTask";
		Query query = session.createQuery(sql);
		ArrayList<BeanTask> beanUserTask = new ArrayList<BeanTask>(query.list());
		return beanUserTask;
	}

	@Override
	public ArrayList<BeanTask> searchTasksByProjectId(String projectId) {

		String sql = "from BeanTask where projectId=?";
		Query query = session.createQuery(sql);
		query.setString(0, projectId);
		ArrayList<BeanTask> beanTaskList = new ArrayList<BeanTask>(query.list());

		ArrayList<BeanTask> beanTaskListWithoutSubTask = new ArrayList<BeanTask>();
		for (int i = 0; i < beanTaskList.size(); i++) {
			if (!beanTaskList.get(i).getTaskId().contains("ST")) {
				beanTaskListWithoutSubTask.add(beanTaskList.get(i));
			}
		}
		// System.out.println("size : "+beanUserList.size());
		return beanTaskListWithoutSubTask;

	}

	@Override
	public ArrayList<BeanTask> searchSubTasksBtTaskId(String taskId) {
		String sql = "from BeanTask where taskId like :keyword";
		Query query = session.createQuery(sql);
		// query.setString(0,taskId);
		query.setParameter("keyword", "" + taskId + "ST%");
		ArrayList<BeanTask> beanTaskList = new ArrayList<BeanTask>(query.list());
		// System.out.println("size : "+beanUserList.size());
		return beanTaskList;
	}

	@Override
	public ArrayList<BeanTask> searchTasksByBuildId(String buildId) {

		String sql = "from BeanTask where buildId=?";
		Query query = session.createQuery(sql);
		query.setString(0, buildId);
		ArrayList<BeanTask> beanTaskList = new ArrayList<BeanTask>(query.list());

		return beanTaskList;
	}

}
