<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="resto" value="${restoList }" />
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../resources/css/reservDetail.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69f40615d8246aa59404879f19fe7284"></script>
<script>
	function reservConfirm(){
		var reserv_deposit = document.getElementById("reserv_deposit").value;
		var u_point = document.getElementById("u_point").value;
		alert(reserv_deposit);
		alert(u_point);
		// 예약금 여유
		if(reserv_deposit<=u_point){
			reservation.method = "POST";
			reservation.action = "${path}/reservation/addReserv.do"
			reservation.submit();
		}// 예약금 부족
		else if(reserv_deposit>u_point){
			var select = confirm('예약포인트가 부족합니다. 포인트 충전 페이지로 이동하시겠습니까?');
			if(select == true){
				reservation.method = "POST";
				reservation.action = "${path}/member/mypoint.do?command=frmCharge"
				reservation.submit();		
			} else if(select == false){
				return;
			}
		}
	}
</script>
<title>Document</title>
</head>

<body>
	<form name="reservation">
		<div class="detailContainer">
			<input type="hidden" id="u_point" name="u_point" value="${newUser.u_point }">
			<input type="hidden" id="resto_no" name="resto_no" value="${resto.resto_no }">
			<input type="hidden" id="reserv_no" name="reserv_no" value="${reserv_no }">
			<c:set var="reserv_no" value="${reserv_no }" />			
			<div class="detailTop">
				<h2 class="resto_name">${resto.resto_name }</h2>
			<input type="hidden" id="resto_name" name="resto_name" value="${resto.resto_name }">
			<input type="hidden" id="resto_addr" name="resto_addr" value="${resto.resto_addr }">			
				<p>${resto.resto_addr }</p>
			</div>

			<div class="reservInfo">
				<h5>예약정보</h5>

				<div class="fLeft">
					<div class="infoLeft">
						<p class="u_name">예약자</p>
						<p class="u_email">이메일</p>
						<p class="schedule">예약일정</p>
						<p class="reserv_member">인원</p>
						<p class="deposit">예약포인트</p>
					</div>
					<div class="infoRight">
						<input type="hidden" id="reserv_sched" name="reserv_sched" value="${reserv_sched }">	
						<p class="u_name">${user_onDTO.u_name }</p>
						<input type="hidden" id="u_name" name="u_name" value="${user_onDTO.u_name }">	
						<p class="u_email">${user_onDTO.u_email }</p>
						<input type="hidden" id="u_email" name="u_email" value="${user_onDTO.u_email }">
						<input type="hidden" id="c_email" name="c_email" value="${c_email }">
						<c:set var="length" value="${fn:length(reserv_sched) }" />
						<c:if test="${fn:substring(reserv_sched, length-2,length) eq 00 }">
							<p class="schedule">${fn:substring(reserv_sched,0,length-2) }시</p>
						</c:if>
						<c:if test="${fn:substring(reserv_sched,length-2,length) ne 00}">
							<p class="schedule">${fn:substring(reserv_sched,0,length-2) }시 ${fn:substring(reserv_sched,length-2,length) }분</p>
						</c:if>
						<p class="reserv_member">${reserv_member }인</p>
						<input type="hidden" id="reserv_member" name="reserv_member" value="${reserv_member }">
						<c:set var="reserv_deposit" value="${resto.deposit * reserv_member }" />
						<input type="hidden" id="reserv_deposit" name="reserv_deposit" value="${reserv_deposit }">
						<p class="deposit" id="reserv_depo">${reserv_deposit }포인트</p>
					</div>
				</div>
			</div>

			<div class="detailInfo">
				<h5>상세정보</h5>
				<div class="detail">
					<strong>전화번호</strong>
					<p class="resto_tel">${resto.resto_tel }</p>

					<strong>매장주소</strong>
					<p class="resto_addr">${resto.resto_addr }</p>

					<strong>영업시간</strong>
					<p class="resto_time">${resto.resto_time }</p>
					<strong>쉬는시간</strong>
					<p class="resto_break">${resto.resto_break }</p>

				</div>
			</div>
			<div class="divBtn">
				<c:if test="${result == false}">
				<button class="btn btn-success" value="예약하기"
					onClick="reservConfirm()">예약하기</button>
				</c:if>
			</div>
			
			<c:if test="${userLogOn == true and selReserv.u_email == user_onDTO.u_email and selReserv.reserv_condition == 'A' or selReserv.reserv_condition == 'B'}">
			<div class="divBtn">
				<button class="btn btn-success" value="취소"
					onClick="">취소</button>
			</div>
			</c:if>
<!-- 			 and selReserv.c_email == client_onDTO.c_email and selReserv.reserv_condition == 'A' -->
			<c:if test="${clientLogOn == true }">
			<div class="divBtn">
				<button class="btn btn-success" value="예약확정"
					onClick="">예약확정</button>
			</div>
			</c:if>
			 
			<c:if test="${clientLogOn == true and resto.c_email == client_onDTO.c_email and selReserv.reserv_condition == 'B'}">
			<div class="divBtn">
				<c:if test="${result == false}">
				<button class="btn btn-success" value="방문완료"
					onClick="">예약하기</button>
				</c:if>
			</div>
			</c:if>
		</div>
	</form>
</body>
</html>