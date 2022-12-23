<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="c" value="${articleMap.com }" />
<c:set var="list" value="${articleMap.list }" />
<c:set var="imageFileList" value="${articleMap.imageFileList }" />

<!DOCTYPE html>
<html>
<style>
.o_img {
	width: 200px;
	height: auto;
}
 div.Modal { position:relative; z-index:1; display: none; }
 div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
 div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:500px; height:250px; padding:20px 10px; background:#fff; border:2px solid #666; }
 div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px; height:200px; }
 div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 div.modalContent button.modal_cancel { margin-left:20px; }
 
 
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function btnClick0(clicked_id) { // 하얀 버튼 클릭 시 하얀 버튼 사라지고 검은 버튼 나오게 함
    let btnHeart = document.getElementById(clicked_id); // 하얀 버튼 id의 object 저장
    let blk = "blk";
    btnHeart.style.display = "none";    // 하얀버튼 object 안보이게 함

    let btnBlack = document.getElementById(blk.concat(clicked_id));    // blk id의 object 저장

    btnBlack.style.display = "inline"
    
     $.ajax({
    	type: 'GET',
    	url : "${path}/community/scrap.do",
    	data : $("form[name=scrap_form]").serialize(),
    	success : function(result){
    		
    	    	$("#scrap_span > span").empty();
    	    	
    	        str = "<span>"+result+"</span>";
    	        				
    	        $("#scrap_span").append(str);
    	    	
    	}, error : function() {
    		}
    	});
    
    
}

function btnClick1(clicked_id) { // 하얀 버튼 클릭 시 하얀 버튼 사라지고 검은 버튼 나오게 함
    let btnHeart = document.getElementById(clicked_id); // 하얀 버튼 id의 object 저장
    let blk = "blk";
    btnHeart.style.display = "none";    // 하얀버튼 object 안보이게 함

    let btnBlack = document.getElementById(blk.concat(clicked_id));    // blk id의 object 저장

    btnBlack.style.display = "inline"
    
     $.ajax({
    	type: 'GET',
    	url : "${path}/community/heart.do",
    	data : $("form[name=heart_form]").serialize(),
    	success : function(result){
    		
    	    	$("#heart_span > span").empty();
    	    	
    	        str = "<span>"+result+"</span>";
    	        				
    	        $("#heart_span").append(str);
    	    	
    	}, error : function() {
    			
    		}
    	});
    
    
}

function btnClick00(clicked_id) {
   alert('로그인후 이용 가능');
}

function btnClickAgain0(clicked_id) {
    let btnHeartBlack = document.getElementById(clicked_id);

    btnHeartBlack.style.display = "none";

    let btnHeart = document.getElementById(clicked_id.substring(3));

    btnHeart.style.display = "inline";

	 $.ajax({
	    	type: 'GET',
	    	url : "${path}/community/scrapCancel.do",
	    	data : $("form[name=scrap_form]").serialize(),
	    	success : function(result){
	    	    	$("#scrap_span > span").empty();
	    	        str = "<span>"+result+"</span>";	
	    	        $("#scrap_span").append(str);
	    	    		
	    	}, error : function() {
	    			
	    		}
	    	});



}
function btnClickAgain1(clicked_id) {
    let btnHeartBlack = document.getElementById(clicked_id);

    btnHeartBlack.style.display = "none";

    let btnHeart = document.getElementById(clicked_id.substring(3));

    btnHeart.style.display = "inline";

	 $.ajax({
	    	type: 'GET',
	    	url : "${path}/community/heartCancel.do",
	    	data : $("form[name=heart_form]").serialize(),
	    	success : function(result){
	    	    	$("#heart_span > span").empty();
	    	        str = "<span>"+result+"</span>";	
	    	        $("#heart_span").append(str);
	    	    		
	    	}, error : function() {
	    			
	    		}
	    	});



}

	function backToList() {
		location.href="${path }/community/community.do";
	}
	function deleteArticle(url, c_articleNo) {
		if (confirm('정말로 삭제하시겠습니까?')) {
			let form = document.createElement("form");
			
			form.method="post";
			form.action=url;
			
			let c_articleNoInput = document.createElement("input");
			c_articleNoInput.setAttribute("type", "hidden");
			c_articleNoInput.setAttribute("name", "c_articleNo");
			c_articleNoInput.setAttribute("value", c_articleNo);
			
			form.appendChild(c_articleNoInput);
			document.body.appendChild(form);
			
			form.submit();
		} else {
			alert('삭제 취소');
		}
	}
	function deleteReply(url, reply_no, c_articleNo) {
		if (confirm('정말로 삭제하시겠습니까?')) {
			let form = document.createElement("form");
			
			form.method="post";
			form.action=url;
			
			let reply_noInput = document.createElement("input");
			reply_noInput.setAttribute("type", "hidden");
			reply_noInput.setAttribute("name", "reply_no");
			reply_noInput.setAttribute("value", reply_no);
			
			let c_articleNoInput = document.createElement("input");
			c_articleNoInput.setAttribute("type", "hidden");
			c_articleNoInput.setAttribute("name", "c_articleNo");
			c_articleNoInput.setAttribute("value", c_articleNo);
			
			form.appendChild(reply_noInput);
			form.appendChild(c_articleNoInput);
			document.body.appendChild(form);
			
			form.submit();
		} else {
			alert('삭제 취소');
		}
	}
	function modalView() {
		$(".Modal").fadeIn(200);
	}
	
	
	
</script>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../resources/css/common.css" rel="stylesheet">
    <link href="../resources/css/feedCard.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="../resources/script/community.js"></script>
<title>Insert title here</title>
</head>
<body>
	
	
		<!-- feedCard 시작-->
    <div class="container col-lg-3">
        <div class="imgContainer">
            <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">

                <div class="carousel-inner">
                    <c:forEach var="image" items="${imageFileList }">
                    <div class="carousel-item active" data-bs-interval="5000">
                        <img src="${path }/download.do?c_articleNo=${image.c_articleNo}&c_image=${image.c_image}" alt="/resources." style="height:300px">
                    </div>
                   </c:forEach>
                   <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
                </div>
				
					
				
                
            </div>
        </div>
        
        <div class="iconBox">
        
           <form name="heart_form" style="display: inline;">
            <input type="hidden" name="c_articleNo" value="${c.c_articleNo }">
            <c:choose>
            	<c:when test="${userLogOn != null && com_heartDTO != null }">
            		<c:forEach var="heart" items="${com_heartDTO }">
            			
            			<c:if test="${heart.c_articleNo == c.c_articleNo }">
            				 <img src="../resources/img/icon/heartFull_icon.png" class="icon" onclick="btnClickAgain1(this.id)" id="blkbtnHeart1">
            				<script>
            				$(function() {
            					$("#btnHeart1").css({"display": "none"});
							});
            					
            				</script>
            			</c:if>
            			
            		</c:forEach>
            		<img src="../resources/img/icon/heart_icon.png" class="icon" onclick="btnClick1(this.id)" id="btnHeart1">
            <img src="../resources/img/icon/heartFull_icon.png" class="icon" onclick="btnClickAgain1(this.id)" id="blkbtnHeart1"
                style="display:none">
            	</c:when>
            	<c:otherwise>
            			 <img src="../resources/img/icon/heart_icon.png" class="icon" onclick="btnClick00(this.id)" id="btnHeart00">
            
            		</c:otherwise>
            </c:choose>
            
            <span id="heart_span"><span>${c.heart }</span></span>
            </form>
            <img src="../resources/img/icon/text_icon.png" class="icon" onclick="">
            <span>${c.reply_cnt }</span>
            <form name="scrap_form" style="display: inline;">
            <input type="hidden" name="c_articleNo" value="${c.c_articleNo }">
            <c:choose>
            	<c:when test="${userLogOn != null && com_scrapDTO != null }">
            		<c:forEach var="com" items="${com_scrapDTO }">
            			
            			<c:if test="${com.c_articleNo == c.c_articleNo }">
            				 <img src="../resources/img/icon/scrapFull_icon.png" class="icon" onclick="btnClickAgain0(this.id)" id="blkbtnScrap0">
            				<script>
            				$(function() {
            					$("#btnScrap0").css({"display": "none"});
							});
            					
            				</script>
            			</c:if>
            			
            		</c:forEach>
            		<img src="../resources/img/icon/scrap_icon.png" class="icon" onclick="btnClick0(this.id)" id="btnScrap0">
            <img src="../resources/img/icon/scrapFull_icon.png" class="icon" onclick="btnClickAgain0(this.id)" id="blkbtnScrap0"
                style="display:none">
            	</c:when>
            	<c:otherwise>
            			 <img src="../resources/img/icon/scrap_icon.png" class="icon" onclick="btnClick00(this.id)" id="btnScrap00">
            
            		</c:otherwise>
            </c:choose>
            
            <span id="scrap_span"><span>${c.c_scraps }</span></span>
            </form>
        </div>
        <div class="contentBox">
            <h5 class="content">${c.c_title }</h5>
            <p class="content">${c.c_content }</p>
        </div>
		
		<form name="form" method="post" enctype="multipart/form-data">
		<div>
		<input type="button" value="커뮤니티 목록" onclick="backToList()">
		<c:if test="${user_onDTO.u_email == c.u_email }">
			<input type="button" value="수정" onclick="modalView()">
			<input type="button" value="삭제" onclick="deleteArticle('${path}/community/deleteArticle.do', ${c.c_articleNo })">
		</c:if>
	</div>
	<hr>
	</form>
		
		
		
		
        <div class="replyBox">
            <c:forEach var="l" items="${list }">
            <!--댓글영역-->
            <div class="replyUnit">
                <hr />
                <strong class="writer">${l.u_nick }</strong>
                <p class="reply">${l.reply_content }</p>
                <c:if test="${user_onDTO.u_email == l.u_email }">
						<input type="button" value="수정" >
						<input type="button" value="삭제" onclick="deleteReply('${path}/community/deleteReply.do', ${l.reply_no }, ${c.c_articleNo })">
					</c:if>
            </div>
            </c:forEach>
        </div>
        
					
						
						
						
						
					
        <form role="form" method="post" autocomplete="off">
        <input type="hidden" name="c_articleNo" value="${c.c_articleNo }">
						<input type="hidden" name="u_email" value="${user_onDTO.u_email }">
         <div class="input-group flex-nowrap replyInput">
         <c:choose>
         	<c:when test="${userLogOn != null && user_onDTO != null  }">
         		<input type="text" name="reply_content" class="form-control" aria-describedby="addon-wrapping" placeholder="댓글을 입력해주세요"
                onkeyup="if(window.event.keyCode==13){submitReply()}">
                <button type="submit" class="input-group-text" id="addon-wrapping" >댓글 등록</button>
         	</c:when>
         	<c:when test="${isAdminLogOn != null && user_onDTO != null  }">
         		<input type="text" name="reply_content" class="form-control" aria-describedby="addon-wrapping" placeholder="댓글을 입력해주세요"
                onkeyup="if(window.event.keyCode==13){submitReply()}">
                <button type="submit" class="input-group-text" id="addon-wrapping" >댓글 등록</button>
         	</c:when>
         	<c:otherwise>
         		<input type="text" name="reply_content" class="form-control" aria-describedby="addon-wrapping" placeholder="로그인후 작성가능"
                onkeyup="if(window.event.keyCode==13){submitReply()}" disabled="disabled">
                <button type="button" class="input-group-text" id="addon-wrapping" onclick="btnClick00(this.id)">댓글 등록</button>
         	</c:otherwise>
         </c:choose>
            
                
            
        </div>
        </form>
    </div>
    
    <!-- feedCard 끝 -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
	
	
	
	
	
	
	
	
	
	
	
	
	<div class="Modal">
	<form action="${path }/community/modArticle.do" method="post">
		<div class="modalContent">
			<div>
				<input type="hidden" name="c_articleNo" value="${c.c_articleNo }">
				<input type="text" class="modal_title" name="c_title" value="${c.c_title }">
				<textarea class="modal_content" name="c_content" >${c.c_content }</textarea>
			</div>
			<div>
				<input type="submit" class="modal_modify_btn" value="수정">
				<input type="button" class="modal_cancel" value="뒤로">
			</div>
		</div>
		<div class="modalBackground"></div>
	</form>
	</div>
	<script>
		$(".modal_cancel").click(function(){
 			$(".Modal").fadeOut(200);
			});
	</script>
	
	
</body>
</html>