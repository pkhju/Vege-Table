<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
</head>

<script type="text/javascript">
	window.onload = function () {
		console.log("${list}");
	}
</script>
<body>
	<h1>Hello world!</h1>
	<!-- 영업시간이랑 브레이크타임 계산해서 예약가능한 시간만 String으로 출력됨 갖다 쓰는 건 알아서 활용하시요 -->

	<c:if test="${list != null }">
		<c:forEach var="item" items="${list }" begin="0">
			<span>${item }</span>
		</c:forEach>
	</c:if>
</body>
</html>
