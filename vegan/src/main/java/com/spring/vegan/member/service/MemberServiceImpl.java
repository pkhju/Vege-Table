package com.spring.vegan.member.service;

import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.spring.vegan.community.dto.Com_HeartDTO;
import com.spring.vegan.community.dto.Com_ScrapDTO;
import com.spring.vegan.community.dto.CommunityDTO;
import com.spring.vegan.community.dto.InqueryDTO;
import com.spring.vegan.member.dao.MemberDAO;
import com.spring.vegan.member.dto.Card_payDTO;
import com.spring.vegan.member.dto.Client_onDTO;
import com.spring.vegan.member.dto.EventDTO;
import com.spring.vegan.member.dto.Iq_ReplyDTO;
import com.spring.vegan.member.dto.LoginDTO;
import com.spring.vegan.member.dto.PointDTO;
import com.spring.vegan.reservation.dto.ReservDTO;
import com.spring.vegan.member.dto.SearchDTO;
import com.spring.vegan.member.dto.User_onDTO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private JavaMailSender mailSender;
	
//	@Autowired
//	private SimpleMailMessage preConfiguredMessage;
	
	@Override
	public User_onDTO checkByEmailPwd_u(LoginDTO loginDTO) {
		// TODO Auto-generated method stub
		return memberDAO.checkByEmailPwd_u(loginDTO);
	}

	@Override
	public Client_onDTO checkByEmailPwd_c(LoginDTO loginDTO) {
		// TODO Auto-generated method stub
		return memberDAO.checkByEmailPwd_c(loginDTO);
	}
	@Override
	public String searchLogin(SearchDTO dto) {
		return memberDAO.searchLogin(dto);
	}

	@Override
	public User_onDTO selectMemberInfo(String u_email) {
		// TODO Auto-generated method stub
		return memberDAO.selectMemberInfo(u_email);
	}
	
	@Override
	public Client_onDTO selectMemberInfo_c(String c_email) {
		// TODO Auto-generated method stub
		return memberDAO.selectMemberInfo_c(c_email);
	}

	@Override
	public List<User_onDTO> listMemberInfo_u() {
		return memberDAO.listMemberInfo_u();
	}

	@Override
	public List<Client_onDTO> listMemberInfo_c() {
		return memberDAO.listMemberInfo_c();
	}

	@Override
	public int chargePoint(Card_payDTO card_payDTO, int u_point) {
		return memberDAO.chargePoint(card_payDTO, u_point);
	}

	@Override
	public List<PointDTO> pointList(String u_email) {
		// TODO Auto-generated method stub
		return memberDAO.selectPointList(u_email);
	}

	@Override
	public int payPoint(PointDTO pointDTO, User_onDTO user_onDTO) {
		// TODO Auto-generated method stub
		return memberDAO.payPoint(pointDTO, user_onDTO);
	}

	@Override
	public String duplicate_email(String input_email) {
		// TODO Auto-generated method stub
		return memberDAO.duplicate_email(input_email);
	}
	
	@Override
	public String duplicate_nick(String input_nick) {
		// TODO Auto-generated method stub
		return memberDAO.duplicate_nick(input_nick);
	}

	@Override
	@Async
	public void sendAuthMail(String to, String subject, String body) {
		// TODO Auto-generated method stub
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setCc("gw_1v@naver.com");
			messageHelper.setFrom("vegan@admin.com", "베지테이블");
			messageHelper.setSubject(subject);
			messageHelper.setTo(to);
			messageHelper.setText(body,true);
			mailSender.send(message);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@Override
	public int certifEmail(String email) {
		// TODO Auto-generated method stub
		return memberDAO.certifEmail(email);
	}

	@Override
	public int insertJoinUser(User_onDTO dto) {
		// TODO Auto-generated method stub
		return memberDAO.insertJoinUser(dto);
	}

	@Override
	public int updateModifyUser(User_onDTO dto) {
		// TODO Auto-generated method stub
		return memberDAO.updateModifyUser(dto);
	}
	@Override
	public int updateModifyUser_c(Client_onDTO client_onDTO) {
		// TODO Auto-generated method stub
		return memberDAO.updateModifyUser_c(client_onDTO);
	}

	@Override
	public int selectReservCondition(String u_email) {
		// TODO Auto-generated method stub
		return memberDAO.selectReservCondition(u_email);
	}
	
	@Override
	public int selectReservCondition_c(String c_email) {
		// TODO Auto-generated method stub
		return memberDAO.selectReservCondition_c(c_email);
	}

	@Override
	public int deleteMemberInfo(User_onDTO user_onDTO) {
		// TODO Auto-generated method stub
		return memberDAO.deleteMemberInfo(user_onDTO);
	}

	@Override
	public int deleteMemberInfo_c(Client_onDTO client_onDTO) {
		// TODO Auto-generated method stub
		return memberDAO.deleteMemberInfo_c(client_onDTO);
	}
	
	@Override
	public int resetPwd(LoginDTO loginDTO) {
		// TODO Auto-generated method stub
		return memberDAO.resetPwd(loginDTO);
	}

	@Override
	public User_onDTO selectUpdatedUser(String u_email) {
		User_onDTO newUser = memberDAO.selectUpdatedUser(u_email);
		return newUser;
	}

	@Override
	public Client_onDTO selectUpdatedClient(String c_email) {
		// TODO Auto-generated method stub
		Client_onDTO newClient = memberDAO.selectUpdatedClient(c_email);
		return newClient;
	}

//	@Override
//	@Async
//	public void sendPreConfiguredMail(String message) {
//		SimpleMailMessage mailMessage = new SimpleMailMessage(preConfiguredMessage);
//		mailMessage.setText(message);
//		mailSender.send(mailMessage);
//		
//	}
	@Override
	public void event(EventDTO ev) {
		memberDAO.event(ev);
	}

	@Override
	public Map<String, Object> myWriteList(String u_email) {
		// TODO Auto-generated method stub
		return memberDAO.myWriteList(u_email);
	}

	@Override
	public List<Com_ScrapDTO> scrapInfo(String u_email) {
		// TODO Auto-generated method stub
		return memberDAO.scrapInfo(u_email);
	}

	@Override
	public Map<String, Object> myScrapList(String u_email) {
		// TODO Auto-generated method stub
		return memberDAO.myScrapList(u_email);
	}

	@Override
	public int addNewEvent(Map<String, Object> articleMap) {
		// TODO Auto-generated method stub
		return memberDAO.insertNewEvent(articleMap);
	}

	@Override
	public Map<String, Object> myInqueryList(String u_email) {
		// TODO Auto-generated method stub
		return memberDAO.myInqueryList(u_email);
	}

	@Override
	public List<CommunityDTO> viewSearchList(CommunityDTO com) {
		// TODO Auto-generated method stub
		return memberDAO.viewSearchList(com);
	}

	@Override
	public List<InqueryDTO> viewInqueryList(InqueryDTO iq) {
		// TODO Auto-generated method stub
		return memberDAO.viewInqueryList(iq);
	}

	@Override
	public void reply(Map<String, Object> articleMap) {
		// TODO Auto-generated method stub
		memberDAO.reply(articleMap);
	}

	@Override
	public List<Iq_ReplyDTO> replyInquery(int reply_iq_no) {
		// TODO Auto-generated method stub
		return memberDAO.replyInquery(reply_iq_no);
	}

	@Override
	public List<Com_HeartDTO> heartInfo(String u_email) {
		// TODO Auto-generated method stub
		return memberDAO.heartInfo(u_email);
	}
}
