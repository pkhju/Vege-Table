package com.spring.vegan.resto.service;

import java.util.List;
import java.util.Map;

import com.spring.vegan.resto.dto.RestoDTO;
import com.spring.vegan.resto.dto.Resto_ImageDTO;
import com.spring.vegan.resto.dto.ReviewDTO;

public interface RestoService {
	public List<RestoDTO> selectRestoList();
	public RestoDTO restoDetail(int resto_no);
	public void modResto(Map<String, Object> restoMap);
	public RestoDTO restoInfo(int resto_no);
	public int addResto(Map<String, Object> restoMap);
	public int selectNewResto_no();
	public void resto_image(Map<String, Object> restoMap);
	public List<ReviewDTO> selectReview(int resto_no);
	public void addReview(Map<String, Object> reviewMap);
	public void review_image(Map<String, Object> reviewMap);
	public int count();
	public List<Resto_ImageDTO> selectImage(int resto_no);
	public void removeReview(int review_no);
	public void showReview(int review_no);
	public void hideReview(int review_no);
	public void modReview(Map<String, Object> reviewMap);
	public List<String> selectOriginalFileName(int resto_no);
	public String getReviewImageFileName(int review_no);
	public void maintainVegan(Map<String, Object> restoMap);
	public String avg_rate(RestoDTO resto);
	public void setAvg_rate(RestoDTO resto);
	public void removeImage(String imageFileNo);
	public String getImageFileName(String imageFileNo);
	public String getMainImage(int resto_no);
	public void updateMainImage(Map<String, Object> imageName);
	public void addNewImage(Map<String, Object> restoMap);
	public void nullImage(int resto_no);
	public String mainImage(int resto_no);
	public List<RestoDTO> searchResto(RestoDTO restoDTO);
	public String startTime(int resto_no);
	public String endTime(int resto_no);
	public String breakStart(int resto_no);
	public String breakEnd(int resto_no);
	public ReviewDTO getReview(int review_no);
	public Boolean restoExist(String c_email);
}
