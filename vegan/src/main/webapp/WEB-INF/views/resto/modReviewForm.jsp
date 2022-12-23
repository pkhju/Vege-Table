<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="resto_no" value="${resto_no }" />
<c:set var="review" value="${review }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰작성</title>
<link href="../resources/css/common.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function validation() {
		let review_content = document.getElementById("review_content");

		if (review_content.value == "") {
			alert("리뷰내용을 입력해주세요");
			review_content.focus();
		} else {
			modReview.submit();
		}
	}

	function readURL(input) {
		if (input.files && input.files[0]) {
			let reader = new FileReader();
			reader.onload = function(e) {
				$("#preview").attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<style>
.container {
	margin-top: 30px;
}
</style>
</head>

<body>
	<form method="post" name="modReview" action="${path }/resto/modReview.do" enctype="multipart/form-data">
		<div class="col-lg-3 container">
			<h4 class="mb-3">리뷰수정</h4>
			<input type="hidden" value="${resto_no}" name="resto_no">
			<input type="hidden" value="${review.review_no}" name="review_no">
			<form class="needs-validation" novalidate="">

				<div class="row g-3">

					<!-- vegan 선택 시작 -->
					<div>
						<c:if test="${empty review.imageFileName }">
							<img src="" id="preview" width="500">
						</c:if>
						<c:if test="${not empty review.imageFileName }">
							<img src="${path }/downloadReviewImage.do?resto_no=${review.resto_no }&imageFileName=${review.imageFileName }" id="preview" width="500">
						</c:if>
					</div>
						<input type="file" name="imageFileName" onchange="readURL(this)">
					</div>
					<div class="col-12">
						<label class="form-label">평점</label> <select class="form-select"
							name="rate">
							<option value="${review.rate }">
								<c:if test="${review.rate == 1 }">★☆☆☆☆</c:if>
								<c:if test="${review.rate == 2 }">★★☆☆☆</c:if>
								<c:if test="${review.rate == 3 }">★★★☆☆</c:if>
								<c:if test="${review.rate == 4 }">★★★★☆</c:if>
								<c:if test="${review.rate == 5 }">★★★★★</c:if>
							</option>
							<c:if test="${review.rate == 1}">
								<option value="2">★★☆☆☆</option>
								<option value="3">★★★☆☆</option>
								<option value="4">★★★★☆</option>
								<option value="5">★★★★★</option>
							</c:if>
							<c:if test="${review.rate == 2}">
								<option value="1">★☆☆☆☆</option>
								<option value="3">★★★☆☆</option>
								<option value="4">★★★★☆</option>
								<option value="5">★★★★★</option>
							</c:if>
							<c:if test="${review.rate == 3}">
								<option value="1">★☆☆☆☆</option>
								<option value="2">★★☆☆☆</option>
								<option value="4">★★★★☆</option>
								<option value="5">★★★★★</option>
							</c:if>
							<c:if test="${review.rate == 4}">
								<option value="1">★☆☆☆☆</option>
								<option value="2">★★☆☆☆</option>
								<option value="3">★★★☆☆</option>
								<option value="5">★★★★★</option>
							</c:if>
							<c:if test="${review.rate == 5}">
								<option value="1">★☆☆☆☆</option>
								<option value="2">★★☆☆☆</option>
								<option value="3">★★★☆☆</option>
								<option value="4">★★★★☆</option>
							</c:if>
						</select>
						<div class="invalid-feedback">Please select a valid level.</div>
					</div>
					<!-- vegan 선택 끝 -->

					<!-- 상세정보 시작 -->
					<div class="">
						<label class="form-label">리뷰내용</label>
						<div class="input-group has-validation">
							<textarea rows="10" class="form-control" name="review_content"
								id="review_content" style="resize: none" maxlength="150">${review.review_content }</textarea>
							<div class="invalid-feedback">Your information is required.
							</div>
						</div>
					</div>
					<!-- 상세정보 끝 -->
					<hr class="my-4">

					<button class="w-100 btn btn-primary btn-lg" type="button"
						style="background-color: #55771C; border: none"
						onclick="validation()">수정완료</button>
			</form>
		</div>
	</form>
</body>
</html>