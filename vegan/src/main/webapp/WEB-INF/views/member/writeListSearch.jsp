<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function viewSearchList(){
	// 3. url로 넘긴 컨트롤러에서 실행한 sql결과(result)를 foreach로 돌려서 div id writeList에 검색시마다 넣어줌
	$.ajax({
		type: 'GET',
		url : "${path}/member/viewSearchList.do",
		data : $("form[name=search-form]").serialize(),
		success : function(result){
			// 4. 테이블 초기화
			$('#writeList > div').empty();
			if(result.length>=1){
				result.forEach(function(item){
					str = "<div><a href='${path }/community/viewArticle.do?c_articleNo="+item.c_articleNo+"'>";
					str +=" <span>"+item.c_title+"</span><span>"+item.u_nick+"</span><span>"+item.u_email+"</span><span>"+item.c_writeDate+"</span></a></div>";
					
					$('#writeList').append(str);
        		});			 
			}
		}, error : function() {
			alert('잘 안됨');
		}
	});
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="search-form" autocomplete="off">
	<!-- 1. 검색기능할 때 폼에 네임만 일단 지정 
		2. 검색 필터(search_type)과 검색할 내용(keyword) 인풋으로 추가하고 테이블과 디티오에도
		컬럼추가하기
		인풋 버튼 온클릭으로 ajax 자스 메서드 실행 
		-->
		<input type="hidden" name="c_category" value="all">
		<select name="search_type">
			<option selected="selected" value="">검색 필터 선택</option>
			<option value="c_title">제목</option>
			<option value="u_nick">닉네임</option>
			
		</select>
		<input type="search" name="keyword" placeholder="제목 또는 닉네임 입력">
		<input type="button" onclick="viewSearchList()" value="검색">
		
		
		<div id="writeList">
			<div>
				
			</div>
		</div>
		
		
		
	</form>
</body>
</html>