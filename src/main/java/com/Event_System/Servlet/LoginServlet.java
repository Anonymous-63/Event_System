package com.Event_System.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Event_System.Dao.AdminDao;
import com.Event_System.Dao.UserDao;
import com.Event_System.Entity.Admin;
import com.Event_System.Entity.Message;
import com.Event_System.Entity.User;
import com.Event_System.Helper.ConnectionProvider;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		HttpSession session = request.getSession();
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		User u = dao.loginUser(email, password);
		AdminDao aDao = new AdminDao(ConnectionProvider.getConnection());
		Admin a = aDao.loginAdmin(email, password);

		if (u != null) {
			session.setAttribute("currentUser", u);
			response.sendRedirect("jsp/MainPage.jsp");
		}
		else if (a != null) {
			session.setAttribute("currentAdmin", a);
			response.sendRedirect("jsp/AdminDash.jsp");
		} else {
			Message msg = new Message("Invalid Details ! Try Again", "error", "alert-danger");
			session.setAttribute("msg", msg);
			response.sendRedirect("jsp/LoginPage.jsp");
		}
		
	}
}
