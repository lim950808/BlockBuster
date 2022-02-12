<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<%
	String context = request.getContextPath();
%>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript">

<%-- /* EmpController */
function getDeptName(vNickname) {
	 console.log(vNickname);
	 alert("vNickname->"+vNickname); 
	 
	 $.ajax(
		 {
				url:"<%=context%>/getDeptName",  
				data:{nickname : vNickname}, //칼럼값과 동일
				dataType:'text',
				success:function(data){
					// alert("success ajax Data->"+data); 
					// 1이면 존재 0이면 존재하지않음
					$('#deptName').val(data);     /*  input Tag */
					$('#msg').html(data);         /* span  id Tag */
				}
			}
	 );
} --%>





</script>
</head>
<body>
<h2>회원수정</h2>
<form action="memberUpdate" method="post">
  <input type="hidden" name="id" value="${member.id}">
         
  <table>  
	<tr><th>ID</th><td>${member.id}</td></tr>
	<tr><th>닉네임</th><td>
		<input type="text" name="nickname" required="required" placeholder="닉네임을 입력해주세요" value="${member.nickname}">
		<input type="button" value="중복확인" onclick="getDeptName('${member.nickname}')"><br>
		<c:if test="${msg!=null}">${msg}</c:if>
	</td></tr>
	<tr><th>이메일</th><td>
		<input type="text" name="email" required="required" placeholder="이메일을 입력해주세요" value="${member.email}">
		<input type="button" value="중복확인" onclick=""><br>
	</td></tr>
	<tr><th>비빌번호</th><td>
		<input type="password" name="password" placeholder="비밀번호를 입력해주세요" required="required"> 
	</td></tr>
	<tr><th>비빌번호확인</th><td>
		<input type="password" name="passwordCheck" placeholder="비밀번호 확인" required="required">
	</td></tr>
	
	<tr><td colspan="2">
	   <input type="submit" value="확인">
	   </td>
	</tr>
  </table>
</form>
<%@ include file="../footer.jsp" %> 
</body>
</html>