<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="iq" value="${articleMap.iq }" />

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
	function replyInquery() {
		$.ajax({
			type: 'POST',
			url : "${path}/member/replyInquery.do",
			data : $("form[name=form]").serialize(),
			success : function(result){
				// 4. 테이블 초기화
				alert('문의 답변 달림');
				}
			}, error : function() {
				alert('잘 안됨');
			}
		});
	}
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<label>제목</label> <span>${iq.iq_title }</span>
	</div>
	<div>
		<label>작성일</label> <span>${iq.iq_writeDate }</span>
	</div>
	<div>
		<label>글번호</label> <span>${iq.iq_no }</span>
	</div>

	<div>
		<label>내용</label> <span>${iq.iq_content }</span>
	</div>
	<div>
		<c:choose>
			<c:when test="${not empty imageFileList }">
				<c:forEach var="item" items="${imageFileList }" varStatus="status">
					<div>
						<input type="hidden" name="originalFileName" value="${item.iq_image }">
						<img src="${path }/download2.do?iq_no=${iq.iq_no}&iq_image=${item.iq_image}" class="o_img">
					</div>	
				</c:forEach>
				
			</c:when>
			<c:otherwise>
				<h2>이미지가 없음</h2>
			</c:otherwise>
		</c:choose>
		
	</div>
	
	<div id="reply">
		<div>
			<c:forEach var="l" items="${list }">
				<label>${l.iq_u_email }</label>
				<label>${l.iq_reply_content }</label>
				<label>${l.iq_reply_writeDate }</label>
			</c:forEach>
		</div>
	</div>
	
	
	
	<div>
		<c:choose>
			<c:when test="${isAdminLogOn == true && user_onDTO != null }">
				<section>
					<form name="form" method="post" autocomplete="off">
						
					
						<input type="hidden" name="reply_iq_no" value="${iq.iq_no }">
						<input type="hidden" name="iq_u_email" value="${user_onDTO.u_email }">
						<div>
							<label>${user_onDTO.u_email }</label>
						</div>
						<div>
							<textarea name="iq_reply_content" id="iq_reply_content"></textarea>
						</div>
					
						<div>
							<input type="button" onclick="replyInquery()" value="문의답변">
						</div>
					</form>
				</section>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</div>
	
	
</body>
</html>