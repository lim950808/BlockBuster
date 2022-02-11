<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateForm</title>

<style type="text/css">
body {	
	font-family: 굴림체; 
	text-align: center;	
}
table { 
	border: 3px ridge #ffd800; 
	width: 100%; 
}
tr { 
	height: 30px; 
	background: #6799FF; 
}

th {	
	background: #3533B0; 
	color:#fff; 
	text-align: center; 
}
td {
	background: #3634a5; 
	color:#ffd800;	
	text-align : left;
}

h2{
	font-size:60px;
	font-weight:bold;
	font-family: 'Montserrat', sans-serif;
	text-align:center;
	color:#08088A;
	letter-spacing:0px;
  	transition:1s;
  	-webkit-transition:1s;
  	-ms-transition:1s;
  	position: relative;
  	padding:10px;
 
}
.updateFormCB input{
	float: center;
    width: 800px;
    height: 35px;
    padding-left: 20px;
    border-radius: 6px;
    background-color: #fff;
    border: 1px solid #2f2f2f;
    color: #000;
}

.updateFormCB textarea[name="f_content"]{
    width: 800px;
    height: 300px; 
    padding-left: 20px;
    border-radius: 6px;
    background-color: #fff;
    border: 1px solid #2f2f2f;
    color: #000;
    word-break: break-all;
  
}

.updateFormCB button{
	background-color: #ffd600;
	font: 12px 굴림;
	font-weight: bold;
	color: black;
	width: 130;
	height: 30;
  	border: none;
  	padding: 10px 20px;
  	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	margin: 4px 2px;
  	cursor: pointer;
  	border-radius: 16px;
  	float: right;
}
</style>
</head>
<body>

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
	   		</td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>