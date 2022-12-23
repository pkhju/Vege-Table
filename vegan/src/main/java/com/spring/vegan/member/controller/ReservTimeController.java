package com.spring.vegan.member.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.vegan.member.service.MemberService;

@Controller
public class ReservTimeController {
	@RequestMapping(value="/test")
	public ModelAndView test (HttpServletRequest request, HttpServletResponse response) throws Exception {
		// DB에서 0000-0000 형식으로 받아오면 편할 듯
		String [] r = "1030-2100".split("-"); // 영업시간 "-" 기준으로 잘라서 배열로
		String [] b = "1600-1800".split("-"); // 브레이크타임 "-" 기준으로 잘라서 배열로
		
		int rs = Integer.parseInt(r[0])/100; // 영업시간 시작 10
		int re = Integer.parseInt(r[1])/100; // 영업시간 끝 21		
		int bs = Integer.parseInt(b[0])/100; // 브레이크타임 시작 16
		int be = Integer.parseInt(b[1])/100; // 브레이크타임 끝 18
		int[] st = {rs, be}; // // start time: 영업시간 시작(rs), 브레이크타임 끝(be) => {10, 18}
		
		int t1 = (bs - st[0]); // 점심 영업시간: 브레이크타임 시작 - 영업시간 시작 => 16 - 10 = 4
		int t2 = (re - st[1]); // 저녁 영업시간: 영업시간 끝 - 브레이크타임 끝 => 21 - 18 = 3
		
		int[] subT = {t1, t2}; // 점심, 저녁 영업시간 배열 (i값 넣어서 for문 한번에 돌리려고)
		
		List<String> list = new ArrayList<String>(); // 30분 단위로 쪼갠 예약 가능 시간 담을 리스트
		
		for ( int j = 0; j < subT.length; j++ ) { // subT.length = 2 ({점심(t1), 저녁(t2)})
			if ( j == 0 ) { // 점심 영업시간: j = 0 => subT[0] = t1 
				for ( int i = 0; i < ((subT[j]*2)+1); i++ ) { // (subT[j]*2)+1: (영업시간*2)+1 => 10:00 부터 16:00 까지 30분 단위로 쪼갰을 때 개수
					if ( i != 0 && i % 2 == 0 ) {
						st[j] += 1; // 0 제외 짝수 인덱스일 때 시간 1시간씩 더하기 예) 11 -> 12 -> 13
					}
					if ( i % 2 == 0 ) { // 짝수 인덱스일 때 :00 붙여서 list에 추가
						list.add(i, String.valueOf(st[j]) + ":00");
						
					} else { // 홀수 인덱스일 때 :30 붙여서 list에 추가
						list.add(i, String.valueOf(st[j]) + ":30");
					}
				}
				
			} else if ( j == 1 ) {
				// 저녁 영업시간: j = 1 => subT[1] = t2
				int end = list.size() + ((subT[j]*2)+1);
				int start = list.size(); // 점심시간 쪼갠거 다 담은 이후부터 저녁시간 배열 시작
				for ( int i = start ; i < end; i++ ) {
					if ( i != start && i % 2 == 1 ) {
						st[j] += 1;
					}
					if ( i % 2 == 1 ) {
						list.add(i, String.valueOf(st[j]) + ":00");
						
					} else {
						list.add(i, String.valueOf(st[j]) + ":30");
					}
				}
			}
		}
		
		ModelAndView mav = new ModelAndView("home");
		mav.addObject("list", list);
		return mav;
	}
	
	
	
}
