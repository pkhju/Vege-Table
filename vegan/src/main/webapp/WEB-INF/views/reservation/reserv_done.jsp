<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div style="text-align: center;">
		<c:if test="${reservProc != null && reservProc == true }">
			예약이 완료되었습니다. <br>
			<button id="btn_reservDetail">자세히 보기</button>
			<a href="${path }/member/main">홈</a>
			<script type="text/javascript">
				let btn_reservDetail = document.querySelector("#btn_reservDetail");
				btn_reservDetail.addEventListener('click', function(event) {
// 					location.href = "${path}/reservation/reservDetail.do?reserv_member=${selReserv.reserv_member}&reserv_sched=${selReserv.reserv_sched}&resto_no=${selReserv.resto_no}";
				});
			</script>
		</c:if>
	</div>
</body>
</html>