<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>포인트 사용 내역</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="${path }/resources/css/mypointList.css">
    <link rel="stylesheet" href="${path }/resources/css/common.css">
    
<c:if test="${user_onDTO == null && client_onDTO == null}">
	<script type="text/javascript">
		window.onload = function () {
			alert('로그인이 필요한 페이지 입니다.');
			location.href = '${path}/member/login';
		}
	</script>
</c:if>
</head>
<body>
<div class="mypageMain col-lg-8">

	<!-- 프로필 섹션 시작 -->
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
	<!-- 프로필 섹션 끝 -->
	
	<c:if test="${pointList == '[]' }">
		<h6>포인트 사용 내역이 없습니다.</h6>
	</c:if>
	<!-- 포인트 사용 내역 시작 -->
	<c:forEach var="item" items="${pointList }">
		
		<div class="point_list_item">
			
			
			<c:choose>
				<c:when test="${item.point_history == 'C' }">
					<div class="pointDiv">
						<div class="pointHistory">포인트 충전</div>
						<p class="pointDate">${item.point_date }<span class="pointChange">+${item.point_change }</span></p>
		                <hr>
	            	</div>
				</c:when>
				<c:when test="${item.point_history == 'R' }">
					<div class="pointDiv">
						<div class="pointHistory">적립 - 리뷰 작성</div>
						<p class="pointDate">${item.point_date }<span class="pointChange">+${item.point_change }</span></p>
		                <hr>
	            	</div>
				</c:when>
				<c:when test="${item.point_history == 'W' }">
					<div class="pointDiv">
						<div class="pointHistory">적립 - 게시글 작성</div>
						<p class="pointDate">${item.point_date }<span class="pointChange">+${item.point_change }</span></p>
		                <hr>
	            	</div>
				</c:when>
				<c:when test="${item.point_history == 'E' }">
					<div class="pointDiv">
						<div class="pointHistory">적립 - 이벤트 참여</div>
						<p class="pointDate">${item.point_date }<span class="pointChange">+${item.point_change }</span></p>
		                <hr>
	            	</div>
				</c:when>
				<c:otherwise>
					<div class="pointDiv">
						<div class="pointHistory">예약 - ${item.resto_name }</div>
						<p class="pointDate">${item.point_date }<span class="pointChange">${item.point_change }</span></p>
		                <hr>
	            	</div>
				</c:otherwise>
			</c:choose>
		</div>
	</c:forEach>
	<!-- 포인트 사용 내역 끝 -->	
</div> <!-- class="mypageMain col-lg-8" -->

	<script>
        let pc = document.querySelectorAll('.pointChange');
        for (let i = 0; i < pc.length; i++) {
            if (parseInt(pc[i].innerText) > 0) {
                pc[i].style.color = "blue";
            } else {
            	pc[i].style.color = "black";
            }
        }
        console.log('${pointList}');
    </script>
	
</body>
</html>