package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;

public class UserSelectCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 구현
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		UserDao dao = new UserDao();
		String name = dao.selectName(id, pw);
		System.out.println(name);
		//로그인 정보 세션에 저장
		if(!name.equals("")) {
			HttpSession session = request.getSession();
			session.setAttribute("name", name);
		}
	}

}