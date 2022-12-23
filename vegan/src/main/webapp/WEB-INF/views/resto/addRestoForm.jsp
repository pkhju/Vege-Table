<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../resources/css/restoReg.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<title>식당등록</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var cnt = 1;
	function readURL(input) {
		if (input.files && input.files[0]) {
			let reader = new FileReader();
			reader.onload = function(e) {
				let preview = document.getElementById("preview" + (cnt - 1));
				preview.src = e.target.result;
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	function fn_addImage() {
		$("#resto_image").append(
				"<br><input type='file' onChange='readURL(this)' name='resto_image"
						+ cnt + "'>");
		$("#resto_image").append('<img id="preview' + cnt + '" width="150">');
		cnt++;
	}

	function toRestoList() {
		location.href = "${path}/resto/restoList.do";
	}
	function validation() {
		let vegan_val = document.getElementById("vegan");
		let name_val = document.getElementById("resto_name");
		let info_val = document.getElementById("resto_info");
		let deposit_val = document.getElementById("deposit");
		let addr_val = document.getElementById("resto_addr");
		let tel_val = document.getElementById("resto_tel");
		let time_val = document.getElementById("resto_time");
		let break_val = document.getElementById("resto_break");
		let detail_val = document.getElementById("resto_detail");

		if (vegan_val.value == "") {
			alert("음식종류를 선택해주세요");
		} else if (name_val.value == "") {
			alert("이름을 입력해주세요");
			name_val.focus();
		} else if (info_val.value == "") {
			alert("한줄소개를 입력해주세요");
			info_val.focus();
		} else if (deposit_val.value == "") {
			alert("예약포인트를 입력해주세요");
			deposit_val.focus();
		} else if (addr_val.value == "") {
			alert("주소를 입력해주세요");
			addr_val.focus();
		} else if (tel_val.value == "") {
			alert("전화번호를 입력해주세요");
			tel_val.focus();
		} else if (time_val.value == "") {
			alert("영업시간을 입력해주세요");
			time_val.focus();
		} else if (time_val.value < 8){
			alert("8자리를 모두 입력해주세요");
			time_val.focus();
		} else if (break_val.value == "") {
			alert("브레이크 타임을 입력해주세요");
			break_val.focus();
		} else if (break_val.value < 8){
			alert("8자리를 모두 입력해주세요");
			break_val.focus();
		} else if (detail_val.value == "") {
			alert("상세정보를 입력해주세요");
			detail_val.focus();
		} else {
			addRestoForm.submit();
		}
	}
</script>
</head>
<body>
	<form name="addRestoForm" method="post" action="${path }/resto/addResto.do" enctype="multipart/form-data">
		<input type="hidden" value="${resto_no }" name="resto_no"> 
		<input type="hidden" value="${imageFileName }" name="imageFileName">
		<div class="logo">
			<a href="${path }/resto/restoList.do">
			<img src="../resources/img/vegetable_logos_finals/tight_light_mask.png" class="logoImg"></a>
		</div>
		
		<div class="col-lg-3 container">
			<h4 class="mb-3">식당등록</h4>
			<div class="row g-3">
				<div>
					<input type="button" value="이미지첨부" onClick="fn_addImage()"><br>
					<div id="resto_image"></div>
				</div>

					<div class="col-12">
					<label class="form-label">음식종류</label>
					<select class="form-select" id="vegan" name="vegan">
						<option value=""></option>
						<option value="Y">비건음식만</option>
						<option value="N">논비건음식포함</option>
					</select>
					<div class="invalid-feedback">Please select a valid level.</div>

					<!-- 식당 이름 시작 -->
					<div class="col-12">
						<label class="form-label">식당이름</label> <input type="text" class="form-control" name="resto_name" id="resto_name" 
						placeholder="식당 이름를 입력하세요" maxlength="20">
						<div class="invalid-feedback">Valid restaurant name is required.</div>
					</div>
					<!-- 식당 이름 끝 -->

					<!-- 한줄소개 시작 -->
					<div class="col-12">
						<label lass="form-label">한줄소개</label>
						<div class="input-group has-validation">
							<input type="textarea" class="form-control" name="resto_info" id="resto_info" 
							placeholder="한줄 소개를 입력하세요" maxlength="50">
							<div class="invalid-feedback">Your information is required.</div>
						</div>
					</div>
					<!-- 한줄소개 끝 -->

					<!-- 예약포인트 시작 -->
					<div class="col-12">
						<label class="form-label">예약포인트</label>
						<div class="input-group has-validation">
							<input type="number" class="form-control" name="deposit" id="deposit" placeholder="예약포인트를 입력하세요">
							<div class="invalid-feedback">Your information is required.</div>
						</div>
					</div>
					<!-- 예약포인트 끝 -->

					<!-- 식당 주소 시작 -->
					<div class="col-12">
						<label class="form-label">식당주소</label> <input type="text" class="form-control" name="resto_addr" id="resto_addr" 
						placeholder="주소를 입력하세요" maxlength="40">
						<div class="invalid-feedback">Please enter your shipping address.</div>
					</div>
					<!-- 식당 주소 끝 -->

					<!-- email 시작 -->
					<div class="col-12">
						<label class="form-label">이메일 <span class="text-muted"></span></label>
						<input type="text" class="form-control" name="c_email" id="c_email" readonly="readonly" value=${c_email }>
						<div class="invalid-feedback">Please enter a valid email address for shipping updates.</div>
					</div>
					<!-- email 끝 -->

					<!-- 전화번호 시작 -->
					<div class="col-12">
						<label class="form-label">전화번호 <span class="text-muted"></span></label>
						<input type="text" class="form-control" name="resto_tel" id="resto_tel" placeholder="전화번호를 입력하세요" maxlength="11">
						<div class="invalid-feedback">Please enter a valid email address for shipping updates.</div>
					</div>
					<!-- 전화번호 끝 -->

					<!-- 영업시간 시작 -->
					<div class="col-12">
						<label class="form-label">영업시간 <span class="text-muted"></span></label>
						<input type="text" class="form-control" name="resto_time" id="resto_time" placeholder="영업시간을 입력하세요(예:09002100)" maxlength="8">
						<div class="invalid-feedback">Please enter a valid email address for shipping updates.</div>
					</div>
					<!-- 영업시간 끝 -->

					<!-- 쉬는시간 시작 -->
					<div class="col-12">
						<label class="form-label">쉬는시간 <span class="text-muted"></span></label>
						<input type="text" class="form-control" name="resto_break" id="resto_break" placeholder="쉬는시간을 입력하세요(예:09002100)" maxlength="8">
						<div class="invalid-feedback">Please enter a valid email address for shipping updates.</div>
					</div>
					<!-- 쉬는시간 끝 -->

					<!-- 상세정보 시작 -->
					<div class="">
						<label class="form-label">상세정보</label>
						<div class="input-group has-validation">
							<textarea rows="10" class="form-control" name="resto_detail" id="resto_detail" placeholder="상세정보를 입력하세요." 
							 style="resize: none" maxlength="300"></textarea>
							<div class="invalid-feedback">Your information is required.</div>
						</div>
					</div>
					<!-- 상세정보 끝 -->
					<hr class="my-4">

					<button class="w-100 btn btn-primary btn-lg" type="button" style="background-color: #55771C; border: none" onclick="validation();">작성완료</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>