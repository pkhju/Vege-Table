package com.spring.vegan.reservation.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.vegan.member.dto.Client_onDTO;
import com.spring.vegan.member.dto.PointDTO;
import com.spring.vegan.member.dto.User_onDTO;
import com.spring.vegan.member.service.MemberService;
import com.spring.vegan.reservation.dto.ReservDTO;
import com.spring.vegan.reservation.service.ReservService;
import com.spring.vegan.resto.dto.RestoDTO;

@Controller
public class ReservControllerImpl  implements ReservController{
	@Autowired
	ReservService reservService;
	@Autowired
	MemberService memberService;

	@Override
	@RequestMapping(value="/reservation/reservDetail.do", method=RequestMethod.GET)
	public ModelAndView reservDetail(@RequestParam("resto_no") int resto_no, @RequestParam("reserv_member") int reserv_member, 
			@RequestParam("reserv_sched") String reserv_sched, @RequestParam("reserv_no") String reserv_no, @RequestParam("c_email") String c_email,
			@RequestParam("u_email") String u_email, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		List<ReservDTO> reserv = reservService.getReserv();
		RestoDTO restoList = reservService.getRestoDetail(resto_no);
		User_onDTO newUser = memberService.selectUpdatedUser(u_email);
		ReservDTO selReserv = reservService.selectReserv(reserv_no);
		reserv_no = u_email + "/" + reserv_sched + "/" + resto_no + "/" + reserv_member;
		int result  = reservService.selectResult(reserv_no);
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("restoList", restoList);
		mav.addObject("reserv_member", reserv_member);
		mav.addObject("reserv_sched", reserv_sched);
		mav.addObject("reserv_no", reserv_no);
		mav.addObject("c_email", c_email);
		mav.addObject("u_email", u_email);
		mav.addObject("newUser", newUser);
		mav.addObject("selReserv", selReserv);
		mav.addObject("reserv", reserv);
		if(result == 1) {
			mav.addObject("result", true);
		} else {
			mav.addObject("result", false);
		}
		return mav;
	}

	@Override
	@RequestMapping(value="/reservation/addReserv.do", method=RequestMethod.POST)
	public void addReserv(ReservDTO reserv, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String msg = null;
		String url = null;

		User_onDTO user_onDTO = (User_onDTO) request.getSession().getAttribute("user_onDTO");

		int reserv_deposit = Integer.parseInt(request.getParameter("reserv_deposit"));

		// point 테이블에 insert -> user_on table에 u_point update -> reserv 테이블에 예약정보 저장
		PointDTO pointDTO = new PointDTO();

		pointDTO.setEmail(reserv.getU_email());
		pointDTO.setPoint_change(-reserv_deposit);
		pointDTO.setPoint_history("B");

		int result = memberService.payPoint(pointDTO, user_onDTO);
		reservService.addReserv(reserv);

		out.println("<script>");
		out.println("alert('" + "예약이 완료되었습니다" + "');");
		out.println("location.href='" + request.getContextPath() + "/reservation/reservList.do" + "';");
		out.println("</script>");
	}

	@Override
	@RequestMapping(value="/reservation/reservList.do", method=RequestMethod.GET)
	public ModelAndView reservList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String viewName = (String) request.getAttribute("viewName");
		
		User_onDTO user_onDTO = (User_onDTO) request.getSession().getAttribute("user_onDTO");
		Client_onDTO client_onDTO = (Client_onDTO) request.getSession().getAttribute("client_onDTO");
			
		if(user_onDTO != null) {
			String u_email = user_onDTO.getU_email();
		
			List<ReservDTO> reservA = reservService.reservA(u_email);
			List<ReservDTO> reservB = reservService.reservB(u_email);
			List<ReservDTO> reservC = reservService.reservC(u_email);
			List<ReservDTO> reservD = reservService.reservD(u_email);		
			List<ReservDTO> reservE = reservService.reservE(u_email);		

			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("reservA", reservA);
			mav.addObject("reservB", reservB);
			mav.addObject("reservC", reservC);
			mav.addObject("reservD", reservD);
			mav.addObject("reservE", reservE);
			return mav;
		} else if(client_onDTO != null) {
			String c_email = client_onDTO.getC_email();
			
			List<ReservDTO> cReservA = reservService.cReservA(c_email);
			List<ReservDTO> cReservB = reservService.cReservB(c_email);
			List<ReservDTO> cReservC = reservService.cReservC(c_email);
			List<ReservDTO> cReservD = reservService.cReservD(c_email);		
			List<ReservDTO> cReservE = reservService.cReservE(c_email);		

			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("cReservA", cReservA);
			mav.addObject("cReservB", cReservB);
			mav.addObject("cReservC", cReservC);
			mav.addObject("cReservD", cReservD);
			mav.addObject("cReservE", cReservE);
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("/reservation/confirm");
			return mav;
		}
	}

	@Override
	@RequestMapping(value="/reservation/confirm.do", method=RequestMethod.GET)
	public ModelAndView confirm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
}
