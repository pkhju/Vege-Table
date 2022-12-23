<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="event" value="${articleMap.event }" />

<c:set var="imageFileList" value="${articleMap.imageFileList }" />

<!DOCTYPE html>
<html>
<style>
.o_img {
	width: 200px;
	height: auto;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function backToList() {
	location.href="${path }/community/community.do";
}
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<label>제목</label> <span>${event.e_title }</span>
	</div>
	<div>
		<label>작성일</label> <span>${event.e_date }</span>
	</div>
	<div>
		<label>글번호</label> <span>${event.e_no }</span>
	</div>

	<div>
		<label>내용</label> <span>${event.e_content }</span>
	</div>
	<div>
		<c:choose>
			<c:when test="${not empty imageFileList }">
				<c:forEach var="item" items="${imageFileList }" varStatus="status">
					<div>
						<input type="hidden" name="originalFileName" value="${item.e_image }">
						<img src="${path }/download3.do?e_no=${event.e_no}&e_image=${item.e_image}" class="o_img">
					</div>	
				</c:forEach>
				
			</c:when>
			<c:otherwise>
				<h2>이미지가 없음</h2>
			</c:otherwise>
		</c:choose>
		
	</div>
	<div>
		<button onclick="backToList()">커뮤니티로</button>
	</div>
	
	
	
	
	
	
	
</body>
</html>