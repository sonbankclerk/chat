package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import command.UserInsertCommand;
import command.UserSelectCommand;

@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage = null;
		response.setContentType("text/html; charset=UTF-8");
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf(".do"));

		switch(com.trim()) {
			case "index":
				viewPage="WEB-INF/view/index.jsp";
				break;
			case "login":
				viewPage="WEB-INF/view/login.jsp";
				break;
			case "signup":
				viewPage="WEB-INF/view/signup.jsp";
				break;
			case "userInsert":
				Command userInsert = new UserInsertCommand();
				userInsert.execute(request, response);
				viewPage="WEB-INF/view/login.jsp";
				break;
			case "userSelect":
				Command userSelect = new UserSelectCommand();
				userSelect.execute(request, response); 
				// 로그인 성공 체크
				if(request.getSession().getAttribute("name") != null) {
					viewPage="home.do";				
				}
				else {
					viewPage="WEB-INF/view/login.jsp";
				}
				break;
			case "home":
				viewPage="WEB-INF/view/home.jsp";
				break;
				
		}
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
