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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function deleteArticle(url, c_articleNo) {
		if (confirm('정말로 삭제하시겠습니까?')) {
			let form = document.createElement("form");
			
			form.method="post";
			form.action=url;
			
			let c_articleNoInput = document.createElement("input");
			c_articleNoInput.setAttribute("type", "hidden");
			c_articleNoInput.setAttribute("name", "c_articleNo");
			c_articleNoInput.setAttribute("value", c_articleNo);
			
			form.appendChild(c_articleNoInput);
			document.body.appendChild(form);
			
			form.submit();
		} else {
			alert('삭제 취소');
		}
	}
	function deleteReply(url, reply_no, c_articleNo) {
		if (confirm('정말로 삭제하시겠습니까?')) {
			let form = document.createElement("form");
			
			form.method="post";
			form.action=url;
			
			let reply_noInput = document.createElement("input");
			reply_noInput.setAttribute("type", "hidden");
			reply_noInput.setAttribute("name", "reply_no");
			reply_noInput.setAttribute("value", reply_no);
			
			let c_articleNoInput = document.createElement("input");
			c_articleNoInput.setAttribute("type", "hidden");
			c_articleNoInput.setAttribute("name", "c_articleNo");
			c_articleNoInput.setAttribute("value", c_articleNo);
			
			form.appendChild(reply_noInput);
			form.appendChild(c_articleNoInput);
			document.body.appendChild(form);
			
			form.submit();
		} else {
			alert('삭제 취소');
		}
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<label>작성글</label>
		<c:forEach var="c" items="${articleMap.com }">
			<div>
				<a href="${path }/community/viewArticle.do?c_articleNo=${c.c_articleNo}"><label>${c.c_articleNo }</label>
				<label>${c.c_category }</label>
				<label>${c.c_title }</label>
				<label>${c.c_writeDate }</label></a>
				<input type="button" value="수정">
				<input type="button" value="삭제" onclick="deleteArticle('${path}/community/deleteArticle.do', ${c.c_articleNo })">
			</div>
		</c:forEach>
	</div>
	<div>
		<label>작성댓글</label>
		<c:forEach var="r" items="${articleMap.reply }">
			<div>
				<a href="${path }/community/viewArticle.do?c_articleNo=${r.c_articleNo}"><label>${r.reply_no }</label>
				<label>${r.c_articleNo }</label>
				<label>${r.reply_content }</label>
				<label>${r.reply_writeDate }</label></a>
				<input type="button" value="수정">
				<input type="button" value="삭제" onclick="deleteReply('${path}/community/deleteReply.do', ${r.reply_no }, ${r.c_articleNo })">
			</div>
		</c:forEach>
	</div>
</body>
</html>