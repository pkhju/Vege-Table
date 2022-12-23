package com.spring.vegan.resto.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.vegan.resto.dto.Resto_ImageDTO;
import com.spring.vegan.resto.dto.RestoDTO;
import com.spring.vegan.resto.dto.ReviewDTO;

@Repository
public class RestoDAOImpl implements RestoDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<RestoDTO> selectRestoList() {
		// TODO Auto-generated method stub
		List<RestoDTO> restoList = sqlSession.selectList("mapper.resto.selectRestoList");
		return restoList;
	}

	@Override
	public RestoDTO restoDetail(int resto_no) {
		// TODO Auto-generated method stub
		RestoDTO resto = sqlSession.selectOne("mapper.resto.restoDetail", resto_no);
		return resto;
	}

	@Override
	public void modResto(Map<String, Object> restoMap) {
		// TODO Auto-generated method stub
		sqlSession.update("mapper.resto.modResto", restoMap);
	}

	@Override
	public RestoDTO restInfo(int resto_no) {
		// TODO Auto-generated method stub
		RestoDTO resto = sqlSession.selectOne("mapper.resto.restoInfo", resto_no);
		return resto;
	}

	@Override
	public int addNewResto(Map<String, Object> restoMap) {
		// TODO Auto-generated method stub
		int resto_no = selectNewResto_no();
		restoMap.put("resto_no", resto_no);
		sqlSession.insert("mapper.resto.addNewResto", restoMap);
		insertNewImage(restoMap);
		return resto_no;
	}

	private void insertNewImage(Map<String, Object> restoMap) {
		// TODO Auto-generated method stub
		List<Resto_ImageDTO> imageFileList = (List<Resto_ImageDTO>) restoMap.get("imageFileList");
		if(imageFileList != null) {
			Integer resto_no = (Integer) restoMap.get("resto_no");
			int imageFileNo = 1;

			for(Resto_ImageDTO image : imageFileList) {
				image.setImageFileNo(resto_no + "_" + imageFileNo++);
				image.setResto_no(resto_no);
			}
			sqlSession.insert("mapper.resto.insertNewImage", imageFileList);
		}
	}

	public int selectNewResto_no() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.resto.selectNewResto_no");
	}

	@Override
	public void resto_image(Map<String, Object> restoMap) {
		// TODO Auto-generated method stub
		sqlSession.update("mapper.resto.resto_image", restoMap);
	}

	@Override
	public List<ReviewDTO> selectReview(int resto_no) {
		// TODO Auto-generated method stub
		List<ReviewDTO> reviewList = sqlSession.selectList("mapper.resto.selectReviewList", resto_no);
		return reviewList;
	}

	@Override
	public void addNewReview(Map<String, Object> reviewMap) {
		// TODO Auto-generated method stub
		sqlSession.insert("mapper.resto.addNewReview", reviewMap);
	}

	@Override
	public void review_image(Map<String, Object> reviewMap) {
		// TODO Auto-generated method stub
		sqlSession.update("mapper.resto.review_image", reviewMap);
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.resto.count");
	}

	@Override
	public List<Resto_ImageDTO> selectImage(int resto_no) {
		// TODO Auto-generated method stub
		List<Resto_ImageDTO> resto_imageList = sqlSession.selectList("mapper.resto.selectImageList", resto_no);
		return resto_imageList;
	}

	@Override
	public void removeReview(int review_no) {
		// TODO Auto-generated method stub
		sqlSession.update("mapper.resto.removeReview", review_no);
	}

	@Override
	public void showReview(int review_no) {
		// TODO Auto-generated method stub
		sqlSession.update("mapper.resto.showReview", review_no);
	}

	@Override
	public void hideReview(int review_no) {
		// TODO Auto-generated method stub
		sqlSession.update("mapper.resto.hideReview", review_no);
	}

	@Override
	public void modReview(Map<String, Object> reviewMap) {
		// TODO Auto-generated method stub
		sqlSession.update("mapper.resto.modReview", reviewMap);
	}

	@Override
	public List<String> selectOriginalFileName(int resto_no) {
		// TODO Auto-generated method stub
		List<String> originalFileName = sqlSession.selectList("mapper.resto.selectOriginalFileName", resto_no);
		return originalFileName;
	}

	@Override
	public String getReviewImageFileName(int review_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.resto.getReviewImageFileName", review_no);
	}

	@Override
	public void maintainVegan(Map<String, Object> restoMap) {
		// TODO Auto-generated method stub
		sqlSession.update("mapper.resto.maintainVegan", restoMap);
	}

	@Override
	public String avg_rate(RestoDTO resto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.resto.avg_rate", resto);
	}

	@Override
	public void setAvg_rate(RestoDTO resto) {
		// TODO Auto-generated method stub
		sqlSession.update("mapper.resto.setAvg_rate", resto);
	}

	@Override
	public void removeImage(String imageFileNo) {
		// TODO Auto-generated method stub
		sqlSession.delete("mapper.resto.removeImage", imageFileNo);
	}

	@Override
	public String getImageFileName(String imageFileNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.resto.getImageFileName", imageFileNo);
	}

	@Override
	public String getMainImage(int resto_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.resto.getMainImage", resto_no);
	}

	@Override
	public void updateMainImage(Map<String, Object> imageName) {
		// TODO Auto-generated method stub
		sqlSession.update("mapper.resto.updateMainImage", imageName);
	}

	@Override
	public void addNewImage(Map<String, Object> restoMap) {
		// TODO Auto-generated method stub
		List<Resto_ImageDTO> imageFileList = (List<Resto_ImageDTO>) restoMap.get("imageFileList");
		if(imageFileList != null) {
			Integer resto_no = (Integer) restoMap.get("resto_no");
			if(sqlSession.selectOne("mapper.resto.imageFileNo", resto_no) == null) {
				int imageFileNo = 1;
				for(Resto_ImageDTO image : imageFileList) {
					image.setImageFileNo(resto_no + "_" + (imageFileNo++));
					image.setResto_no(resto_no);
				}
			} else {
				int imageFileNo = sqlSession.selectOne("mapper.resto.imageFileNo", resto_no);
				for(Resto_ImageDTO image : imageFileList) {
					image.setImageFileNo(resto_no + "_" + ((imageFileNo++)+1));
					image.setResto_no(resto_no);
				}
			}
			sqlSession.insert("mapper.resto.addNewImage", imageFileList);
		}
	}

	@Override
	public void nullImage(int resto_no) {
		// TODO Auto-generated method stub
		sqlSession.update("mapper.resto.nullImage", resto_no);
	}

	@Override
	public String mainImage(int resto_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.resto.mainImage", resto_no);
	}

	@Override
	public List<RestoDTO> searchResto(RestoDTO restoDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.resto.searchResto", restoDTO);
	}

	@Override
	public String startTime(int resto_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.resto.startTime", resto_no);
	}

	@Override
	public String endTime(int resto_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.resto.endTime", resto_no);
	}

	@Override
	public String breakStart(int resto_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.resto.breakStart", resto_no);
	}

	@Override
	public String breakEnd(int resto_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.resto.breakEnd", resto_no);
	}

	@Override
	public ReviewDTO getReview(int review_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.resto.getReview", review_no);
	}

	@Override
	public Boolean restoExist(String c_email) {
		// TODO Auto-generated method stub
		RestoDTO dto = sqlSession.selectOne("mapper.resto.restoExist", c_email);
		if(dto == null) {
			return false;
		}
		return true; 
	}
}