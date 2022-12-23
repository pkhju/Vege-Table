package com.spring.vegan.resto.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.vegan.resto.dto.RestoDTO;
import com.spring.vegan.resto.dto.ReviewDTO;

public interface RestoController {
	public ModelAndView restoForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addReviewForm(@RequestParam("resto_no") int resto_no, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modReviewForm(@RequestParam("resto_no") int resto_no, @RequestParam("review_no") int review_no, 
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView restoList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String searchResto(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView restoDetail(@RequestParam("resto_no") int resto_no,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modRestoForm(@RequestParam("resto_no") int resto_no,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity<String> modResto(@ModelAttribute("resto") RestoDTO resto, MultipartHttpServletRequest multipartRequest, 
			HttpServletResponse response) throws Exception;
	public ResponseEntity<String> addResto(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public ModelAndView addRestoForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity<String> addReview(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public void removeReview(@RequestParam("resto_no") int resto_no, 
			@RequestParam("review_no") int review_no, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void showReview(@RequestParam("resto_no") int resto_no, 
			@RequestParam("review_no") int review_no, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void hideReview(@RequestParam("resto_no") int resto_no, 
			@RequestParam("review_no") int review_no, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity<String> modReview(@RequestParam("resto_no") int resto_no, @RequestParam("review_no") int review_no, 
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public void removeImage(@RequestParam("resto_no") int resto_no, @RequestParam("imageFileNo") String imageFileNo, 
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
}
