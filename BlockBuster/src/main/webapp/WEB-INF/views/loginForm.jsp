<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
  
</head>
<body>

    <form action="<c:url value='loginCheck'/>" method="post">
    
        <h3>로그인 페이지</h3>
        
        <div id="error">
		    <c:if test="${not empty param.error}">
				${URLDecoder.decode(param.error)}         
		    </c:if>        
		</div>
		
        <input type="text" name="id" placeholder="아이디" autofocus>
        <input type="password" name="password" placeholder="비밀번호">
        
        <button>로그인</button>
        
    </form>
    
</body>
</html>