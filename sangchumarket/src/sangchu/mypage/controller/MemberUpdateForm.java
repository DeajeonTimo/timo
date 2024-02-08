package sangchu.mypage.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import sangchu.chat.service.ChatServiceImpl;
import sangchu.chat.service.IChatService;
import sangchu.main.vo.MemberVO;
import sangchu.mypage.service.IMypageService;
import sangchu.mypage.service.MypageServiceImpl;
import sangchu.mypage.vo.UpdateMemberVO;

@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 30,
		maxRequestSize = 1024 * 1024 * 100
	)
@WebServlet("/memberUpdateForm.do")
public class MemberUpdateForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/*
		최초 작성자 : 김석호
		최초 작성일 : 2023.08.13 19:29
		
		최근 수정자 : 김석호
		최근 수정일 : 2023.08.15 13:13
		
		수정내역
		2023.08.14 13:20 - 김석호 : Post메소드 추가 및 구현, 페이지설명 주석 수정 
		2023.08.15 13:13 - 김석호 : 이미지 업로드부분 로직 오류로 수정 
		
		마이페이지에서 회원정보 수정관련 요청을 처리하는 서블릿입니다.
	*/
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/jsp/mypage/updateMemberInfoform.jsp").forward(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 파일 처리부분
		// 이미지가 저장된 폴더 설정
		String filePath = "d:/midlleproforImages";
		File f = new File(filePath);
		// 저장될 폴더가 없으면 새로 만들어 놓는다.
		if(!f.exists()) {
			f.mkdirs();
		}
		// 세션에서 로그인 멤버 정보 객체를 빼낸다
		HttpSession session = request.getSession();
		MemberVO memVO =  (MemberVO)session.getAttribute("memVO");
		// 로그인 세션이 만료되었을 경우
		if(memVO==null) {
			response.sendRedirect(request.getContextPath()+"/sangchuMain.do");
			return;
		}
		
		// 일단 이메일을 가져온다
		String email = memVO.getEmail();
		
		// 회원 이미지 정보가 있는지 가져온다.
		IChatService chatService = ChatServiceImpl.getInstance();
		String imgsrc = chatService.emailImage(email);
		
		// 폼에서 보낸 데이터 수령
		String tel = request.getParameter("u_tel");
		String loc = request.getParameter("loc");
		String loc2 = request.getParameter("loc2");
		Part filePart = request.getPart("profile");
		
		
		// 디렉토리에서 이미지 파일을 먼저 삭제하는 부분
		if(imgsrc!=null) {
			for(File fi : f.listFiles()) {
				if(fi.getName().equals(imgsrc)) {
					fi.delete();
				}
			}
		}
		
		String filename = "";		// 받은 파일명을 저장할 장소
		String filewhat = ".jpg";		// 파일 확장자..는 jpg로 고정할예정
		String photoPath = "";		// 데이터 베이스에 삽입할 파일명을 만들어서 저장하는 장소
		
		// Part에서 파일명 분리
		filename = extractFileName(filePart);
		
		// 수정용 VO객체를 생성해서 업데이트 문을 날릴 준비를 한다.
		UpdateMemberVO updateVO = new UpdateMemberVO();
		updateVO.setEmail(email);
		updateVO.setU_loc(Double.parseDouble(loc));
		updateVO.setU_loc2(Double.parseDouble(loc2));
		updateVO.setU_tel(tel);
		
		
		// 파츠에 파일이 들었는지 안들었는지 판단한다.
		if(filePart!=null&&!filename.equals("")&&filename!=null) {
			System.out.println("여기로 들어온다고?");
			System.out.println(filePart.toString());
			System.out.println(filename);
			photoPath = filePath + File.separator + email + filewhat;
			// 파일이 없을수도 있으니 여기서 세팅한다.
			updateVO.setImg_src(email + filewhat);
		}
		
		// 이제 대망의 업데이트 ..
		IMypageService service = MypageServiceImpl.getInstance();
		int res = service.updateMemberInfo(updateVO);
		if(res>0) {
			// 이미지가 원래 없었고, 수정에서도 이미지등록을 하지 않았다면 아무일도 발생하지 않음
			res += service.updateUserImage(updateVO);
		}
		if(res>0) {
			session.invalidate();
			if(filePart!=null&&!filename.equals("")&&filename!=null) {
				filePart.write(photoPath);
			}
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().println("<script>alert('회원정보 수정에 성공했습니다! 다시 로그인 해주세요!');location.href='"+request.getContextPath()+"/sangchuMain.do';</script>");
			return;
			
		}else {
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().println("<script>alert('회원정보 수정에 실패했습니다!');location.href='"+request.getContextPath()+"/mypageMain.do';</script>");
			return;
		}
	}
	
	// Part구조 안에서 파일명을 찾는 메서드
	private String extractFileName(Part part) {
		String fileName = "";
		
		String conDisposition = part.getHeader("content-disposition");
		String[] items = conDisposition.split(";");
		for(String item : items) {
			if(item.trim().startsWith("filename")) {
				fileName = item.substring(item.indexOf("=")+2, item.length()-1);
			}
		}
		return fileName;
	}
	
}