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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<label>문의내역</label>
		<c:forEach var="iq" items="${articleMap.iq_list }">
			<div>
				<a href="${path }/community/viewInquery.do?iq_no=${iq.iq_no}">
				<label>${iq.iq_no }</label>
				<label>${iq.iq_title }</label>
				<label>${iq.iq_writeDate }</label>
				</a>
			</div>
		</c:forEach>
	</div>
</body>
</html>