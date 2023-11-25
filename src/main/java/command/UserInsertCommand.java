package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import dto.UserDto;

public class UserInsertCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//회원가입 구현
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pw");
		String name = request.getParameter("name");
		String eMail = request.getParameter("eMail");
		System.out.println(name);

		//유효성 검사
		UserDao dao = new UserDao();
		if(dao.idCheack(id)) {
			request.setAttribute("error", 2);
		}
		UserDto dto = new UserDto(id,pwd,name);
		dao.insert(dto);
	}

}