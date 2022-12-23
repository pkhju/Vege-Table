package com.spring.vegan.about.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface AboutController {
	public ModelAndView about(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
