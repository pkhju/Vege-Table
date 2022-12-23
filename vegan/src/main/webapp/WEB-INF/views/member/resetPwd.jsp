<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
     <head>
          <meta charset="UTF-8">
          <meta http-equiv="X-UA-Compatible" content="IE=edge">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>비밀번호 재설정</title>
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
          <link href="${path }/resources/css/resetPwd.css" rel="stylesheet">
          <link href="${path }/resources/css/common.css" rel="stylesheet">
          <link href="${path }/resources/css/join.css" rel="stylesheet">
          <script src="${path }/resources/script/resetPwd.js"></script>
      
      </head>
<body>

	<c:if test="${resetting != null && resetting == true }">
		<form name="frmReset" method="post">
			<div class="col-lg-4 searchLoginInfo">
				<div class="section-logo">
	    			<a href="${path }/member/main"><img class="mb-4" src="<c:url value='/resources/img/vegetable_logos_finals/tight_light_mask.png' />" 
	                        alt="" height="57"></a>
       			</div>
				<h6>비밀번호 재설정 </h6>
				<div>${email }님 비밀번호를 재설정해 주세요.</div>
				<input type="hidden" value="${email }" name="email">
                    <!-- 비밀번호 시작 -->
                    <div class="col-12">
                        <label class="form-label">비밀번호</label>
                        <div class="input-group flex-nowrap replyInput">
                            <input type="password" name="input_pwd" class="form-control" aria-describedby="addon-wrapping"
                                placeholder=" (영문, 숫자, 특수문자 8~20자)" style="text-align: center;" maxlength="20">
                        </div>
                        <span class="result txt_pwd_form">공백은 입력할 수 없습니다.</span>
                    </div>
                    <!-- 비밀번호 끝 -->
            
                    <!-- 비밀번호 재입력 시작 -->
                    <div class="col-12">
                        <label class="form-label">비밀번호 재입력</label>
                        <div class="input-group flex-nowrap replyInput">
                            <input type="password" name="input_pwd_r" class="form-control" aria-describedby="addon-wrapping"
                                placeholder="비밀번호 재입력" style="text-align: center;" maxlength="20">
                        </div>
                        <div class="result r_true txt_pwd_t">비밀번호가 일치합니다.</div>
                    	<div class="result r_false txt_pwd_f">비밀번호가 일치하지 않습니다.</div>
                    </div>
                    <!-- 비밀번호 재입력 끝 -->
                    <button class="w-100 btn btn-primary btn-lg" type="button"
                        style="background-color:#55771C; border:none; margin-top: 40px;" id="btn_reset">비밀번호 재설정</button>
                </div>
		</form>
		
		
	</c:if>
</body>
</html>