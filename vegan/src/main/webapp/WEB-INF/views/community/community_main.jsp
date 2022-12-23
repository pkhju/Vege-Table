<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="../resources/css/header.css" rel="stylesheet">
<link href="../resources/css/landingpage.css" rel="stylesheet">
<link href="../resources/css/common.css" rel="stylesheet">
<link href="../resources/css/feedCard.css" rel="stylesheet">
<link href="../resources/css/footer.css" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/resrevCard.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<style>
.o_img {
	width: 200px;
	height: auto;
}

.e_img {
	width: 500px;
	height: auto;
}

a {
	text-decoration: none;
	color: #333;
}
</style>
<script src="../resources/script/community.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>


function goToComment(c_articleNo) {
	location.href="${path}/community/viewArticle.do?c_articleNo="+c_articleNo+"";
}

</script>
<title>Insert title here</title>
</head>
<body style="margin: 0px;">
	<div class="landingPage">

		<!--main-page 시작-->
		<div class="main-page" style="min-height: 800px;">
		<div class="inner">
			<div class="btnReserv">
				<div class="btnChange">
					<a href="${path }/community/community.do"><button type="button" class="btn btn-success"
						style="background-color: #55771C; border: none">HOME</button></a>
					<a href="${path }/community/recipeMore.do"><button type="button" class="btn btn-success"
						style="background-color: #55771C; border: none">레시피</button></a>
					<a href="${path }/community/veganLifeMore.do"><button type="button" class="btn btn-success"
						style="background-color: #55771C; border: none">비건라이프</button></a>
					<c:choose>
				<c:when test="${isLogOn == true && user_onDTO != null }">
					<a href="${path }/community/articleForm.do"><button class="btn btn-success" 
						style="background-color: #55771C; border: none">게시글
							작성</button></a>
				</c:when>
				<c:when test="${isAdminLogOn == true && user_onDTO != null }">
				</c:when>
				<c:otherwise>
					<button class="btn btn-success" 
						style="background-color: #55771C; border: none" onclick="cantWrite()">게시글 작성</button>
				</c:otherwise>
			</c:choose>
				</div>
				
			</div>



			








			<div id="eventBanner">
				<div class="boxFilter">
					<label>이벤트배너</label>
				</div>

				<div class="imgContainer">
					<div id="carouselExampleInterval" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-inner" style="width: auto; height: 300px;">
							<c:forEach var="e" items="${articleMap.eventBanner }">
								<div class="carousel-item active" data-bs-interval="2000">
									<a href="${path }/community/viewEvent.do?e_no=${e.e_no}"> <img
										src="${path }/download3.do?e_no=${e.e_no}&e_image=${e.e_image}"
										class="d-block w-100 carousel" alt="..." style="height: 300px" /></a>
								</div>

							</c:forEach>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleInterval" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>

						</div>

					</div>
				</div>


			</div>

		
			<div class="boxFilter">레시피 인기글</div>

			<div class="feedConatiner">

				<!-- feedCard 시작-->
				<c:forEach var="c1" items="${articleMap.community1 }"
					varStatus="status">

					<div class="container col-lg-5 r_hot">

						<div class="imgContainer">
							<div id="carouselExampleInterval" class="carousel slide"
								data-bs-ride="carousel">
								<div class="carousel-inner" style="height: 300px;">

									<c:forEach var="i" items="${articleMap.img }">
										<c:if test="${c1.c_articleNo == i.c_articleNo }">
											<div class="carousel-item active" data-bs-interval="2000">
												<img
													src="${path }/download.do?c_articleNo=${i.c_articleNo}&c_image=${i.c_image}"
													class="d-block w-100 carousel" alt="..."
													style="height: 300px">

											</div>
										</c:if>

									</c:forEach>



								</div>

							</div>
						</div>
						<div class="iconBox">

							<c:choose>
								<c:when test="${isLogOn != null && com_heartDTO != null }">
									<c:forEach var="heart" items="${com_heartDTO }">

										<c:if test="${heart.c_articleNo == c1.c_articleNo }">
											<img src="../resources/img/icon/heartFull_icon.png"
												class="icon" >
											<script>
            					$(function() {
            						$("#btnHeart"+${status.count}+"").css({"display": "none"});
								});
            						
            					</script>
										</c:if>
										
									</c:forEach>
									<img src="../resources/img/icon/heart_icon.png" class="icon"
										 id="btnHeart${status.count}">
								</c:when>
								<c:otherwise>
									<img src="../resources/img/icon/heart_icon.png" class="icon"
										>
								</c:otherwise>
							</c:choose>

							<span>${c1.heart }</span> 
							<img
								src="../resources/img/icon/text_icon.png" class="icon"
								onclick="goToComment(${c1.c_articleNo})"> <span>${c1.reply_cnt }</span>

							
							<c:choose>
								<c:when test="${isLogOn != null && com_scrapDTO != null }">
									<c:forEach var="scrap" items="${com_scrapDTO }">

										<c:if test="${scrap.c_articleNo == c1.c_articleNo }">
											<img src="../resources/img/icon/scrapFull_icon.png"
												class="icon" >
											<script>
            					$(function() {
            						$("#btnScrap"+${status.count}+"").css({"display": "none"});
								});
            						
            					</script>
										</c:if>
										
									</c:forEach>
									<img src="../resources/img/icon/scrap_icon.png" class="icon"
										 id="btnScrap${status.count}">
								</c:when>
								<c:otherwise>
									<img src="../resources/img/icon/scrap_icon.png" class="icon"
										>
								</c:otherwise>
							</c:choose>
							
							
							<span>${c1.c_scraps }</span>


						</div>
						<div class="contentBox">
							<a
								href="${path }/community/viewArticle.do?c_articleNo=${c1.c_articleNo}">
								<h5 class="content">${c1.c_title }</h5>
								<p class="content">${c1.c_content }</p>

							</a>
						</div>

					</div>

				</c:forEach>
				<!-- feedCard 끝 -->



			</div>
			<!--feedContainer 끝-->
			<div class="boxFilter"><a href="${path }/community/recipeMore.do"><button class="btn btn-success" 
						style="background-color: #55771C; border: none">레시피 더보기</button></a></div>
			<hr>

			<div class="boxFilter">비건 라이프 인기글</div>

			<div class="feedConatiner">

				<!-- feedCard 시작-->
				<c:forEach var="c2" items="${articleMap.community2 }"
					varStatus="status2">
					<div class="container col-lg-5 v_hot">

						<div class="imgContainer">
							<div id="carouselExampleInterval" class="carousel slide"
								data-bs-ride="carousel">
								<div class="carousel-inner" style="height: 300px;">
									<c:forEach var="i" items="${articleMap.img }">
										<c:if test="${c2.c_articleNo == i.c_articleNo }">
											<div class="carousel-item active" data-bs-interval="2000">
												<img
													src="${path }/download.do?c_articleNo=${i.c_articleNo}&c_image=${i.c_image}"
													class="d-block w-100 carousel" alt="..."
													style="height: 300px">

											</div>
										</c:if>

									</c:forEach>



								</div>

							</div>
						</div>
						<div class="iconBox">
							<c:choose>
								<c:when test="${isLogOn != null && com_heartDTO != null }">
									<c:forEach var="heart" items="${com_heartDTO }">

										<c:if test="${heart.c_articleNo == c2.c_articleNo }">
											<img src="../resources/img/icon/heartFull_icon.png"
												class="icon" >
											<script>
            					$(function() {
            						$("#btnHeart"+${status2.count + 10000}+"").css({"display": "none"});
								});
            						
            					</script>
										</c:if>
										
									</c:forEach>
									<img src="../resources/img/icon/heart_icon.png" class="icon"
										 id="btnHeart${status2.count + 10000}">
								</c:when>
								<c:otherwise>
									<img src="../resources/img/icon/heart_icon.png" class="icon"
										>
								</c:otherwise>
							</c:choose> <span>${c2.heart }</span>
							 <img src="../resources/img/icon/text_icon.png" class="icon"
								onclick="goToComment(${c2.c_articleNo})"> <span>${c2.reply_cnt }</span>
							
								<c:choose>
								<c:when test="${isLogOn != null && com_scrapDTO != null }">
									<c:forEach var="scrap" items="${com_scrapDTO }">

										<c:if test="${scrap.c_articleNo == c2.c_articleNo }">
											<img src="../resources/img/icon/scrapFull_icon.png"
												class="icon" >
											<script>
            					$(function() {
            						$("#btnScrap"+${status2.count + 10000}+"").css({"display": "none"});
								});
            						
            					</script>
										</c:if>
										
									</c:forEach>
									<img src="../resources/img/icon/scrap_icon.png" class="icon"
										 id="btnScrap${status2.count + 10000}">
								</c:when>
								<c:otherwise>
									<img src="../resources/img/icon/scrap_icon.png" class="icon"
										>
								</c:otherwise>
							</c:choose>
								
								
								
							 <span>${c2.c_scraps }</span>
							


						</div>
						<div class="contentBox">
							<a
								href="${path }/community/viewArticle.do?c_articleNo=${c2.c_articleNo}">
								<h5 class="content">${c2.c_title }</h5>
								<p class="content">${c2.c_content }</p>
							</a>
						</div>

					</div>

				</c:forEach>
				<!-- feedCard 끝 -->



			</div>
			<!--feedContainer 끝-->
			<div class="boxFilter"><a href="${path }/community/veganLifeMore.do"><button class="btn btn-success" 
						style="background-color: #55771C; border: none">비건라이프 더보기</button></a></div>




			




		</div>
		<!-- content div -->
		</div>
	</div>
	<!-- main-page 끝-->
	<!-- main 끝 -->

	


	



	


</body>
</html>