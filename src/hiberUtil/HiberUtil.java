package hiberUtil;

import model.BeanBuild;
import model.BeanProject;
import model.BeanProjectUsers;
import model.BeanRelease;
import model.BeanTask;
import model.BeanUser;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HiberUtil {

	public static final SessionFactory sessionFactory;

	static {
		Configuration cfg = new Configuration();
		cfg.addAnnotatedClass(BeanRelease.class);
		cfg.addAnnotatedClass(BeanUser.class);
		cfg.addAnnotatedClass(BeanTask.class);
		cfg.addAnnotatedClass(BeanBuild.class);
		cfg.addAnnotatedClass(BeanProjectUsers.class);
		cfg.addAnnotatedClass(BeanProject.class);
		cfg.configure();
		sessionFactory = cfg.buildSessionFactory();
	}

	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	private HiberUtil() {

	}

	public static Session getSession() {
		return sessionFactory.openSession();

	}

}
