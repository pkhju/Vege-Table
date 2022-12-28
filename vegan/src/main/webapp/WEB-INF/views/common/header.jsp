<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>header</title>
<link href="../resources/css/header.css" rel="stylesheet">
<link href="../resources/css/common.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body style="margin: 0px;">
	<!-- header 시작 -->
	<div class="nav-container">
		<div class="logoDiv">
			<a href="${path }/member/main"> <img
				src="<c:url value='/resources/img/vegetable_logos_finals/tight_light_mask.png' />"
				class="logoImg"></a>

		</div>
		<c:choose>
			<c:when test="${user_onDTO != null && user_onDTO.u_auth == 'B' }">
				<div class="nav-item">
					<a href="${path }/member/logout.do" class="aTag">로그아웃</a>
				</div>
				<div class="nav-item">
					<a href="${path }/reservation/reservList.do" class="aTag">내 예약</a>
				</div>
				<div class="nav-item header_profile">
					<a href="${path }/member/mypage.do" class="aTag"><img
						src="${path }/resources/img/lion.png"></a>
				</div>
			</c:when>
			<c:when
				test="${user_onDTO != null && isAdminLogOn != null && isAdminLogOn == true && user_onDTO.u_auth == 'B' }">
				<b class="aTag">관리자 <span>${user_onDTO.u_email }</span>님
				</b>
				<div class="nav-item">
					<a href="${path }/member/logout.do" class="aTag">로그아웃</a>
				</div>
				<div class="nav-item">
					<a href="${path }/member/adminMain.do" class="aTag">어드민페이지</a>
				</div>
			</c:when>
			<c:when test="${client_onDTO != null && client_onDTO.c_auth == 'B' }">
				<div class="nav-item">
					<a href="${path }/member/logout.do" class="aTag">로그아웃</a>
				</div>
				<div class="nav-item">
					<a href="${path }/reservation/reservList.do" class="aTag">내 예약</a>
				</div>
				<div class="nav-item header_profile">
					<a href="${path }/member/mypage.do" class="aTag"><img
						src="${path }/resources/img/lion.png"></a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="nav-item">
					<a href="${path }/member/login" class="aTag">로그인</a>
				</div>
				<div class="nav-item">
					<a href="${path }/member/join" class="aTag">회원가입</a>
				</div>
			</c:otherwise>
		</c:choose>
		<!-- <div style="flex-grow:1"></div> -->
	</div>

	<div class="main-background">
		<form action="${path }/resto/searchResto.do" method="GET"
			class="search">
			<div class="mx-auto mt-5 search-bar input-group mb-3">
				<input name="keyword" type="text"
					class="form-control rounded-pill searchBar"
					placeholder="지역 또는 식당명 검색" aria-label="Recipient's username"
					aria-describedby="button-addon2">
				<div class="input-group-append"></div>
			</div>
		</form>
	</div>
	<!-- header 끝 -->

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<div class="collapse navbar-collapse menu-bar" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="#">About</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${path }/reservation/reservList.do">내 예약</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${path }/resto/restoList.do">식당</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${path }/community/community.do">커뮤니티</a></li>
				</ul>
			</div>
		</div>
	</nav>
</body>

</html>