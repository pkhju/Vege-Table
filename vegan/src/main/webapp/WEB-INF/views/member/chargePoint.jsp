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
    <title>포인트 충전</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link href="<c:url value='/resources/css/common.css' />" rel="stylesheet">
    <link href="<c:url value='/resources/css/chargePoint.css' />" rel="stylesheet">
    <script src="<c:url value='/resources/script/mypoint.js' />"></script>    
    
<c:if test="${user_onDTO == null && client_onDTO == null }">
	<script src="<c:url value='/resources/script/noSession.js' />"></script>
</c:if>

</head>
<body>
	<!-- 충전 폼 시작 -->
	<div class="logo">
        <a href="#"><img src="<c:url value='/resources/img/vegetable_logos_finals/tight_light_mask.png' />" class="logoImg"></a>
    </div>

    <div class="col-lg-3 container">
        <h4 class="mb-3">포인트 충전</h4>

        <form class="needs-validation" novalidate name="frmCharge" method="post">

            <div class="g-3">
                <!-- 충전금액 시작 -->
                <div>
                    <label class="form-label">충전금액</label>
                    <span class="form_option">&nbsp;충전할 금액을 입력하세요. (1만원부터 충전 가능)</span>
                    <input type="text" class="form-control form30" value="20000" name="input_point" id="input_point" placeholder="충전할 금액 입력" required="required" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
                    <div class="invalid-feedback">
                        Valid restaurant name is required.
                    </div>
                </div>
                <!-- 충전금액 끝 -->
                <div class="between"></div>

                <!-- 카드종류 선택 시작 -->
                <label class="form-label" id="card_s">카드종류</label>
                <div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" checked type="radio" name="card_sort" id="card_sort1" value="개인">
                        <label class="form-check-label" for="card_sort1">개인카드</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="card_sort" id="card_sort2" value="법인">
                        <label class="form-check-label" for="card_sort2">법인카드</label>
                    </div>
                </div>
                <!-- 카드종류 선택 끝 -->

                <div class="between"></div>
                <!-- 카드번호 시작 -->
                <label class="form-label">카드번호</label>
                <div class="col-12">
                    <input type="text" class="form-control form20" name="card_no1" required id="card_no1" value="1205" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
                    <input type="text" class="form-control form20" name="card_no2" required id="card_no2" value="6378" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
                    <input type="text" class="form-control form20" name="card_no3" required id="card_no3" value="9000" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
                    <input type="text" class="form-control form20" name="card_no4" required id="card_no4" value="0343" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
                    <div class="invalid-feedback">
                        Valid restaurant name is required.
                    </div>
                </div>
                <!-- 카드번호 끝 -->
                <div class="between"></div>
                <!-- 유효기간 선택 시작 -->
                <div class="col-12" style="float:left;">
                    <label class="form-label">유효기간</label>
                    <select class="form-select form25" required name="card_valid_m" id="card_valid_m">
                        <option >선택</option>
                        <c:forEach var="i" begin="1" end="12" step="1">
                            <option value="${i }" selected="selected">${i }</option>	
                        </c:forEach>
                    </select><span class="form_option">월&nbsp;</span>
                    <div class="invalid-feedback">
                        Please select a valid level.
                    </div>
                    <select class="form-select form25" required name="card_valid_y" id="card_valid_y">
                        <option >선택</option>
                        <c:forEach var="j" begin="2022" end="2035" step="1">
                            <option value="${j }" selected="selected">${j }</option>	
                        </c:forEach>
                    </select><span class="form_option">년&nbsp;</span>
                    <div class="invalid-feedback">
                        Please select a valid level.
                    </div>
                </div>
                <!-- 유효기간 선택 끝 -->
                
                <div class="between" style="clear:both;"></div>
                <!-- 할부기간 선택 시작 -->
                <div class="col-12">
                    <label class="form-label">할부기간(월)</label>
                    <select class="form-select form25" required name="card_month">
                        <option >선택</option>
                        <option selected value="1">일시불</option>
                        <option value="2">2개월</option>	
                        <option value="3">3개월</option>	
                        <option value="4">4개월</option>	
                        <option value="5">5개월</option>
                    </select>
                    <div class="invalid-feedback">
                        Please select a valid level.
                    </div>
                </div>
                <!-- 할부기간 선택 끝 -->

                <div class="between"></div>
                <!-- 신용카드 비밀번호 시작 -->
                <label class="form-label">신용카드 비밀번호</label>
                <div class="col-lg-12">
                    <input type="password" class="form-control form20" name="card_pwd" value="55" required placeholder="**" id="card_pwd" maxlength="2"> **<span class="form_option">&nbsp;앞 두자리</span>
                    <div class="invalid-feedback">
                        Valid restaurant name is required.
                    </div>
                </div>
                <!-- 신용카드 비밀번호 끝 -->
                <div class="between"></div>
                <!-- 인증번호 시작 -->
                <div>
                    <label class="form-label">인증번호</label>
                    <span class="form_option">주민등록번호 앞 6자리 또는 사업자등록번호 10자리</span>
                    <input type="text" class="form-control form30" name="card_regiNum" required maxlength="10" value="123456" id="card_regiNum" placeholder="주민등록번호 앞 6자리 또는 사업자등록번호 10자리">
                    <div class="invalid-feedback">
                        Valid restaurant name is required.
                    </div>
                </div>
                <!-- 인증번호 끝 -->
                <button class="w-100 btn btn-primary btn-lg" type="button" style="background-color:#55771C; border:none; margin-top: 40px;" id="btn_charge">충전하기</button>
             </form>
        </div>
	</div>           
    <!-- 충전 폼 끝 -->     

	<c:if test="${user_onDTO != null }">
		<script type="text/javascript">
			btn_charge.addEventListener('click',chargeProc);
			function chargeProc() {
				frmCharge.action = "${path }/member/mypoint.do?command=charge" ;
				frmCharge.submit();
			}
		</script>
	</c:if>
	<c:if test="${client_onDTO != null }">
		<script type="text/javascript">
			btn_charge.addEventListener('click',chargeProc);
			function chargeProc() {
				frmCharge.action = "${path }/member/mypoint_c.do?command=charge" ;
				frmCharge.submit();
			}
		</script>
	</c:if>
</body>
</html>