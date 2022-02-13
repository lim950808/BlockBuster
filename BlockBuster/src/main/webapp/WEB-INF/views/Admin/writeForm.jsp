<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../header.jsp" %> 
<html>
<%
	String context = request.getContextPath();
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {	font-family: 굴림체; text-align: center;	}
table { border: 1px solid pink; width: 100%; 
         }
tr { height: 30px; background: yellow; }
/* th {	background: #C9BFED;	} */
th {	background: #b9b973;	}
td {	background: #f9f3b3;	}


</style>

<script>
function categoryChange(e) {
    var movie = ["1100", "1200", "1300", "1400", "1500", "1600", "1700"];
    var drama = ["2100", "2200", "2300"];
    var enter = ["3100", "3200", "3300", "3400", "3500"];
    var dacu = ["4100", "4200", "4300"];
    var ani  = ["5100", "5200"];
    var target = document.getElementById("genre");

    if(e.value == "1000") var d = movie;
    else if(e.value == "2000") var d = drama;
    else if(e.value == "3000") var d = enter;
    else if(e.value == "4000") var d = dacu;	
    else if(e.value == "5000") var d = ani;

    target.options.length = 0;

    for (x in d) {
        var opt = document.createElement("option");
        opt.value = d[x];
        opt.innerHTML = d[x];
        target.appendChild(opt);
    }   
}



</script>



</head>
<body>
	<h2>영상 등록</h2>
    <%--  <c:if test="${msg != null}">${msg}</c:if> --%>
    <!--  <form action="write" method="post" name="frm"> -->
   <%--  <form action="<%=context%>/Admin/write" method="post" name="frm"> --%>
    <form action="/Admin/write" method="post" id="frm" name="frm" enctype="multipart/form-data" target="myBatisFrame">
    <input type="hidden" name="pno" value="${updateForm.pno}">
    <table>
        <%-- <tr>
            <th>품번</th>
            <td>
                <input type="number" name="pno" required="required" maxlength="4" value="${pno}">
                <input type="button" value="중복확인" onclick="chk()">
            </td>
        </tr> --%>
        <tr>
            <th>영상제목</th>
            <td>
                <input type="text" name="title" required="required">
            </td>
        </tr>
        <tr>
           <td>
           <!-- <label for="category">대분류 선택</label> -->
          	<select class="form-control" id="category" name="category" onchange="categoryChange(this)">
	            <option>대분류 선택</option>
	            <option value="1000">영화</option>
	            <option value="2000">드라마</option>
	            <option value="3000">예능</option>
				<option value="4000">다큐</option>
		        <option value="5000">애니</option>
            </select>
		   </td>
		   <td>
          <!--  <label for="genre">소분류 선택</label> -->
           <select class="form-control" id="genre" name="genre">
             <option>선택해주세요</option>
           </select>
  		   </td>
        </tr>
        
        
        
        
        
<%--         <tr>
            <th>대분류</th>
            <td>
               <!--  <input type="text" name="category" required="required"> -->              
				<select id="inputCat" class="form-control">
				    <option selected>대분류</option>
				    <c:forEach items="${getCatList}" var="product">
 	 				 	<option><c:out value="${product.category}"/></option>
  					 </c:forEach>
				</select>
            </td>
        </tr>
        <tr>
            <th>소분류</th>
            <td>
                <input type="text" name="genre" required="required">
            </td>
        </tr> --%>
        
        <tr>
            <th>제작연도</th>
            <td>
                <input type="number" name="year" required="required">
            </td>
        </tr>
        <tr>
            <th>제작국가</th>
            <td>
                <input type="text" name="country" required="required">
            </td>
        </tr>
        <tr>
            <th>감독</th>
            <td>
                <input type="text" name="director">
            </td>
            <%-- <td>
                <select name="mgr">
                    <c:forEach var="emp" items="${empMngList}">
                        <option value="${emp.empno}">${emp.ename}</option>
                    </c:forEach>
                </select>
            </td> --%>
        </tr>
        <tr>
            <th>출연진</th>
            <td>
                <input type="text" name="casting">
            </td>
        </tr>
        <tr>
            <th>줄거리</th>
            <td>
                <input type="text" name="description">
            </td>
        </tr>
        <tr>
            <th>가격(원)</th>
            <td>
                <input type="number" name="price">
            </td>
        </tr>
        <tr>
            <th>이미지</th>
            <td>
            <input class="" id="imgFile" name="imgFile" type="file"/>
            <!-- <input type="text" name="p_img"> -->
            </td>
        </tr>
        <tr>
            <th>영상 URL</th>
            <td>
                <input type="text" name="p_video">
            </td>
        </tr>
        <%-- <tr>
        	<th>부서코드</th>
        	<td>
        		<select name="deptno">
        			<c:forEach var="dept" items="${deptList }">
        				<option value="${dept.deptno }">${dept.dname }</option>
        			</c:forEach>
        		</select>
        	</td>
        </tr> --%>
        <tr>
            <td colspan="2"><input type="submit" value="등록"></td>
        </tr>
    </table>
    </form>

<script type="text/javascript">
function boardIn(){
	$('#frm').submit();
}
	function addFilePath(msg) {
		alert(msg);
		document.getElementById("frm").reset();
	}
</script>
    
    
<%@ include file="../footer.jsp" %> 
</body>
</html>