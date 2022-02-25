<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html><html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css" integrity="sha384-zEpdAL7W11eTKeoBJK1g79kgl9qjP7g84KfK3AZsuonx38n8ad+f5ZgXtoSDxPOh" crossorigin="anonymous">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
</head>
<style>
	tr{
		color : white;
		text-align: center;
	}
	#list:hover tr:hover{
		pointer-events: none;
	}
	#list:hover tr:hover td{
		color:#ff7f00;
	}
</style>

<body>
	<span style="color:gray; size:5px;">※ 최근 10개의 글만 화면에 보여집니다.</span>
	<table id="list" class="table table-hover">
		<tr style="background-color:#ff7f00; color: white">
			<th>순번</th>
			<th>닉네임</th>
			<th>한줄인사</th>
			<th>날짜</th>
		</tr>
		
		<c:forEach var="listCursor" items="${listCursor}">
			<tr>
				<td>${listCursor.q_no}</td>
			    <td>${listCursor.nickName}</td>
				<td>${listCursor.q_content}</td>
				<td>${listCursor.q_date}</td>
			</tr>
		</c:forEach>
		
	</table>     
</body>
</html>