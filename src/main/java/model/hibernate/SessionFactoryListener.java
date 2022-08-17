package model.hibernate;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.hibernate.SessionFactory;

import web.booking.dao.CheckinUtil;
@WebListener
public class SessionFactoryListener implements ServletContextListener {
	private SessionFactory sessionFactory;
	@Override
	public void contextInitialized(ServletContextEvent sce) {
//		StandardServiceRegistry serviceRegistry =
//				new StandardServiceRegistryBuilder().configure().build();
//				sessionFactory = new MetadataSources(
//				serviceRegistry).buildMetadata().buildSessionFactory();
					
		HibernateUtil.getSessionFactory();
		CheckinUtil.getMongoClient();
		System.out.println("SessionFactoryListener getSessionFactory");
		
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		HibernateUtil.closeSessionFactory();
		CheckinUtil.closeMongoClient();
//		if(sessionFactory != null) {
//			sessionFactory.close();
//			}
		System.out.println("contextDestroyed closeSessionFactory");
	}

}
