package user;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.jdi.Location;

public class UserRegisterServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userID = request.getParameter("userID");
		String userPW1 = request.getParameter("userPW1");
		String userPW2 = request.getParameter("userPW2");
		String userName = request.getParameter("userName");
		String userAge = request.getParameter("userAge");
		String userGender = request.getParameter("userGender");
		String userEmail = request.getParameter("userEmail");
			
		
		if(userID == null || userID.equals("") || userPW1 == null || userPW1.equals("")
				|| userPW2 == null || userPW2.equals("") || userName == null || userName.equals("")
				|| userAge == null || userAge.equals("") || userGender == null || userGender.equals("") || userEmail == null || userEmail.equals("")) {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", " ※ 빈 칸을 모두 입력하세요.");
			response.sendRedirect("joinForm.jsp");
			return;
		}
		if(!userPW1.equals(userPW2)) {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", " ※ 비밀번호가 일치하지 않습니다.");
			response.sendRedirect("joinForm.jsp");
			return;
		}
		if(!Pattern.matches("^[0-9]*$", userAge)) {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", " ※ 나이는 숫자만 입력해 주세요.");
			response.sendRedirect("joinForm.jsp");
			return;
		}
		
		int result = new UserDAO().register(userID, userPW1, userName, userAge, userGender, userEmail);
		
		if(result == 1) {
			request.getSession().setAttribute("messageType", "성공 메시지");
			request.getSession().setAttribute("messageContent", " ※ 회원가입이 완료되었습니다. 다시 로그인 해주세요. ※ ");
			response.sendRedirect("joinForm.jsp");
			
			return;
		}
		else {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "이미 존재하는 회원입니다.");
			response.sendRedirect("joinForm.jsp");
			return;
		}
	}
}
