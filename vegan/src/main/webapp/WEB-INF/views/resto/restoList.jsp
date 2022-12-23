<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="image" value="${imageFileName }" />
<!DOCTYPE html>
<html>
<head>
<style>
        .aTag {
            text-decoration: none;
            color: #333;
        }

        .card {
            max-width: 200px;
            min-width: 200px;
        }

        .wrap {
            flex-wrap: wrap;
        }

        .nav {
            width: 900px;
            margin: 0 auto;
        }
        .card-img-top {
        	min-height: 132px;
        }
        .card-text{
        	font-size: 7pt;
        }
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>식당목록</title>
<link href="../resources/css/common.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<title>식당 리스트</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body style="margin: 0px;">
	<div class="landingPage">
		<div class="main-page">
		
			<nav class="nav" style="clear:both;">
				<div class="wrap">
					<c:forEach var="resto" items="${restoList }" varStatus="list">
						<div class="card wrap-item">
							<a href="${path }/resto/restoDetail.do?resto_no=${resto.resto_no }" class="aTag">
								<input type="hidden" name="originalFileName" value="${resto.imageFileName }">
								<c:if test="${resto.imageFileName eq null }">
									<img src="../resources/img/image.jpg" class="card-img-top">
								</c:if> 
								<c:if test="${resto.imageFileName ne null }">
									<img src="${path }/downloadRestoImage.do?resto_no=${resto.resto_no }&imageFileName=${resto.imageFileName }"
										class="card-img-top">
								</c:if>
								<div class="card-body">
									<h6>${resto.resto_name }</h6>
									<p class="card-text">${resto.resto_addr}</p>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</nav>
		</div>

	</div>
</body>
</html>