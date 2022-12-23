package com.spring.vegan.resto.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.vegan.resto.dao.RestoDAO;
import com.spring.vegan.resto.dto.Resto_ImageDTO;
import com.spring.vegan.resto.dto.RestoDTO;
import com.spring.vegan.resto.dto.ReviewDTO;

@Service
public class RestoServiceImpl implements RestoService{
	@Autowired
	RestoDAO restoDAO;

	@Override
	public List<RestoDTO> selectRestoList() {
		// TODO Auto-generated method stub
		List<RestoDTO> restoList = restoDAO.selectRestoList();
		return restoList;
	}

	@Override
	public RestoDTO restoDetail(int resto_no) {
		// TODO Auto-generated method stub
		return restoDAO.restoDetail(resto_no);
	}

	@Override
	public void modResto(Map<String, Object> restoMap) {
		// TODO Auto-generated method stub
		restoDAO.modResto(restoMap);
	}

	@Override
	public RestoDTO restoInfo(int resto_no) {
		// TODO Auto-generated method stub
		return restoDAO.restInfo(resto_no);
	}

	@Override
	public int addResto(Map<String, Object> restoMap) {
		// TODO Auto-generated method stub
		return restoDAO.addNewResto(restoMap);
	}

	@Override
	public int selectNewResto_no() {
		// TODO Auto-generated method stub
		return restoDAO.selectNewResto_no();
	}

	@Override
	public void resto_image(Map<String, Object> restoMap) {
		// TODO Auto-generated method stub
		restoDAO.resto_image(restoMap);
	}

	@Override
	public List<ReviewDTO> selectReview(int resto_no) {
		// TODO Auto-generated method stub
		List<ReviewDTO> reviewList = restoDAO.selectReview(resto_no);
		return reviewList;
	}

	@Override
	public void addReview(Map<String, Object> reviewMap) {
		// TODO Auto-generated method stub
		restoDAO.addNewReview(reviewMap);
	}

	@Override
	public void review_image(Map<String, Object> reviewMap) {
		// TODO Auto-generated method stub
		restoDAO.review_image(reviewMap);
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return restoDAO.count();
	}

	@Override
	public List<Resto_ImageDTO> selectImage(int resto_no) {
		// TODO Auto-generated method stub
		List<Resto_ImageDTO> resto_imageList = restoDAO.selectImage(resto_no);
		return resto_imageList;
	}

	@Override
	public void removeReview(int review_no) {
		// TODO Auto-generated method stub
		restoDAO.removeReview(review_no);
	}

	@Override
	public void showReview(int review_no) {
		// TODO Auto-generated method stub
		restoDAO.showReview(review_no);
	}

	@Override
	public void hideReview(int review_no) {
		// TODO Auto-generated method stub
		restoDAO.hideReview(review_no);
	}

	@Override
	public void modReview(Map<String, Object> reviewMap) {
		// TODO Auto-generated method stub
		restoDAO.modReview(reviewMap);
	}

	@Override
	public List<String> selectOriginalFileName(int resto_no) {
		// TODO Auto-generated method stub
		return restoDAO.selectOriginalFileName(resto_no);
	}

	@Override
	public String getReviewImageFileName(int review_no) {
		// TODO Auto-generated method stub
		return restoDAO.getReviewImageFileName(review_no);
	}

	@Override
	public void maintainVegan(Map<String, Object> restoMap) {
		// TODO Auto-generated method stub
		restoDAO.maintainVegan(restoMap);
	}

	@Override
	public String avg_rate(RestoDTO resto) {
		// TODO Auto-generated method stub
		return restoDAO.avg_rate(resto);
	}

	@Override
	public void setAvg_rate(RestoDTO resto) {
		// TODO Auto-generated method stub
		restoDAO.setAvg_rate(resto);
	}

	@Override
	public void removeImage(String imageFileNo) {
		// TODO Auto-generated method stub
		restoDAO.removeImage(imageFileNo);
	}

	@Override
	public String getImageFileName(String imageFileNo) {
		// TODO Auto-generated method stub
		return restoDAO.getImageFileName(imageFileNo);
	}

	@Override
	public String getMainImage(int resto_no) {
		// TODO Auto-generated method stub
		return restoDAO.getMainImage(resto_no);
	}

	@Override
	public void updateMainImage(Map<String, Object> imageName) {
		// TODO Auto-generated method stub
		restoDAO.updateMainImage(imageName);
	}

	@Override
	public void addNewImage(Map<String, Object> restoMap) {
		// TODO Auto-generated method stub
		restoDAO.addNewImage(restoMap);
	}

	@Override
	public void nullImage(int resto_no) {
		// TODO Auto-generated method stub
		restoDAO.nullImage(resto_no);
	}

	@Override
	public String mainImage(int resto_no) {
		// TODO Auto-generated method stub
		return restoDAO.mainImage(resto_no);
	}

	@Override
	public List<RestoDTO> searchResto(RestoDTO restoDTO) {
		// TODO Auto-generated method stub
		return restoDAO.searchResto(restoDTO);
	}

	@Override
	public String startTime(int resto_no) {
		// TODO Auto-generated method stub
		return restoDAO.startTime(resto_no);
	}

	@Override
	public String endTime(int resto_no) {
		// TODO Auto-generated method stub
		return restoDAO.endTime(resto_no);
	}

	@Override
	public String breakStart(int resto_no) {
		// TODO Auto-generated method stub
		return restoDAO.breakStart(resto_no);
	}

	@Override
	public String breakEnd(int resto_no) {
		// TODO Auto-generated method stub
		return restoDAO.breakEnd(resto_no);
	}

	@Override
	public ReviewDTO getReview(int review_no) {
		// TODO Auto-generated method stub
		return restoDAO.getReview(review_no);
	}

	@Override
	public Boolean restoExist(String c_email) {
		// TODO Auto-generated method stub
		return restoDAO.restoExist(c_email);
	}
}
