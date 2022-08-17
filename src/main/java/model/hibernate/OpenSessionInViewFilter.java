package model.hibernate;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
@WebFilter("/*")
public class OpenSessionInViewFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			System.out.println("[filter]beginTransaction");
			chain.doFilter(request, response); 	//呼叫後端Servlet
			transaction.commit();
			System.out.println("[filter]commit");
		} catch (Exception e) {
			transaction.rollback();
			System.out.println("[filter]transaction.rollback");
			
//			chain.doFilter(request, response);
			e.printStackTrace();
		} finally {
			System.out.println("[filter]session.close");
			
			session.close();
		}
	}
}
