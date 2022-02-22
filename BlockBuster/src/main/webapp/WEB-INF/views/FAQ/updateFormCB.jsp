<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateForm</title>

<style type="text/css">
body {	
	font: sans-serif; 
	/* text-align: center;	 */
}
.updateFormCB { 
	width: 100%; 
	border: 3px ridge #ff7f00; 
}
.updateFormCB tr { 
	background: #333; 
	height: 30px; 
}
.updateFormCB th {	
	background: #333; 
	text-align: center; 
	color: #fff; 
	padding-right: 40px;
	padding-left: 20px;
}
.updateFormCB td {
	background: #333; 
	text-align : left;
	font-weight: bold;
	color: #ff7f00;	
}
.container h2{
	font-size:60px;
	font-weight:bold;
	font-family: 'Montserrat', sans-serif;
	text-align:left;
	color:#fff;
  	position: relative;
  	padding:20px;
	/* letter-spacing:0px;
  	transition:1s;
  	-webkit-transition:1s;
  	-ms-transition:1s;
  	position: relative; */
}
.updateFormCB input{
    background-color: #F5F5F5;
    color: #000;
    width: 800px;
    height: 35px;
    padding-left: 20px;
    border-radius: 6px;
    border: 1px solid #2f2f2f;
	float: center;
}
.updateFormCB textarea[name="f_content"]{
    background-color: #F5F5F5;
    color: #000;
    width: 800px;
    height: 300px; 
    padding-left: 20px;
    border-radius: 6px;
    border: 1px solid #2f2f2f;
    word-break: break-all;  
}
.updateFormCB button{
	background-color: #ff7f00;
	font: 12px 굴림;
	font-weight: bold;
  	text-align: center;
  	text-decoration: none;
	color: black;
	width: 130;
	height: 30;
  	padding: 10px 20px;
  	border: none;
  	border-radius: 16px;
  	margin: 4px 2px;
  	display: inline-block;
  	cursor: pointer;
  	float: right;
}
</style>
</head>
<body>
<pre>

</pre>
<div class="container">
	<h2>FAQ 수정</h2>
	<form action="updateCB" method="post">
  		<input type="hidden" name="f_no" value="${cbFaqdto.f_no}">
  		<input type="hidden" name="id"  value="${cbFaqdto.id}" >
         
  	<table class="updateFormCB">  
		<tr><th>No</th><td>${cbFaqdto.f_no}</td></tr>
		<tr><th>Id</th><td>${cbFaqdto.id}</td></tr>
		<tr><th>제목</th><td>
	    	<input type="text" name="f_title" required="required" value="${cbFaqdto.f_title }"></td></tr>
		<tr><th>내용</th><td>
	    	<textarea class="f_content" name="f_content" required="required" value="${cbFaqdto.f_content }" >${cbFaqdto.f_content }</textarea></td></tr>
		<tr><td colspan="2">
	   		<button type="submit" value="확인">확인</button>
			<button type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/listCB'">취소</button>
	   		</td>
		</tr>
	</table>
	</form>
	
<pre>

</pre>
<%@ include file="../footer.jsp" %>
</div>
</body>
</html>