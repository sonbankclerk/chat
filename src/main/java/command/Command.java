package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	// 게시판 관련 모델 정의
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

}