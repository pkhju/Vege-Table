package com.spring.vegan.reservation.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.vegan.reservation.dto.ReservDTO;

public interface ReservController {
	public ModelAndView reservDetail(@RequestParam("resto_no") int resto_no, @RequestParam("reserv_member") int reserv_member, 
			@RequestParam("reserv_sched") String reserv_sched, @RequestParam("reserv_no") String reserv_no, 
			@RequestParam("c_email") String c_email, @RequestParam("u_email") String u_email,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void addReserv(@ModelAttribute("reserv") ReservDTO reserv, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView reservList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView confirm(HttpServletRequest request, HttpServletResponse response) throws Exception;
}	