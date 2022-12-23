package com.spring.vegan.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.vegan.reservation.dto.ReservDTO;
import com.spring.vegan.reservation.dao.ReservDAO;
import com.spring.vegan.resto.dto.RestoDTO;

@Service
public class ReservServiceImpl implements ReservService{
	@Autowired
	ReservDAO reservDAO;

	@Override
	public RestoDTO getRestoDetail(int resto_no) {
		// TODO Auto-generated method stub
		RestoDTO restoList = reservDAO.getRestoDetail(resto_no);
		return restoList;
	}

	@Override
	public void addReserv(ReservDTO reserv) {
		// TODO Auto-generated method stub
		reservDAO.addReserv(reserv);
	}

	@Override
	public ReservDTO selectReserv(String reserv_no) {
		// TODO Auto-generated method stub
		ReservDTO reserv = reservDAO.selectReserv(reserv_no);
		return reserv;
	}

	@Override
	public List<ReservDTO> reservA(String u_email) {
		// TODO Auto-generated method stub
		List<ReservDTO> reservA = reservDAO.reservA(u_email);
		return reservA;
	}

	@Override
	public List<ReservDTO> reservB(String u_email) {
		// TODO Auto-generated method stub
		List<ReservDTO> reservB = reservDAO.reservB(u_email);
		return reservB;
	}

	@Override
	public List<ReservDTO> reservC(String u_email) {
		// TODO Auto-generated method stub
		List<ReservDTO> reservC = reservDAO.reservC(u_email);
		return reservC;
	}

	@Override
	public List<ReservDTO> reservD(String u_email) {
		// TODO Auto-generated method stub
		List<ReservDTO> reservD = reservDAO.reservD(u_email);
		return reservD;
	}

	@Override
	public List<ReservDTO> reservE(String u_email) {
		// TODO Auto-generated method stub
		List<ReservDTO> reservE = reservDAO.reservE(u_email);
		return reservE;
	}

	@Override
	public int selectResult(String reserv_no) {
		// TODO Auto-generated method stub
		int result = reservDAO.selectResult(reserv_no);
		return result;
	}

	@Override
	public List<ReservDTO> cReservA(String c_email) {
		// TODO Auto-generated method stub
		List<ReservDTO> cReservA = reservDAO.cReservA(c_email);
		return cReservA;
	}

	@Override
	public List<ReservDTO> cReservB(String c_email) {
		// TODO Auto-generated method stub
		List<ReservDTO> cReservB = reservDAO.cReservB(c_email);
		return cReservB;
	}

	@Override
	public List<ReservDTO> cReservC(String c_email) {
		// TODO Auto-generated method stub
		List<ReservDTO> cReservC = reservDAO.cReservC(c_email);
		return cReservC;
	}

	@Override
	public List<ReservDTO> cReservD(String c_email) {
		// TODO Auto-generated method stub
		List<ReservDTO> cReservD = reservDAO.cReservD(c_email);
		return cReservD;
	}

	@Override
	public List<ReservDTO> cReservE(String c_email) {
		// TODO Auto-generated method stub
		List<ReservDTO> cReservE = reservDAO.cReservE(c_email);
		return cReservE;
	}

	@Override
	public List<ReservDTO> getReserv() {
		// TODO Auto-generated method stub
		List<ReservDTO> reserv = reservDAO.getReserv();
		return reserv;
	}
}
