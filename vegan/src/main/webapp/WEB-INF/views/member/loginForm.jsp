<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>login</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value='/resources/css/common.css' />"> 
	<link href="${path }/resources/css/login.css" rel="stylesheet">
    
    <c:if test="${result != null && result == 'loginFailed' }">
		<script type="text/javascript">
			window.onload = function() {
				alert("이메일 또는 비밀번호가 일치하지 않습니다.");
				//frmLogin.email.focus();
			}	
		</script>
    </c:if>
</head>

<body>
   <!-- login 시작 -->
    <div class="loginBox">
        <main class="form-signin">
            <form method="post" name="frmLogin" action="${path }/member/login.do">
            	<!-- 로고 시작 -->
            	<div class="section-logo">
	                <a href="${path }/member/main"><img class="mb-4" src="<c:url value='/resources/img/vegetable_logos_finals/tight_light_mask.png' />" 
	                        alt="" height="57"></a>
                </div>
                <!-- 로고 끝 -->
                
                <div class="form-floating">
                    <input type="email" value="user01@mail.com" class="form-control" id="floatingInput" name="email" placeholder="name@example.com">
                    <label for="floatingInput">Email address</label>
                </div>
                <br />
                <div class="form-floating">
                    <input type="password" class="form-control" id="floatingPassword" name="pwd" placeholder="Password">
                    <label for="floatingPassword">Password</label>
                </div>

                <div class="checkbox mb-3">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>
                <button class="w-100 btn btn-lg btn-primary loginBtn" type="submit"
                    style="background-color:#55771C; border:none">Sign in</button>
                    
                    <!--  이메일/비밀번호 찾기, 회원가입 버튼 시작 -->
                    <div class="setion_btns">
	                    <span class="mb-3 text-muted"><button id="btn_searchEmail" type="button" class="btn_txt">이메일찾기</button></span>&nbsp;
						<span class="mb-3 text-muted" ><button id="btn_searchPwd" type="button" class="btn_txt">비밀번호찾기</button></span>&nbsp;
						<span class="mb-3 text-muted"><a href="${path }/member/join" class="aTag">회원가입</a></span>
                    </div>
                    <!--  이메일/비밀번호 찾기, 회원가입 버튼 끝 -->
                
            </form>
        </main>
    </div>
    <!-- login 끝 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
    
    <!-- 이메일 찾기 시작 -->
    <div class="box_search" id="box_searchEmail">
        <div class="inner_search">
            <div class="form-signin">
                <form action="${path}/member/search.do?command=email" method="post">
	                    <!-- 로고 시작 -->
            	<div class="section-logo">
	                <a href="${path }/member/main"><img class="mb-4" src="<c:url value='/resources/img/vegetable_logos_finals/tight_light_mask.png' />" 
	                        alt="" height="57"></a>
                </div>
                <!-- 로고 끝 -->
                    <p>회원가입 시 입력한 이름, 연락처를 입력하세요.</p>        
                    <div class="form-floating">
                        <input type="text" name="input_name" class="form-control" id="floatingInput" placeholder="이름">
                        <label for="floatingInput">이름</label>
                    </div>
                    <br />
                    <div class="form-floating">
                        <input type="text" name="input_tel" class="form-control" id="floatingPassword" placeholder="연락처">
                        <label for="floatingPassword">연락처(숫자만 입력)</label>
                    </div>

                    <div class="mb-3">
                        <!-- <label>
                            <input type="checkbox" value="remember-me"> Remember me
                        </label> -->
                    </div>
                    <button class="w-100 btn btn-lg btn-primary " type="submit"
                        style="background-color:#55771C; border:none">이메일찾기</button>
                    <!-- <span class="mt-5 mb-3 text-muted"><a href="#" class="aTag">이메일 찾기</a></span>&nbsp;
                    <span class="mt-5 mb-3 text-muted"><a href="#" class="aTag">비밀번호 찾기</a></span>&nbsp;
                    <span class="mt-5 mb-3 text-muted"><a href="#" class="aTag">회원가입</a></span> -->
                </form>
            </div>             
        </div>
        <p class="btn_exit">닫기</p>
    </div>
    <!-- 이메일 찾기 끝 -->

    <!-- 비밀번호 찾기 시작 -->
    <div class="box_search" id="box_searchPwd">
        <div class="inner_search">
            <form action="${path}/member/search.do?command=pwd" method="post">
                <!-- 로고 시작 -->
            	<div class="section-logo">
	                <a href="${path }/member/main"><img class="mb-4" src="<c:url value='/resources/img/vegetable_logos_finals/tight_light_mask.png' />" 
	                        alt="" height="57"></a>
                </div>
                <!-- 로고 끝 -->
                <p>이메일을 입력하세요</p>     
                <div class="form-floating">
                    <input type="email" class="form-control" name="input_email" id="floatingInput" placeholder="name@example.com">
                    <label for="floatingInput">이메일 (예: example@email.com)</label>
                </div>
                <br />
                <!-- <div class="form-floating">
                    <input type="text" class="form-control" id="floatingPassword" placeholder="Password">
                    <label for="floatingPassword">연락처(숫자만 입력)</label>
                </div> -->

                <div class="mb-3">
                    <!-- <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label> -->
                </div>
                <button class="w-100 btn btn-lg btn-primary " type="submit"
                    style="background-color:#55771C; border:none">비밀번호 찾기</button>
                <!-- <span class="mt-5 mb-3 text-muted"><a href="#" class="aTag">이메일 찾기</a></span>&nbsp;
                <span class="mt-5 mb-3 text-muted"><a href="#" class="aTag">비밀번호 찾기</a></span>&nbsp;
                <span class="mt-5 mb-3 text-muted"><a href="#" class="aTag">회원가입</a></span> -->
            </form>           
        </div>
        <p class="btn_exit">닫기</p>
    </div>
    <!-- 비밀번호 찾기 끝 -->
    <script src="${path }/resources/script/login.js"></script>
</body>

</html>