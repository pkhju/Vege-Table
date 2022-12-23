package com.spring.vegan.community.controller;

import java.io.File;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import com.spring.vegan.community.dto.C_ImageDTO;
import com.spring.vegan.community.dto.Com_ScrapDTO;
import com.spring.vegan.community.dto.CommunityDTO;
import com.spring.vegan.community.dto.InqueryDTO;
import com.spring.vegan.community.dto.Iq_ImageDTO;
import com.spring.vegan.community.dto.ReplyDTO;
import com.spring.vegan.community.service.CommunityService;
import com.spring.vegan.member.dto.EventDTO;
import com.spring.vegan.member.dto.Iq_ReplyDTO;
import com.spring.vegan.member.dto.User_onDTO;

@Controller("communityController")
@EnableAspectJAutoProxy
@RequestMapping("/community/*")
public class CommunityControllerImpl implements CommunityController{
	@Autowired
	private CommunityService communityService;
	
	private static final String VEGI_UPLOAD = "C:\\Users\\UserF\\Desktop\\YSH\\Vegan_Image\\Vegi_Image";
	private static final String INQUERY_UPLOAD = "C:\\Users\\UserF\\Desktop\\YSH\\Vegan_Image\\Inquery_Image";
	private static final String EVENT_UPLOAD = "C:\\Users\\UserF\\Desktop\\YSH\\Vegan_Image\\Event_Image";

	@Override
	@RequestMapping("/community.do")
	public ModelAndView community(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		List<Com_ScrapDTO> scrap = (List<Com_ScrapDTO>) session.getAttribute("com_scrapDTO");
			
		Map<String, Object> articleMap = communityService.community();
		
		mav.addObject("articleMap", articleMap);
		
		return mav;
	}

	@Override
	@RequestMapping("/articleForm.do")
	public ModelAndView articleForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/viewArticle.do", method = RequestMethod.GET)
	public ModelAndView viewArticle(@RequestParam("c_articleNo") int c_articleNo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session = request.getSession();
		Boolean userLogOn = (Boolean) session.getAttribute("userLogOn");
		
		
		
		Map<String, Object> articleMap = communityService.viewArticle(c_articleNo);
		
		
		
		mav.addObject("articleMap", articleMap);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/viewArticle.do", method = RequestMethod.POST)
	public String comment(ReplyDTO reply) throws Exception {
		communityService.comment(reply);
		
		return "redirect:/community/viewArticle.do?c_articleNo=" + reply.getC_articleNo();
	}

	@Override
	@RequestMapping("/inqueryForm.do")
	public ModelAndView inqueryForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		Boolean userLogOn = (Boolean) session.getAttribute("userLogOn");
		ModelAndView mav = new ModelAndView();
		if (userLogOn != null && userLogOn == true) {
			mav.setViewName(viewName);
		} else {
			mav.setViewName("redirect:/");
		}
		
		
		
		
		return mav;
	}

	

	@Override
	@RequestMapping(value = "addArticle.do", method = RequestMethod.POST)
	public ResponseEntity<String> addArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration<String> enu = multipartRequest.getParameterNames();
		
		while (enu.hasMoreElements()) {
			String name = enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}
		int divideNum = 1;
		List<String> fileList = uploadMulti(multipartRequest, divideNum);
		List<C_ImageDTO> imageFileList = new ArrayList<C_ImageDTO>();
		
		if (fileList != null && fileList.size() != 0) {
			for (String fileName : fileList) {
				C_ImageDTO image = new C_ImageDTO();
				image.setC_image(fileName);
				imageFileList.add(image);
			}
		}
		
		
		
		HttpSession session = multipartRequest.getSession();
		User_onDTO user = (User_onDTO) session.getAttribute("user_onDTO");
		String u_email = user.getU_email();
		String u_nick = user.getU_nick();
		articleMap.put("u_email", u_email);
		articleMap.put("u_nick", u_nick); 
		articleMap.put("imageFileList", imageFileList);
		
		String message;
		ResponseEntity<String> resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");
		
		try {
			int articleNo = communityService.addNewarticle(articleMap);
			
			
			
			if (fileList != null && fileList.size() != 0) {
				for (String fileName : fileList) {
				File srcFile = new File(VEGI_UPLOAD + "\\" + "temp" + "\\" + fileName);
				File descDir = new File(VEGI_UPLOAD + "\\" + articleNo);
				FileUtils.moveFileToDirectory(srcFile, descDir, true);
				}
			}

			message = "<script>";
			message += " alert('새 글을 추가함');";
			message += " location.href='"+multipartRequest.getContextPath()+"/community/community.do';";
			message += "</script>";
			resEnt = new ResponseEntity<String>(message, responseHeaders, HttpStatus.OK);
		} catch (Exception e) {
			if (fileList != null && fileList.size() != 0) {
				for (String fileName : fileList) {
				File srcFile = new File(VEGI_UPLOAD + "\\" + "temp" + "\\" + fileName);
				srcFile.delete();
				}
			}
			
			

			message = "<script>";
			message += " alert('오류발생함');";
			message += " location.href='"+multipartRequest.getContextPath()+"/community/articleForm.do';";
			message += "</script>";
			resEnt = new ResponseEntity<String>(message, responseHeaders, HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}

		return resEnt;
	}
	
	@Override
	@RequestMapping(value = "inquery.do", method = RequestMethod.POST)
	public ResponseEntity<String> inquery(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration<String> enu = multipartRequest.getParameterNames();
		
		while (enu.hasMoreElements()) {
			String name = enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}
		int divideNum = 2;
		List<String> fileList = uploadMulti(multipartRequest, divideNum);
		List<Iq_ImageDTO> imageFileList = new ArrayList<Iq_ImageDTO>();
		
		if (fileList != null && fileList.size() != 0) {
			for (String fileName : fileList) {
				Iq_ImageDTO image = new Iq_ImageDTO();
				image.setIq_image(fileName);
				imageFileList.add(image);
			}
		}
		
		HttpSession session = multipartRequest.getSession();
		User_onDTO user = (User_onDTO) session.getAttribute("user_onDTO");
		String u_email = user.getU_email();
		
		articleMap.put("u_email", u_email);
		
		articleMap.put("imageFileList", imageFileList);
		
		String message;
		ResponseEntity<String> resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");
		
		try {
			int iq_no = communityService.inquery(articleMap);
			
			
			
			if (fileList != null && fileList.size() != 0) {
				for (String fileName : fileList) {
				File srcFile = new File(INQUERY_UPLOAD + "\\" + "temp" + "\\" + fileName);
				File descDir = new File(INQUERY_UPLOAD + "\\" + iq_no);
				FileUtils.moveFileToDirectory(srcFile, descDir, true);
				}
			}
			
			message = "<script>";
			message += " alert('문의 작성완료');";
			message += " location.href='"+multipartRequest.getContextPath()+"/community/community.do';";
			message += "</script>";
			resEnt = new ResponseEntity<String>(message, responseHeaders, HttpStatus.OK);
		} catch (Exception e) {
			if (fileList != null && fileList.size() != 0) {
				for (String fileName : fileList) {
				File srcFile = new File(INQUERY_UPLOAD + "\\" + "temp" + "\\" + fileName);
				srcFile.delete();
				}
			}
			
			

			message = "<script>";
			message += " alert('오류발생함');";
			message += " location.href='"+multipartRequest.getContextPath()+"/community/inqueryForm.do';";
			message += "</script>";
			resEnt = new ResponseEntity<String>(message, responseHeaders, HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}

		return resEnt;
	}
	
	
	
	
	
	
	
	
	private List<String> uploadMulti(MultipartHttpServletRequest multipartRequest, int divideNum) throws Exception{
		// TODO Auto-generated method stub
		List<String> fileList = new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			fileList.add(originalFileName);
			
			if (divideNum == 1) {
				File file = new File(VEGI_UPLOAD + "\\" + fileName);

				if (mFile.getSize() != 0) {
					if (!file.exists()) {
						if (file.getParentFile().mkdirs()) {
							file.createNewFile();
						}
					}
					mFile.transferTo(new File(VEGI_UPLOAD + "\\" + "temp" + "\\" + originalFileName));
				}
			} else if (divideNum == 2) {
				File file = new File(INQUERY_UPLOAD + "\\" + fileName);

				if (mFile.getSize() != 0) {
					if (!file.exists()) {
						if (file.getParentFile().mkdirs()) {
							file.createNewFile();
						}
					}
					mFile.transferTo(new File(INQUERY_UPLOAD + "\\" + "temp" + "\\" + originalFileName));
				}
			}
			
			
			
		}
		
		return fileList;
	}

	@Override
	@ResponseBody
	@RequestMapping(value = "/scrap.do", method = RequestMethod.GET)
	public int scrap(int c_articleNo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		User_onDTO user = (User_onDTO) session.getAttribute("user_onDTO");
		String u_email = user.getU_email();
		Map<String, Object> heartMap = new HashMap<String, Object>();
		heartMap.put("u_email", u_email);
		heartMap.put("c_articleNo", c_articleNo);
		System.out.println("글번호 : " + c_articleNo);
		return communityService.scrap(heartMap);
		
		
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value = "/scrapCancel.do", method = RequestMethod.GET)
	public int scrapCancel(int c_articleNo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return communityService.scrapCancel(c_articleNo);
		
		
	}
	
	

	@Override
	@RequestMapping("/viewInquery.do")
	public ModelAndView viewInquery(int iq_no, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		
		
		
		Map<String, Object> articleMap = communityService.viewInquery(iq_no);
		
		List<Iq_ReplyDTO> list = communityService.replyInquery(iq_no);
		
		mav.addObject("articleMap", articleMap);
		mav.addObject("list", list);
		return mav;
	}

	@Override
	@RequestMapping(value = "/deleteArticle.do", method = RequestMethod.POST)
	public void deleteArticle(int c_articleNo, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String msg = null;
		String url = null;

		try {
			communityService.deleteArticle(c_articleNo);
			
			
			File file = new File(VEGI_UPLOAD + "\\" + c_articleNo);
			FileUtils.deleteDirectory(file);
			

			msg = "삭제가 완료 되었습니다.";
			url = request.getContextPath() + "/community/community.do";
			
		} catch(Exception e){
			msg = "삭제에 실패했습니다. 다시 시도하세요.";
			url = request.getContextPath() + "/board/viewArticle.do?c_articleNo="+c_articleNo;
			e.printStackTrace();
		}
		out.println("<script>");
		out.println("alert('" + msg + "');");
		out.println("location.href='" + url + "';");
		out.println("</script>");
	}

	@Override
	@RequestMapping(value = "/deleteReply.do", method = RequestMethod.POST)
	public void deleteReply(int reply_no, int c_articleNo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String msg = null;
		String url = null;

		try {
			communityService.deleteReply(reply_no);
			
			msg = "삭제가 완료 되었습니다.";
			url = request.getContextPath() + "/community/viewArticle.do?c_articleNo="+c_articleNo;
			
		} catch(Exception e){
			msg = "삭제에 실패했습니다. 다시 시도하세요.";
			url = request.getContextPath() + "/board/viewArticle.do?c_articleNo="+c_articleNo;
			e.printStackTrace();
		}
		out.println("<script>");
		out.println("alert('" + msg + "');");
		out.println("location.href='" + url + "';");
		out.println("</script>");
		
	}

	@Override
	@RequestMapping("/eventUpdate.do")
	public void eventUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<EventDTO> eventList = communityService.eventDate();
		
		for (EventDTO event : eventList) {
			int e_no = event.getE_no();
			String e_title = event.getE_title();
			Map<String, Object> eventMap = new HashMap<String, Object>();
			eventMap.put("e_no", e_no);
			eventMap.put("e_title", e_title);
			
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
			LocalDate date = LocalDate.parse(event.getE_end(), formatter);
			LocalDate today = LocalDate.now();
			
			if (today.isAfter(date)) {
				communityService.eventUpdate(eventMap);
			}
			
		}
		
	}

	@Override
	@RequestMapping("/viewEvent.do")
	public ModelAndView viewEvent(int e_no, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		Map<String, Object> articleMap = communityService.viewEvent(e_no);
		
		mav.addObject("articleMap", articleMap);
		
		return mav;
	}

	@Override
	@RequestMapping("/recipeMore.do")
	public ModelAndView recipeMore(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		Map<String, Object> articleMap = communityService.recipeMore();
		mav.addObject("articleMap", articleMap);
		return mav;
	}

	@Override
	@RequestMapping("/veganLifeMore")
	public ModelAndView veganLifeMore(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		
		Map<String, Object> articleMap = communityService.veganLifeMore();
		mav.addObject("articleMap", articleMap);
		return mav;
	}

	@Override
	@ResponseBody
	@RequestMapping("/changeFilter.do")
	public List<CommunityDTO> changeFilter(String search_type, Model model) throws Exception {
		CommunityDTO com = new CommunityDTO();
		com.setSearch_type(search_type);
		
		if (com.getSearch_type().equals("write")) {
			return communityService.writeFilter();
		} else if (com.getSearch_type().equals("views")) {
			return communityService.viewsFilter();
		} else if (com.getSearch_type().equals("scraps")) {
			return communityService.scrapsFilter();
		} else if (com.getSearch_type().equals("hearts")) {
			return communityService.heartsFilter();
		} else if (com.getSearch_type().equals("reply_cnt")) {
			return communityService.reply_cntFilter();
		}
		
		return null;
	}
	
	@Override
	@ResponseBody
	@RequestMapping("/changeFilter2.do")
	public List<CommunityDTO> changeFilter2(String search_type, Model model) throws Exception {
		CommunityDTO com = new CommunityDTO();
		com.setSearch_type(search_type);
		
		if (com.getSearch_type().equals("write")) {
			return communityService.writeFilter2();
		} else if (com.getSearch_type().equals("views")) {
			return communityService.viewsFilter2();
		} else if (com.getSearch_type().equals("scraps")) {
			return communityService.scrapsFilter2();
		} else if (com.getSearch_type().equals("hearts")) {
			return communityService.heartsFilter2();
		} else if (com.getSearch_type().equals("reply_cnt")) {
			return communityService.reply_cntFilter2();
		}
		
		return null;
	}

	@Override
	@ResponseBody
	@RequestMapping("/heart.do")
	public int heart(int c_articleNo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		User_onDTO user = (User_onDTO) session.getAttribute("user_onDTO");
		String u_email = user.getU_email();
		
		Map<String, Object> heartMap = new HashMap<String, Object>();
		heartMap.put("u_email", u_email);
		heartMap.put("c_articleNo", c_articleNo);
		System.out.println("글번호 : " + c_articleNo);
		
		
		return communityService.heart(heartMap);
	}

	@Override
	@ResponseBody
	@RequestMapping("/heartCancel.do")
	public int heartCancel(int c_articleNo, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		
		return communityService.heartCancel(c_articleNo);
	}

	@Override
	@RequestMapping(value = "/modArticle.do", method = RequestMethod.POST)
	public String modArticle(int c_articleNo, String c_title, String c_content, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		Map<String, Object> articleMap = new HashMap<String, Object>();
		articleMap.put("c_articleNo", c_articleNo);
		articleMap.put("c_title", c_title);
		articleMap.put("c_content", c_content);
		
		communityService.modArticle(articleMap);
		
		
		return "redirect:/community/viewArticle.do?c_articleNo=" + c_articleNo;
	}

	

	

	

	
	
	
	
	
	
	
	
	

	
}
