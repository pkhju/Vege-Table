package com.spring.vegan.resto.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.vegan.member.dto.Client_onDTO;
import com.spring.vegan.member.dto.User_onDTO;
import com.spring.vegan.resto.dto.RestoDTO;
import com.spring.vegan.resto.dto.Resto_ImageDTO;
import com.spring.vegan.resto.dto.ReviewDTO;
import com.spring.vegan.resto.service.RestoService;

@Controller
public class RestoControllerImpl implements RestoController{
	private static final String RESTO_IMAGE_REPO = "C:\\Users\\UserF\\Desktop\\YSH\\Vegan_Image\\Resto_Image";
	private static final String REVIEW_IMAGE_REPO = "C:\\Users\\UserF\\Desktop\\YSH\\Vegan_Image\\Review_Image";
	@Autowired
	RestoService restoService;

	@Override
	@RequestMapping(value="/resto/*Form.do", method=RequestMethod.GET)
	public ModelAndView restoForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);	
		return mav;
	}
	
	@Override
	@RequestMapping(value="/resto/addReviewForm.do", method=RequestMethod.GET)
	public ModelAndView addReviewForm(@RequestParam("resto_no") int resto_no, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		String viewName = (String) request.getAttribute("viewName");
		
		HttpSession session = request.getSession();
		User_onDTO user_on = (User_onDTO) session.getAttribute("user_onDTO");
		String nickName = user_on.getU_nick();

		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("resto_no", resto_no);
		mav.addObject("nickName", nickName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/resto/modReviewForm.do", method=RequestMethod.GET)
	public ModelAndView modReviewForm(@RequestParam("resto_no") int resto_no, @RequestParam("review_no") int review_no, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		String viewName = (String) request.getAttribute("viewName");
		ReviewDTO reviewDTO = restoService.getReview(review_no);

		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("review_no", review_no);	
		mav.addObject("review", reviewDTO);
		mav.addObject("resto_no", resto_no);
		return mav;
	}

	@Override
	@RequestMapping(value="/resto/addRestoForm.do", method=RequestMethod.GET)
	public ModelAndView addRestoForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session = request.getSession();
		Client_onDTO client_on = (Client_onDTO) session.getAttribute("client_onDTO");
		String c_email = client_on.getC_email();

		int resto_no = restoService.selectNewResto_no();
		mav.addObject("resto_no", resto_no);
		mav.addObject("c_email", c_email);
		return mav;
	}

	@Override
	@RequestMapping(value="/resto/restoList.do", method=RequestMethod.GET)
	public ModelAndView restoList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// TODO Auto-generated method stub
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		List<RestoDTO> restoList = restoService.selectRestoList();
		mav.addObject("restoList", restoList);			
		return mav;
	}
	
	@Override
	@RequestMapping(value="/resto/searchResto.do", method=RequestMethod.GET)
	public String searchResto(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String keyword = request.getParameter("keyword");
		
		RestoDTO restoDTO = new RestoDTO();
		restoDTO.setKeyword(keyword);
		
		List<RestoDTO> restoList = restoService.searchResto(restoDTO);
		model.addAttribute("restoList", restoList);
		
		return "/resto/restoList";
	}
	
	@Override
	@RequestMapping(value="/resto/restoDetail.do", method=RequestMethod.GET)
	public ModelAndView restoDetail(@RequestParam("resto_no") int resto_no, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String viewName = (String) request.getAttribute("viewName"); 
		ModelAndView mav = new ModelAndView(viewName);

		List<ReviewDTO> reviewList = restoService.selectReview(resto_no);
		List<Resto_ImageDTO> resto_imageList = restoService.selectImage(resto_no);
		RestoDTO resto = restoService.restoDetail(resto_no);
		String rate = restoService.avg_rate(resto);
		if(rate == null) {
			rate = "0";
		}
		double avg_rate = Double.parseDouble(rate);
		resto.setAvg_rate(avg_rate);
		restoService.setAvg_rate(resto);
		resto = restoService.restoDetail(resto_no);
		String startTime = restoService.startTime(resto_no);
		int start = Integer.parseInt(startTime);
		String endTime = restoService.endTime(resto_no);
		int end = Integer.parseInt(endTime);
		String breakStart = restoService.breakStart(resto_no);
		int startBreak = Integer.parseInt(breakStart);
		String breakEnd = restoService.breakEnd(resto_no);
		int endBreak = Integer.parseInt(breakEnd);
		
		mav.addObject("resto", resto);
		mav.addObject("reviewList", reviewList);
		mav.addObject("resto_imageList", resto_imageList);
		mav.addObject("start", start);
		mav.addObject("end", end);
		mav.addObject("startBreak", startBreak);
		mav.addObject("endBreak", endBreak);
		return mav;
	}

	@Override
	@RequestMapping(value="/resto/modRestoForm.do", method=RequestMethod.GET)
	public ModelAndView modRestoForm(@RequestParam("resto_no") int resto_no, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		String viewName = (String) request.getAttribute("viewName");
		List<Resto_ImageDTO> resto_imageList = restoService.selectImage(resto_no);

		ModelAndView mav = new ModelAndView(viewName);
		RestoDTO resto = restoService.restoInfo(resto_no);
		mav.addObject("resto", resto);
		mav.addObject("resto_imageList", resto_imageList);
		return mav;
	}

	@Override
	@RequestMapping(value="/resto/modResto.do", method=RequestMethod.POST)
	public ResponseEntity<String> modResto(@ModelAttribute("resto") RestoDTO resto, MultipartHttpServletRequest multipartRequest, 
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> restoMap = new HashMap<String, Object>();
		Enumeration<String> enu = multipartRequest.getParameterNames();
		List<String> originalFileName = restoService.selectOriginalFileName(resto.getResto_no());

		while(enu.hasMoreElements()) {
			String name = enu.nextElement();
			String value = multipartRequest.getParameter(name);
			restoMap.put(name, value);
		}

		List<String> fileList = updateRestoImage(multipartRequest);
		if(!(fileList.isEmpty())) {
			List<Resto_ImageDTO> imageFileList = new ArrayList<Resto_ImageDTO>();
			if(fileList != null && fileList.size() != 0) {
				for(String fileName : fileList) {
					Resto_ImageDTO image = new Resto_ImageDTO();
					image.setImageFileName(fileName);
					imageFileList.add(image);
				}
			}
			restoMap.put("imageFileName", fileList.get(0));
			restoMap.put("imageFileList", imageFileList);
		}
		restoMap.put("resto_no", resto.getResto_no());

		HttpSession session = multipartRequest.getSession();
		Client_onDTO client_on = (Client_onDTO) session.getAttribute("client_onDTO");
		
		String c_email = client_on.getC_email();
		restoMap.put("c_email", c_email);

		String message;
		ResponseEntity<String> resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");

		try {
			if(restoMap.get("vegan") == null || restoMap.get("vegan").equals("")) {
				restoService.maintainVegan(restoMap);
			} else {
				restoService.modResto(restoMap);
			}
			restoService.addNewImage(restoMap);
			
			List<Resto_ImageDTO> imageDTO = restoService.selectImage(resto.getResto_no());
			String mainImage = restoService.mainImage(resto.getResto_no());
			if(!imageDTO.isEmpty() && mainImage == null) {
				restoService.resto_image(restoMap);
			}

			if(fileList != null && fileList.size() != 0) {
				for(String fileName : fileList) {
					File srcFile = new File(RESTO_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);
					File destDir = new File(RESTO_IMAGE_REPO + "\\" + resto.getResto_no());
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}

			message = "<script>";
			message += "alert('식당정보 수정이 완료되었습니다.');";
			message += "location.href='" + multipartRequest.getContextPath() +"/resto/restoDetail.do?resto_no="+resto.getResto_no()+"';";
			message += "</script>";
			resEnt = new ResponseEntity<String>(message, responseHeaders, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			if(fileList != null && fileList.size() != 0) {
				for(String fileName : fileList) {
					File srcFile = new File(RESTO_IMAGE_REPO + "\\" + fileName);
					srcFile.delete();
				}
			}
			message = "<script>";
			message += "alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += "location.href='" + multipartRequest.getContextPath() +"/resto/restoDetail.do?resto_no="+resto.getResto_no()+"';";
			message += "</script>";
			resEnt = new ResponseEntity<String>(message, responseHeaders, HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return resEnt;
	}

	private List<String> updateRestoImage(MultipartHttpServletRequest multipartRequest) throws Exception{
		// TODO Auto-generated method stub
		List<String> fileList = new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();

		Date date = new Date();
		SimpleDateFormat simpl = new SimpleDateFormat("yyMMdd;HHmmss");
		String time = simpl.format(date);
		
		while(fileNames.hasNext()) {
			String fileName= fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			if(mFile.getOriginalFilename().equals("") || mFile.getOriginalFilename() == null) {
				return null;
			}
			String originalFileName = mFile.getOriginalFilename();
			String imageFileName = time + "_" + originalFileName; 
			fileList.add(imageFileName);

			File file = new File(RESTO_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);
			if(mFile.getSize() != 0) {
				if(!file.exists()) {
					if(file.getParentFile().mkdirs()) {
						file.createNewFile();
					}
				}

				mFile.transferTo(new File(RESTO_IMAGE_REPO + "\\" + "temp" + "\\"  + imageFileName));
			}
		}
		return fileList;
	}

	@Override
	@RequestMapping(value="/resto/addResto.do", method= RequestMethod.POST)
	public ResponseEntity<String> addResto(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> restoMap = new HashMap<String, Object>();
		Enumeration<String> enu = multipartRequest.getParameterNames();

		while(enu.hasMoreElements()) {
			String name = enu.nextElement();
			String value = multipartRequest.getParameter(name);
			restoMap.put(name, value);
		}

		List<String> fileList = uploadRestoImage(multipartRequest);
		if(!(fileList.isEmpty())) {
			List<Resto_ImageDTO> imageFileList = new ArrayList<Resto_ImageDTO>();
			if(fileList != null && fileList.size() != 0) {
				for(String fileName : fileList) {
					Resto_ImageDTO image = new Resto_ImageDTO();
					image.setImageFileName(fileName);
					imageFileList.add(image);
				}
			}
			restoMap.put("imageFileName", fileList.get(0));
			restoMap.put("imageFileList", imageFileList);
		}

		HttpSession session = multipartRequest.getSession();
		Client_onDTO client_on = (Client_onDTO) session.getAttribute("client_onDTO");

		String c_email = client_on.getC_email();
		restoMap.put("c_email", c_email);

		String message;
		ResponseEntity<String> resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");

		try {
			int resto_no = restoService.addResto(restoMap);
			restoService.resto_image(restoMap);

			message = "<script>";
			message += "alert('식당등록이 완료되었습니다.');";
			message += "location.href='" + multipartRequest.getContextPath() +"/resto/restoList.do';";
			message += "</script>";
			resEnt = new ResponseEntity<String>(message, responseHeaders, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			if(fileList != null && fileList.size() != 0) {
				for(String fileName : fileList) {
					File srcFile = new File(RESTO_IMAGE_REPO + "\\" + fileName);
					srcFile.delete();
				}
			}
			message = "<script>";
			message += "alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += "location.href='" + multipartRequest.getContextPath() +"/resto/addRestoForm.do';";
			message += "</script>";
			resEnt = new ResponseEntity<String>(message, responseHeaders, HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return resEnt;
	}

	private List<String> uploadRestoImage(MultipartHttpServletRequest multipartRequest) throws Exception{
		// TODO Auto-generated method stub
		List<String> fileList = new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		int resto_no = restoService.selectNewResto_no();

		Date date = new Date();
		SimpleDateFormat simpl = new SimpleDateFormat("yyMMdd;HHmmss");
		String time = simpl.format(date);
		
		while(fileNames.hasNext()) {
			String fileName= fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			if(mFile.getOriginalFilename().equals("") || mFile.getOriginalFilename() == null) {
				return null;
			}
			String originalFileName = mFile.getOriginalFilename();
			String imageFileName = time + "_" + originalFileName; 
			fileList.add(imageFileName);
			File file = new File(RESTO_IMAGE_REPO + "\\" + resto_no + "\\" + fileName);
			if(mFile.getSize() != 0) {
				if(!file.exists()) {
					if(file.getParentFile().mkdirs()) {
						file.createNewFile();
					}
				}

				mFile.transferTo(new File(RESTO_IMAGE_REPO + "\\" + resto_no + "\\"  + imageFileName));
			}
		}
		return fileList;
	}

	@Override
	@RequestMapping(value="/resto/addReview.do", method= RequestMethod.POST)
	public ResponseEntity<String> addReview(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> reviewMap = new HashMap<String, Object>();
		Enumeration<String> enu = multipartRequest.getParameterNames();

		while(enu.hasMoreElements()) {
			String name = enu.nextElement();
			String value = multipartRequest.getParameter(name);				
			reviewMap.put(name, value);
		}

		String imageFileName = uploadReviewImage(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		User_onDTO user_on = (User_onDTO) session.getAttribute("user_onDTO");
		int review_no = restoService.count();

		String u_nick = user_on.getU_nick();
		reviewMap.put("u_nick", u_nick);
		
		reviewMap.put("imageFileName", imageFileName);
		reviewMap.put("review_no", review_no+1);

		String message;
		ResponseEntity<String> resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");

		try {
			restoService.addReview(reviewMap);
			if(reviewMap.isEmpty()) {
				restoService.review_image(reviewMap);
			}

			if(!(imageFileName == null)) {
				File srcFile = new File(REVIEW_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
				File destDir = new File(REVIEW_IMAGE_REPO + "\\" + reviewMap.get("resto_no"));
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}

			message = "<script>";
			message += "alert('리뷰 등록이 완료되었습니다.');";
			message += "opener.location.href='" + multipartRequest.getContextPath() +"/resto/restoDetail.do?resto_no="+reviewMap.get("resto_no") + "';";
			message += "window.close()";
			message += "</script>";
			resEnt = new ResponseEntity<String>(message, responseHeaders, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			File srcFile = new File(REVIEW_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
			srcFile.delete();

			message = "<script>";
			message += "alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += "location.href='" + multipartRequest.getContextPath() +"/resto/addReviewForm.do?resto_no="+reviewMap.get("resto_no") + "';";
			message += "</script>";

			resEnt = new ResponseEntity<String>(message, responseHeaders, HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return resEnt;
	}

	private String uploadReviewImage(MultipartHttpServletRequest multipartRequest) throws Exception{
		// TODO Auto-generated method stub
		String imageFileName = null;
		Map<String, String> reviewMap = new HashMap<String, String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();

		Date date = new Date();
		SimpleDateFormat simpl = new SimpleDateFormat("yyMMdd;HHmmss");
		String time = simpl.format(date);

		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			if(mFile.getOriginalFilename().equals("") || mFile.getOriginalFilename() == null) {
				return null;
			}
			imageFileName = time + "_" + mFile.getOriginalFilename();
			File file = new File(REVIEW_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);
			if(mFile.getSize() != 0) {
				if(!file.exists()) {
					if(file.getParentFile().mkdirs()) {
						file.createNewFile();
					}
				}
				mFile.transferTo(new File(REVIEW_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName));
			}
		}
		return imageFileName;
	}

	@Override
	@RequestMapping(value="/resto/removeReview.do", method=RequestMethod.POST)
	public void removeReview(int resto_no, int review_no, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String msg = null;
		String url = null;

		try {
			restoService.removeReview(review_no);

			msg = "삭제가 완료 되었습니다.";
			url = request.getContextPath() + "/resto/restoDetail.do?resto_no="+resto_no;

		} catch(Exception e){
			msg = "삭제에 실패했습니다. 다시 시도하세요.";
			url = request.getContextPath() + "/resto/restoDetail.do?resto_no="+resto_no;
			e.printStackTrace();
		}
		out.println("<script>");
		out.println("alert('" + msg + "');");
		out.println("location.href='" + url + "';");
		out.println("</script>");
	}

	@Override
	@RequestMapping(value="/resto/showReview.do", method=RequestMethod.POST)
	public void showReview(int resto_no, int review_no, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String msg = null;
		String url = null;

		try {
			restoService.showReview(review_no);

			msg = "리뷰를 보이게 하셨습니다.";
			url = request.getContextPath() + "/resto/restoDetail.do?resto_no="+resto_no;

		} catch(Exception e){
			msg = "다시 시도하세요.";
			url = request.getContextPath() + "/resto/restoDetail.do?resto_no="+resto_no;
			e.printStackTrace();
		}
		out.println("<script>");
		out.println("alert('" + msg + "');");
		out.println("location.href='" + url + "';");
		out.println("</script>");
	}

	@Override
	@RequestMapping(value="/resto/hideReview.do", method=RequestMethod.POST)
	public void hideReview(int resto_no, int review_no, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String msg = null;
		String url = null;

		try {
			restoService.hideReview(review_no);

			msg = "리뷰를 숨기셨습니다.";
			url = request.getContextPath() + "/resto/restoDetail.do?resto_no="+resto_no;

		} catch(Exception e){
			msg = "다시 시도하세요.";
			url = request.getContextPath() + "/resto/restoDetail.do?resto_no="+resto_no;
			e.printStackTrace();
		}
		out.println("<script>");
		out.println("alert('" + msg + "');");
		out.println("location.href='" + url + "';");
		out.println("</script>");
	}

	@Override
	@RequestMapping(value="/resto/modReview.do", method=RequestMethod.POST)
	public ResponseEntity<String> modReview(@RequestParam("resto_no") int resto_no, @RequestParam("review_no") int review_no,
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String originalFileName = restoService.getReviewImageFileName(review_no);
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> reviewMap = new HashMap<String, Object>();
		Enumeration<String> enu = multipartRequest.getParameterNames();

		while(enu.hasMoreElements()) {
			String name = enu.nextElement();
			String value = multipartRequest.getParameter(name);				
			reviewMap.put(name, value);
		}
		String imageFileName = uploadReviewImage(multipartRequest);
		HttpSession session = multipartRequest.getSession();
//		User_onDTO user_on = (User_onDTO) session.getAttribute("user_onDTO");
//
//		String u_nick = user_on.getU_nick();
//		reviewMap.put("u_nick", u_nick);
		
		if(imageFileName == null || imageFileName.equals("")) {
			reviewMap.put("imageFileName", originalFileName);
		} else {
			reviewMap.put("imageFileName", imageFileName);
		}

		String message;
		ResponseEntity<String> resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");	

		try {
			restoService.modReview(reviewMap);

			if(!(imageFileName == null)) {
				File srcFile = new File(REVIEW_IMAGE_REPO + "\\" + resto_no + "\\" + originalFileName);
				srcFile.delete();
				srcFile = new File(REVIEW_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
				File destDir = new File(REVIEW_IMAGE_REPO + "\\" + resto_no);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}

			message = "<script>";
			message += "alert('리뷰 수정이 완료되었습니다.');";
			message += "opener.location.href='" + multipartRequest.getContextPath() +"/resto/restoDetail.do?resto_no="+reviewMap.get("resto_no") + "';";
			message += "window.close()";
			message += "</script>";
			resEnt = new ResponseEntity<String>(message, responseHeaders, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			File srcFile = new File(REVIEW_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
			srcFile.delete();

			message = "<script>";
			message += "alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += "location.href='" + multipartRequest.getContextPath() +"/resto/modReviewForm.do?resto_no="+reviewMap.get("resto_no") + "&review_no="+review_no +"';";
			message += "</script>";

			resEnt = new ResponseEntity<String>(message, responseHeaders, HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return resEnt;
	}

	@Override
	@RequestMapping(value="/resto/removeImage.do", method=RequestMethod.POST)
	public void removeImage(@RequestParam("resto_no") int resto_no, @RequestParam("imageFileNo") String imageFileNo, 
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String msg = null;
		String url = null;

		try {
			String imageFileName = restoService.getImageFileName(imageFileNo);
			restoService.removeImage(imageFileNo);
			String mainImage = restoService.getMainImage(resto_no);

			File srcFile = new File(RESTO_IMAGE_REPO + "\\" + resto_no + "\\" + imageFileName);
			srcFile.delete();

			List<Resto_ImageDTO> imageDTO = restoService.selectImage(resto_no);
			if(imageDTO.isEmpty()) {
				restoService.nullImage(resto_no);
			}

			if(imageFileName != mainImage && !imageDTO.isEmpty()) {	
				Map<String, Object> imageName = new HashMap<String, Object>();
				imageName.put("imageFileName", mainImage);
				imageName.put("resto_no", resto_no);
				restoService.updateMainImage(imageName);
			}

			msg = "이미지를 삭제하셨습니다.";
			url = multipartRequest.getContextPath() + "/resto/modRestoForm.do?resto_no="+resto_no;
		} catch (Exception e) {
			// TODO: handle exception
			msg = "다시 시도하세요.";
			url = multipartRequest.getContextPath() + "/resto/modRestoForm.do?resto_no="+resto_no;
			e.printStackTrace();
		}
		out.println("<script>");
		out.println("alert('" + msg + "');");
		out.println("location.href='" + url + "';");
		out.println("</script>");
	}
}