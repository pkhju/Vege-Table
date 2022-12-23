<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="${path }/resources/css/common.css" rel="stylesheet">
<link href="${path }/resources/css/mypage_info.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script type="text/javascript" src="${path }/resources/script/mypage_info.js"></script>
<script type="text/javascript" src="${path }/resources/script/mypage_info_u.js"></script>
<c:if test="${user_onDTO == null }">
	<script type="text/javascript">
		window.onload = function() {
			alert('로그인이 필요한 페이지 입니다.');
			location.href = '${path}/member/login';
		}
	</script>
</c:if>
</head>
<body>
	<c:if test="${user_onDTO != null }">
		<div class="logo">
			<a href="#"><img
				src="${path }/resources/img/vegetable_logos_finals/tight_light_mask.png"
				class="logoImg"></a>
		</div>
		<div class="col-lg-3 container">
			<h4 class="mb-3">회원 정보 수정</h4>
			<form class="needs-validation" novalidate name="frmModify"
				method="post">
				<div class="row g-3">
					<!-- 이메일 시작 -->
					<div class="col-12">
						<label class="form-label">이메일</label>
						<div class="input-group flex-nowrap replyInput">
							<div>${user_onDTO.u_email }</div>
						</div>
					</div>
					<!-- 이메일 끝 -->

					<!-- 비밀번호 시작 -->
					<div class="col-12">
						<label class="form-label">비밀번호 <span class="option">(영문,
								숫자, 특수문자 8~20자)</span></label>
						<div class="input-group flex-nowrap replyInput">
							<input type="password" value="${user_onDTO.u_pwd }"
								placeholder="비밀번호" name="input_pwd" class="form-control"
								aria-describedby="addon-wrapping">
						</div>
						<span class="result txt_pwd_form">공백은 입력할 수 없습니다.</span>
					</div>
					<!-- 비밀번호 끝 -->

					<!-- 비밀번호 재입력 시작 -->
					<div class="col-12">
						<label class="form-label">비밀번호 재입력</label>
						<div class="input-group flex-nowrap replyInput">
							<input type="password" name="input_pwd_r" class="form-control"
								aria-describedby="addon-wrapping">
						</div>
						<div class="result r_true txt_pwd_t">비밀번호가 일치합니다.</div>
						<div class="result r_false txt_pwd_f">비밀번호가 일치하지 않습니다.</div>
					</div>
					<!-- 비밀번호 재입력 끝 -->

					<!-- 이름 시작 -->
					<div class="col-12">
						<label class="form-label">이름</label>
						<div class="input-group flex-nowrap replyInput">
							<input type="text" name="input_name"
								value="${user_onDTO.u_name }" class="form-control"
								aria-describedby="addon-wrapping">
						</div>
					</div>
					<!-- 이름 끝 -->

					<!-- 전화번호 시작 -->
					<div class="col-12">
						<label class="form-label">휴대전화번호</label>
						<div class="input-group flex-nowrap replyInput">
							<input type="tel" name="input_tel"
								placeholder="휴대폰 번호 ('-' 없이 입력)" value="${user_onDTO.u_tel }"
								class="form-control" aria-describedby="addon-wrapping">
							<button class="input-group-text" id="btn_tel" type="button">인증하기</button>
						</div>
					</div>
					<!-- 전화번호 끝 -->
					<!-- 닉네임 시작 -->
					<div class="col-12">
						<label class="form-label">닉네임</label>
						<div class="input-group flex-nowrap replyInput">
							<input type="text" name="input_nick"
								value="${user_onDTO.u_nick }" class="form-control"
								aria-describedby="addon-wrapping">
							<button class="input-group-text" id="btn_nick" type="button">중복확인</button>
						</div>
						<div class="result r_true txt_nick_t">사용 가능한 닉네임 입니다.</div>
						<div class="result r_false txt_nick_f">이미 존재하는 닉네임 입니다.</div>
					</div>
					<!-- 닉네임 끝 -->

					<!-- 주소 시작 -->
					<div class="col-12">
						<label class="form-label">주소${user_onDTO.u_addr }<span class="option">
								[선택]</span></label>
						<div class="input-group flex-nowrap replyInput">
							<input type="text" name="input_addr"
								value="${user_onDTO.u_addr }" placeholder="주소 입력"
								class="form-control" aria-describedby="addon-wrapping">
							<button class="input-group-text" type="button">주소검색</button>
						</div>
					</div>
					<!-- 주소 끝 -->

					<!-- 비건단계 선택 시작 -->
					<div class="col-12">
						<label class="form-label">비건단계 ${user_onDTO.u_lvl }<span class="option">
								[선택]</span></label>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="input_lvl"
								id="v1"> <label class="form-check-label" for="v1">
								비건 (Vegan) </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="input_lvl"
								id="v2"> <label class="form-check-label" for="v2">
								락토 베지테리언 (lacto-vegetarian) </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="input_lvl"
								id="v3"> <label class="form-check-label" for="v3">
								오보 베지테리언 (ovo-vegetarian) </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="input_lvl"
								id="v4"> <label class="form-check-label" for="v4">
								락토 오보 베지테리언 (lacto-ovo-vegetarian) </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="input_lvl"
								id="v5"> <label class="form-check-label" for="v5">
								페스코 베지테리언 (Pescatarian 또는 Pesco-vegetarian) </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="input_lvl"
								id="v6"> <label class="form-check-label" for="v6">
								폴로 베지테리언 (Pollotarian) </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="input_lvl"
								id="v7"> <label class="form-check-label"
								for="flexRadioDefault1"> 플랙시테리언 (Flexitarian) </label>
						</div>
					</div>
					<!-- 비건단계 선택 끝 -->
					
					<button class="w-100 btn btn-primary btn-lg" type="button" style="background-color: #55771C; border: none; margin-top: 40px;"
							id="btn_modify">수정하기</button>
					
					<!-- 계정 비활성화 시작 -->
					<button id="btn_delete" class="btn_off" type="button">계정 비활성화</button>

					<div id="container_del">
						<div class="inner">
							<h4>계정 비활성화</h4>
							<p id="del_ask"></p>
							<p id="del_result1"></p>
							<p id="del_result2"></p>
							<a href="${path }/member/delete.do" id="del_proc">비활성화</a>
							<div id="delBtm">
								<button id="btn_exit" class="btn_off" type="button">닫기</button>
							</div>
						</div>
					</div>
					<!-- 계정 비활성화 끝 -->
					
					
					<!-- 유저 스크립트 시작 -->
					<script type="text/javascript">
						switch ("${user_onDTO.u_lvl}") {
					    case 'A':
					         document.getElementById('v1').checked = true;
					         break;
					    case 'B':
					         document.getElementById('v2').checked = true;
					         break;
					    case 'C':
					         document.getElementById('v3').checked = true;
					         break;
					    case 'D':
					         document.getElementById('v4').checked = true;
					         break;
					    case 'E':
					         document.getElementById('v5').checked = true;
					         break;	
					    case 'F':
					         document.getElementById('v6').checked = true;
					         break;
					    case 'G':
					         document.getElementById('v7').checked = true;
					         break;	
					    default:
					         break;
					    }
						
						// 계정 비활성화 확인창 시작
						function showDelete() { 
							$.ajax({
								type : "POST",
								dataType : "text",
								async : "false",
								url : "${path }/member/delConfirm.do",
								success : function(data) {
									let point = ${user_onDTO.u_point};
										if (data > 0 || point > 0) {
										del_ask.innerText = "진행중인 예약이 있거나 잔여 포인트가 존재하는 경우 계정 비활성화가 불가능합니다.";
										del_result1.innerText = "현재 진행중인 예약건: " + data + " 건";
										del_result2.innerText = "보유중인 포인트: " + ${user_onDTO.u_point } +" 원";
										del_proc.style.display = 'none';
									} else {
										del_ask.innerText = "계정을 비활성화 하시겠습니까?";
										del_result1.innerText = "현재 진행중인 예약건: " + data + " 건";
										del_result2.innerText = "보유중인 포인트: " + ${user_onDTO.u_point } +" 원";
									}
								},
								error : function(data,
										textStatus) {
									alert("에러가 발생했습니다.");
								}
							});
							container_del.style.display = 'block';
						}
						// 계정 비활성화 확인창 끝
					</script>
					<!-- 유저 스크립트 끝 -->

				</div>
			</form>
		</div>
	</c:if>
</body>
</html>