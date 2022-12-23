<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 회원 정보 조회</title>
<c:if test="${user_onDTO.u_email == null }">
	<script type="text/javascript">
		window.onload = function() {
			alert('로그인이 필요한 페이지 입니다.');
			location.href = '${path}/member/login';
		}
	</script>
</c:if>
<script type="text/javascript">
	window.onload = function() {
		document.getElementById('btn_search').addEventListener('click',
				searchMemberInfo);
		
		function searchMemberInfo() { // 세션에 admin 이메일 없어도 조회됨
			let list_target = document.getElementById('list_target').value;
			location.href = '${path }/member/admin/' + list_target + '.do';
		}
	}
</script>
<style type="text/css">
.tbl_memberList {
	border-collapse: collapse;
	text-align: center;
	margin-top: 15px;
}

.tbl_memberList td {
	border: 1px solid #999;
	padding: 3px 5px;
}
</style>
</head>
<body>
	list_memberInfo.jsp / ${user_onDTO.u_email }
	<br>
	<a href="${path }/main">홈</a> <br>
	<select id="list_target">
		<option value="list_user">일반 회원</option>
		<option value="list_client">사업자 회원</option>
	</select>
	<input type="button" value="조회" id="btn_search">
	<table class="tbl_memberList">
		<c:choose>
			<c:when test="${target == 'user' }">
				<tr>
					<td>구분</td>
					<td>이름</td>
					<td>휴대폰 번호</td>
					<td>이메일</td>
					<td>비밀번호</td>
					<td>닉네임</td>
					<td>포인트</td>
					<td>비건 유형</td>
					<td>주소</td>
					<td>가입일</td>
				</tr>
			</c:when>
			<c:when test="${target == 'client' }">
				<tr>
					<td>구분</td>
					<td>이름</td>
					<td>휴대폰 번호</td>
					<td>이메일</td>
					<td>비밀번호</td>
					<td>사업자등록번호</td>
					<td>영업허가번호</td>
					<td>포인트</td>
					<td>가입일</td>
				</tr>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${target == 'user' }">
				<c:forEach var="item" items="${list_userDTO }">
					<tr>
						<td>일반</td>
						<td>${item.u_name }</td>
						<td>${item.u_tel }</td>
						<td>${item.u_email }</td>
						<td>${item.u_pwd }</td>
						<td>${item.u_nick }</td>
						<td>${item.u_point }</td>
						<td>${item.u_lvl }</td>
						<td>${item.u_addr }</td>
						<td>${item.u_joinDate }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:when test="${target == 'client' }">
				<c:forEach var="item" items="${list_clientDTO }">
					<tr>
						<td>사업자</td>
						<td>${item.c_name }</td>
						<td>${item.c_tel }</td>
						<td>${item.c_email }</td>
						<td>${item.c_pwd }</td>
						<td>${item.regiNum }</td>
						<td>${item.certify }</td>
						<td>${item.c_point }</td>
						<td>${item.c_joinDate }</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>

	</table>
</body>
</html>