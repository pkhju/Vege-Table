<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 사업자 회원 가입 </title>
<link href="<c:url value='/resources/css/common.css' />" rel="stylesheet">
<link href="<c:url value='/resources/css/join.css' />" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
	.input_list {
		list-style: none;
	}
	.input_list li {
		margin-bottom: 20px;
	}
	.input_list li:nth-child(2) {
		width: 350px;
	}
	.tit_h4 {
		margin: 0;
		padding: 0;
	}
	.result {
		font-size: 14px;
		color: #555;
	}
	.r_false {
		color: red;
	}
	.option {
		font-size: 12px;
	}
	.txt_pwd_form {
		float: right;
	}
</style>
<script type="text/javascript">
	window.onload = function () {
		let result = document.querySelectorAll('.result');
		for ( let i = 0; i < result.length; i++ ) {
			result[i].style.display = 'none';
		}
	}
</script>
</head>
<body>
	<div class="logo">
        <a href="${path }/member/main"><img src="<c:url value='/resources/img/vegetable_logos_finals/tight_light_mask.png' />" class="logoImg"></a>
    </div>
	<form name="frmJoin" method="post">
	<div class="col-lg-3 container">
		<ul class="input_list" style="">
			<li>
				<div class="col-12">
				<div class="input-group flex-nowrap replyInput">
				<h4 class="tit_h4">이메일</h4>
				<input type="email" name="input_email" value="user08@mail.com"> <!-- @
				<select name="input_email_address"> 
					<option value="email.com">email.com</option>
					<option value="test.com">test.com</option>
				</select> -->
				<input type="button" value="중복확인" id="btn_email">
				</div>
				<div class="result r_true txt_email_t">사용 가능한 이메일 입니다.</div>
				<div class="result r_false txt_email_f">이미 존재하는 이메일 입니다.</div>
				<div class="result txt_email_form">이메일 형식이 아닙니다. 예) vegan@vegetable.com</div>
				</div>
			</li>
			<li>
				<h4 class="tit_h4">비밀번호<span class="option"> (영문, 숫자, 특수문자 8-20자)</span></h4>
				<input type="password" placeholder="비밀번호 " name="input_pwd" value="8888">
				<span class="result txt_pwd_form">공백은 입력할 수 없습니다.</span>
			</li>
			<li>
				<h4 class="tit_h4">비밀번호 재입력</h4>
				<input type="password" name="input_pwd_r" placeholder="비밀번호 재입력">
				<div class="result r_true txt_pwd_t">비밀번호가 일치합니다.</div>
				<div class="result r_false txt_pwd_f">비밀번호가 일치하지 않습니다.</div>
			</li>
			<li>
				<h4 class="tit_h4">이름</h4>
				<input type="text" placeholder="이름 입력" name="input_name" value="user08">
			</li>		
			<li>
				<h4 class="tit_h4">사업자등록번호</h4>
				<input type="number" name="regiNum" placeholder="사업자등록번호 10자리 입력" maxlength="10">
			</li>
			<li>
				<h4 class="tit_h4">영업허가번호</h4>
				<input type="number" name="certify" placeholder="영업허가번호 10자리 입력" maxlength="10">
			</li>
			<li>
				<h4 class="tit_h4">휴대폰 번호</h4>
				<input type="tel" name="input_tel" placeholder="휴대폰 번호 ('-' 없이 입력)" value="01020203030">
				<input type="button" value="인증하기" id="btn_tel">
			</li>	
			<li>
				<input type="button" value="가입하기" id="btn_join">
			</li>
		</ul>
		</div>
	</form>
	
<script type="text/javascript">
	let frmJoin = document.frmJoin;
	
	let btn_email = document.getElementById('btn_email');
	let input_pwd_r = frmJoin.input_pwd_r;
	let btn_tel = document.getElementById('btn_tel');
	let btn_join = document.getElementById('btn_join');
	
	btn_email.addEventListener('click', duplicate_input); // 중복확인
	input_pwd_r.addEventListener('keyup', check_pwd); // 비밀번호 재확인
	btn_tel.addEventListener('click', verify_tel); // 휴대폰 인증
	btn_join.addEventListener('click', valid_join); // 가입버튼
	
	function duplicate_input() {
		// 입력받은 email 값을 보내서 중복확인하고 다시 페이지로 와야함
		// ajax로 해야함
		let e_target = event.target.id;
		let email = frmJoin.input_email.value.replaceAll(' ','');
		if ( e_target == 'btn_email' && email != "" ) {
			if ( email.includes('@', 1) == true) {
				$.ajax({
					type: "POST",
					dataType: "text",
					async: "false",
					url: "${path }/member/join.do?command=duplicate_email",
					data: { "input_email": frmJoin.input_email.value },
					success: function ( data ) {
					// 사용 가능한 아이디 입니다. 출력, 중복확인 버튼 비활성화
					// 이미 존재하는 아이디다 -> false
					// 가입 가능한 아이디다 -> true
						 if ( data == 'true' ) {
							btn_email.disabled = true;
							frmJoin.input_email.readOnly = true;
							document.querySelector('.txt_email_t').style.display = 'block';
							document.querySelector('.txt_email_f').style.display = 'none';
							document.querySelector('.txt_email_form').style.display = 'none';
						} else {
							document.querySelector('.txt_email_form').style.display = 'none';
							document.querySelector('.txt_email_t').style.display = 'none';
							document.querySelector('.txt_email_f').style.display = 'block';
						} 
					},
					error:function(data, textStatus) {
						alert("에러가 발생했습니다.");
					}
				});
			} else {
				// 이메일 형식이 아닙니다. 예) vegan@vegetable.com
				document.querySelector('.txt_email_form').style.display = 'block';
				document.querySelector('.txt_email_t').style.display = 'none';
				document.querySelector('.txt_email_f').style.display = 'none';
				frmJoin.input_email.value = null;
				frmJoin.input_email.focus();
			}
			
		} else if ( e_target == 'btn_nick' && nick != "" ) {
			$.ajax({
				type: "POST",
				dataType: "text",
				async: "false",
				url: "${path }/member/join.do?command=duplicate_nick",
				data: { "input_nick": frmJoin.input_nick.value },
				success: function ( data ) {
					 if ( data == 'true' ) {
						btn_nick.disabled = true;
						frmJoin.input_nick.readOnly = true;
						document.querySelector('.txt_nick_t').style.display = 'block';
						document.querySelector('.txt_nick_f').style.display = 'none';
					} else {
						document.querySelector('.txt_nick_t').style.display = 'none';
						document.querySelector('.txt_nick_f').style.display = 'block';
					} 
				},
				error:function(data, textStatus) {
					alert("에러가 발생했습니다.");
				}
			});
		}
		
	}
	function check_pwd () { // 비밀번호 재입력
		let pwd = frmJoin.input_pwd.value.replaceAll(' ','');
		let pwd_r = frmJoin.input_pwd_r.value.replaceAll(' ','');
		if ( pwd == pwd_r  ) {
			if ( pwd != "" && pwd_r != "" ) {
				document.querySelector('.txt_pwd_t').style.display = 'block';
				document.querySelector('.txt_pwd_f').style.display = 'none';
				document.querySelector('.txt_pwd_form').style.display = 'none';
			} else {
				document.querySelector('.txt_pwd_t').style.display = 'none';
				document.querySelector('.txt_pwd_f').style.display = 'none';
				document.querySelector('.txt_pwd_form').style.display = 'block';
				frmJoin.input_pwd.value = null;
				frmJoin.input_pwd_r.value = null;
				frmJoin.input_pwd.focus();
			}
			
		} else {
			document.querySelector('.txt_pwd_form').style.display = 'none';
			document.querySelector('.txt_pwd_t').style.display = 'none';
			document.querySelector('.txt_pwd_f').style.display = 'block';
		}
	}
	
	function verify_tel() {} // 휴대폰 인증
	
	function valid_join() {
		let email = frmJoin.input_email.value.replaceAll(' ','');
		let name = frmJoin.input_name.value.replaceAll(' ','');
		let tel = frmJoin.input_tel.value.replaceAll(' ','');
		let nick = frmJoin.input_nick.value.replaceAll(' ','');
		let pwd = frmJoin.input_pwd.value.replaceAll(' ','');
		let pwd_r = frmJoin.input_pwd_r.value.replaceAll(' ','');
		
		let st_txt_email_t = document.querySelector('.txt_email_t').style.display;
		let st_txt_email_f = document.querySelector('.txt_email_t').style.display;
		let st_txt_email_form = document.querySelector('.txt_email_t').style.display;
		
		let st_txt_pwd_t = document.querySelector('.txt_pwd_t').style.display;
		let st_txt_pwd_f = document.querySelector('.txt_pwd_f').style.display;
		let st_txt_pwd_form = document.querySelector('.txt_pwd_form').style.display;
		
		let st_txt_nick_t = document.querySelector('.txt_nick_t').style.display;
		let st_txt_nick_f = document.querySelector('.txt_nick_f').style.display;
		
		if ( st_txt_email_t != 'block') {
			// 중복확인이 완료되지 않은 경우
			alert("이메일 입력 및 중복확인이 필요합니다.");
			frmJoin.input_email.focus();
		}
		if ( pwd == "" || pwd == null ) {
			alert("비밀번호를 입력해 주세요.");
			frmJoin.input_pwd.focus();
		}
		if ( st_txt_pwd_t != 'block' ) {
			alert("비밀번호가 일치하지 않습니다.");
			frmJoin.input_pwd_r.focus();
		}
		if ( name == "" || name == null ) {
			alert("이름을 입력해 주세요");
			frmJoin.input_name.focus();
		}
		if ( st_txt_nick_t != 'block') {
			// 중복확인이 완료되지 않은 경우
			alert("닉네임 입력 및 중복확인이 필요합니다.");
			frmJoin.input_nick.focus();
		}
		if ( tel == "" || tel == null ) {
			alert("휴대폰번호를 입력해 주세요");
			frmJoin.input_tel.focus();
		}
		console.log("빈칸검사");
		if ( st_txt_email_t == 'block' ) {
			// 중복확인이 된 경우
			console.log("이메일");
			if ( pwd != "" || pwd != null ) {
				console.log("비밀번호");
				if ( st_txt_pwd_t == 'block' && st_txt_pwd_f == 'none' && st_txt_pwd_form == 'none' ) {
					console.log("비밀번호재확인");
					if ( name != "" || name != null ) {
						console.log("이름");
						if ( st_txt_nick_t == 'block' && st_txt_nick_f == 'none' ) {
							console.log("닉네임");
							if ( tel != "" || tel != null ) {
								console.log("전화번호");
								frmJoin.action = "${path }/member/joinProc.do";
								frmJoin.submit();
							}
						}
					}
				}
			}
		}
		
	}
	
</script>
</body>
</html>