window.onload = function () {
     // client script

	document.getElementById('container_del').style.display = 'none';
	
	let result = document.querySelectorAll('.result');
	for ( let i = 0; i < result.length; i++ ) {
		result[i].style.display = 'none';
	}
	
     let frmModify = document.frmModify;

		let input_pwd_r = frmModify.input_pwd_r;
		let btn_tel = document.getElementById('btn_tel');
		let btn_modify = document.getElementById('btn_modify');

		input_pwd_r.addEventListener('keyup', check_pwd); // 비밀번호 재확인
		btn_tel.addEventListener('click', verify_tel); // 휴대폰 인증
		btn_modify.addEventListener('click', valid_modify); // 가입버튼

		function check_pwd() { // 비밀번호 재입력
			let pwd = frmModify.input_pwd.value.replaceAll(' ', '');
			let pwd_r = frmModify.input_pwd_r.value.replaceAll(' ', '');
			if (pwd == pwd_r) {
				if (pwd != "" && pwd_r != "") {
					document.querySelector('.txt_pwd_t').style.display = 'block';
					document.querySelector('.txt_pwd_f').style.display = 'none';
					document.querySelector('.txt_pwd_form').style.display = 'none';
				} else {
					document.querySelector('.txt_pwd_t').style.display = 'none';
					document.querySelector('.txt_pwd_f').style.display = 'none';
					document.querySelector('.txt_pwd_form').style.display = 'block';
					frmModify.input_pwd.value = null;
					frmModify.input_pwd_r.value = null;
					frmModify.input_pwd.focus();
				}

			} else {
				document.querySelector('.txt_pwd_form').style.display = 'none';
				document.querySelector('.txt_pwd_t').style.display = 'none';
				document.querySelector('.txt_pwd_f').style.display = 'block';
			}
		} // check_pwd 끝

		function verify_tel() {
		} // 휴대폰 인증

		function valid_modify() {
			let name = frmModify.input_name.value.replaceAll(' ', '');
			let tel = frmModify.input_tel.value.replaceAll(' ', '');
			let pwd = frmModify.input_pwd.value.replaceAll(' ', '');
			let pwd_r = frmModify.input_pwd_r.value.replaceAll(' ', '');

			let st_txt_pwd_t = document.querySelector('.txt_pwd_t').style.display;
			let st_txt_pwd_f = document.querySelector('.txt_pwd_f').style.display;
			let st_txt_pwd_form = document.querySelector('.txt_pwd_form').style.display;

			if (pwd == "" || pwd == null) {
				alert("비밀번호를 입력해 주세요.");
				frmModify.input_pwd.focus();
			}
			if (st_txt_pwd_t != 'block') {
				alert("비밀번호가 일치하지 않습니다.");
				frmModify.input_pwd_r.focus();
			}
			if (name == "" || name == null) {
				alert("이름을 입력해 주세요");
				frmModify.input_name.focus();
			}
			if (tel == "" || tel == null) {
				alert("휴대폰번호를 입력해 주세요");
				frmModify.input_tel.focus();
			}

			if (pwd != "" || pwd != null) {
				if (st_txt_pwd_t == 'block' && st_txt_pwd_f == 'none'
						&& st_txt_pwd_form == 'none') {
					if (name != "" || name != null) {
						if (tel != "" || tel != null) {
							frmModify.action = "/vegan/member/mypage.do?command=modify";
							frmModify.submit();
						}
					}
				}
			}
		} // valid_modify 끝
     // 회원정보수정 script 끝     
          
     // 계정 비활성화 스크립트
       	let btn_delete = document.getElementById('btn_delete');
		 
        let btn_exit = document.getElementById('btn_exit');
        let del_result1 = document.getElementById('del_result1');
        let del_result2 = document.getElementById('del_result2');
        let del_ask = document.getElementById('del_ask');
        let del_proc  = document.getElementById('del_proc');

        btn_exit.addEventListener('click',delExit);
        btn_delete.addEventListener('click', showDelete);

        
        function delExit() {
             container_del.style.display = 'none';
        }
     // 계정 비활성화 스크립트 끝
}