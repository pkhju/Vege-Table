<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title> 이메일 찾기 </title>
<link href="${path }/resources/css/proc.css" rel="stylesheet">
<style type="text/css">
	.tit_h4 {
		margin: 0 0 5px 0;
		padding: 0;
	}
	.result {
		font-size: 14px;
		color: #555;
	}
	.r_false {
		color: red;
	}
</style>
</head>
<body>
<div id="wrap">
	<div class="txt_proc">
		<c:if test="${email != null && restting == null && email != false}">
			이메일 찾기
			<p>${email }</p>
			<a href="${path }/member/login">로그인 하기 ></a><br>
		</c:if>
		<c:if test="${email == false }">
			<p>일치하는 이메일이 없습니다. 관리자에게 문의하세요.</p>
			<a href="#">관리자에게 문의하기 ></a>
		</c:if>
	</div>

</div>
</body>
</html>