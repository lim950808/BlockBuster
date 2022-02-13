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
table {
  border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 400px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

td {
  text-align: center;
}
tr {

  hover background-color: #7ED2FF;
}

</style>
</head>

<body>
<h2>회원 목록</h2>
<table border=1  width=1000 >
	<tr><th>No</th><th>아이디</th><th>이메일</th><th>닉네임</th><th>관리</th></tr>
<c:forEach var="BHDto" items="${listMem}" varStatus="status">
	<input type="hidden" id="id${status.index}" value="${BHDto.id}" > 
	<tr id="memberDelete${status.index}">
		<td>${status.index+1}</td>
		<td>${BHDto.id}</td>
		<td>${BHDto.email}</td>
		<td>${BHDto.nickname}</td>
		<td><input type="button" id="memberrowdelete" value="회원 삭제" onclick="memberDelete(${status.index})"></td>
	</tr>
</c:forEach>	
	
</table>
</body>
<%@ include file="../footer.jsp" %>
</html>