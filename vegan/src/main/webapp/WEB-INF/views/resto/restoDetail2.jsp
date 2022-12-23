<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="resto" value="${resto }" />
<c:set var="c_email" value="${c_email }" />
<c:set var="u_nick" value="${u_nick }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식당 상세 정보</title>
<style>
	/*.text {
		border: none;
		outline: none;
	}*/
	.footer1 {
		position: fixed;
		bottom: 0;
		margin: 0 auto;
	}

	.reviewRate {
		visibility: hidden;
	}
	
	.imageFileName {
		visibility: hidden;
	}
	
	#modal.modal-overlay {
		visibility: hidden;
		width: 590%;
		height: 0%;
		position: absolute;
		left: 0;
		top: 0;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		background: rgba(255, 255, 255, 0.25);
		box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
		backdrop-filter: blur(1.5px);
		-webkit-backdrop-filter: blur(1.5px);
		border-radius: 10px;
		border: 1px solid rgba(255, 255, 255, 0.18);
	}
	
	#modal .modal-window {
		background: rgba(69, 139, 197, 0.70);
		box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
		backdrop-filter: blur(13.5px);
		-webkit-backdrop-filter: blur(13.5px);
		border-radius: 10px;
		border: 1px solid rgba(255, 255, 255, 0.18);
		width: 800px;
		height: 1000px;
		position: relative;
		top: -550px;
		padding: 10px;
	}
	
	#modal .title {
		padding-left: 10px;
		display: inline;
		text-shadow: 1px 1px 2px gray;
		color: white;
	}
	
	#modal .title h2 {
		display: inline;
	}
	
	#modal .close-area {
		display: inline;
		float: right;
		padding-right: 10px;
		cursor: pointer;
		text-shadow: 1px 1px 2px gray;
		color: white;
	}
	
	#modal .content {
		margin-top: 20px;
		padding: 0px 10px;
		text-shadow: 1px 1px 2px gray;
		color: white;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	let reservTime;
	function readURL(input){
		if(input.files && input.files[0]){
		let reader = new FileReader();
		reader.onload = function(e){
			$("#preview").attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
		}
	}
	function fn_enable(review_no){
		var review_num = document.getElementById("review_no" + review_no);
		
		if(review_num.value == review_no){
			document.getElementById("review_content" + review_num.value).disabled=false;
			$('input[name=mod' + review_num.value + ']').hide();
			$('input[name=del' + review_num.value + ']').hide();
			$('input[name=hide' + review_num.value + ']').hide();
			$('input[name=show' + review_num.value + ']').hide();
			$('input[name=modFinish' + review_num.value + ']').prop('type', "submit");
			$('input[id=rate' + review_num.value + ']').hide();
			$('input[id=imageFileName' + review_num.value + ']').css('visibility', "visible");
			$('select[id=rate' + review_num.value + ']').css('visibility', "visible");

		}
	}
	function fn_remove(url, review_no, resto_no){
		if(confirm('정말 삭제하시겠습니까?')){
			let form = document.createElement("form");
			form.method="post";
			form.action=url;
			
			let review_noInput = document.createElement("input");
			review_noInput.setAttribute("type", "hidden");
			review_noInput.setAttribute("name", "review_no");
			review_noInput.setAttribute("value", review_no);
			
			let resto_noInput = document.createElement("input");
			resto_noInput.setAttribute("type", "hidden");
			resto_noInput.setAttribute("name", "resto_no");
			resto_noInput.setAttribute("value", resto_no);
			
			form.appendChild(review_noInput);
			form.appendChild(resto_noInput);
			document.body.appendChild(form)
			
			form.submit();
			
		} else {
			alert("삭제가 취소 되었습니다.");
		}
	}
	function fn_hide(url, review_no, resto_no){
		if(confirm('리뷰를 숨기시겠습니까?')){
			let form = document.createElement("form");
			form.method="post";
			form.action=url;
			
			let review_noInput = document.createElement("input");
			review_noInput.setAttribute("type", "hidden");
			review_noInput.setAttribute("name", "review_no");
			review_noInput.setAttribute("value", review_no);
			
			let resto_noInput = document.createElement("input");
			resto_noInput.setAttribute("type", "hidden");
			resto_noInput.setAttribute("name", "resto_no");
			resto_noInput.setAttribute("value", resto_no);
			
			form.appendChild(review_noInput);
			form.appendChild(resto_noInput);
			document.body.appendChild(form)
			
			form.submit();
		} else {
			alert("취소 되었습니다.");
		}
	}
	function fn_show(url, review_no, resto_no){
		if(confirm('리뷰가 보이게 하시겠습니까?')){
			let form = document.createElement("form");
			form.method="post";
			form.action=url;
			
			let review_noInput = document.createElement("input");
			review_noInput.setAttribute("type", "hidden");
			review_noInput.setAttribute("name", "review_no");
			review_noInput.setAttribute("value", review_no);
			
			let resto_noInput = document.createElement("input");
			resto_noInput.setAttribute("type", "hidden");
			resto_noInput.setAttribute("name", "resto_no");
			resto_noInput.setAttribute("value", resto_no);
			
			form.appendChild(review_noInput);
			form.appendChild(resto_noInput);
			document.body.appendChild(form)
			
			form.submit();
		} else {
			alert("취소 되었습니다.");
		}
	}
	function reservDetail(url, resto_no){
		let form = document.createElement("form");
		form.method="GET";
		form.action=url;
		
		var headCount = document.getElementById("headCount").innerText;
		let headCountInput = document.createElement("input");
		headCountInput.setAttribute("type", "hidden");
		headCountInput.setAttribute("name", "headCount");
		headCountInput.setAttribute("value", headCount);
		
		let reserv_schedInput = document.createElement("input");
		reserv_schedInput.setAttribute("type", "hidden");
		reserv_schedInput.setAttribute("name", "reservTime");
		reserv_schedInput.setAttribute("value", reservTime);
		
		let resto_noInput = document.createElement("input");
		resto_noInput.setAttribute("type", "hidden");
		resto_noInput.setAttribute("name", "resto_no");
		resto_noInput.setAttribute("value", resto_no);
		
		form.appendChild(headCountInput);
		form.appendChild(reserv_schedInput);
		form.appendChild(resto_noInput);
		document.body.appendChild(form)
		
		form.submit();
	}
	$(document).ready(function(){
		$(".reserv_sched").click(function(){
			reservTime = $(this).val();
			$('input[name=reservTime]').attr('value', reservTime);
		});
	});

</script>
</head>
<body>
	<input type="hidden" value="${resto.resto_no }" name="resto_no">
	<div id="restoDetail">
	<table border="1" align="center">
		<tr>
			<td><c:if test="${empty resto_imageList}">
					<img src="../resources/img/image.jpg" width="500">
				</c:if> <c:forEach var="image" items="${resto_imageList }">
					<c:if test="${image.imageFileName ne null }">
						<input type="hidden" id="originalFileName"
							value="${review.imageFileName }">
						<img src="${path }/downloadRestoImage.do?imageFileNo=${image.imageFileNo }&imageFileName=${image.imageFileName }&resto_no=${resto.resto_no }"
							width="500" align="center">
					</c:if>
				</c:forEach></td>
		</tr>
		<tr>
			<td><h3>
					식당이름 <input type="text" name="avg_rate" readonly="readonly"
						value="평점 ★ ${resto.avg_rate }">
					<textarea class="text" rows="1" cols="20" style="resize: none;"
						name="vegan" readonly="readonly">${resto.vegan }</textarea>
				</h3> <textarea class="text" rows="1" cols="65" style="resize: none;"
					name="resto_name" readonly="readonly">${resto.resto_name }</textarea><br>
				식당 소개<br> <textarea class="text" rows="3" cols="65"
					style="resize: none;" name="resto_info" readonly="readonly">${resto.resto_info }</textarea>
				<hr> 예약포인트<br> <textarea class="text" rows="1" cols="65"
					style="resize: none;" name="deposit" readonly="readonly">${resto.deposit }</textarea><br>
				<hr> 식당주소<br> <textarea class="text" rows="1" cols="65"
					style="resize: none;" name="resto_addr" readonly="readonly">${resto.resto_addr }</textarea><br>
				연락처<br> <textarea class="text" rows="1" cols="65"
					style="resize: none;" name="resto_tel" readonly="readonly">${resto.resto_tel }</textarea><br>
				<textarea class="text" rows="1" cols="65" style="resize: none;"
					name="c_email" readonly="readonly">${resto.c_email }</textarea>
				<hr> 영업시간<br> <textarea class="text" rows="1" cols="65"
					style="resize: none;" name="resto_time" readonly="readonly">${resto.resto_time }</textarea><br>
				쉬는시간<br> <textarea class="text" rows="1" cols="65"
					style="resize: none;" name="resto_break" readonly="readonly">${resto.resto_break }</textarea>
				<hr> <b>상세정보</b><br> <textarea class="text" rows="20"
					cols="65" style="resize: none;" name="resto_detail"
					readonly="readonly">${resto.resto_detail }</textarea>
				<hr></td>
	</table>
	<form method="post" name="addReview"
		action="${path }/resto/addReview.do" enctype="multipart/form-data">
		<input type="hidden" value="${resto.resto_no }" name="resto_no">
		<input type="hidden" value="${review.review_no }" name="review_no">
		<table border="1" align="center" width="500">
			<tr>
				<td>
					<div>
						<img src="" id="preview" width="500"><br> <input
							type="file" name="imageFileName" onchange="readURL(this)">
					</div>
				</td>
			</tr>
			<tr>
				<td><select name="rate">
						<option>평점</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
				</select></td>
			</tr>
			<tr>
				<td><textarea class="text" rows="5" cols="65"
						style="resize: none;" name="review_content" placeholder="내용"></textarea>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="리뷰등록"></td>
			</tr>
		</table>
	</form>
	<table border="1" align="center">
		<tr>
			<td><c:forEach var="review" items="${reviewList }">
					<c:choose>
						<c:when
							test="${resto.resto_no eq review.resto_no and review.imageFileName ne null}">
							<form method="post" action="modReview.do"
								enctype="multipart/form-data">
								<input type="hidden" value="${review.resto_no }" name="resto_no">
								<img name="imageFileName"
									src="${path }/downloadReviewImage.do?resto_no=${review.resto_no }&imageFileName=${review.imageFileName }"
									id="preview" width="500" align="center"><br> <input
									type="file" name="reviewImageFileName"
									id="imageFileName${review.review_no}" class="imageFileName"
									onchange="readURL(this)"><br>
								<c:if test="${review.show eq 'y' }">
									<input type="button" name="hide${review.review_no}" value="숨기기"
										onClick="fn_hide('${path}/resto/hideReview.do', ${review.review_no }, ${review.resto_no })">
									<br>
								</c:if>
								<c:if test="${review.show eq 'n' }">
									<input type="button" name="show${review.review_no}" value="보이기"
										onClick="fn_show('${path}/resto/showReview.do', ${review.review_no }, ${review.resto_no })">
									<br>
								</c:if>
								<textarea class="text" rows="1" cols="20" style="resize: none;"
									name="u_nick" placeholder="닉네임" disabled="disabled">${review.u_nick }</textarea>
								<br>
								<c:if test="${review.rate eq 1 }">
									<input type="text" name="rateInStar"
										id="rate${review.review_no}" placeholder="평점"
										disabled="disabled" value="★☆☆☆☆">
								</c:if>
								<c:if test="${review.rate eq 2 }">
									<input type="text" name="rateInStar"
										id="rate${review.review_no}" placeholder="평점"
										disabled="disabled" value="★★☆☆☆">
								</c:if>
								<c:if test="${review.rate eq 3 }">
									<input type="text" name="rateInStar"
										id="rate${review.review_no}" placeholder="평점"
										disabled="disabled" value="★★★☆☆">
								</c:if>
								<c:if test="${review.rate eq 4 }">
									<input type="text" name="rateInStar"
										id="rate${review.review_no}" placeholder="평점"
										disabled="disabled" value="★★★★☆">
								</c:if>
								<c:if test="${review.rate eq 5 }">
									<input type="text" name="rateInStar"
										id="rate${review.review_no}" placeholder="평점"
										disabled="disabled" value="★★★★★">
								</c:if>
								<select name="rate" class="reviewRate"
									id="rate${review.review_no}">
									<option value="${review.rate }">${review.rate }</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
								<textarea class="text" rows="1" cols="10" style="resize: none;"
									name="review_date" placeholder="리뷰일자" disabled="disabled">${review.review_date }</textarea>
								<br>
								<textarea class="text" rows="5" cols="60" style="resize: none;"
									id="review_content${review.review_no }" name="review_content"
									class="review_content" placeholder="내용" disabled="disabled">${review.review_content }</textarea>
								<br> <input type="hidden"
									name="modFinish${review.review_no}" value="수정완료"> <input
									type="button" value="수정하기" name="mod${review.review_no}"
									onClick="fn_enable(${review.review_no})"> <input
									type="button" value="삭제하기" name="del${review.review_no}"
									onClick="fn_remove('${path}/resto/removeReview.do', ${review.review_no }, ${review.resto_no })"><br>
								<hr>
								<input type="hidden" value="${review.review_no }"
									name="review_no" id="review_no${review.review_no }">
							</form>
						</c:when>
						<c:otherwise>
							<form method="post" action="modReview.do"
								enctype="multipart/form-data">
								<input type="hidden" value="${review.resto_no }" name="resto_no">
								<c:if
									test="${resto.resto_no eq review.resto_no and review.imageFileName eq null}">
									<input type="file" name="reviewImageFileName"
										id="imageFileName${review.review_no}" class="imageFileName"
										onchange="readURL(this)">
									<br>
									<c:if test="${review.show eq 'y' }">
										<input type="button" name="hide${review.review_no}"
											value="숨기기"
											onClick="fn_hide('${path}/resto/hideReview.do', ${review.review_no }, ${review.resto_no })">
										<br>
									</c:if>
									<c:if test="${review.show eq 'n' }">
										<input type="button" name="show${review.review_no}"
											value="보이기"
											onClick="fn_show('${path}/resto/showReview.do', ${review.review_no }, ${review.resto_no })">
										<br>
									</c:if>
									<textarea class="text" rows="1" cols="20" style="resize: none;"
										name="u_nick" placeholder="닉네임" disabled="disabled">${review.u_nick }</textarea>
									<br>
									<c:if test="${review.rate eq 1 }">
										<input type="text" name="rateInStar"
											id="rate${review.review_no}" placeholder="평점"
											disabled="disabled" value="★☆☆☆☆">
									</c:if>
									<c:if test="${review.rate eq 2 }">
										<input type="text" name="rateInStar"
											id="rate${review.review_no}" placeholder="평점"
											disabled="disabled" value="★★☆☆☆">
									</c:if>
									<c:if test="${review.rate eq 3 }">
										<input type="text" name="rateInStar"
											id="rate${review.review_no}" placeholder="평점"
											disabled="disabled" value="★★★☆☆">
									</c:if>
									<c:if test="${review.rate eq 4 }">
										<input type="text" name="rateInStar"
											id="rate${review.review_no}" placeholder="평점"
											disabled="disabled" value="★★★★☆">
									</c:if>
									<c:if test="${review.rate eq 5 }">
										<input type="text" name="rateInStar"
											id="rate${review.review_no}" placeholder="평점"
											disabled="disabled" value="★★★★★">
									</c:if>
									<select name="rate" class="reviewRate"
										id="rate${review.review_no}">
										<option value="${review.rate }">${review.rate }</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select>
									<textarea class="text" rows="1" cols="10" style="resize: none;"
										name="review_date" placeholder="리뷰일자" disabled="disabled">${review.review_date }</textarea>
									<br>
									<textarea class="text" rows="5" cols="60" style="resize: none;"
										id="review_content${review.review_no }" name="review_content"
										class="review_content" placeholder="내용" disabled="disabled">${review.review_content }</textarea>
									<br>
									<input type="hidden" name="modFinish${review.review_no}"
										value="수정완료">
									<input type="button" value="수정하기" name="mod${review.review_no}"
										onClick="fn_enable(${review.review_no})">
									<input type="button" value="삭제하기" name="del${review.review_no}"
										onClick="fn_remove('${path}/resto/removeReview.do', ${reviewList })">
									<br>
									<hr>
									<input type="hidden" value="${review.review_no }"
										name="review_no" id="review_no${review.review_no }">
								</c:if>
							</form>
						</c:otherwise>
					</c:choose>
				</c:forEach><br></td>
		</tr>
	</table>
	</div>
	<footer class="footer1">
		<input type="button" value="스크랩">
        <button id="btn-modal">예약하기</button>
		<a href="${path }/resto/restoList.do">홈으로</a> 
		<a href="${path }/resto/modRestoForm.do?resto_no=${resto.resto_no}">수정하기</a>
		
			
		<div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <h2>예약</h2>
            </div>
            <div class="close-area">X</div>
            <div class="content" align="center">
			<p><h2>인원수</h2><input type="button" value="-" onClick="count('minus')">
				<span id="headCount">1</span>
				<input type="button" value="+" onClick="count('plus')"><br><br><br>
		
			<c:if test="${end gt start}">
				<c:forEach var="time" begin="${start }" end="${end -50}" step="50" varStatus="status">
						<c:set var="count" value="${count + 1}" />
						<c:set var="fourDigits" value="0${time }" />
						<c:set var="oneTwo" value="${fn:substring(fourDigits,0,2) }" />
						<c:set var="threeFour" value="${fn:substring(fourDigits,2,4) }" />
						<c:set var="firstTwo" value="${fn:substring(time,0,2) }" />
						<c:set var="lastTwo" value="${fn:substring(time,2,4) }" />		
					<c:choose>
						<c:when test="${time >= startBreak and time <= endBreak }">
							<c:set var="count" value="${count -1 }" />
							<input type="hidden" class="reserv_sched">
						</c:when>
						<c:when test="${time lt 1000 and threeFour ne 50}">
							<input type="button" class="reserv_sched" value="${fourDigits }" name="${count }">
						</c:when>
						<c:when test="${time lt 1000 and threeFour eq 50}">
							<input type="button" class="reserv_sched" value="${oneTwo }30" name="${count }">
						</c:when>
						<c:when test="${time gt 1000 and lastTwo ne 50}">
							<input type="button" class="reserv_sched" value="${time }" name="${count }">
						</c:when>
						<c:when test="${time gt 1000 and lastTwo eq 50}">
							<input type="button" class="reserv_sched" value="${firstTwo }30" name="${count }">
						</c:when>
					</c:choose>
				</c:forEach>
			</c:if>
					
			<c:if test="${start gt end}">
				<c:forEach var="time" begin="${start }" end="2350" step="50">
						<c:set var="firstTwo" value="${fn:substring(time,0,2) }" />
						<c:set var="lastTwo" value="${fn:substring(time,2,4) }" />
					<c:choose>
						<c:when test="${time >= startBreak and time <= endBreak }"></c:when>
						<c:when test="${time gt 1000 and lastTwo ne 50}">
							<input type="button" class="reserv_sched" value="${time }" >
						</c:when>
						<c:when test="${time gt 1000 and lastTwo eq 50}">
							<input type="button" class="reserv_sched" value="${firstTwo }30" >
						</c:when>
					</c:choose>
				</c:forEach>
				<c:forEach var="time" begin="0" end="${end -50 }" step="50">
						<c:set var="fourDigits" value="0${time }" />
						<c:set var="oneTwo" value="${fn:substring(fourDigits,0,2) }" />
						<c:set var="threeFour" value="${fn:substring(fourDigits,2,4) }" />
					<c:choose>
						<c:when test="${time >= startBreak and time <= endBreak }"></c:when>
						<c:when test="${time eq 0}">
							<input type="button" class="reserv_sched" value="0000" >
						</c:when>
						<c:when test="${time eq 50}">
							<input type="button" class="reserv_sched" value="0030" >
						</c:when>
						<c:when test="${time lt 1000 and threeFour ne 50}">
							<input type="button" class="reserv_sched" value="${fourDigits }" >
						</c:when>
						<c:when test="${time lt 1000 and threeFour eq 50}">
							<input type="button" class="reserv_sched" value="${oneTwo }30" >
						</c:when>
					</c:choose>
				</c:forEach>
			</c:if>
				<br><input type="text" name="reservTime">
				<br><input type="button" value="예약하기" onClick="reservDetail('${path}/reserv/reservDetail.do', ${resto.resto_no})">
            </div>
        </div>
    </div>
    
    <script>
        const restoDetail = document.getElementById("restoDetail")

        function modalOn() {
            modal.style.display = "flex"
        }

        function isModalOn() {
            return modal.style.display === "flex"
        }

        function modalOff() {
            modal.style.display = "none"
        }

        const btnModal = document.getElementById("btn-modal")
        btnModal.addEventListener("click", e => {
        	$('div[id=modal]').css('visibility', "visible");
            modalOn()
        })

        const closeBtn = modal.querySelector(".close-area")
        closeBtn.addEventListener("click", e => {
            modalOff()
        })

        modal.addEventListener("click", e => {
            const evTarget = e.target
            if (evTarget.classList.contains("modal-overlay")) {
                modalOff()
            }
        })

        window.addEventListener("keyup", e => {
            if (isModalOn() && e.key === "Escape") {
                modalOff()
            }
        })
        
       	function count(type){
        	var number = document.getElementById("headCount");
        	var headCount = number.innerText;
        	
        	if(type == 'plus' && headCount != 10){
        		headCount = parseInt(headCount) + 1;
        	} else if(type == 'minus' && headCount != 1){
        		headCount = parseInt(headCount) - 1;
        	}

        	number.innerText = headCount;
        }
    </script>	
	</footer>
</body>
</html>