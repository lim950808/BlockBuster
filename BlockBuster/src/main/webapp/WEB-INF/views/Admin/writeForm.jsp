<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
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

.bhtitle h1 {
	font-size:48px;
	font-weight:bold;
	font-family: 'Montserrat', sans-serif;
	text-align:center;
	color: white;
	letter-spacing:0px;
  	transition:1s;
  	-webkit-transition:1s;
  	-ms-transition:1s;
  	position: relative;
  	padding:10px;
}

	hr{
		background-color:white;
	}
	table{
		width : 80%
	}
	body{
		background-color : #333;
		font-family: 'Montserrat', sans-serif;
	}
	tr{
		color : white;
	}
	a {
  		color : white;
	}

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
<pre>
	
</pre>

<div class="container">
 	<div class=bhtitle>
		<h1>영상 등록</h1>
	</div>	

   	<div align="center">
	<form action="${pageContext.request.contextPath}/Admin/write" method="post" id="frm" name="frm" enctype="multipart/form-data" target="myBatisFrame">
   
    
    <table>
        <tr>
            <th>영상제목</th>
            <td>
                <input type="text" name="title" required="required">
            </td>
        </tr>
        <tr>
           <td>
         
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
         
           <select class="form-control" id="genre" name="genre">
             <option>선택해주세요</option>
           </select>
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
          
            </td>
        </tr>
        <tr>
            <th>영상 URL</th>
            <td>
                <input type="text" name="p_video">
            </td>
        </tr>
        <tr>
           <th></th>
           <td><input id="enroll" type="submit" value="등록"></td>
        </tr>
	</table>
    </form>
    </div> 
    </div> <!-- container -->
<script type="text/javascript">
function boardIn(){
	$('#frm').submit();
}
	function addFilePath(msg) {
		alert(msg);
		document.getElementById("frm").reset();
	}
</script>
  
<br><br><%@include file="../footer.jsp" %>
</body>
</html>