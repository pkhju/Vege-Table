<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${path }/resources/css/common.css">
<link rel="stylesheet" href="${path }/resources/css/mypage_main.css?ver=1">
<!-- 서버 재시작 했는데도 css나 js 반영 안될 때 ?ver=1 붙이면 됨 -->

<c:if test="${user_onDTO == null && client_onDTO == null }">
	<script src="<c:url value='/resources/script/noSession.js' />"></script>
</c:if>
<c:if test="${modProc != null }">
	<script type="text/javascript">
		alert("${modProc}");
	</script>
</c:if>
<c:if test="${charge_point != null }">
	<script type="text/javascript">
		alert("${charge_point }");
	</script>
</c:if>

</head>
<body> <!-- /member/mypage.do -->
	<div class="mypageMain col-lg-8">
		<c:choose>
			<c:when test="${user_onDTO.u_email == 'admin@admin.kr' }">
				<a href="${path }/member/admin/listMemberInfo">회원 정보 조회</a>
			</c:when>
			
			<c:when test="${user_onDTO != null || client_onDTO != null }">
				<div class="profile col-lg-4">
					<img src="${path }/resources/img/lion.png" class="proPick">
					
			<!-- user_on 프로필 시작 -->		
					<c:if test="${user_onDTO != null && client_onDTO == null}">
						<h3>${user_onDTO.u_nick }
							<span class="user_title">[일반회원]</span>
						</h3>
						<a href="${path }/member/mypoint.do?command=list&user_categoty=user" style="text-decoration: none; color: #777">
							<h5>${user_onDTO.u_point } 포인트</h5>						
						</a>
						
					</c:if>
			<!-- user_on 프로필 끝 -->
				
				
			<!-- client_on 프로필 시작 -->								
					<c:if test="${client_onDTO != null && user_onDTO == null}">
						<h3>${client_onDTO.c_name }
							<span class="user_title">[사업자회원]</span>
						</h3>
						<a href="${path }/member/mypoint.do?command=list&user_categoty=client" style="text-decoration: none; color: #777">
							<h5>${client_onDTO.c_point } 포인트</h5>
						</a>
						<!-- 클라이언트가 로그인하고 등록한 식당이 존재하지 않는 경우 식당 등록 버튼 노출 -->	
						<c:if test="${clientLogOn == true and restoExist == false }">
							<button type="button" class="btn btn-success"
								onClick="location.href='${path }/resto/addRestoForm.do'" style="background-color: #55771C; border: none;">식당 등록</button>
						</c:if>
					</c:if>
			<!-- client_on 프로필 끝 --> 
					<button type="button" class="btn btn-success" onClick="location.href='${path }/member/mypoint.do?command=frmCharge'"
							style="background-color: #55771C; border: none;">포인트 충전</button>
					<button type="button" class="btn btn-success" onClick="location.href='${path }/member/mypage_info.do'"
						style="background-color: #55771C; border: none;">회원정보수정</button>
					</div>
					
				<!-- 찜한 식당 시작 -->
				<div class="container">
					<h5 class="menuName">찜한 식당</h5>
					<div class="scrap">
						<a href=""><img src="${path }/resources/img/iphone.png"
							class="scrapPic"></a> <a href=""><img
							src="${path }/resources/img/iphone.png" class="scrapPic"></a> <a
							href=""><img src="${path }/resources/img/iphone.png"
							class="scrapPic"></a> <a href=""><img
							src="${path }/resources/img/iphone.png" class="scrapPic"></a>
					</div>
				</div>
				<!-- 찜한 식당 끝 -->
				
				<!-- 스크랩한 게시물 시작 -->
				<div class="container">
					<h5 class="menuName">스크랩한 게시물</h5>
				<c:if test="${articleMap.cs == '[]' }">
					<div class="noContent"  style="">
						<h6 class="noConTit" style="">스크랩한 게시물이 없습니다.</h6>
					</div>
				</c:if>		
				<c:if test="${articleMap.cs != '[]' }">
					<div class="scrap">
						<c:forEach var="cs" items="${articleMap.cs }">
						
							<a href="${path }/community/viewArticle.do?c_articleNo=${cs.c_articleNo}">
								<img class="scrapPic" src="${path }/download.do?c_articleNo=${cs.c_articleNo}&c_image=${cs.c_image}" />
							</a>
						</c:forEach>
					</div>
				</c:if>
				</div>
				<!-- 스크랩한 게시물 끝 -->
				
				<!-- 좋아요한 게시물 시작 -->
				<div class="container">
					<h5 class="menuName">좋아요한 게시물</h5>
					
					<div class="scrap">
						<c:forEach var="heart" items="${articleMap.heart }">
							<c:if test="${heart == '[]' }">
								<h6>좋아요한 게시물이 없습니다.</h6>
							</c:if>
							<a href="${path }/community/viewArticle.do?c_articleNo=${heart.c_articleNo}">
								<img class="scrapPic" src="${path }/download.do?c_articleNo=${heart.c_articleNo}&c_image=${heart.c_image}" />
							</a>
						</c:forEach>
					</div>
				</div>
				<!-- 좋아요한 게시물 끝 -->
				
				<!-- 작성한 글 시작 -->
			 	<div class="container">
					<h5 class="menuName">작성한 글</h5>
					<c:if test="${write == '[]' }">
						<h6>작성한 글이 없습니다.</h6>
					</c:if>
					<div class="scrap">
						<c:forEach var="write" items="${articleMap.write }">
							<a href="${path }/community/viewArticle.do?c_articleNo=${write.c_articleNo}">
								<img class="scrapPic" src="${path }/download.do?c_articleNo=${write.c_articleNo}&c_image=${write.c_image}" />
							</a>
						</c:forEach>
					</div>
				</div>  
				<!-- 작성한 글 끝 -->
				
				<!-- 문의내역 시작 -->
				<div class="container">
					<h5 class="menuName">문의내역</h5>
					<c:if test="${iq == '[]' }">
						<h6>문의내역이 없습니다.</h6>
					</c:if>
					<div class="scrap">
					<c:forEach var="iq" items="${articleMap.iq }">
						<a href="${path }/community/viewInquery.do?iq_no=${iq.iq_no}">
							<img class="scrapPic" src="${path }/download2.do?iq_no=${iq.iq_no}&iq_image=${iq.iq_image}" />
						</a>
					</c:forEach>
					</div>
				</div>
				<!-- 문의내역 끝 -->
				
				<!-- 작성한 리뷰 시작 -->
				<div class="container">
					<h5 class="menuName">작성한 리뷰</h5>
					<c:if test="${iq == '[]' }">
						<h6>작성한 리뷰가 없습니다.</h6>
					</c:if>
					<div class="scrap">
						<a href=""><img src="${path }/resources/img/iphone.png"
							class="scrapPic"></a> <a href=""><img
							src="${path }/resources/img/iphone.png" class="scrapPic"></a> <a
							href=""><img src="${path }/resources/img/iphone.png"
							class="scrapPic"></a> <a href=""><img
							src="${path }/resources/img/iphone.png" class="scrapPic"></a>
					</div>
				</div>
				<!-- 작성한 리뷰 끝 -->
				
			</c:when>
			<c:otherwise>
				<!--  -->
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>