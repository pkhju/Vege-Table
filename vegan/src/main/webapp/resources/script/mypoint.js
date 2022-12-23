window.onload = function () {
	let frmCharge = document.frmCharge;
	let card_sort = frmCharge.card_sort;
	let input_point = frmCharge.input_point;
	let card_no1 = frmCharge.card_no1;
	let card_no2 = frmCharge.card_no2;
	let card_no3 = frmCharge.card_no3;
	let card_no4 = frmCharge.card_no4;
	let card_valid_m = frmCharge.card_valid_m;
	let card_valid_y = frmCharge.card_valid_y;
	let card_month = frmCharge.card_month;
	let card_pwd = frmCharge.card_pwd;
	let card_regiNum = frmCharge.card_regiNum;
	
	let btn_charge = document.getElementById('btn_charge'); 

	btn_charge.addEventListener('click', validation);

	function validation() {	
		
		if ( input_point.value < 10000 ) {
			alert('1만원 이상부터 충전 가능합니다.');
			input_point.focus();
			return;
		}

		if ( input_point.value > 1000000 ) {
			alert('충전할 금액을 한 번 더 확인해 주세요.');
			input_point.focus();
			return;
		}
	
		if ( card_sort[0].checked == false && card_sort[1].checked == false ) {
			alert('카드 종류를 선택하세요.');
			return;
		}
		if ( card_no1.value.substr(3) == "" ) {
			alert('카드 번호를 입력하세요.');
			card_no1.focus();
			return;
		}
		if ( card_no2.value.substr(3) == "" ) {
			alert('카드 번호를 입력하세요.');
			card_no2.focus();
			return;
		}
		if ( card_no3.value.substr(3) == "" ) {
			alert('카드 번호를 입력하세요.');
			card_no3.focus();
			return;
		}
		if ( card_no4.value.substr(3) == "" ) {
			alert('카드 번호를 입력하세요.');
			card_no4.focus();
			return;
		}

		if ( card_valid_m.value == '선택' ) {
			alert('카드 유효기간을 선택하세요.');
			card_valid_m.focus();
			return;
		}
		if ( card_valid_y.value == '선택' ) {
			alert('카드 유효기간을 선택하세요.');
			card_valid_y.focus();
			return;
		}

		if ( card_month.value == '선택' ) {
			alert('할부기간을 선택하세요.');
			card_month.focus();
			return;
		}

		if ( card_pwd.value.substr(1) == "" ) {
			alert('카드 비밀번호 앞 두자리를 입력하세요.');
			card_pwd.focus();
			return;
		}

		if ( card_regiNum.value.substr(5) == "" ) {
			alert('인증번호를 입력하세요.');
			card_regiNum.focus();
			return;
		}
				
	};		
};





