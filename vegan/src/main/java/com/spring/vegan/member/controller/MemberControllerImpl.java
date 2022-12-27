package com.spring.vegan.member.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.vegan.member.dto.Card_payDTO;
import com.spring.vegan.member.dto.Client_onDTO;
import com.spring.vegan.member.dto.LoginDTO;
import com.spring.vegan.member.dto.PointDTO;
import com.spring.vegan.member.dto.SearchDTO;
import com.spring.vegan.member.dto.User_onDTO;
import com.spring.vegan.member.service.MemberService;
import com.spring.vegan.resto.service.RestoService;
import com.spring.vegan.community.dto.Com_HeartDTO;
import com.spring.vegan.community.dto.Com_ScrapDTO;
import com.spring.vegan.community.dto.CommunityDTO;
import com.spring.vegan.community.dto.InqueryDTO;
import com.spring.vegan.member.dto.E_ImageDTO;
import com.spring.vegan.member.dto.Iq_ReplyDTO;

@Controller
@EnableAsync // @EnableAsync 를 지정해서 메서드를 호출할 경우 비동기로 동작하게 하는 @Async 기능 사용 가능
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class MemberControllerImpl implements MemberController {
	private static final Logger logger = LogManager.getLogger(MemberControllerImpl.class);
	private static final String EVENT_UPLOAD = "C:\\Users\\UserF\\Desktop\\YSH\\Vegan_Image\\Event_Image";
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private RestoService restoService;
	
	@Override
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse resoponse) throws Exception {
		String viewName = "/member/loginForm";
		ModelAndView mav = new ModelAndView(viewName);
		logger.info("public ModelAndView " + Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/join")
	public ModelAndView join(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "/member/joinForm";
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/member/join_c")
	public ModelAndView join_c(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "/member/joinForm_c";
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	
	@Override
	@RequestMapping(value = "/member/admin/listMemberInfo")
	public ModelAndView listMemberInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String viewName = "/member/admin/listMemberInfo";
		ModelAndView mav = new ModelAndView(viewName);

		return mav;
	}

	@Override
	@RequestMapping(value = "/member/login.do")
	public ModelAndView loginProc(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "/member/main";
		ModelAndView mav = new ModelAndView();

		LoginDTO loginDTO = new LoginDTO();
		loginDTO.setEmail(request.getParameter("email"));
		loginDTO.setPwd(request.getParameter("pwd"));

		// 이메일과 비밀번호가 일치하면 해당 유저 정보를 user_onDTO로 가져온다
		User_onDTO user_onDTO = memberService.checkByEmailPwd_u(loginDTO);
		if ( user_onDTO != null ) {
			if ( user_onDTO.getU_auth().equals("A") ) { // 이메일 인증이 안된 계정인 경우
				mav.addObject("auth","A");
				viewName = "/member/proc";
			} else if ( user_onDTO.getU_auth().equals("C") ) {
				// 비활성화된 계정인 경우
				mav.addObject("auth","C");
				viewName = "/member/proc";
				
			} else {
				if (user_onDTO.getU_email().equals("a1@a1")) {
					HttpSession session = request.getSession();
					// session.setMaxInactiveInterval(60*60); // 세션 유지 시간 10s -> 10초 후 로그아웃
					session.setAttribute("user_onDTO", user_onDTO);
					session.setAttribute("isAdminLogOn", true);
					viewName = "/member/main";
				}
				HttpSession session = request.getSession();
				List<Com_ScrapDTO> cs = memberService.scrapInfo(user_onDTO.getU_email());
				List<Com_HeartDTO> heart = memberService.heartInfo(user_onDTO.getU_email());
				// session.setMaxInactiveInterval(60*60); // 세션 유지 시간 10s -> 10초 후 로그아웃
				session.setAttribute("user_onDTO", user_onDTO);
				session.setAttribute("com_scrapDTO", cs);
				session.setAttribute("com_heartDTO", heart);
				session.setAttribute("userLogOn", true);
				viewName = "/member/main";
			}
		} else {
			// user_on 테이블에 해당 계정이 존재하지 않는 경우
			Client_onDTO client_onDTO = memberService.checkByEmailPwd_c(loginDTO);
			if ( client_onDTO != null ) {
				if ( client_onDTO.getC_auth().equals("A") ) { // 이메일 인증이 안된 계정인 경우
					mav.addObject("auth","A");
					viewName = "/member/proc";
				} else if ( client_onDTO.getC_auth().equals("C") ) { // 이메일 인증이 안된 계정인 경우
					mav.addObject("auth","C");
					viewName = "/member/proc";
				} else {
					HttpSession session = request.getSession();
					session.setMaxInactiveInterval(60*60); // 세션 유지 시간 10s -> 10초 후 로그아웃
					session.setAttribute("client_onDTO", client_onDTO);
					session.setAttribute("clientLogOn", true);
					viewName = "/member/main";
				}
			} else {
				// client_on 테이블에도 해당 계정이 존재하지 않는 경우
				viewName = "/member/loginForm";
				mav.addObject("result", "loginFailed");
			}
		}

		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/logout.do")
	public ModelAndView logoutProc(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
//		session.removeAttribute("user_onDTO");
		session.invalidate(); // 생성된 세션을 소멸

		ModelAndView mav = new ModelAndView("/member/main");
		// http://localhost:8090/vegetable/member/logout.do
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/search.do")
	public ModelAndView searchProc(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = null;
		String command = request.getParameter("command");
		ModelAndView mav = new ModelAndView();
		
		if ( command.equals("email") ) {
			SearchDTO dto = new SearchDTO();
			dto.setName(request.getParameter("input_name"));
			dto.setTel(request.getParameter("input_tel"));
			String email = memberService.searchLogin(dto);
			if ( email != null ) {
				mav.addObject("email", email);
				mav.setViewName("/member/proc");
				
			} else {
				mav.addObject("email", "false");
				mav.setViewName("/member/proc");
			}

		} else if ( command.equals("pwd") ) {
			SearchDTO dto = new SearchDTO();
			dto.setEmail(request.getParameter("input_email"));
			String email = memberService.searchLogin(dto);

			if ( email != null ) {
				//sendEmail(input_email, "아래 링크를 클릭해 이메일 주소를 인증해 주세요.", "/certifEmail?email=", input_name,  "이메일 인증하기", "[베지테이블] 회원가입을 위해 이메일을 인증해 주세요.");
				sendEmail(email, "아래 링크를 클릭해 비밀번호를 재설정해 주세요.", "/resettingPwd.do?email=", email, "비밀번호 재설정", "[베지테이블] 계정 암호 재설정");
				mav.addObject("pwd", "입력하신 이메일로 비밀번호 재설정 메일을 발송하였습니다.");
				mav.setViewName("/member/proc");
			} else {
				mav.addObject("pwd", "일치하는 계정을 찾을 수 없습니다.");
				mav.setViewName("/member/proc");
			}
		}
		return mav;
	}

	@Override
	@RequestMapping(value="/member/mypage.do")
	public ModelAndView mypage_main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ModelAndView mav = new ModelAndView();	
		User_onDTO user_onDTO = (User_onDTO) request.getSession().getAttribute("user_onDTO");
		if ( user_onDTO != null ) {
			mav.addObject("user_onDTO", user_onDTO);
			String u_email = user_onDTO.getU_email();
			Map<String, Object> articleMap = memberService.myScrapList(u_email);
			mav.addObject("articleMap", articleMap);
			User_onDTO newUser = memberService.selectUpdatedUser(user_onDTO.getU_email());
			mav.addObject("newUser", newUser);
		} else {
			Client_onDTO client_onDTO = (Client_onDTO) request.getSession().getAttribute("client_onDTO");
			mav.addObject("client_onDTO", client_onDTO);
			Client_onDTO newClient = memberService.selectUpdatedClient(client_onDTO.getC_email());
			mav.addObject("newClient", newClient);
			HttpSession session = request.getSession();
			Client_onDTO client_on = (Client_onDTO) session.getAttribute("client_onDTO");
			if(client_on != null) {
				String c_email = client_on.getC_email();
				Boolean restoExist = restoService.restoExist(c_email);
				mav.addObject("restoExist", restoExist);
			}
		}
		
		mav.setViewName("/member/mypage_main");
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/mypoint.do")
	public ModelAndView mypoint(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		// 포인트 관리 - 잔액, 충전, 충전 및 사용 내역
		// 1. user_on 테이블에서 where u_email = #{u_email } 로 포인트 잔액 가져오기
		// 2. point 테이블에서 포인트 충전 및 사용 내역 가져오기
		ModelAndView mav = new ModelAndView();		
		String command = request.getParameter("command");
		User_onDTO user_onDTO = (User_onDTO) request.getSession().getAttribute("user_onDTO");
		String u_email = user_onDTO.getU_email();
		int u_point = user_onDTO.getU_point();
		String viewName = null;
		
		if ( command == null ) { 
			
			
		} else if ( command.equals("charge") ) { // 포인트 충전
			int input_point = Integer.parseInt(request.getParameter("input_point"));
			String card_sort = request.getParameter("card_sort");
			String card_no = request.getParameter("card_no1") + request.getParameter("card_no2") + request.getParameter("card_no3") + request.getParameter("card_no4");
			
			String card_valid = null;
			int card_valid_m = Integer.parseInt(request.getParameter("card_valid_m"));
			String card_valid_y = request.getParameter("card_valid_y").substring(2);
			if ( card_valid_m > 0 && card_valid_m < 10 ) {
				card_valid = "0" + request.getParameter("card_valid_m") + card_valid_y;
			} else {
				card_valid = request.getParameter("card_valid_m") + card_valid_y;
			}
			int card_month = Integer.parseInt(request.getParameter("card_month"));
			String card_pwd = request.getParameter("card_pwd");
			String card_regiNum = request.getParameter("card_regiNum");
			
			Card_payDTO card_payDTO = new Card_payDTO();
			card_payDTO.setEmail(u_email);
			card_payDTO.setCard_no(card_no);
			card_payDTO.setCard_valid(card_valid);
			card_payDTO.setCard_month(card_month);
			card_payDTO.setCard_pwd(card_pwd);
			card_payDTO.setCard_regiNum(card_regiNum);
			card_payDTO.setCard_price(input_point);
			int result = memberService.chargePoint(card_payDTO, u_point);
			
			if ( result == 1 ) {
				// 포인트 충전 성공
				request.getSession().setAttribute("user_onDTO", user_onDTO);
				mav.addObject("charge_point", "포인트가 충전되었습니다.");
				
				viewName = "/member/mypage_main";
			} else {
				// 포인트 충전 실패
				mav.addObject("charge_point", "에러가 발생했습니다. 관리자에게 문의하세요.");
				viewName = "/member/mypage_main";
			}
			
		} else if ( command.equals("list") ) {
			// 세션에 있는 이메일로 해당 사용자의 포인트 사용내역 리스트 출력
			List<PointDTO> pointList = memberService.pointList(u_email);
			mav.addObject("pointList", pointList);
			viewName = "/member/mypoint_list";
		} else if ( command.equals("frmCharge") ) {
			viewName = "/member/chargePoint";
		}
		// 업데이트 된 user_onDTO 다시 가져와서 세션에 담고  
//		client_onDTO = memberService.selectMemberInfo_c(client_onDTO.getC_email());
//		request.getSession().setAttribute("client_onDTO", client_onDTO);
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/member/mypoint_c.do")
	public ModelAndView mypoint_c(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		// 포인트 관리 - 잔액, 충전, 충전 및 사용 내역
		// 1. client_on 테이블에서 where c_email = #{c_email } 로 포인트 잔액 가져오기
		// 2. point 테이블에서 포인트 충전 및 사용 내역 가져오기
		ModelAndView mav = new ModelAndView();		
		String viewName = null;
		String command = request.getParameter("command");
		Client_onDTO client_onDTO = (Client_onDTO) request.getSession().getAttribute("client_onDTO");
		String c_email = client_onDTO.getC_email();
		int c_point = client_onDTO.getC_point();
		
		if ( command == null ) {
			
		} else if ( command.equals("charge") ) { // 포인트 충전
			int input_point = Integer.parseInt(request.getParameter("input_point"));
			String card_sort = request.getParameter("card_sort");
			String card_no = request.getParameter("card_no1") + request.getParameter("card_no2") + request.getParameter("card_no3") + request.getParameter("card_no4");
			
			String card_valid = null;
			int card_valid_m = Integer.parseInt(request.getParameter("card_valid_m"));
			String card_valid_y = request.getParameter("card_valid_y").substring(2);
			if ( card_valid_m > 0 || card_valid_m < 10 ) {
				card_valid = "0" + request.getParameter("card_valid_m") + card_valid_y;
			} else {
				card_valid = request.getParameter("card_valid_m") + card_valid_y;
			}
			
			int card_month = Integer.parseInt(request.getParameter("card_month"));
			String card_pwd = request.getParameter("card_pwd");
			String card_regiNum = request.getParameter("card_regiNum");
			
			Card_payDTO card_payDTO = new Card_payDTO();
			card_payDTO.setEmail(c_email);
			card_payDTO.setCard_no(card_no);
			card_payDTO.setCard_valid(card_valid);
			card_payDTO.setCard_month(card_month);
			card_payDTO.setCard_pwd(card_pwd);
			card_payDTO.setCard_regiNum(card_regiNum);
			card_payDTO.setCard_price(input_point);
			int result = memberService.chargePoint(card_payDTO, c_point);
			
			if ( result == 1 ) {
				// 포인트 충전 성공
				request.getSession().setAttribute("client_onDTO", client_onDTO);
				mav.addObject("charge_point", "포인트가 충전되었습니다.");
				
				viewName = "/member/mypage_main";
			} else {
				// 포인트 충전 실패
				mav.addObject("charge_point", "에러가 발생했습니다. 관리자에게 문의하세요.");
				viewName = "/member/mypage_main";
			}
			
		} else if ( command.equals("list") ) {
			// 세션에 있는 이메일로 해당 사용자의 포인트 사용내역 리스트 출력
			List<PointDTO> pointList = memberService.pointList(c_email);
			mav.addObject("pointList", pointList);
			viewName = "/member/mypoint_list";
		} else if ( command.equals("frmCharge") ) {
			viewName = "/member/chargePoint";
		}
		// 업데이트 된 user_onDTO 다시 가져와서 세션에 담고  
		client_onDTO = memberService.selectMemberInfo_c(client_onDTO.getC_email());
		request.getSession().setAttribute("client_onDTO", client_onDTO);
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/member/admin/list_*.do")
	public ModelAndView MemberList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String requestURI = request.getRequestURI(); // /vegan/member/searchEmail
		String[] str = requestURI.split("/member/admin/list_");
		ModelAndView mav = new ModelAndView();

		if (str[1].equals("user.do")) {
			List<User_onDTO> list_userDTO = (List<User_onDTO>) memberService.listMemberInfo_u();
			mav.addObject("list_userDTO", list_userDTO);
			mav.addObject("target", "user");

		} else if (str[1].equals("client.do")) {
			List<Client_onDTO> list_clientDTO = memberService.listMemberInfo_c();
			mav.addObject("list_clientDTO", list_clientDTO);
			mav.addObject("target", "client");
		}

		mav.setViewName("/member/admin/listMemberInfo");
		return mav;
	}

//	@Override
//	@RequestMapping(value="/reservation/reserv_done", method=RequestMethod.GET)
//	public ModelAndView reservation(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		String command = request.getParameter("command");
//		ModelAndView mav = new ModelAndView();
//		User_onDTO user_onDTO = (User_onDTO) request.getSession().getAttribute("user_onDTO");
//		String viewName = null;
//		
//		if ( command == null ) {
//			viewName = "/reservation/reservDetail";
//		} else if ( command.equals("payPoint") ) { // 포인트 사용하여 예약금 결제 후 예약 테이블에 저장
//			int reserv_deposit = Integer.parseInt(request.getParameter("reserv_deposit"));
//			
//			// point 테이블에 insert -> user_on table에 u_point update -> reserv 테이블에 예약정보 저장
//			PointDTO pointDTO = new PointDTO();
//			
//			pointDTO.setEmail(user_onDTO.getU_email());
//			pointDTO.setPoint_change(-reserv_deposit);
//			pointDTO.setPoint_history("B");
//			
//			int result = memberService.payPoint( pointDTO, user_onDTO);
//			
//			if ( result == 1 ) {
//				mav.addObject("reservProc", true);
//			} else {
//				mav.addObject("reservProc", false);
//			}
//			
//			viewName = "/reservation/reserv_done";
//		}
//		mav.setViewName(viewName);
//		return mav;
//		
//	}

	@Override
	@RequestMapping(value="/member/joinProc.do", method = RequestMethod.POST)
	public ModelAndView joinProc(String input_email, String input_pwd_r, String input_name, String input_nick,
			String input_tel, String input_addr, String input_lvl) throws Exception {
		// TODO Auto-generated method stub
		String viewName = null;
		ModelAndView mav = new ModelAndView();
		User_onDTO dto = new User_onDTO();
		dto.setU_email(input_email);
		dto.setU_pwd(input_pwd_r);
		dto.setU_name(input_name);
		dto.setU_nick(input_nick);
		dto.setU_tel(input_tel);
		dto.setU_lvl(input_lvl);
		dto.setU_addr(input_addr);
		
		int result = memberService.insertJoinUser(dto);
		if ( result == 1 ) {
			// DB 에 데이터가 정상적으로 저장된 경우
			// 인증 이메일 보내고 성공하면 화면 전환
			sendEmail(input_email, "아래 링크를 클릭해 이메일 주소를 인증해 주세요.", "/certifEmail?email=", input_name,  "이메일 인증하기", "[베지테이블] 회원가입을 위해 이메일을 인증해 주세요.");
			viewName = "/member/proc";
			mav.addObject("joinProc", true);
			mav.addObject("input_email", input_email);
		} else {
			viewName = "/member/proc";
			mav.addObject("joinProc",false);
		}
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/join.do") // 회원가입시 이메일, 닉네임 중복 확인 ajax 관련 메서드
	public void joinProc_(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String result = null;
		String command = request.getParameter("command");
		if ( command.equals("duplicate_email") ) {
			String input_email = request.getParameter("input_email");
			result = memberService.duplicate_email(input_email);
			// 이미 존재하는 아이디다 -> false
			// 가입 가능한 아이디다 -> true
		} else if ( command.equals("duplicate_nick") ) {
			String input_nick = request.getParameter("input_nick");
			result = memberService.duplicate_nick(input_nick);
		}
		response.getWriter().print(result);
	}

	// 회원가입시 이메일 인증 메일 전송 메서드
	public void sendEmail(String input_name, String message, String url, String input_email, String procName, String procTitle){
		// sendEmail(input_email, "아래 링크를 클릭해 이메일 주소를 인증해 주세요.", "/certifEmail?u_email=", input_name,  "이메일 인증하기", "[베지테이블] 회원가입을 위해 이메일을 인증해 주세요.");	
		StringBuffer sb = new StringBuffer();
		sb.append("<html><head><meta charset='UTF-8'></head>");
		sb.append("<body><p>" + input_name +"님, 안녕하세요.</p>");
		sb.append("<p>" + message + "</p>");
		sb.append("<a href='http://localhost:8090/vegan/member" + url + input_email + "'>" + procName + "</a>");
		sb.append("</body></html>");
		
		String content = sb.toString();
		
		// memberService 의 sendAuthMail 메서드로 주소, 제목, 내용을 전달
		memberService.sendAuthMail("gw_1v@naver.com", procTitle, content);
		
		// mail-context.xml 에 설정한 메일 주소로 내용을 보낸다
		// memberService.sendPreConfiguredMail("테스트 메일입니다."); 
	}

	@Override
	@RequestMapping(value="/member/certifEmail") // 사용자가 수신한 인증 이메일을 클릭한 경우 u_auth 값을 'Y'로 업데이트하는 메서드
	public ModelAndView certifEmail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = null;
		ModelAndView mav = new ModelAndView();		
		String u_email = request.getParameter("u_email");
		int result = memberService.certifEmail(u_email);
		
		if ( result == 1 ) {
			// u_auth 컬럼값 Y로 변경됨 -> 로그인 시 서비스 이용 가능
			mav.addObject("certifEmail", true);
			
		} else if ( result == 999 ) {
			// 이미 인증된 계정
			mav.addObject("certifEmail", false);
		}
		viewName = "/member/proc";
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/member/delete.do")
	public ModelAndView deleteMemberInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = null;
		ModelAndView mav = new ModelAndView();	
		User_onDTO user_onDTO = (User_onDTO) request.getSession().getAttribute("user_onDTO");
		//		1. 예약 승인 대기 또는 예약 진행중인 건이 없는 경우
		//		2. 포인트가 0원인 경우
		//		1, 2 모두 해당되면 삭제 가능
		//		-> 계정 삭제 동의 -> 비활성화 계정 테이블로 이관 및 일정 기간동안 보관 후 삭제
		if ( user_onDTO != null ) {
			int result = memberService.deleteMemberInfo(user_onDTO);

			if ( result == 1) {
				// user_on delete, user_off insert 성공한 경우
				request.getSession().invalidate();
				mav.addObject("delProc",true);
			} else {
				mav.addObject("delProc",false);
			}
			viewName = "/member/proc";
		} else {
			Client_onDTO client_onDTO = (Client_onDTO) request.getSession().getAttribute("client_onDTO");
			int result = memberService.deleteMemberInfo_c(client_onDTO);

			if ( result == 1) {
				// user_on delete, user_off insert 성공한 경우 세션 제거 후 페이지 전환
				request.getSession().invalidate();
				mav.addObject("delProc",true);
			} else {
				mav.addObject("delProc",false);
			}
			viewName = "/member/proc";
		}

		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/member/delConfirm.do") // 계정 비활성화 버튼 클릭 시 남은 예약건, 포인트 가져오는 ajax 메서드
	public void delConfirm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int result_r = 0;
		User_onDTO user_onDTO = (User_onDTO) request.getSession().getAttribute("user_onDTO");
		
		if ( user_onDTO != null ) {
			result_r = memberService.selectReservCondition(user_onDTO.getU_email());
		} else {
			Client_onDTO client_onDTO = (Client_onDTO) request.getSession().getAttribute("client_onDTO");
			result_r = memberService.selectReservCondition_c(client_onDTO.getC_email());
		}
		
		System.out.println("result_r: " + result_r);
		
		response.getWriter().print(result_r);
	}

	@Override
	@RequestMapping(value="/member/resettingPwd.do") // 비밀번호 재설정 링크로 요청
	public ModelAndView resettingPwd(String email, String input_pwd_r, String command) throws Exception {
		String viewName = "/member/searchLoginInfo";
		ModelAndView mav = new ModelAndView();	
		if ( command == null ) { // 비밀번호 재설정 폼 출력
			mav.addObject("email",email);
			mav.addObject("resetting",true);
			viewName = "/member/resetPwd";
			
		} else if ( command.equals("reset") ) { // 비밀번호 재설정 폼에서 input_pwd_r, u_email 값이 들어옴
			LoginDTO loginDTO = new LoginDTO();
			loginDTO.setEmail(email);
			loginDTO.setPwd(input_pwd_r);
			int result = memberService.resetPwd(loginDTO);
			if ( result == 1 ) {
				// 비밀번호 변경 성공
				viewName = "/member/proc";
				mav.addObject("resetPwd", true);
			} else {
				viewName = "/member/proc";
				mav.addObject("resetPwd", false);
			}
		}
		
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/member/mypage_info.do")
	public ModelAndView mypage_info(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();	
		String command = request.getParameter("command");
		String viewName = "";
		
		User_onDTO user_onDTO = (User_onDTO) request.getSession().getAttribute("user_onDTO");
		Client_onDTO client_onDTO = null;
		if ( user_onDTO != null ) {} else {
			client_onDTO = (Client_onDTO) request.getSession().getAttribute("client_onDTO");
		}
		
		if ( command == null ) { // 사용자 정보 불러오기
			if ( user_onDTO != null ) {
				viewName = "/member/mypage_info_u";
			}
			if ( client_onDTO != null ) {
				viewName = "/member/mypage_info_c";
			}
			
			
		} else if ( command.equals("modify") ) { // 회원정보수정 버튼 클릭 시
			int result = 0;
			if ( user_onDTO != null ) {
				result = memberService.updateModifyUser(user_onDTO);
			} else {
				result = memberService.updateModifyUser_c(client_onDTO);
			}
			if ( result > 0) {
				mav.addObject("modProc","회원 정보가 수정되었습니다.");
			} else {
				mav.addObject("modProc","에러가 발생하였습니다. 관리자에게 문의하세요.");
			}
			viewName = "/member/mypage.do";
		}
		
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping("/member/adminMain.do")
	public ModelAndView adminMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		Boolean isAdminLogOn = (Boolean) session.getAttribute("isAdminLogOn");
		ModelAndView mav = new ModelAndView();
		
		if (isAdminLogOn != null) {
			mav.setViewName(viewName);
		} else {
			mav.setViewName("redirect:/");
		}
		
		
		
		return mav;
	}

	@Override
	@RequestMapping("/member/eventForm.do")
	public ModelAndView eventForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	

	

	@Override
	@RequestMapping("/member/myWriteList.do")
	public ModelAndView myWriteList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session = request.getSession();
		User_onDTO user = (User_onDTO) session.getAttribute("user_onDTO");
		String u_email = user.getU_email();
		
		
		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");
		
		if (isLogOn != null) {
			List<Com_ScrapDTO> c_s = (List<Com_ScrapDTO>) session.getAttribute("com_scrapDTO");
			for (Com_ScrapDTO cs : c_s) {
				if (cs.getU_email() == u_email) {
					mav.addObject("cs", cs);
				}
			}
		} 	
		
		Map<String, Object> articleMap = memberService.myWriteList(u_email);
		mav.addObject("articleMap", articleMap);
		
		return mav;
	}
	
	@Override
	@RequestMapping("/member/myScrapList.do")
	public ModelAndView myScrapList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session = request.getSession();
		User_onDTO user = (User_onDTO) session.getAttribute("user_onDTO");
		String u_email = user.getU_email();
		
		
		
		
		
		
		Map<String, Object> articleMap = memberService.myScrapList(u_email);
		mav.addObject("articleMap", articleMap);
		
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/event.do", method = RequestMethod.POST)
	public ResponseEntity<String> event(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration<String> enu = multipartRequest.getParameterNames();
		
		while (enu.hasMoreElements()) {
			String name = enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}
		
		List<String> fileList = uploadMulti(multipartRequest);
		List<E_ImageDTO> imageFileList = new ArrayList<E_ImageDTO>();
		
		if (fileList != null && fileList.size() != 0) {
			for (String fileName : fileList) {
				E_ImageDTO image = new E_ImageDTO();
				image.setE_image(fileName);
				imageFileList.add(image);
			}
		}
		
		
		
		HttpSession session = multipartRequest.getSession();
		User_onDTO user = (User_onDTO) session.getAttribute("user_onDTO");
		String u_email = user.getU_email();
		String u_nick = user.getU_nick();
		articleMap.put("u_email", u_email);
		articleMap.put("u_nick", u_nick); 
		articleMap.put("imageFileList", imageFileList);
		
		String message;
		ResponseEntity<String> resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");
		
		try {
			int e_no = memberService.addNewEvent(articleMap);
			
			
			
			if (fileList != null && fileList.size() != 0) {
				for (String fileName : fileList) {
				File srcFile = new File(EVENT_UPLOAD + "\\" + "temp" + "\\" + fileName);
				File descDir = new File(EVENT_UPLOAD + "\\" + e_no);
				FileUtils.moveFileToDirectory(srcFile, descDir, true);
				}
			}

			message = "<script>";
			message += " alert('새 이벤트를 추가함');";
			message += " location.href='"+multipartRequest.getContextPath()+"/community/community.do';";
			message += "</script>";
			resEnt = new ResponseEntity<String>(message, responseHeaders, HttpStatus.OK);
		} catch (Exception e) {
			if (fileList != null && fileList.size() != 0) {
				for (String fileName : fileList) {
				File srcFile = new File(EVENT_UPLOAD + "\\" + "temp" + "\\" + fileName);
				srcFile.delete();
				}
			}
			
			

			message = "<script>";
			message += " alert('오류발생함');";
			message += " location.href='"+multipartRequest.getContextPath()+"/member/eventForm.do';";
			message += "</script>";
			resEnt = new ResponseEntity<String>(message, responseHeaders, HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}

		return resEnt;
		
	}

	private List<String> uploadMulti(MultipartHttpServletRequest multipartRequest) throws Exception{
		
		List<String> fileList = new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			fileList.add(originalFileName);
			
			
			File file = new File(EVENT_UPLOAD + "\\" + fileName);
			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					if (file.getParentFile().mkdirs()) {
						file.createNewFile();
					}
				}
				mFile.transferTo(new File(EVENT_UPLOAD + "\\" + "temp" + "\\" + originalFileName));
			}
		}
		return fileList;
	}

	@Override
	@RequestMapping("/member/myInqueryList.do")
	public ModelAndView myInqueryList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session = request.getSession();
		User_onDTO user = (User_onDTO) session.getAttribute("user_onDTO");
		String u_email = user.getU_email();
		
		
		
		
		Map<String, Object> articleMap = memberService.myInqueryList(u_email);
		mav.addObject("articleMap", articleMap);
		
		return mav;
	}

	@Override
	@RequestMapping("/member/writeListSearch.do")
	public ModelAndView writeListSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		return mav;
	}

	@Override
	@ResponseBody
	@RequestMapping("/member/viewSearchList.do")
	public List<CommunityDTO> viewSearchList(String search_type, String keyword, String c_category, Model model) throws Exception {
		CommunityDTO com = new CommunityDTO();
		com.setC_category(c_category);
		com.setSearch_type(search_type);
		com.setKeyword(keyword);
		
		return memberService.viewSearchList(com);
	}

	@Override
	@RequestMapping("/member/inqueryList.do")
	public ModelAndView inqueryList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		return mav;
	}

	@Override
	@ResponseBody
	@RequestMapping("/member/viewInqueryList.do")
	public List<InqueryDTO> viewInqueryList(String search_type, String keyword, Model model) throws Exception {
		InqueryDTO iq = new InqueryDTO();
		iq.setSearch_type(search_type);
		iq.setKeyword(keyword);
		
		return memberService.viewInqueryList(iq);
	}

	@Override
	@ResponseBody
	@RequestMapping(value = "/member/replyInquery.do", method = RequestMethod.POST)
	public void replyInquery(int reply_iq_no, String iq_reply_content, String iq_u_email, Model model)
			throws Exception {
		
		Map<String, Object> articleMap = new HashMap<String, Object>();
		articleMap.put("reply_iq_no", reply_iq_no);
		
		articleMap.put("iq_reply_content", iq_reply_content);
		
		articleMap.put("iq_u_email", iq_u_email);
		
		memberService.reply(articleMap);
		
	}

}
