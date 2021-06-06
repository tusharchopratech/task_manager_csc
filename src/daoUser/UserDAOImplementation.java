package daoUser;

import hiberUtil.HiberUtil;

import java.util.ArrayList;
import java.util.List;

import model.BeanUser;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class UserDAOImplementation implements UserDAOInterface{

	Session session=HiberUtil.getSession();
	
	@Override
	public BeanUser insert(BeanUser beanUser) {
		
		Transaction trans=null;
		try
		{
			trans=session.beginTransaction();
			session.save(beanUser);
			trans.commit();
			System.out.println("User Record inserted : "+beanUser);
			return beanUser;
		}
		catch(Exception e)
		{
		if(trans!=null){e.printStackTrace();trans.rollback();}
		}
		
		return null;
	}

	@Override
	public BeanUser update(BeanUser beanUser) {

		Transaction trans=null;
		try
		{
		trans=session.beginTransaction();
		session.update(beanUser);
		trans.commit();
		return beanUser;
		}
		catch(Exception e)
		{if(trans!=null){e.printStackTrace();trans.rollback();} }
		
		return null;
	}

	@Override
	public boolean delete(String userId) {

		boolean flag=false;
		Transaction trans=null;
		try
		{
				trans=session.beginTransaction();
				String sql="from BeanUser where userId=?";
				Query query = session.createQuery(sql);
				query.setString(0,userId);
				List<BeanUser> beanUserList=query.list();
				//	System.out.println("size : "+beanUserList.size());
				BeanUser beanUser;
				if(beanUserList.size()==1)
				{ 
					beanUser=beanUserList.get(0);  
					session.delete(beanUser);
					trans.commit();
					System.out.println("One Record Deleted "+beanUser); 
				    flag=true;
				}
		}
		catch(Exception e)
		{if(trans!=null){e.printStackTrace();trans.rollback();} }
		
		return flag;
		
	}

	@Override
	public BeanUser searchById(String userId) 
	{
		BeanUser tmp=null;
		
		String sql="from BeanUser where userId=?";
		Query query = session.createQuery(sql);
		query.setString(0,userId);
		List<BeanUser> beanUserList=query.list();
		System.out.println("BeanUser Search List Size : "+beanUserList.size());
		if(beanUserList.size()==1)
		{
			tmp=beanUserList.get(0);
		}
	
		return tmp;	
	}

	@Override
	public ArrayList<BeanUser> showAll() {
		
		String sql="from BeanUser";
		Query query = session.createQuery(sql);
		ArrayList<BeanUser> beanUserList=new ArrayList<BeanUser>(query.list());
		return beanUserList;
	}

	@Override
	public boolean validate(String userId, String password) 
	{
		boolean flag=false;
		
		String sql="from BeanUser where userId=? and password=?";
		Query query = session.createQuery(sql);
		query.setString(0,userId);
		query.setString(1,password);
		//List<BeanUser> beanUserList=query.list();
		//	System.out.println("size : "+beanUserList.size());
		if(query.list().size()==1)
		{
			flag=true;
		}
	
		return flag;
	}

	
	
	
}
