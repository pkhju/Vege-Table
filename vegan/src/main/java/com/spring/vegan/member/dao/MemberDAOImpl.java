package com.spring.vegan.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.vegan.member.dto.Card_payDTO;
import com.spring.vegan.member.dto.Client_onDTO;
import com.spring.vegan.member.dto.LoginDTO;
import com.spring.vegan.member.dto.PointDTO;
import com.spring.vegan.member.dto.SearchDTO;
import com.spring.vegan.member.dto.User_onDTO;
import com.spring.vegan.community.dto.C_ImageDTO;
import com.spring.vegan.community.dto.Com_HeartDTO;
import com.spring.vegan.community.dto.Com_ScrapDTO;
import com.spring.vegan.community.dto.CommunityDTO;
import com.spring.vegan.community.dto.InqueryDTO;
import com.spring.vegan.community.dto.Iq_ImageDTO;
import com.spring.vegan.community.dto.ReplyDTO;
import com.spring.vegan.member.dto.E_ImageDTO;
import com.spring.vegan.member.dto.EventDTO;
import com.spring.vegan.member.dto.Iq_ReplyDTO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public User_onDTO checkByEmailPwd_u(LoginDTO loginDTO) {
		User_onDTO user_onDTO = new User_onDTO();
		try {
			user_onDTO = sqlSession.selectOne("mapper.member.checkByEmailPwd_u", loginDTO);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return user_onDTO;
	}

	@Override
	public Client_onDTO checkByEmailPwd_c(LoginDTO loginDTO) {
		Client_onDTO client_onDTO = new Client_onDTO();
		try {
			client_onDTO = sqlSession.selectOne("mapper.member.checkByEmailPwd_c", loginDTO);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return client_onDTO;
	}

	@Override
	public String searchLogin(SearchDTO dto) {
		String email = null;
		if ( dto.getEmail() == null ) {
			// 이름, 전화번호로 이메일 검색
			email = sqlSession.selectOne("mapper.member.searchEmail", dto);
			if ( email == null ) {
				email = sqlSession.selectOne("mapper.member.searchEmail_c", dto);
				if ( email != null ) {
					return email;
				}
			}
		} else {
			// 입력한 이메일이 존재하는지 확인
			email =  sqlSession.selectOne("mapper.member.searchPwd", dto.getEmail());
			if ( email == null ) {
				email = sqlSession.selectOne("mapper.member.searchPwd_c", dto);
				if ( email != null ) {
					return email;
				}
			}
		}
		return email;
	}

	@Override
	public User_onDTO selectMemberInfo(String u_email) {
		User_onDTO user_onDTO = new User_onDTO();
		try {
			user_onDTO = sqlSession.selectOne("mapper.member.selectMemberInfo", u_email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user_onDTO;
	}

	@Override
	public Client_onDTO selectMemberInfo_c(String c_email) {
		Client_onDTO client_onDTO = new Client_onDTO();
		try {
			client_onDTO = sqlSession.selectOne("mapper.member.selectMemberInfo_c", c_email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return client_onDTO;
	}

	@Override
	public List<User_onDTO> listMemberInfo_u() {
		List<User_onDTO> list = null;
		try {
			list = sqlSession.selectList("mapper.member.listMemberInfo_u");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	} 

	@Override
	public List<Client_onDTO> listMemberInfo_c() {
		List<Client_onDTO> list = null;
		try {
			list = sqlSession.selectList("mapper.member.listMemberInfo_c");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int chargePoint(Card_payDTO card_payDTO, int u_point) {
		int result = 0;
		try {
			result = sqlSession.insert("mapper.member.insertCardPay", card_payDTO);

			if ( result == 1 ) {
				System.out.println("insertCardPay result: " + result);
				card_payDTO = sqlSession.selectOne("mapper.member.selectCardPay",card_payDTO.getEmail());

				PointDTO pointDTO = new PointDTO();
				pointDTO.setEmail(card_payDTO.getEmail());
				pointDTO.setPoint_change(card_payDTO.getCard_price());
				pointDTO.setPoint_rest(u_point + card_payDTO.getCard_price());
				pointDTO.setPoint_history("C");
				pointDTO.setPoint_detail(card_payDTO.getPoint_detail());

				result = sqlSession.insert("mapper.member.insertPoint", pointDTO);
				if ( result == 1 ) {
					System.out.println("insertPoint result: " + result);
					result = sqlSession.update("mapper.member.updateU_point", pointDTO);
					System.out.println("updateU_point result: " + result);
					if ( result != 1 ) {
						result = sqlSession.update("mapper.member.updateC_point", pointDTO);
						System.out.println("updateC_point result: " + result);
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<PointDTO> selectPointList(String u_email) {
		List<PointDTO> list = new ArrayList<PointDTO>();

		try {
			list = sqlSession.selectList("mapper.member.selectPointList", u_email);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int payPoint(PointDTO pointDTO, User_onDTO user_onDTO) { 
		int result = 0;

		pointDTO.setPoint_rest(user_onDTO.getU_point() + pointDTO.getPoint_change()); 
		// point 테이블에 사용내역 insert
		result = sqlSession.insert("mapper.member.insertpayPoint", pointDTO); 
		if ( result == 1 ) {
			// user_on 테이블에 잔액 u_point update
			result = sqlSession.update("mapper.member.updateU_point", pointDTO); 
		}
		return result;
	}

	@Override
	public String duplicate_email(String input_email) {
		String result = null;

		try {
			result = sqlSession.selectOne("mapper.member.duplicate_email", input_email);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public String duplicate_nick(String input_nick) {
		String result = null;

		try {
			result = sqlSession.selectOne("mapper.member.duplicate_nick", input_nick);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int certifEmail(String u_email) {
		int result = 0;
		try {
			String u_auth = sqlSession.selectOne("mapper.member.selectU_auth", u_email);
			if ( u_auth.equals("N") ) {
				result = sqlSession.update("mapper.member.updateU_auth", u_email);
			} else if ( u_auth.equals("Y") ){
				result = 999;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		// TODO Auto-generated method stub
		return result;
	}

	@Override
	public int insertJoinUser(User_onDTO dto) {
		int result = 0;
		// TODO Auto-generated method stub
		try {
			if ( dto.getU_addr() == null || dto.getU_addr() == "" ) {
				dto.setU_addr("");
			}
			if ( dto.getU_lvl() == null || dto.getU_lvl() == "" ) {
				dto.setU_lvl("");
			}
			result = sqlSession.insert("mapper.member.insertJoinUser", dto);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	@Override
	public int updateModifyUser(User_onDTO dto) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			if ( dto.getU_addr() == null || dto.getU_addr() == "" ) {
				dto.setU_addr("");
			}
			if ( dto.getU_lvl() == null || dto.getU_lvl() == "" ) {
				dto.setU_lvl("");
			}
			result = sqlSession.update("mapper.member.updateModifyUser", dto);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int updateModifyUser_c(Client_onDTO client_onDTO) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = sqlSession.update("mapper.member.updateModifyClient", client_onDTO);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int selectReservCondition(String u_email) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = sqlSession.selectOne("mapper.member.selectReservCondition", u_email);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int selectReservCondition_c(String c_email) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			// 해당 유저의 이메일로 resto테이블에서 resto_no 가져와서 reserv테이블에서 resto_no로 상태가 A나 B인거 찾아와야댐
			int resto_no = sqlSession.selectOne("mapper.member.selectResto_no", c_email);
			if ( resto_no > 0 ) {
				result = sqlSession.selectOne("mapper.member.selectReservCondition_c", resto_no);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteMemberInfo(User_onDTO user_onDTO) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = sqlSession.delete("mapper.member.updateU_authbyC", user_onDTO.getU_email());

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int deleteMemberInfo_c(Client_onDTO client_onDTO) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = sqlSession.delete("mapper.member.updateC_authbyC", client_onDTO.getC_email());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int resetPwd(LoginDTO loginDTO) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = sqlSession.update("mapper.member.resetPwd", loginDTO);
			if ( result == 0 ) {
				result = sqlSession.update("mapper.member.resetPwd_c", loginDTO);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public User_onDTO selectUpdatedUser(String u_email) {
		// TODO Auto-generated method stub
		User_onDTO newUser = sqlSession.selectOne("mapper.member.selectUpdatedUser", u_email);
		return newUser;
	}

	@Override
	public Client_onDTO selectUpdatedClient(String c_email) {
		// TODO Auto-generated method stub
		Client_onDTO newClient = sqlSession.selectOne("mapper.member.selectUpdatedClient", c_email);
		return newClient;
	}
	@Override
	public void event(EventDTO ev) {
		sqlSession.insert("mapper.member.event", ev);
		
	}

	@Override
	public Map<String, Object> myWriteList(String u_email) {
		List<CommunityDTO> com = sqlSession.selectList("mapper.member.myComList", u_email);
		List<ReplyDTO> reply = sqlSession.selectList("mapper.member.myReList", u_email);
		
		Map<String, Object> articleMap = new HashMap<String, Object>();
		articleMap.put("com", com);
		articleMap.put("reply", reply);
		
		return articleMap;
	}

	@Override
	public List<Com_ScrapDTO> scrapInfo(String u_email) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.member.scrapInfo", u_email);
	}

	@Override
	public Map<String, Object> myScrapList(String u_email) {
		RowBounds row = new RowBounds(0, 4);
		List<C_ImageDTO> write = sqlSession.selectList("mapper.member.myWriteList", u_email, row);
		List<C_ImageDTO> cs = sqlSession.selectList("mapper.member.myScrapList", u_email, row);
		List<C_ImageDTO> heart = sqlSession.selectList("mapper.member.myHeartList", u_email, row);
		List<Iq_ImageDTO> iq = sqlSession.selectList("mapper.member.myIQ", u_email, row);
		Map<String, Object> articleMap = new HashMap<String, Object>();
		articleMap.put("cs", cs);
		articleMap.put("heart", heart);
		articleMap.put("write", write);
		articleMap.put("iq", iq);
		return articleMap;
	}

	@Override
	public int insertNewEvent(Map<String, Object> articleMap) {
		int e_no = selectNewE_No();
		articleMap.put("e_no", e_no);
		sqlSession.insert("mapper.member.insertNewEvent", articleMap);
		insertNewImage(articleMap);
		
		return e_no;
	}
	private void insertNewImage(Map<String, Object> articleMap) {
		List<E_ImageDTO> imageFileList = (List<E_ImageDTO>) articleMap.get("imageFileList");
		Integer e_no = (Integer) articleMap.get("e_no");
		int e_imageNo = selectNewImageFileNo();
		
		for (E_ImageDTO image : imageFileList) {
			image.setE_imageNo(++e_imageNo);
			image.setE_no(e_no);
		}
		sqlSession.insert("mapper.member.insertNewImage", imageFileList);
	}
	private int selectNewImageFileNo() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.member.selectNewImageFileNo");
	}
	private int selectNewE_No() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.member.selectNewE_No");
	}

	@Override
	public Map<String, Object> myInqueryList(String u_email) {
		List<InqueryDTO> iq_list = sqlSession.selectList("mapper.member.myInqueryList", u_email);
		Map<String, Object> articleMap = new HashMap<String, Object>();
		articleMap.put("iq_list", iq_list);
		
		
		return articleMap;
	}

	@Override
	public List<CommunityDTO> viewSearchList(CommunityDTO com) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.member.viewSearchList", com);
	}

	@Override
	public List<InqueryDTO> viewInqueryList(InqueryDTO iq) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.member.viewInqueryList", iq);
	}

	@Override
	public void reply(Map<String, Object> articleMap) {
		
		
		sqlSession.insert("mapper.member.reply", articleMap);
		
	}

	@Override
	public List<Iq_ReplyDTO> replyInquery(int reply_iq_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.member.replyInquery", reply_iq_no);
	}

	@Override
	public List<Com_HeartDTO> heartInfo(String u_email) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.member.heartInfo", u_email);
	}
}

