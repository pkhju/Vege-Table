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
<style>
	

</style>
<meta charset="UTF-8">
<link href="../resources/css/mypage_main.css" rel="stylesheet">
<link href="../resources/css/header.css" rel="stylesheet">
<link href="../resources/css/landingpage.css" rel="stylesheet">
<link href="../resources/css/common.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h5 class="menuName">스크랩</h5>
		<c:forEach var="cs" items="${articleMap.cs }">
			<div class="scrap">
				<a href="${path }/community/viewArticle.do?c_articleNo=${cs.c_articleNo}">
				<img class="scrapPic" src="${path }/download.do?c_articleNo=${cs.c_articleNo}&c_image=${cs.c_image}" />
				</a>
				
				
			</div>
		</c:forEach>
		<h5 class="menuName">하트</h5>
		<c:forEach var="heart" items="${articleMap.heart }">
			<div class="scrap">
				<a href="${path }/community/viewArticle.do?c_articleNo=${heart.c_articleNo}">
				<img class="scrapPic" src="${path }/download.do?c_articleNo=${heart.c_articleNo}&c_image=${heart.c_image}" />
				</a>
				
				
			</div>
		</c:forEach>
	</div>
</body>
</html>