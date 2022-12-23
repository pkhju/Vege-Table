package com.spring.vegan.community.service;

import java.util.List;
import java.util.Map;

import com.spring.vegan.community.dto.Com_ScrapDTO;
import com.spring.vegan.community.dto.CommunityDTO;
import com.spring.vegan.community.dto.InqueryDTO;
import com.spring.vegan.community.dto.ReplyDTO;
import com.spring.vegan.member.dto.EventDTO;
import com.spring.vegan.member.dto.Iq_ReplyDTO;

public interface CommunityService {

	

	public Map<String, Object> community();

	public Map<String, Object> viewArticle(int c_articleNo);

	public void comment(ReplyDTO reply);

	

	

	public int addNewarticle(Map<String, Object> articleMap);

	public int inquery(Map<String, Object> articleMap);

	public int scrap(Map<String, Object> heartMap);
	public int scrapCancel(int c_articleNo);
	

	public Map<String, Object> viewInquery(int iq_no);

	public void deleteArticle(int c_articleNo);

	public void deleteReply(int reply_no);

	public List<EventDTO> eventDate();

	public void eventUpdate(Map<String, Object> eventMap);

	public List<Iq_ReplyDTO> replyInquery(int iq_no);

	public Map<String, Object> viewEvent(int e_no);

	public Map<String, Object> recipeMore();

	public List<CommunityDTO> writeFilter();
	public List<CommunityDTO> viewsFilter();
	public List<CommunityDTO> scrapsFilter();
	public List<CommunityDTO> heartsFilter();
	public List<CommunityDTO> reply_cntFilter();
	
	public List<CommunityDTO> writeFilter2();
	public List<CommunityDTO> viewsFilter2();
	public List<CommunityDTO> scrapsFilter2();
	public List<CommunityDTO> heartsFilter2();
	public List<CommunityDTO> reply_cntFilter2();

	public int heart(Map<String, Object> heartMap);

	public int heartCancel(int c_articleNo);

	public Map<String, Object> veganLifeMore();

	public void modArticle(Map<String, Object> articleMap);

	

	

	

	

	

}
