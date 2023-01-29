<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> Vege-Table - 회원가입 </title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" href="<c:url value='/resources/css/common.css' />" >
	<link rel="stylesheet" href="<c:url value='/resources/css/joinfrm.css' />" >
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<script src="<c:url value='/resources/script/join_u.js' />"></script>   
</head>
<body>
	<div class="join_topMenu col-lg-3" style="text-align: right;">
		<a href="${path }/member/join_c">사업자로 회원가입하기</a>
	</div>
	<!-- 회원가입 폼 시작 -->
    <div class="logo">
        <a href="${path }/member/main"><img src="<c:url value='/resources/img/vegetable_logos_finals/tight_light_mask.png' />" class="logoImg"></a>
    </div>

    <div class="col-lg-3 container">
        <h6 class="join-title">회원가입 <span class="join-option">[일반회원]</span></h6>

        <form class="needs-validation" novalidate name="frmJoin" method="post">

            <div class="row g-3">

                <!-- 이메일 시작 -->
                <div class="col-12">
                    <label class="form-label">이메일</label>
                    <div class="input-group flex-nowrap replyInput">
                        <input type="email" name="input_email" class="form-control" aria-describedby="addon-wrapping">
                        <button class="input-group-text" id="btn_email" type="button">중복확인</button>
                    </div>
                    <div class="result r_true txt_email_t">사용 가능한 이메일 입니다.</div>
                    <div class="result r_false txt_email_f">이미 존재하는 이메일 입니다.</div>
                    <div class="result txt_email_form">이메일 형식이 아닙니다. 예)vegan@vegetable.com</div>
                </div>
                <!-- 이메일 끝 -->

                <!-- 비밀번호 시작 -->
                <div class="col-12">
                    <label class="form-label">비밀번호 <span class="join-option">(영문, 숫자, 특수문자 8~20자)</span></label>
                    <div class="input-group flex-nowrap replyInput">
                        <input type="password" name="input_pwd" class="form-control" aria-describedby="addon-wrapping">
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
                        <input type="text" name="input_name" class="form-control" aria-describedby="addon-wrapping">
                    </div>
                </div>
                <!-- 이름 끝 -->

                <!-- 닉네임 시작 -->
                <div class="col-12">
                    <label class="form-label">닉네임</label>
                    <div class="input-group flex-nowrap replyInput">
                        <input type="text" name="input_nick" class="form-control" aria-describedby="addon-wrapping">
                        <button class="input-group-text" id="btn_nick" type="button">중복확인</button>
                    </div>
                    <div class="result r_true txt_nick_t">사용 가능한 닉네임 입니다.</div>
                    <div class="result r_false txt_nick_f">이미 존재하는 닉네임 입니다.</div>
                </div>
                <!-- 닉네임 끝 -->

                <!-- 전화번호 시작 -->
                <div class="col-12">
                    <label class="form-label">휴대전화번호</label>
                    <div class="input-group flex-nowrap replyInput">
                        <input type="tel" name="input_tel" class="form-control" aria-describedby="addon-wrapping">
                        <button class="input-group-text" id="btn_tel" type="button">인증하기</button>
                    </div>
                </div>
                <!-- 전화번호 끝 -->

                <!-- 주소 시작 -->
                <div class="col-12">
                    <label class="form-label">주소 <span class="join-option">[선택]</span></label>
                    <div class="input-group flex-nowrap replyInput">
                        <input type="text" name="input_addr" class="form-control" aria-describedby="addon-wrapping">
                        <button class="input-group-text" type="button">주소검색</button>
                    </div>
                </div>
                <!-- 주소 끝 -->

                <!-- 비건단계 선택 시작 -->
                <div class="col-12">
                    <label class="form-label">비건단계 <span class="join-option">[선택]</span></label>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="input_lvl" id="v1" value="A">
                        <label class="form-check-label" for="v1">
                            비건 (Vegan)
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="input_lvl" id="v2" value="B">
                        <label class="form-check-label" for="v2">
                            락토 베지테리언 (lacto-vegetarian)
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="input_lvl" id="v3" value="C">
                        <label class="form-check-label" for="v3">
                            오보 베지테리언 (ovo-vegetarian)
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="input_lvl" id="v4" value="D">
                        <label class="form-check-label" for="v4">
                            락토 오보 베지테리언 (lacto-ovo-vegetarian)
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="input_lvl" id="v5" value="E">
                        <label class="form-check-label" for="v5">
                            페스코 베지테리언 (Pescatarian 또는 Pesco-vegetarian)
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="input_lvl" id="v6" value="F">
                        <label class="form-check-label" for="v6">
                            폴로 베지테리언 (Pollotarian)
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="input_lvl" id="v7" value="G">
                        <label class="form-check-label" for="flexRadioDefault1">
                            플랙시테리언 (Flexitarian)
                        </label>
                    </div>
                </div>
                <!-- 비건단계 선택 끝 -->

                <button class="w-100 btn btn-primary btn-lg" type="button"
                    style="background-color:#55771C; border:none; margin-top: 40px;" id="btn_join">작성완료</button>
                    </div>
        </form>
    </div>

</body>
</html>