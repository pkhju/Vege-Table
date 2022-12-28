package com.spring.vegan.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.vegan.community.dto.InqueryDTO;
import com.spring.vegan.community.dto.CommunityDTO;

public interface MemberController {
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView join(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView join_c(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView joinProc(@RequestParam("certify") String certify, @RequestParam("regiNum") String regiNum, @RequestParam("input_email") String input_email, @RequestParam("input_pwd_r") String input_pwd_r, @RequestParam("input_name") String input_name, @RequestParam("input_nick") String input_nick, @RequestParam("input_tel") String input_tel, @RequestParam("input_addr") String input_addr, @RequestParam("input_lvl") String input_lvl) throws Exception;
	public void joinProc_(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void delConfirm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView loginProc(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView logoutProc(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchProc(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView mypoint(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView mypoint_c(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView MemberList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listMemberInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//	public ModelAndView reservation(HttpServletRequest request,HttpServletResponse response) throws Exception;
	public ModelAndView certifEmail(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView deleteMemberInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView resettingPwd(@RequestParam("u_email") String u_email, @RequestParam("input_pwd_r") String input_pwd_r, @RequestParam("command") String command) throws Exception;
	public ModelAndView mypage_main(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView mypage_info(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView adminMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView eventForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity<String> event(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public ModelAndView writeListSearch(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myWriteList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myScrapList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myInqueryList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public List<CommunityDTO> viewSearchList(@RequestParam("search_type") String search_type, @RequestParam("keyword") String keyword, @RequestParam("c_category") String c_category, Model model) throws Exception;
	public ModelAndView inqueryList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public List<InqueryDTO> viewInqueryList(@RequestParam("search_type") String search_type, @RequestParam("keyword") String keyword, Model model) throws Exception;
	public void replyInquery(@RequestParam("reply_iq_no") int reply_iq_no, @RequestParam("iq_reply_content") String iq_reply_content, @RequestParam("iq_u_email") String iq_u_email, Model model) throws Exception;

}
