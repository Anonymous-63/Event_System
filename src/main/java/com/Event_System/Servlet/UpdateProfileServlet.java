package com.Event_System.Servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.Event_System.Dao.UserDao;
import com.Event_System.Entity.Message;
import com.Event_System.Entity.User;
import com.Event_System.Helper.ConnectionProvider;
import com.Event_System.Helper.Helper;

@MultipartConfig
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateProfileServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		PrintWriter out = response.getWriter();
		
		String uname = request.getParameter("user_uname");
		String full_name = request.getParameter("full_name");
		String email = request.getParameter("user_email");
		String tel = request.getParameter("user_tel");
		String password = request.getParameter("user_password");
		Part part = request.getPart("user_profile");
		String imgName = part.getSubmittedFileName();
		
		
		//get The user from session 
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("currentUser");
		
		user.setUname(uname);
		user.setName(full_name);
		user.setEmail(email);
		user.setTel(tel);
		user.setPassword(password);
		String oldFile = user.getProfile();
		user.setProfile(imgName);
		
		
		//Update Into Database
		UserDao userDao = new UserDao (ConnectionProvider.getConnection());
		boolean update = userDao.updateProfile(user);
		
		if (update) {
			out.println("Profile Update");
			
			String path = request.getRealPath("/")+"image/profile"+ File.separator+user.getProfile();
			
			//Deleting old File
			String oldFilePath = request.getRealPath("/")+"image/profile"+ File.separator+oldFile;
				
			if(!oldFile.equals("default.png")) {
				Helper.deleteFile(oldFilePath);
			}
			
				if(Helper.saveFile(part.getInputStream(), path)) {
					out.println("Profile Update..");
					Message msg = new Message("Profile Details Update", "success", "alert-success");
					session.setAttribute("msg", msg);
				}
				else {
					Message msg = new Message("Profile Not Update","error", "alert-danger");
					session.setAttribute("msg", msg);
				}
			
			System.out.println(path);
		}
		else {
			out.println("Profle not Update");
			Message msg = new Message("Profile Not Update","error", "alert-danger");
			session.setAttribute("msg", msg);
		}
		response.sendRedirect("jsp/MainPage.jsp");
		
	}

}
