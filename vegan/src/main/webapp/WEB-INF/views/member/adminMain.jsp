<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<a href="${path }/member/writeListSearch.do">게시글 조회</a>
	</div>
	<div>
		<a href="#">리뷰 조회</a>
	</div>
	<div>
		<a href="${path }/member/inqueryList.do">고객 문의 확인</a>
	</div>
	<div>
		<a href="${path }/member/eventForm.do">이벤트 등록</a>
	</div>
</body>
</html>