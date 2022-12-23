package com.spring.vegan.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.vegan.reservation.dto.ReservDTO;
import com.spring.vegan.resto.dto.RestoDTO;

@Repository
public class ReservDAOImpl implements ReservDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public RestoDTO getRestoDetail(int resto_no) {
		// TODO Auto-generated method stub
		RestoDTO restoList = sqlSession.selectOne("mapper.resto.getRestoDetail", resto_no);
		return restoList;
	}

	@Override
	public void addReserv(ReservDTO reserv) {
		// TODO Auto-generated method stub
		sqlSession.insert("mapper.reserv.addReserv", reserv);
	}

	@Override
	public ReservDTO selectReserv(String reserv_no) {
		// TODO Auto-generated method stub
		ReservDTO reserv = sqlSession.selectOne("mapper.reserv.selectReserv", reserv_no);
		return reserv;
	}

	@Override
	public List<ReservDTO> reservA(String u_email) {
		// TODO Auto-generated method stub
		List<ReservDTO> reservA = sqlSession.selectList("mapper.reserv.reservA", u_email);
		return reservA;
	}

	@Override
	public List<ReservDTO> reservB(String u_email) {
		// TODO Auto-generated method stub
		List<ReservDTO> reservB = sqlSession.selectList("mapper.reserv.reservB", u_email);
		return reservB;
	}

	@Override
	public List<ReservDTO> reservC(String u_email) {
		// TODO Auto-generated method stub
		List<ReservDTO> reservC = sqlSession.selectList("mapper.reserv.reservC", u_email);
		return reservC;
	}

	@Override
	public List<ReservDTO> reservD(String u_email) {
		// TODO Auto-generated method stub
		List<ReservDTO> reservD = sqlSession.selectList("mapper.reserv.reservD", u_email);
		return reservD;
	}

	@Override
	public List<ReservDTO> reservE(String u_email) {
		// TODO Auto-generated method stub
		List<ReservDTO> reservE = sqlSession.selectList("mapper.reserv.reservE", u_email);
		return reservE;
	}

	@Override
	public int selectResult(String reserv_no) {
		// TODO Auto-generated method stub
		int result = sqlSession.selectOne("mapper.reserv.selectResult", reserv_no);
		System.out.println(result);
		return result;
	}

	@Override
	public List<ReservDTO> cReservA(String c_email) {
		// TODO Auto-generated method stub
		List<ReservDTO> cReservA = sqlSession.selectList("mapper.reserv.cReservA", c_email);
		return cReservA;
	}

	@Override
	public List<ReservDTO> cReservB(String c_email) {
		// TODO Auto-generated method stub
		List<ReservDTO> cReservB = sqlSession.selectList("mapper.reserv.cReservB", c_email);
		return cReservB;
	}

	@Override
	public List<ReservDTO> cReservC(String c_email) {
		// TODO Auto-generated method stub
		List<ReservDTO> cReservC = sqlSession.selectList("mapper.reserv.cReservC", c_email);
		return cReservC;
	}

	@Override
	public List<ReservDTO> cReservD(String c_email) {
		// TODO Auto-generated method stub
		List<ReservDTO> cReservD = sqlSession.selectList("mapper.reserv.cReservD", c_email);
		return cReservD;
	}

	@Override
	public List<ReservDTO> cReservE(String c_email) {
		// TODO Auto-generated method stub
		List<ReservDTO> cReservE = sqlSession.selectList("mapper.reserv.cReservE", c_email);
		return cReservE;
	}

	@Override
	public List<ReservDTO> getReserv() {
		// TODO Auto-generated method stub
		List<ReservDTO> reserv = sqlSession.selectList("mapper.reserv.getReserv");
		return reserv;
	}
}
