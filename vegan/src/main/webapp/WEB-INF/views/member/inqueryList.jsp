<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function viewInqueryList(){
	$.ajax({
		type: 'GET',
		url : "${path}/member/viewInqueryList.do",
		data : $("form[name=search-form]").serialize(),
		success : function(result){
			//테이블 초기화
			$('#inqueryList > div').empty();
			if(result.length>=1){
				result.forEach(function(item){
					str = "<div><a href='${path }/community/viewInquery.do?iq_no="+item.iq_no+"'>";
					str +=" <span>"+item.u_email+"</span><span>"+item.iq_title+"</span><span>"+item.iq_writeDate+"</span></a></div>";
					
					$('#inqueryList').append(str);
        		});			 
			}
		}, error : function() {
			alert('잘 안됨');
		}
	});
}
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="search-form" autocomplete="off">
		<select name="search_type">
			<option selected="selected" value="">전체</option>
			<option value="iq_title">제목</option>
			<option value="u_email">유저메일</option>
		</select>
		<input type="search" name="keyword" placeholder="제목 또는 유저 이메일 입력">
		<input type="button" onclick="viewInqueryList()" value="검색">
		<div id="inqueryList">
			<div>
				
			</div>
		</div>
		
	</form>
</body>
</html>