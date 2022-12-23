package com.spring.vegan.community.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.vegan.community.dto.C_ImageDTO;
import com.spring.vegan.community.dto.Com_ScrapDTO;
import com.spring.vegan.community.dto.CommunityDTO;
import com.spring.vegan.community.dto.InqueryDTO;
import com.spring.vegan.community.dto.Iq_ImageDTO;
import com.spring.vegan.community.dto.ReplyDTO;
import com.spring.vegan.member.dto.E_ImageDTO;
import com.spring.vegan.member.dto.EventDTO;
import com.spring.vegan.member.dto.Iq_ReplyDTO;

@Repository("communityDAO")
public class CommunityDAOImpl implements CommunityDAO{
	@Autowired
	private SqlSession sqlSession;

	

	@Override
	public Map<String, Object> community() {
		RowBounds row = new RowBounds(0, 4);
		 RowBounds row2 = new RowBounds(0, 3);
		
		List<CommunityDTO> community1 = sqlSession.selectList("mapper.community.community1", null, row);
		List<CommunityDTO> community2 = sqlSession.selectList("mapper.community.community2", null, row);
		List<CommunityDTO> recipe = sqlSession.selectList("mapper.community.recipeMore");
		List<CommunityDTO> vegan = sqlSession.selectList("mapper.community.veganLifeMore");
		List<C_ImageDTO> img = sqlSession.selectList("mapper.community.img");
		
		List<EventDTO> eventBanner = sqlSession.selectList("mapper.community.eventBanner", null, row2);
		
		
		
		Map<String, Object> articleMap = new HashMap<String, Object>();
		articleMap.put("community1", community1);
		articleMap.put("community2", community2);
		articleMap.put("recipe", recipe);
		articleMap.put("vegan", vegan);
		articleMap.put("img", img);
		
		articleMap.put("eventBanner", eventBanner);
		
		return articleMap;
	}

	@Override
	public Map<String, Object> viewArticle(int c_articleNo) {
		CommunityDTO com = sqlSession.selectOne("mapper.community.viewArticle", c_articleNo);
		List<C_ImageDTO> imageFileList = sqlSession.selectList("mapper.community.selectImageFileList1", c_articleNo);
		
		List<ReplyDTO> list = sqlSession.selectList("mapper.community.commentList", c_articleNo);
		
		Map<String, Object> articleMap = new HashMap<String, Object>();
		articleMap.put("com", com);
		articleMap.put("imageFileList", imageFileList);
		articleMap.put("list", list);
		
		
		return articleMap;
	}

	@Override
	public void comment(ReplyDTO reply) {
		sqlSession.insert("mapper.community.comment", reply);
		sqlSession.update("mapper.community.commentCnt", reply);
	}

	

	@Override
	public void increaseViews(int c_articleNo) {
		sqlSession.update("mapper.community.increaseViews", c_articleNo);
		
	}

	

	@Override
	public int insertNewArticle(Map<String, Object> articleMap) {
		int c_articleNo = selectNewArticleNo();
		articleMap.put("c_articleNo", c_articleNo);
		sqlSession.insert("mapper.community.insertNewArticle", articleMap);
		insertNewImage(articleMap);
		
		return c_articleNo;
	}
	private void insertNewImage(Map<String, Object> articleMap) {
		List<C_ImageDTO> imageFileList = (List<C_ImageDTO>) articleMap.get("imageFileList");
		Integer c_articleNo = (Integer) articleMap.get("c_articleNo");
		int c_imageNo = selectNewImageFileNo();
		
		for (C_ImageDTO image : imageFileList) {
			image.setC_imageNo(++c_imageNo);
			image.setC_articleNo(c_articleNo);
		}
		sqlSession.insert("mapper.community.insertNewImage", imageFileList);
	}
	private int selectNewImageFileNo() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.community.selectNewImageFileNo");
	}
	private int selectNewArticleNo() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.community.selectNewArticleNo");
	}

	@Override
	public int inquery(Map<String, Object> articleMap) {
		int iq_no = selectNewIq_No();
		articleMap.put("iq_no", iq_no);
		sqlSession.insert("mapper.community.inquery", articleMap);
		insertNewImage2(articleMap);
		
		return iq_no;
	}
	private void insertNewImage2(Map<String, Object> articleMap) {
		List<Iq_ImageDTO> imageFileList = (List<Iq_ImageDTO>) articleMap.get("imageFileList");
		Integer iq_no = (Integer) articleMap.get("iq_no");
		int iq_imageNo = selectNewImageFileNo2();
		
		for (Iq_ImageDTO image : imageFileList) {
			image.setIq_imageNo(++iq_imageNo);
			image.setIq_no(iq_no);
		}
		sqlSession.insert("mapper.community.insertNewImage2", imageFileList);
	}
	private int selectNewImageFileNo2() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.community.selectNewImageFileNo2");
	}
	private int selectNewIq_No() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.community.selectNewIq_No");
	}

	

	@Override
	public int scrap(Map<String, Object> heartMap) {
		sqlSession.update("mapper.community.scrapPlus", heartMap);
		sqlSession.insert("mapper.community.scrap", heartMap);
		
		return sqlSession.selectOne("mapper.community.upScrapCnt", heartMap);
	}

	
	@Override
	public int scrapCancel(int c_articleNo) {
		sqlSession.update("mapper.community.scrapMinus", c_articleNo);
		sqlSession.delete("mapper.community.scrapCancel", c_articleNo);
	
		return sqlSession.selectOne("mapper.community.downScrapCnt", c_articleNo);
	}

	

	@Override
	public Map<String, Object> viewInquery(int iq_no) {
		InqueryDTO iq = sqlSession.selectOne("mapper.community.viewInquery", iq_no);
		List<Iq_ImageDTO> imageFileList = sqlSession.selectList("mapper.community.selectImageFileList2", iq_no);
		
		
		Map<String, Object> articleMap = new HashMap<String, Object>();
		articleMap.put("iq", iq);
		articleMap.put("imageFileList", imageFileList);
			
		
		return articleMap;
	}

	@Override
	public void deleteArticle(int c_articleNo) {
		sqlSession.delete("mapper.community.deleteAllComment", c_articleNo);
		sqlSession.delete("mapper.community.deleteC_image", c_articleNo);
		sqlSession.delete("mapper.community.scrapCancel", c_articleNo);
		sqlSession.delete("mapper.community.heartCancel", c_articleNo);
		sqlSession.delete("mapper.community.deleteArticle", c_articleNo);
		
	}

	@Override
	public void deleteReply(int reply_no) {
		sqlSession.delete("mapper.community.deleteReply", reply_no);
		
		
	}

	@Override
	public List<EventDTO> eventDate() {
		return sqlSession.selectList("mapper.community.eventDate");
		
	}

	@Override
	public void eventUpdate(Map<String, Object> eventMap) {
		sqlSession.update("mapper.community.eventUpdate", eventMap);
		
	}

	@Override
	public List<Iq_ReplyDTO> replyInquery(int iq_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.community.replyInquery", iq_no);
	}

	@Override
	public Map<String, Object> viewEvent(int e_no) {
		EventDTO event = sqlSession.selectOne("mapper.community.viewEvent", e_no);
		List<E_ImageDTO> imageFileList = sqlSession.selectList("mapper.community.selectImageFileList3", e_no);
		Map<String, Object> articleMap = new HashMap<String, Object>();
		articleMap.put("event", event);
		articleMap.put("imageFileList", imageFileList);
		
		return articleMap;
	}

	@Override
	public Map<String, Object> recipeMore() {
		List<CommunityDTO> recipe = sqlSession.selectList("mapper.community.recipeMore");
		List<C_ImageDTO> img = sqlSession.selectList("mapper.community.img");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		articleMap.put("recipe", recipe);
		articleMap.put("img", img);
		return articleMap;
	}

	@Override
	public List<CommunityDTO> writeFilter() {
		return sqlSession.selectList("mapper.community.writeFilter");
	}
	@Override
	public List<CommunityDTO> viewsFilter() {
		return sqlSession.selectList("mapper.community.viewsFilter");
	}
	@Override
	public List<CommunityDTO> scrapsFilter() {
		return sqlSession.selectList("mapper.community.scrapsFilter");
	}
	@Override
	public List<CommunityDTO> heartFilter() {
		return sqlSession.selectList("mapper.community.heartFilter");
	}
	@Override
	public List<CommunityDTO> reply_cntFilter() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.community.reply_cntFilter");
	}
	
	
	@Override
	public List<CommunityDTO> writeFilter2() {
		return sqlSession.selectList("mapper.community.writeFilter2");
	}
	@Override
	public List<CommunityDTO> viewsFilter2() {
		return sqlSession.selectList("mapper.community.viewsFilter2");
	}
	@Override
	public List<CommunityDTO> scrapsFilter2() {
		return sqlSession.selectList("mapper.community.scrapsFilter2");
	}
	@Override
	public List<CommunityDTO> heartFilter2() {
		return sqlSession.selectList("mapper.community.heartFilter2");
	}
	@Override
	public List<CommunityDTO> reply_cntFilter2() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.community.reply_cntFilter2");
	}
	
	
	@Override
	public int heart(Map<String, Object> heartMap) {
		
		sqlSession.update("mapper.community.heartPlus", heartMap);
		sqlSession.insert("mapper.community.heart", heartMap);
		
		return sqlSession.selectOne("mapper.community.upHeartCnt", heartMap);
	}

	@Override
	public int heartCancel(int c_articleNo) {
		sqlSession.update("mapper.community.heartMinus", c_articleNo);
		sqlSession.delete("mapper.community.heartCancel", c_articleNo);
		
		return sqlSession.selectOne("mapper.community.downHeartCnt", c_articleNo);
	}

	@Override
	public Map<String, Object> veganLifeMore() {
		List<CommunityDTO> vegan = sqlSession.selectList("mapper.community.veganLifeMore");
		List<C_ImageDTO> img = sqlSession.selectList("mapper.community.img");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		
		articleMap.put("vegan", vegan);
		articleMap.put("img", img);
		return articleMap;
	}

	@Override
	public void modArticle(Map<String, Object> articleMap) {
		sqlSession.update("mapper.community.modArticle", articleMap);
		
	}

	

	

	
}
