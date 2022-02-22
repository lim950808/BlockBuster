<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<%
	String context = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>writeForm</title>
<style type="text/css">
body {	
	font-family: sans-serif; 
	/* text-align: center;	 */
}
.writeFormCB { 
	width: 100%; 
	border: 3px ridge #ff7f00; 
}
.writeFormCB tr { 
	background: #333; 
	height: 30px; 
}
.writeFormCB th {	
	background: #333; 
	text-align: center; 
	color: #fff; 
	padding-right: 40px;
	padding-left: 20px;
}
.writeFormCB td {
	background: #333; 
	text-align : left;
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
.writeFormCB input{
    background-color: #F5F5F5;
    color: #000;
    width: 800px;
    height: 35px;
    padding-left: 20px;
    border-radius: 6px;
    border: 1px solid #2f2f2f;
	float: center;
}
.writeFormCB textarea[name="f_content"]{
    background-color: #F5F5F5;
    color: #000;
    width: 800px;
    height: 300px; 
    padding-left: 20px;
    border-radius: 6px;
    border: 1px solid #2f2f2f;
    word-break: break-all; 
}
.writeFormCB button{
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
 <h2>FAQ 등록</h2>
<!--FAQ/writeCB를 제대로 못찾아가서 context 사용  -->
 <form action="${pageContext.request.contextPath}/writeCB" method="post" >
 <!-- 시퀀스로 가져가는 값은 자동으로 변경되기때문에 hidden으로 안가져가도 된다 -->
 <input type="hidden" name="id"  value="admin" > 
 <!-- <input type="hidden" name="f_no" value="1"> --><!-- f_no 안될때 확인해보는 곳 -->
   <table class="writeFormCB">
	<tr><th>No</th><td>  </td></tr> 
	<tr><th>Id</th><td>admin</td></tr>
	<!-- 변하지 않을 값 이기때문에 DB에서 불러올 필요없음 - 그냥 작성 -->
	
	<tr><th>제목</th><td><input type="text" name="f_title" placeholder="제목을 입력해주세요" required="required"></td></tr>
	
	<tr><th>내용</th><td>
		<textarea class="form-control" rows="10" name="f_content" placeholder="내용을 입력해주세요" required></textarea></td></tr>
	<!-- <tr><th>내용</th><td><input type="text" name="f_content" 	required="required"  rows="10"></td></tr> -->

    <tr>
    	<td colspan="2">
    	<button type="submit" value="확인">확인</button> &nbsp; 
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