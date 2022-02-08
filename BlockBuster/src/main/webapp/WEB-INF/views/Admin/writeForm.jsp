<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@CHARSET "UTF-8";
body {	font-family: 굴림체; text-align: center;	}
table { border: 1px solid pink; width: 100%; 
         }
tr { height: 30px; background: yellow; }
/* th {	background: #C9BFED;	} */
th {	background: #b9b973;	}
td {	background: #f9f3b3;	}
</style>

<!-- <script>
    function chk() {
        if(!frm.pno.value) {
            alert('품번을 입력한 후에 확인하세요');
            frm.pno.focus();
            return false;
        } else location.href="confirm?pno=" + frm.pno.value;
    }
</script> -->

</head>
<body>
	<h2>영상정보 입력</h2>
    <c:if test="${msg != null}">${msg}</c:if>
    <form action="write" method="post" name="frm">
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
            <th>대분류</th>
            <td>
                <input type="text" name="category" required="required">
            </td>
        </tr>
        <tr>
            <th>소분류</th>
            <td>
                <input type="text" name="genre" required="required">
            </td>
        </tr>
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
                <input type="text" name="p_img">
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
<%@ include file="../footer.jsp" %> 
</body>
</html>