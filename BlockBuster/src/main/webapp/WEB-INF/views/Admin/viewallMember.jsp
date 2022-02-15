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
<title>회원 목록</title>

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
    	 		if (data == '1') {
      	 			$('#memberDelete'+Vindex).remove(); 
      	 		    	 		}
    	 	}
         }
       );
	}
</script>
<style>
	hr{
		background-color:white;
	}
	table{
		width : 80%
	}
	body{
		background-color : #333;
	}
	tr{
		color : white;
	}
	a {
  		color : white;
	}
</style>
</head>

<body>
<pre>

</pre>
<div class="container">

	<h1 style="color:white;"><b>회원 목록</b></h2>
<pre>

</pre>

	<div align="center">

<table id="list" class="table table-hover">
<!-- 	<tr><th>No</th><th>아이디</th><th>이메일</th><th>닉네임</th><th>관리</th></tr> -->
	
	<tr id="headRow" style="text-align: center; background-color:#F5F5F5; color: black">
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
		<td><input type="button" id="memberrowdelete" value="회원 삭제" onclick="memberDelete(${status.index})"></td>
	</tr>
</c:forEach>		
</table>
</div> <!-- align center 끝 -->

	<!-- 페이징처리 -->	
		<c:choose>
		    <c:when test="${boardKind eq '1'}">
				<c:if test="${pg.startPage > pg.pageBlock }">
					<a href="reviewList?currentPage=${pg.startPage-pg.pageBlock}">⬅︎</a>
				</c:if>
				
				<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
					<a href="reviewList?currentPage=${i}">[${i}]</a>
				</c:forEach>
				
				<c:if test="${pg.endPage < pg.totalPage }">
					<a href="reviewList?currentPage=${pg.startPage+pg.pageBlock}">➡︎︎</a>
				</c:if>
		    </c:when>
		    <c:when test="${boardKind eq '2'}">
				<c:if test="${pg.startPage > pg.pageBlock }">
					<a href="reviewProductList?pno=${pno}&currentPage=${pg.startPage-pg.pageBlock}">⬅︎</a>
				</c:if>
				
				<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
					<a href="reviewProductList?pno=${pno}&currentPage=${i}">[${i}]</a>
				</c:forEach>
				
				<c:if test="${pg.endPage < pg.totalPage }">
					<a href="reviewProductList?pno=${pno}&currentPage=${pg.startPage+pg.pageBlock}">➡︎︎</a>
				</c:if>
		    </c:when>
		    <c:when test="${boardKind eq '3'}">
				<c:if test="${pg.startPage > pg.pageBlock }">
					<a href="search?keyword=${keyword}&currentPage=${pg.startPage-pg.pageBlock}&search_option=${Search_option}">⬅︎</a>
				</c:if>
				
				<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
					<a href="search?keyword=${keyword}&currentPage=${i}&search_option=${Search_option}">[${i}]</a>
				</c:forEach>
				
				<c:if test="${pg.endPage < pg.totalPage }">
					<a href="search?keyword=${keyword}&currentPage=${pg.startPage+pg.pageBlock}&search_option=${Search_option}">➡︎︎</a>
				</c:if>
		    </c:when>
		    
				
		</c:choose>

</div> <!-- container 끝 -->

<br><br><%@include file="../footer.jsp" %>
</body>
</html>