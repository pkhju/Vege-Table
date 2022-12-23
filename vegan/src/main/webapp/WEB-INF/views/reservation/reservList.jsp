<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>reservList</title>
<link href="../resources/css/landingpage.css" rel="stylesheet">
<link href="../resources/css/resrevCard.css" rel="stylesheet">
<link href="../resources/css/common.css" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/resrevCard.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">

<style>
a {
	text-decoration: none;
	color: #333;
}
</style>

<script src="../resources/script/reserv.js"></script>
</head>

<body style="margin: 0px;">
	<!-- main 시작 -->

	<div class="landingPage">

		<!--main-page 시작-->
		<div class="main-page" style="min-height: 800px;">

			<div class="btnReserv">
				<div class="btnChange">
					<button type="button" class="btn btn-success"
						onclick="reservBtn1()"
						style="background-color: #55771C; border: none">예약대기</button>
					<button type="button" class="btn btn-success"
						onclick="reservBtn2()"
						style="background-color: #55771C; border: none">예약확정</button>
					<button type="button" class="btn btn-success"
						onclick="reservBtn3()"
						style="background-color: #55771C; border: none">방문완료</button>
					<button type="button" class="btn btn-success"
						onclick="reservBtn4()"
						style="background-color: #55771C; border: none">취소</button>
					<button type="button" class="btn btn-success"
						onclick="reservBtn5()"
						style="background-color: #55771C; border: none">노쇼</button>
				</div>
				<hr>
			</div>

			<!-- reservCard 예약대기 시작-->
			<c:forEach var="reservA" items="${reservA }">
				<div class="reservBox reservBox1">
					<div class="imgBox"
						style="background-image: url(../resources/img/iphone.png);"></div>
					<div class="textBox">
						<h5>${reservA.resto_name } - 예약대기</h5>
						<p>${reservA.resto_addr }</p>
						<p>${reservA.reserv_sched }</p>
						<p>${reservA.reserv_member }명</p>
						<button type="button" class="btn btn-primary"
							style="background-color: #55771C; border: none"
							onclick="location.href='${path}/reservation/reservDetail.do?reserv_member=${reservA.reserv_member}&reserv_sched=${reservA.reserv_sched }&resto_no=${reservA.resto_no}&reserv_no=${reservA.reserv_no }&c_email=${reservA.c_email }&u_email=${reservA.u_email}'">예약상세</button>
						<button type="button" class="btn btn-primary"
							style="background-color: #55771C; border: none">예약변경</button>
						<button type="button" class="btn btn-primary"
							style="background-color: #55771C; border: none">예약취소</button>
					</div>
				</div>
			</c:forEach>
			<!-- reservCard 예약대기 끝-->
			
			<!-- reservCard 예약확정 시작-->
			<c:forEach var="reservB" items="${reservB }">
				<div class="reservBox reservBox2">
					<div class="imgBox"
						style="background-image: url(../resources/img/iphone.png);"></div>
					<div class="textBox">
						<h5>${reservB.resto_name } - 예약확정</h5>
						<p>${reservB.resto_addr }</p>
						<p>${reservB.reserv_sched }</p>
						<p>${reservB.reserv_member }명</p>
						<button type="button" class="btn btn-primary"
							style="background-color: #55771C; border: none"
							onclick="location.href='${path}/reservation/reservDetail.do?reserv_member=${reservB.reserv_member}&reserv_sched=${reservB.reserv_sched }&resto_no=${reservB.resto_no}&reserv_no=${reservB.reserv_no }&c_email=${reservB.c_email }&u_email=${reservB.u_email}'">예약상세</button>
						<button type="button" class="btn btn-primary"
							style="background-color: #55771C; border: none">예약변경</button>
						<button type="button" class="btn btn-primary"
							style="background-color: #55771C; border: none">예약취소</button>
					</div>
				</div>
			</c:forEach>
			<!-- reservCard 예약확정 끝-->

			<!-- reservCard 방문완료 시작-->
			<c:forEach var="reservC" items="${reservC }">
				<div class="reservBox reservBox3">
					<div class="imgBox"
						style="background-image: url(../resources/img/iphone.png);"></div>
					<div class="textBox">
						<h5>${reservC.resto_name } - 방문완료</h5>
						<p>${reservC.resto_addr }</p>
						<p>${reservC.reserv_sched }</p>
						<p>${reservC.reserv_member }명</p>
						<button type="button" class="btn btn-primary"
							style="background-color: #55771C; border: none"
							onclick="location.href='${path}/reservation/reservDetail.do?reserv_member=${reservC.reserv_member}&reserv_sched=${reservC.reserv_sched }&resto_no=${reservC.resto_no}&reserv_no=${reservC.reserv_no }&c_email=${reservC.c_email }&u_email=${reservC.u_email}'">예약상세</button>
					</div>
				</div>
			</c:forEach>
			<!-- reservCard 방문완료 끝-->

			<!-- reservCard 취소 시작-->
			<c:forEach var="reservD" items="${reservD }">
				<div class="reservBox reservBox4">
					<div class="imgBox"
						style="background-image: url(../resources/img/iphone.png);"></div>
					<div class="textBox">
						<h5>${reservD.resto_name } - 취소</h5>
						<p>${reservD.resto_addr }</p>
						<p>${reservD.reserv_sched }</p>
						<p>${reservD.reserv_member }명</p>
						<button type="button" class="btn btn-primary"
							style="background-color: #55771C; border: none"
							onclick="location.href='${path}/reservation/reservDetail.do?reserv_member=${reservD.reserv_member}&reserv_sched=${reservD.reserv_sched }&resto_no=${reservD.resto_no}&reserv_no=${reservD.reserv_no }&c_email=${reservD.c_email }&u_email=${reservD.u_email}'">예약상세</button>
					</div>
				</div>
			</c:forEach>
			<!-- reservCard 취소 끝-->

			<!-- reservCard 방문예정 시작-->
			<c:forEach var="reservE" items="${reservE }">
				<div class="reservBox reservBox5">
					<div class="imgBox"
						style="background-image: url(../resources/img/iphone.png);"></div>
					<div class="textBox">
						<h5>${reservE.resto_name } - 노쇼</h5>
						<p>${reservE.resto_addr }</p>
						<p>${reservE.reserv_sched }</p>
						<p>${reservE.reserv_member }명</p>
						<button type="button" class="btn btn-primary"
							style="background-color: #55771C; border: none"
							onclick="location.href='${path}/reservation/reservDetail.do?reserv_member=${reservE.reserv_member}&reserv_sched=${reservE.reserv_sched }&resto_no=${reservE.resto_no}&reserv_no=${reservE.reserv_no }&c_email=${reservE.c_email }&u_email=${reservE.u_email}'">예약상세</button>
					</div>
				</div>
			</c:forEach>
			<!-- reservCard 방문예정 끝-->
			
			<!-- reservCard 예약대기 시작-->
			<c:forEach var="cReservA" items="${cReservA }">
				<div class="reservBox reservBox1">
					<div class="imgBox"
						style="background-image: url(../resources/img/iphone.png);"></div>
					<div class="textBox">
						<h5>${cReservA.resto_name } - 예약대기</h5>
						<p>${cReservA.resto_addr }</p>
						<p>${cReservA.reserv_sched }</p>
						<p>${cReservA.reserv_member }명</p>
						<button type="button" class="btn btn-primary"
							style="background-color: #55771C; border: none"
							onclick="location.href='${path}/reservation/reservDetail.do?reserv_member=${cReservA.reserv_member}&reserv_sched=${cReservA.reserv_sched }&resto_no=${cReservA.resto_no}&reserv_no=${cReservA.reserv_no }&c_email=${cReservA.c_email }&u_email=${cReservA.u_email}'">예약상세</button>
						<button type="button" class="btn btn-primary"
							style="background-color: #55771C; border: none">예약변경</button>
						<button type="button" class="btn btn-primary"
							style="background-color: #55771C; border: none">예약취소</button>
					</div>
				</div>
			</c:forEach>
			<!-- reservCard 예약대기 끝-->
			
			<!-- reservCard 예약확정 시작-->
			<c:forEach var="cReservB" items="${cReservB }">
				<div class="cReservBox reservBox2">
					<div class="imgBox"
						style="background-image: url(../resources/img/iphone.png);"></div>
					<div class="textBox">
						<h5>${cReservB.resto_name } - 예약확정</h5>
						<p>${cReservB.resto_addr }</p>
						<p>${cReservB.reserv_sched }</p>
						<p>${cReservB.reserv_member }명</p>
						<button type="button" class="btn btn-primary"
							style="background-color: #55771C; border: none"
							onclick="location.href='${path}/reservation/reservDetail.do?reserv_member=${cReservB.reserv_member}&reserv_sched=${cReservB.reserv_sched }&resto_no=${cReservB.resto_no}&reserv_no=${cReservB.reserv_no }&c_email=${cReservB.c_email }&u_email=${cReservB.u_email}'">>예약상세</button>
						<button type="button" class="btn btn-primary"
							style="background-color: #55771C; border: none">예약변경</button>
						<button type="button" class="btn btn-primary"
							style="background-color: #55771C; border: none">예약취소</button>
					</div>
				</div>
			</c:forEach>
			<!-- reservCard 예약확정 끝-->

			<!-- reservCard 방문완료 시작-->
			<c:forEach var="cReservC" items="${cReservC }">
				<div class="reservBox reservBox3">
					<div class="imgBox"
						style="background-image: url(../resources/img/iphone.png);"></div>
					<div class="textBox">
						<h5>${cReservC.resto_name } - 방문완료</h5>
						<p>${cReservC.resto_addr }</p>
						<p>${cReservC.reserv_sched }</p>
						<p>${cReservC.reserv_member }명</p>
						<button type="button" class="btn btn-primary"
							style="background-color: #55771C; border: none"
							onclick="location.href='${path}/reservation/reservDetail.do?reserv_member=${cReservC.reserv_member}&reserv_sched=${cReservC.reserv_sched }&resto_no=${cReservC.resto_no}&reserv_no=${cReservC.reserv_no }&c_email=${cReservC.c_email }&u_email=${cReservC.u_email}'">>예약상세</button>
					</div>
				</div>
			</c:forEach>
			<!-- reservCard 방문완료 끝-->

			<!-- reservCard 취소 시작-->
			<c:forEach var="cReservD" items="${cReservD }">
				<div class="reservBox reservBox4">
					<div class="imgBox"
						style="background-image: url(../resources/img/iphone.png);"></div>
					<div class="textBox">
						<h5>${cReservD.resto_name } - 취소</h5>
						<p>${cReservD.resto_addr }</p>
						<p>${cReservD.reserv_sched }</p>
						<p>${cReservD.reserv_member }명</p>
						<button type="button" class="btn btn-primary"
							style="background-color: #55771C; border: none"
							onclick="location.href='${path}/reservation/reservDetail.do?reserv_member=${cReservD.reserv_member}&reserv_sched=${cReservD.reserv_sched }&resto_no=${cReservD.resto_no}&reserv_no=${cReservD.reserv_no }&c_email=${cReservD.c_email }&u_email=${cReservD.u_email}'">예약상세</button>
					</div>
				</div>
			</c:forEach>
			<!-- reservCard 취소 끝-->

			<!-- reservCard 방문예정 시작-->
			<c:forEach var="cReservE" items="${cReservE }">
				<div class="reservBox reservBox5">
					<div class="imgBox"
						style="background-image: url(../resources/img/iphone.png);"></div>
					<div class="textBox">
						<h5>${cReservE.resto_name } - 노쇼</h5>
						<p>${cReservE.resto_addr }</p>
						<p>${cReservE.reserv_sched }</p>
						<p>${cReservE.reserv_member }명</p>
						<button type="button" class="btn btn-primary"
							style="background-color: #55771C; border: none"
							onclick="location.href='${path}/reservation/reservDetail.do?reserv_member=${cReservE.reserv_member}&reserv_sched=${cReservE.reserv_sched }&resto_no=${cReservE.resto_no}&reserv_no=${cReservE.reserv_no }&c_email=${cReservE.c_email }&u_email=${cReservE.u_email}'">예약상세</button>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- content div -->

	</div>
	<!-- main-page 끝-->
	<!-- main 끝 -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>