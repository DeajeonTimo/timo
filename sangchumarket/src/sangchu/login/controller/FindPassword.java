package sangchu.login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sangchu.Mailing;
import sangchu.login.service.ILoginService;
import sangchu.login.service.LoginServiceImpl;
import sangchu.main.vo.MemberVO;

@WebServlet("/findPassword.do")
public class FindPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher(request.getContextPath() + "/WEB-INF/jsp/login/findPassword.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("userEmail").trim();
		String name = request.getParameter("userName").trim();
		String birth = request.getParameter("userBirth").trim();
		String tel = request.getParameter("userTel").trim();
		
		System.out.println(email);
		System.out.println(name);
		System.out.println(birth);
		System.out.println(tel);
		
		
		
		MemberVO memVO = new MemberVO();
		memVO.setEmail(email);
		memVO.setName(name);
		memVO.setU_birth(birth);
		memVO.setU_tel(tel);
		
		ILoginService service = LoginServiceImpl.getInstance();
		String password = service.findPass(memVO);
		System.out.println(password);
		
		String message=null;
		if(password==null) {
			response.setContentType("text/html; charset=utf-8");
	       	 PrintWriter writer = response.getWriter();
	       	 writer.println("<script>alert('일치하는 정보가 없습니다. 다시 확인해주세요.');");
	       	 writer.println("history.back();</script>");
	       	 writer.close();
		}else {
		// 임시비밀번호 발급
		int passwordLength = 8 + new Random().nextInt(8); // 8 - 15 자리
        password = generateRandomPassword(passwordLength);
        
        // 임시비밀번호로 update하는 쿼리
        memVO.setPass(password);
        
        int res = service.updateTempPassword(memVO);
        if(res>0) {
        	System.out.println("임시비밀번호로 변경 완료");
        	message ="[상추마켓 비밀번호 찾기]\n";
    		message +="(" + email + ") 님의 비밀번호는 \n▶\t" + password + " \t◀ 입니다."; 
    		
    		String subject="[상추마켓] 임시비밀번호 발급 메일";
    		
    		Mailing mail = Mailing.getMailservice();
    		
    		int resMail = mail.mailing(email, message, subject);
    	    System.out.println("resMail ==>" + resMail);

    	    if(resMail>0) { //메일발송 성공
    	        	 response.setContentType("text/html; charset=utf-8");
    	        	 PrintWriter writer = response.getWriter();
    	        	 writer.println("<script>alert('임시비밀번호 발급메일을 발송하였습니다. 메일함을 확인해주세요.');");
    	        	 writer.println("location.href= '"+ request.getContextPath() + "/loginMain.do'</script>");
    	        	 writer.close();
    	        	 
    	      }else { //메일 발송 실패
    	         request.setAttribute("errorMessage", "예기치 못한 error 발생하였습니다.");
    	         request.getRequestDispatcher("/WEB-INF/jsp/errorPage.jsp").forward(request, response);
    	         return;
    	      }
        }else {
        	request.setAttribute("errorMessage", "예기치 못한 error 발생하였습니다.");
	         request.getRequestDispatcher("/WEB-INF/jsp/errorPage.jsp").forward(request, response);
	         return;
        }
	
		}	
	}
	
	private static final String UPPER = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final String LOWER = "abcdefghijklmnopqrstuvwxyz";
    private static final String DIGITS = "0123456789";
    
    public static String generateRandomPassword(int length) {
        String characters = UPPER + LOWER + DIGITS;
        Random random = new Random();
        StringBuilder password = new StringBuilder();

        for (int i = 0; i < length; i++) {
            int randomIndex = random.nextInt(characters.length());
            password.append(characters.charAt(randomIndex));
        }

        return password.toString();
    }
}
