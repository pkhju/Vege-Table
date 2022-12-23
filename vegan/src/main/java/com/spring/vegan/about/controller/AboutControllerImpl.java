package com.spring.vegan.about.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.vegan.member.controller.MemberControllerImpl;

@Controller
@EnableAsync
public class AboutControllerImpl implements AboutController {
	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	
	@Override
	@RequestMapping(value="/about")
	public ModelAndView about(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String viewName = "/about/about";
		ModelAndView mav = new ModelAndView(viewName);

		return mav;
	}
}
