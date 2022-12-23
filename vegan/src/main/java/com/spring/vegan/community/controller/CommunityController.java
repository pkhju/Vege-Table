package com.spring.vegan.community.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.vegan.community.dto.CommunityDTO;
import com.spring.vegan.community.dto.InqueryDTO;
import com.spring.vegan.community.dto.ReplyDTO;

public interface CommunityController {
	public ModelAndView community(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView articleForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity<String> addArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	public ModelAndView viewArticle(@RequestParam("c_articleNo") int c_articleNo, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String comment(ReplyDTO reply) throws Exception;
	public void deleteArticle(@RequestParam("c_articleNo") int c_articleNo, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void deleteReply(@RequestParam("reply_no") int reply_no, @RequestParam("c_articleNo") int c_articleNo, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView inqueryForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity<String> inquery(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	public int scrap(@RequestParam("c_articleNo") int c_articleNo, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public int scrapCancel(@RequestParam("c_articleNo") int c_articleNo, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	public ModelAndView viewEvent(@RequestParam("e_no") int e_no, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView recipeMore(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView veganLifeMore(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public List<CommunityDTO> changeFilter(@RequestParam("search_type") String search_type, Model model) throws Exception;
	public List<CommunityDTO> changeFilter2(@RequestParam("search_type") String search_type, Model model) throws Exception;
	
	public ModelAndView viewInquery(@RequestParam("iq_no") int iq_no, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public void eventUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public int heart(@RequestParam("c_articleNo") int c_articleNo, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public int heartCancel(@RequestParam("c_articleNo") int c_articleNo, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public String modArticle(@RequestParam("c_articleNo") int c_articleNo, @RequestParam("c_title") String c_title, @RequestParam("c_content") String c_content, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
