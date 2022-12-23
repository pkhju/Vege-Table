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
<link rel="stylesheet" href="${path }/resources/css/mypage_main.css">

<c:if test="${user_onDTO == null && client_onDTO == null }">
	<script type="text/javascript">
		window.onload = function() {
			alert('로그인이 필요한 페이지 입니다.');
			location.href = '${path}/member/login';
		}
	</script>
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
						<a href="${path }/member/mypoint.do?command=list"
						style="text-decoration: none; color: #777">
						<h5>${user_onDTO.u_point } 포인트</h5>						
						</a>
						<button type="button" class="btn btn-success"
						onClick="location.href='${path }/member/mypoint.do?command=frmCharge'"
						style="background-color: #55771C; border: none;">포인트 충전</button>
						
					</c:if>
			<!-- user_on 프로필 끝 -->
				
				
			<!-- client_on 프로필 시작 -->								
					<c:if test="${client_onDTO != null && user_onDTO == null}">
						<h3>${client_onDTO.c_name }
							<span class="user_title">[사업자회원]</span>
						</h3>
						<a href="${path }/member/mypoint_c.do?command=list"
						style="text-decoration: none; color: #777">
						<h5>${client_onDTO.c_point } 포인트</h5>
					</a>
					<button type="button" class="btn btn-success"
						onClick="location.href='${path }/member/mypoint_c.do?command=frmCharge'"
						style="background-color: #55771C; border: none;">포인트 충전</button>
					<c:if test="${clientLogOn == true and restoExist == false }">
				
					<button type="button" class="btn btn-success"
						onClick="location.href='${path }/resto/addRestoForm.do'" style="background-color: #55771C; border: none;">식당 등록</button>
					</c:if>
					</c:if>
			<!-- client_on 프로필 끝 --> 
					<button type="button" class="btn btn-success"
						onClick="location.href='${path }/member/mypage_info.do'"
						style="background-color: #55771C; border: none;">회원정보수정</button>
					</div>
					

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

				<div class="container">
					<h5 class="menuName">스크랩한 게시물</h5>
					
			<div class="scrap">
				<c:forEach var="cs" items="${articleMap.cs }">
				<a href="${path }/community/viewArticle.do?c_articleNo=${cs.c_articleNo}">
				<img class="scrapPic" src="${path }/download.do?c_articleNo=${cs.c_articleNo}&c_image=${cs.c_image}" />
				</a>
				
				</c:forEach>
			</div>
		
				</div>
				
				<div class="container">
					<h5 class="menuName">좋아요한 게시물</h5>
					
			<div class="scrap">
			<c:forEach var="heart" items="${articleMap.heart }">
				<a href="${path }/community/viewArticle.do?c_articleNo=${heart.c_articleNo}">
				<img class="scrapPic" src="${path }/download.do?c_articleNo=${heart.c_articleNo}&c_image=${heart.c_image}" />
				</a>
				
				</c:forEach>
			</div>
		
				</div>

			 	<div class="container">
					<h5 class="menuName">작성한 글</h5>
					
			<div class="scrap">
			<c:forEach var="write" items="${articleMap.write }">
				<a href="${path }/community/viewArticle.do?c_articleNo=${write.c_articleNo}">
				<img class="scrapPic" src="${path }/download.do?c_articleNo=${write.c_articleNo}&c_image=${write.c_image}" />
				</a>
				
				</c:forEach>
			</div>
		
				</div>  
				
				<div class="container">
					<h5 class="menuName">문의내역</h5>
					
			<div class="scrap">
			<c:forEach var="iq" items="${articleMap.iq }">
				<a href="${path }/community/viewInquery.do?iq_no=${iq.iq_no}">
				<img class="scrapPic" src="${path }/download2.do?iq_no=${iq.iq_no}&iq_image=${iq.iq_image}" />
				</a>
				
				</c:forEach>
			</div>
		
				</div>

				<div class="container">
					<h5 class="menuName">작성한 리뷰</h5>
					<div class="scrap">
						<a href=""><img src="${path }/resources/img/iphone.png"
							class="scrapPic"></a> <a href=""><img
							src="${path }/resources/img/iphone.png" class="scrapPic"></a> <a
							href=""><img src="${path }/resources/img/iphone.png"
							class="scrapPic"></a> <a href=""><img
							src="${path }/resources/img/iphone.png" class="scrapPic"></a>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<!--  -->
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>