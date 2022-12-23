
			let result = document.querySelectorAll('.result');
			for ( let i = 0; i < result.length; i++ ) {
				result[i].style.display = 'none';
			}
		
			let frmReset = document.frmReset;
	
			let input_pwd_r = frmReset.input_pwd_r;
			let btn_reset = document.getElementById('btn_reset');
			
			input_pwd_r.addEventListener('keyup', check_pwd); // 비밀번호 재확인
			btn_reset.addEventListener('click', valid_reset); // 비밀번호 변경 버튼
			
			function check_pwd() { // 비밀번호 재입력
				let pwd = frmReset.input_pwd.value.replaceAll(' ', '');
				let pwd_r = frmReset.input_pwd_r.value.replaceAll(' ', '');
				if (pwd == pwd_r) {
					if (pwd != "" && pwd_r != "") {
						document.querySelector('.txt_pwd_t').style.display = 'block';
						document.querySelector('.txt_pwd_f').style.display = 'none';
						document.querySelector('.txt_pwd_form').style.display = 'none';
					} else {
						document.querySelector('.txt_pwd_t').style.display = 'none';
						document.querySelector('.txt_pwd_f').style.display = 'none';
						document.querySelector('.txt_pwd_form').style.display = 'block';
						frmReset.input_pwd.value = null;
						frmReset.input_pwd_r.value = null;
						frmReset.input_pwd.focus();
					}

				} else {
					document.querySelector('.txt_pwd_form').style.display = 'none';
					document.querySelector('.txt_pwd_t').style.display = 'none';
					document.querySelector('.txt_pwd_f').style.display = 'block';
				}
			} // check_pwd 끝
			
			function valid_reset() {
				let pwd = frmReset.input_pwd.value.replaceAll(' ', '');
				let pwd_r = frmReset.input_pwd_r.value.replaceAll(' ', '');

				let st_txt_pwd_t = document.querySelector('.txt_pwd_t').style.display;
				let st_txt_pwd_f = document.querySelector('.txt_pwd_f').style.display;
				let st_txt_pwd_form = document.querySelector('.txt_pwd_form').style.display;

				if (pwd == "" || pwd == null) {
					alert("비밀번호를 입력해 주세요.");
					frmReset.input_pwd.focus();
				}
				if (st_txt_pwd_t != 'block') {
					alert("비밀번호가 일치하지 않습니다.");
					frmReset.input_pwd_r.focus();
				}
				
				if (pwd != "" || pwd != null) {
					if (st_txt_pwd_t == 'block' && st_txt_pwd_f == 'none' && st_txt_pwd_form == 'none') {
						frmReset.action = "${path }/member/resettingPwd.do?command=reset";
						frmReset.submit();
					}
				}
			} // valid_modify 끝