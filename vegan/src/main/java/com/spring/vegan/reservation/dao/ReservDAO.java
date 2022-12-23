package com.spring.vegan.reservation.dao;

import java.util.List;

import com.spring.vegan.reservation.dto.ReservDTO;
import com.spring.vegan.resto.dto.RestoDTO;

public interface ReservDAO {
	public RestoDTO getRestoDetail(int resto_no);
	public void addReserv(ReservDTO reserv);
	public ReservDTO selectReserv(String reserv_no);
	public List<ReservDTO> reservA(String u_email);
	public List<ReservDTO> reservB(String u_email);
	public List<ReservDTO> reservC(String u_email);
	public List<ReservDTO> reservD(String u_email);
	public List<ReservDTO> reservE(String u_email);
	public int selectResult(String reserv_no);
	public List<ReservDTO> cReservA(String c_email);
	public List<ReservDTO> cReservB(String c_email);
	public List<ReservDTO> cReservC(String c_email);
	public List<ReservDTO> cReservD(String c_email);
	public List<ReservDTO> cReservE(String c_email);
	public List<ReservDTO> getReserv();
}
