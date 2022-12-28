package com.spring.vegan.member.service;

import java.util.List;
import java.util.Map;

import com.spring.vegan.community.dto.Com_HeartDTO;
import com.spring.vegan.community.dto.Com_ScrapDTO;
import com.spring.vegan.community.dto.CommunityDTO;
import com.spring.vegan.community.dto.InqueryDTO;
import com.spring.vegan.member.dto.Card_payDTO;
import com.spring.vegan.member.dto.Client_onDTO;
import com.spring.vegan.member.dto.EventDTO;
import com.spring.vegan.member.dto.Iq_ReplyDTO;
import com.spring.vegan.member.dto.LoginDTO;
import com.spring.vegan.member.dto.PointDTO;

import com.spring.vegan.member.dto.SearchDTO;
import com.spring.vegan.member.dto.User_onDTO;

public interface MemberService {
	public User_onDTO checkByEmailPwd_u(LoginDTO loginDTO);
	public Client_onDTO checkByEmailPwd_c(LoginDTO loginDTO);
	public String searchLogin(SearchDTO dto);
	public User_onDTO selectMemberInfo(String u_email); // mypage 사용자 정보 출력
	public List<User_onDTO> listMemberInfo_u(); // admin에서 회원 정보 조회
	public List<Client_onDTO> listMemberInfo_c(); // admin에서 회원 정보 조회
	public int chargePoint(Card_payDTO card_payDTO, int u_point); // 포인트 충전
	public List<PointDTO> pointList(String u_email);
	public int payPoint(PointDTO pointDTO, User_onDTO user_onDTO);
	public String duplicate_email(String input_email);
	public String duplicate_nick(String input_nick);
	public void sendAuthMail(String to, String subject, String body);
	//public void sendPreConfiguredMail(String message); // xml에 저장된 내용으로 메일 전송
	public int certifEmail(String u_email);
	public int insertJoinUser(User_onDTO dto);
	public int insertJoinClient(Client_onDTO client_onDTO);
	public int updateModifyUser(User_onDTO dto);
	public int selectReservCondition(String u_email);
	public int deleteMemberInfo(User_onDTO user_onDTO);
	public int resetPwd(LoginDTO loginDTO);
	public int updateModifyUser_c(Client_onDTO client_onDTO);
	public Client_onDTO selectMemberInfo_c(String c_email);
	public int selectReservCondition_c(String c_email);
	public int deleteMemberInfo_c(Client_onDTO client_onDTO);
	public User_onDTO selectUpdatedUser(String u_email);
	public Client_onDTO selectUpdatedClient(String c_email);
	public void event(EventDTO ev);
	public Map<String, Object> myWriteList(String u_email);
	public List<Com_ScrapDTO> scrapInfo(String u_email);
	public Map<String, Object> myScrapList(String u_email);
	public int addNewEvent(Map<String, Object> articleMap);
	public Map<String, Object> myInqueryList(String u_email);
	public List<CommunityDTO> viewSearchList(CommunityDTO com);
	public List<InqueryDTO> viewInqueryList(InqueryDTO iq);
	public void reply(Map<String, Object> articleMap);
	public List<Iq_ReplyDTO> replyInquery(int reply_iq_no);
	public List<Com_HeartDTO> heartInfo(String u_email);
	
}
