package filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import connection.SingleConnection;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;

@WebFilter(urlPatterns = {"/*"})
public class Filter implements jakarta.servlet.Filter{
	
	private static Connection connection;
	
	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		arg2.doFilter(arg0, arg1);
		try {
			arg2.doFilter(arg0, arg1);
			
			connection.commit();
		}catch(Exception e) {
			try {
				connection.rollback();				
			}catch(SQLException e1) {
				e1.printStackTrace();
			}
		}
	}
	
	@Override
	public void init(FilterConfig arg0) throws ServletException{
		connection = SingleConnection.getConnection();
	}
}
