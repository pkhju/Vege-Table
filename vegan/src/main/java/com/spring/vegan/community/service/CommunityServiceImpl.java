package com.spring.vegan.community.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.vegan.community.dao.CommunityDAO;
import com.spring.vegan.community.dto.Com_ScrapDTO;
import com.spring.vegan.community.dto.CommunityDTO;
import com.spring.vegan.community.dto.InqueryDTO;
import com.spring.vegan.community.dto.ReplyDTO;
import com.spring.vegan.member.dto.EventDTO;
import com.spring.vegan.member.dto.Iq_ReplyDTO;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService{
	@Autowired
	private CommunityDAO communityDAO;

	

	@Override
	public Map<String, Object> community() {
		// TODO Auto-generated method stub
		return communityDAO.community();
	}

	@Override
	public Map<String, Object> viewArticle(int c_articleNo) {
		communityDAO.increaseViews(c_articleNo);
		return communityDAO.viewArticle(c_articleNo);
	}

	@Override
	public void comment(ReplyDTO reply) {
		communityDAO.comment(reply);
		
	}

	

	

	@Override
	public int addNewarticle(Map<String, Object> articleMap) {
		// TODO Auto-generated method stub
		return communityDAO.insertNewArticle(articleMap);
	}

	@Override
	public int inquery(Map<String, Object> articleMap) {
		// TODO Auto-generated method stub
		return communityDAO.inquery(articleMap);
	}

	@Override
	public int scrap(Map<String, Object> heartMap) {
		return communityDAO.scrap(heartMap);
		
	}

	@Override
	public int scrapCancel(int c_articleNo) {
		return communityDAO.scrapCancel(c_articleNo);
	}

	

	@Override
	public Map<String, Object> viewInquery(int iq_no) {
		// TODO Auto-generated method stub
		return communityDAO.viewInquery(iq_no);
	}

	@Override
	public void deleteArticle(int c_articleNo) {
		// TODO Auto-generated method stub
		communityDAO.deleteArticle(c_articleNo);
	}

	@Override
	public void deleteReply(int reply_no) {
		communityDAO.deleteReply(reply_no);
		
	}

	@Override
	public List<EventDTO> eventDate() {
		return communityDAO.eventDate();
		
	}

	@Override
	public void eventUpdate(Map<String, Object> eventMap) {
		communityDAO.eventUpdate(eventMap);
		
	}

	@Override
	public List<Iq_ReplyDTO> replyInquery(int iq_no) {
		// TODO Auto-generated method stub
		return communityDAO.replyInquery(iq_no);
	}

	@Override
	public Map<String, Object> viewEvent(int e_no) {
		// TODO Auto-generated method stub
		return communityDAO.viewEvent(e_no);
	}

	@Override
	public Map<String, Object> recipeMore() {
		// TODO Auto-generated method stub
		return communityDAO.recipeMore();
	}

	@Override
	public List<CommunityDTO> writeFilter() {
		// TODO Auto-generated method stub
		return communityDAO.writeFilter();
	}
	@Override
	public List<CommunityDTO> viewsFilter() {
		// TODO Auto-generated method stub
		return communityDAO.viewsFilter();
	}
	@Override
	public List<CommunityDTO> scrapsFilter() {
		// TODO Auto-generated method stub
		return communityDAO.scrapsFilter();
	}
	@Override
	public List<CommunityDTO> heartsFilter() {
		// TODO Auto-generated method stub
		return communityDAO.heartFilter();
	}
	@Override
	public List<CommunityDTO> reply_cntFilter() {
		// TODO Auto-generated method stub
		return communityDAO.reply_cntFilter();
	}
	
	@Override
	public int heart(Map<String, Object> heartMap) {
		return communityDAO.heart(heartMap);
		
	}

	@Override
	public int heartCancel(int c_articleNo) {
		return communityDAO.heartCancel(c_articleNo);
		
	}

	@Override
	public Map<String, Object> veganLifeMore() {
		// TODO Auto-generated method stub
		return communityDAO.veganLifeMore();
	}

	@Override
	public List<CommunityDTO> writeFilter2() {
		// TODO Auto-generated method stub
		return communityDAO.writeFilter2();
	}
	@Override
	public List<CommunityDTO> viewsFilter2() {
		// TODO Auto-generated method stub
		return communityDAO.viewsFilter2();
	}
	@Override
	public List<CommunityDTO> scrapsFilter2() {
		// TODO Auto-generated method stub
		return communityDAO.scrapsFilter2();
	}
	@Override
	public List<CommunityDTO> heartsFilter2() {
		// TODO Auto-generated method stub
		return communityDAO.heartFilter2();
	}
	@Override
	public List<CommunityDTO> reply_cntFilter2() {
		// TODO Auto-generated method stub
		return communityDAO.reply_cntFilter2();
	}
	
	
	@Override
	public void modArticle(Map<String, Object> articleMap) {
		communityDAO.modArticle(articleMap);
		
	}

	

	
	
}
