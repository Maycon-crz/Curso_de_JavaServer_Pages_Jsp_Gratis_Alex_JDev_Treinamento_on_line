package servlet;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import beans.BeanCursoJsp;
import dao.DaoLogin;

public class LoginServlet extends HttpServlet {
	//Servlet: Intercepta dados e da resposta;
	private static final long serialVersionUID = 1L;
	private DaoLogin daoLogin = new DaoLogin();
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			BeanCursoJsp beanCursoJsp = new BeanCursoJsp(); 
			
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");
			
			if(daoLogin.validarLogin(login, senha)) {//acesso ok			
				RequestDispatcher dispatcher = request.getRequestDispatcher("acessoliberado.jsp");
				dispatcher.forward(request, response);
			}else {//acesso negado
				RequestDispatcher dispatcher = request.getRequestDispatcher("acessonegado.jsp");
				dispatcher.forward(request, response);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
