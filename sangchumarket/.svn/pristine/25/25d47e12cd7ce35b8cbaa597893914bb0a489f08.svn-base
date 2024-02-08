package sangchu.login.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import sangchu.images.service.IImagesService;
import sangchu.images.service.ImagesServiceImpl;
import sangchu.images.vo.ImagesVO;
import sangchu.login.service.IInterestService;
import sangchu.login.service.ILoginService;
import sangchu.login.service.InterestServiceImpl;
import sangchu.login.service.LoginServiceImpl;
import sangchu.login.vo.InterestVO;
import sangchu.main.vo.MemberVO;

@MultipartConfig
@WebServlet("/signup2.do")
public class Signup2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// url 에 포함된 email 가져오기
		String userEmail = request.getParameter("email");

		//사용자의 a_code 이메일인증대기 :1, 회원가입완료:2
		ILoginService service = LoginServiceImpl.getInstance();
		String userAcode = service.checkACode(userEmail);

		if (userAcode.equals("1")) { // 1차 회원가입 (이메일인증 메일 발송) 후 회원가입 대기중 상태 => 2차 회원가입 페이지로 이동
			request.setAttribute("userEmail", userEmail);
			request.getRequestDispatcher("/WEB-INF/jsp/login/signup2.jsp").forward(request, response);

		} else{ // 회원가입 완료 상태 => "유효하지 않은 url 입니다."를 alert창에 띄워준 후, 홈페이지 메인페이지로 이동
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('유효하지 않은 URL입니다.'); location.href='" + request.getContextPath()
					+ "/main.do'</script>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// signup2.jsp에서 submit 클릭시, 여기로 옴 //2차 회원가입 최종 전송

//		 업로드된 파일들이 저장될 폴더 설정///////////////////////////////////////////////////연습용~~~~~~~~~~~~~~~!!!!!!////////////
//		String filePath = "c:/midlleproforImages";       
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		String filePath = "d:/midlleproforImages";
		File f = new File(filePath);
		if (!f.exists()) {
			f.mkdirs();
		}
		
		String email = (String)request.getParameter("email").trim();

		String filename = "";		// 받은 파일명을 저장할 장소
		String filewhat = ".jpg";		// 파일 확장자..는 jpg로 고정할예정
		String photoPath = "";		// 데이터 베이스에 삽입할 파일명을 만들어서 저장하는 장소
		Part filePart = request.getPart("file");
		
		filename = extractFileName(filePart);
		
		ImagesVO imagesVO = new ImagesVO();
		
		if(filePart!=null&&!filename.equals("")&&filename!=null) {
			System.out.println("여기아님");
			System.out.println(filePart.toString());
			System.out.println(filename);
			photoPath = filePath + File.separator + email + filewhat;
			// 파일이 없을수도 있으니 여기서 세팅한다.
			imagesVO.setImg_code(email);
			imagesVO.setImg_src(email + filewhat);
			IImagesService service = ImagesServiceImpl.getInstance();
			int res1= service.uploadUserImage(imagesVO);
			filePart.write(photoPath);
			System.out.println("이미지파일 DB에 업로드 -> 성공1, 실패0" + res1);
		}
		

		// 파일이 아닌 일반 데이터
		String jumin1 = request.getParameter("jumin1");
		String jumin2=null;
		if(request.getParameter("jumin2").equals("1") || request.getParameter("jumin2").equals("3")) {
			jumin2="M";
		}else {
			jumin2="F";
		}
	    request.setCharacterEncoding("utf-8");
		String nickName = request.getParameter("inputNickname");
		String tel = request.getParameter("tel");

		//선택항목 : 주소, 대표이미지, 카테고리
		
		//주소
		double addrX =0;
		double addrY =0;
		if(request.getParameter("addrX")!=null && request.getParameter("addrY")!=null) {
			try {
//				String addx = request.getParameter("addrX");
//				String addy = request.getParameter("addrY");
				addrX = Double.parseDouble(request.getParameter("addrX"));
				addrY = Double.parseDouble(request.getParameter("addrY"));
			}catch (NumberFormatException e) {
				System.out.println("Invalid address values provided.");
			}
		}
		
		String marketing = null;
		if (request.getParameter("marketing").equals("on")) {
			marketing = "Y";
		} else {
			marketing = "N";
		}
		ILoginService serviceLogin = LoginServiceImpl.getInstance();
		MemberVO memVO = new MemberVO();
		
		memVO.setEmail(email);
		memVO.setU_birth(jumin1);
		memVO.setU_gender(jumin2);
		memVO.setU_nick(nickName);
		memVO.setU_tel(tel);
		memVO.setU_loc(addrY);
		memVO.setU_loc2(addrX);
		memVO.setU_marketing(marketing);
		serviceLogin.insertSecondSighup(memVO);
		
		String[] catCheckbox = request.getParameterValues("catCheckbox");
		
		if(catCheckbox!=null && catCheckbox.length!=0 ) {
			InterestVO interestVO = new InterestVO();
			IInterestService serviceInterest = InterestServiceImpl.getInstatnce();
			for(int i =0; i<catCheckbox.length; i++) {
				String interest = catCheckbox[i];
				interestVO.setEmail(email);
				interestVO.setC_middlecat(interest);
				serviceInterest.insertInterest(interestVO);
			}
		}else {
			System.out.println("No category checkbox selected.");
		}
		
		serviceLogin.updateA_code(email);
		
		request.setAttribute("email", email);
		request.getRequestDispatcher(request.getContextPath() + "/WEB-INF/jsp/login/successSignup.jsp").forward(request, response);
		return;
	}

	// Part 객체에서 파일 명을 찾는 메소드
	private String extractFileName(Part part) {
		String fileName = "";

		String conDisposition = part.getHeader("content-disposition"); // 헤더값을 가져옴 - 헤더에는 업로드된 파일의 정보가 포함되어 있다.
		String[] items = conDisposition.split(";"); // 세미콜론 기준으로 각각의 부분을 처리
		for (String item : items) {
			if (item.trim().startsWith("filename")) { // filename으로 시작하는 부분을 찾아 이름을 추축
				fileName = item.substring(item.indexOf("=") + 2, item.length() - 1);
				// 문자열 item에서 = 문자가 처음으로 나타나는 인덱스 / 이 인덱스에 2를 더해서 = 문자 다음위치로 이동 / 문자열의 길이에서 -1
				// 이부분은 마지막 문자의 인덱스
			}
		}
		return fileName;
	}
}
