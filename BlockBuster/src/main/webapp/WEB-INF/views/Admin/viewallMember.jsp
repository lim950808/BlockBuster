<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ include file="../header.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String context = request.getContextPath();
    System.out.println("context->"+context);
%>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript"
src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	              
<script type="text/javascript">    

	var contextPath='${pageContext.request.contextPath}';
	var src='${pageContext.request.contextPath}/images/';
	var contextPath='${pageContext.request.contextPath}';
	var i=2;

	function memberDelete(Vindex){
	console.log(Vindex);
	var selId = $("#id"+Vindex).val();

    $.ajax(
         {
    	 	url:"<%=context%>/memberrowDelete",
    	 	data:{Id : selId },
    	 	dataType:'text',
    	 	success:function(data){
    	 		if (confirm("정말 탈퇴시키겠습니까?") == true) {
    	 			if (data == '1') {
          	 			$('#memberDelete'+Vindex).remove(); 
    	 			}
    	 		} else {
    	 			return false;
    	 		}
    	 	
    	 	}
         }
       );
	}
</script>
<style>
h2 {
	font-size: 60px;
	font-weight: bold;
	font-family: 'Montserrat', sans-serif;
	text-align: left;
	color: #fff;
  	position: relative;
  	padding: 20px; 
}
.b{
	/* background: #ff7f00; */
	font-family: 'Montserrat', sans-serif;
	font-weight: 900;
	width: 100%;
	padding: 18px;
	border:	none;
} 
.b tr{
/* 	background-color: #000; */
  	font-family: 'Montserrat', sans-serif;
  	text-align: left;
  	color: #fff;
  	cursor: pointer;
  	width: 100%;
  	padding: 18px;
 /*  	border-bottom: 1px solid #F5F5F5; */
  	border-left: 0;
  	border-right: 0;
  	border-top: 0;
  	outline: none;
  	transition: 0.4s;  
} 
.b th{
	background: #ff7f00;
	font-family: 'Montserrat', sans-serif;
	font-weight: 900;
    height: 110px;
/* 	width: 100%; */
/* 	padding: 18px; */
	border:	none;
/* 	border-bottom: 1px solid #F5F5F5; */
	color: black;
}

.b td {
	border-bottom: 1px solid #F5F5F5;
    height: 50px;
}

hr{
		background-color:#ff7f00;
}

#list:hover 
tr:hover 
td{
    background: #F5F5F5;
    color: black;
}

.pag{
	text-align: center;
}

.pag a{
	color: #F5F5F5;
	text-decoration: none;
}

.pag a:hover{
	color: #ff7f00;
}

</style>
</head>

<body>
<pre>

</pre>

<div class="container">
	<div class=title>
	<b><h2>회원 목록</h2></b>
	</div>
	
<pre>

</pre>
<c:if test="${sessionScope.sessionId eq 'admin' }"> 

	<div align="center">

	
<table id="list" class="b">
	
	<tr id="headRow" style="text-align: center; background-color: #ff7f00; color: black">
		<th><b>NO</b></th>
		<th><b>아이디</b></th>
		<th><b>이메일</b></th>
		<th><b>닉네임</b></th>	
		<th><b>관리</b></th>
	</tr>
	
	<c:forEach var="BHDto" items="${listMem}" varStatus="status">
	
	<input type="hidden" id="id${status.index}" value="${BHDto.id}" > 
	<tr id="memberDelete${status.index}" style="text-align: center;">
		<td>${status.index+1}</td>
		<td>${BHDto.id}</td>
		<td>${BHDto.email}</td>
		<td>${BHDto.nickname}</td>
<%-- 		<td><input type="button" id="memberrowdelete" value="회원 삭제" onclick="memberDelete(${status.index})"></td> --%>
		<td><input type="button" id="memberrowdelete" value="회원 삭제" onclick="memberDelete(${status.index})"></td>
	</tr>

</c:forEach>		
</table>

<pre>

</pre>

	<!-- 페이징 -->	
	<%-- 	<ul class="pag">
		<c:if test="${pg.startPage > pg.pageBlock }">
			<a href="${pageContext.request.contextPath}/Admin/viewallMember?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
		</c:if>
		
		<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
			<a href="${pageContext.request.contextPath}/Admin/viewallMember?currentPage=${i}">[${i}]</a>
		</c:forEach>
		
		<c:if test="${pg.endPage < pg.totalPage }">
			<a href="${pageContext.request.contextPath}/Admin/viewallMember?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
		</c:if>
		</ul>  --%>
</c:if>
	
	<ul class="pag">
	<c:set var="num" value="${pg.total-pg.start+1 }"></c:set>
	<c:set var="num" value="${num - 1 }"></c:set>
	<c:if test="${pg.startPage > pg.pageBlock}">
		<li class="page-item" href="${pageContext.request.contextPath}/Admin/viewallMember?currentPage=${pg.startPage - pg.pageBlock}">⬅︎</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
		<a href="${pageContext.request.contextPath}/Admin/viewallMember?currentPage=${i }">[${i}]</a>
	</c:forEach>
	<c:if test="${pg.endPage < pg.totalPage}">
		<a href="${pageContext.request.contextPath}/Admin/viewallMember?currentPage=${pg.startPage + pg.pageBlock}">➡︎︎</a>
	</c:if>
	</ul>
	
	</div> <!-- align center 끝 -->
<br><br>
<%@include file="../footer.jsp" %>
</div> <!-- container 끝 -->
</body>
</html>