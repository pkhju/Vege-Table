<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.reserv_item {
		width: 40%;
		height: 30px; 
		line-height: 30px;
		margin-bottom: 10px;
	}
	.reserv_item input {
		border: none;
		padding: 3px 5px;
		border-radius: 5px;
	}
	.reserv_item input:focus {
		outline: none;
		background: #eee;
	}
</style>
</head>
<body>
reserv.jsp
<a href="${path }/member/main">홈</a>
<form name="frmPayPoint" method="post">
	<div class="reserv_item">
		<span>상호명 <input type="number" value="123456" name="resto_no" readonly="readonly"></span>
	</div>
	<div class="reserv_item">
		예약 일정	<input type="text" name="reserv_sched" value="2022/11/25 12:00">
	</div>
	<div class="reserv_item">
		예약 인원	<input type="number" name="reserv_member" value="2" readonly="readonly">
	</div>
	<div class="reserv_item">
		총 예약금	<input name="reserv_deposit" type="number" value="60000" readonly="readonly">
	</div>
	<input type="button" value="결제하기" id="btn_payPoint">
	
	<script type="text/javascript">
		let frmPayPoint = document.frmPayPoint;
		/* let resto_no = frmPayPoint.resto_no;
		let reserv_sched = frmPayPoint.reserv_sched;
		let reserv_member = frmPayPoint.reserv_member;
		let reserv_deposit = frmPayPoint.reserv_deposit; */
		
		btn_payPoint.addEventListener("click",payPoint);
		
		function payPoint () {
			frmPayPoint.action = "${path }/reserv.do?command=payPoint"
			frmPayPoint.submit();
		}

	</script>
</form>
</body>
</html>