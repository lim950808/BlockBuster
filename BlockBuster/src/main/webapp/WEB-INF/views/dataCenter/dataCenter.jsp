<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> <!-- searchbox -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<title>API 제공</title>
<style>
 body { margin:0; padding:0; font-family:'sans-serif', verdana;}
 h2 {color:#ff7f00}
</style>
<script>
function getAllListByGenre(){
	$('#lists').remove();
	var genreNo = $('#genre').val();
		$.ajax({
			type : "GET",
			url :"${pageContext.request.contextPath}/listbygenre",
			data:{genre:genreNo, title:"", casting:"", country:"", year:"", director:""},
			dataType:'json',
			success:function(data){
				console.log(data);
				var jsondata = "<div id='lists' style='margin:20px 0 0 10px;padding:20px 15px;font-size:14px;color:#555;line-height:20px;border:1px solid #ddd;background:#f5f5f5'><br>"+JSON.stringify(data)+"</div>";
				$("#result").append(jsondata);
				}
			}
		);
}
</script>
<body>
<div class="container">
<pre>

</pre>
<h2 data-v-514545ea="" class="tit">장르별 영상 정보 조회 API</h2>
<hr>
<h2 style="font-size:15px;font-weight:bold;">1.URL (GET)</h2>
<div style="padding:20px 15px;font-size:14px;color:#555;line-height:20px;border:1px solid #ddd; background:#f5f5f5"><b>http://localhost:8181/BlockBuster/listbygenre</b></div>
<br>
<br>
<h2 style="font-size:15px;font-weight:bold;">2.Request Parameters</h2>
<table style="width:100%;font-size:14px;" summary="Request Parameters 상세정보">
	<caption style="display:none;">Request Parameters</caption>
	<colgroup>
		<col width="20%">
		<col width="10%">
		<col width="15%">
		<col width="15%">
		<col width="*">
		<col>
	</colgroup>
	<thead style="background:#f5f5f5">
		<tr style="text-align:center;">
			<th scope="col" style="padding:20px 10px; color: #555;">항목</th>
			<th scope="col" style="padding:20px 10px; color: #555;">필수여부</th>
			<th scope="col" style="padding:20px 10px; color: #555;">타입</th>
			<th scope="col" style="padding:20px 10px; color: #555;">길이 (MAX)</th>
			<th scope="col" style="padding:20px 10px; color: #555;">설명</th>
		</tr>
	</thead>
	<tbody>
		<tr style="border-bottom:1px solid #ddd;text-align:center;">
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;"><b>genre</b></td>
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;">O</td>
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;">String</td>
			<td style="padding:20px 10px;vertical-align:middle;">4</td>
			<td style="padding:20px 10px;text-align:left;vertical-align:middle;"><b>장르 구분 코드</b><br>
			<b>영화</b> 공포=1100 액션=1200 범죄/스릴러=1300 전쟁=1400<br>
			판타지/SF=1500 코미디=1600 멜로/로맨스=1700<br>
			<b>드라마</b> 미국=2100일본=2200한국=2300<br>
			<b>예능</b> KBS=3100SBS=3200MBC=3300TVN=3400JTBC=3500<br>
			<b>다큐</b> 히스토리=4100디스커버리=4200내셔널지오그래픽=4300<br>
			<b>애니</b> 디즈니=5100지브리=5200</td>
		</tr>
		<tr style="border-bottom:1px solid #ddd;text-align:center;">
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;"><b>title</b></td>
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;">X</td>
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;">String</td>
			<td style="padding:20px 10px;vertical-align:middle;">255</td>
			<td style="padding:20px 10px;text-align:center;vertical-align:middle;">영상물 제목</td>
		</tr>
		<tr style="border-bottom:1px solid #ddd;text-align:center;">
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;"><b>casting</b></td>
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;">X</td>
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;">String</td>
			<td style="padding:20px 10px;vertical-align:middle;">255</td>
			<td style="padding:20px 10px;text-align:center;vertical-align:middle;">출연진</td>
		</tr>
		<tr style="border-bottom:1px solid #ddd;text-align:center;">
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;"><b>country</b></td>
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;">X</td>
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;">String</td>
			<td style="padding:20px 10px;vertical-align:middle;">100</td>
			<td style="padding:20px 10px;text-align:center;vertical-align:middle;">국가명</td>
		</tr>
		<tr style="border-bottom:1px solid #ddd;text-align:center;">
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;"><b>year</b></td>
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;">X</td>
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;">String</td>
			<td style="padding:20px 10px;vertical-align:middle;">4</td>
			<td style="padding:20px 10px;text-align:center;vertical-align:middle;">방영/개봉 연도 (YYYY)</td>
		</tr>
		<tr style="border-bottom:1px solid #ddd;text-align:center;">
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;"><b>director</b></td>
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;">X</td>
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;">String</td>
			<td style="padding:20px 10px;vertical-align:middle;">100</td>
			<td style="padding:20px 10px;text-align:center;vertical-align:middle;">감독</td>
		</tr>
	</tbody>
</table>
<br>
<br>
<h2 style="font-size:15px;font-weight:bold;">3.Received Message</h2>
<table style="width:100%;font-size:14px;" summary="Request Parameters 상세정보">
	<caption style="display:none;">Request Parameters</caption>
	<colgroup>
		<col width="20%">
		<col width="20%">
		<col width="20%">
		<col width="*">
		<col>
	</colgroup>
	<thead style="background:#f5f5f5">
		<tr style="text-align:center;">
			<th scope="col" style="padding:20px 10px; color: #555;">항목</th>
			<th scope="col" style="padding:20px 10px; color: #555;">타입</th>
			<th scope="col" style="padding:20px 10px; color: #555;">길이 (MAX)</th>
			<th scope="col" style="padding:20px 10px; color: #555;">설명</th>
		</tr>
	</thead>
	<tbody>
		<tr style="border-bottom:1px solid #ddd;text-align:center;">
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;"><b>cat_name</b></td>
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;">String</td>
			<td style="padding:20px 10px;vertical-align:middle;">100</td>
			<td style="padding:20px 10px;text-align:center;vertical-align:middle;">대분류</td>
		</tr>
		<tr style="border-bottom:1px solid #ddd;text-align:center;">
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;"><b>gen_name</b></td>
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;">String</td>
			<td style="padding:20px 10px;vertical-align:middle;">100</td>
			<td style="padding:20px 10px;text-align:center;vertical-align:middle;">소분류</td>
		</tr>
		<tr style="border-bottom:1px solid #ddd;text-align:center;">
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;"><b>title</b></td>
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;">String</td>
			<td style="padding:20px 10px;vertical-align:middle;">255</td>
			<td style="padding:20px 10px;text-align:center;vertical-align:middle;">영상물 제목</td>
		</tr>
		<tr style="border-bottom:1px solid #ddd;text-align:center;">
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;"><b>year</b></td>
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;">String</td>
			<td style="padding:20px 10px;vertical-align:middle;">4</td>
			<td style="padding:20px 10px;text-align:center;vertical-align:middle;">방영/개봉 연도 (YYYY)</td>
		</tr>
		<tr style="border-bottom:1px solid #ddd;text-align:center;">
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;"><b>country</b></td>
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;">String</td>
			<td style="padding:20px 10px;vertical-align:middle;">100</td>
			<td style="padding:20px 10px;text-align:center;vertical-align:middle;">국가명</td>
		</tr>
		<tr style="border-bottom:1px solid #ddd;text-align:center;">
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;"><b>casting</b></td>
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;">String</td>
			<td style="padding:20px 10px;vertical-align:middle;">255</td>
			<td style="padding:20px 10px;text-align:center;vertical-align:middle;">출연진</td>
		</tr>
		<tr style="border-bottom:1px solid #ddd;text-align:center;">
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;"><b>director</b></td>
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;">String</td>
			<td style="padding:20px 10px;vertical-align:middle;">100</td>
			<td style="padding:20px 10px;text-align:center;vertical-align:middle;">감독</td>
		</tr>
		<tr style="border-bottom:1px solid #ddd;text-align:center;">
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;"><b>p_img</b></td>
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;">String</td>
			<td style="padding:20px 10px;vertical-align:middle;">1000</td>
			<td style="padding:20px 10px;text-align:center;vertical-align:middle;">포스터 URL</td>
		</tr>
		<tr style="border-bottom:1px solid #ddd;text-align:center;">
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;"><b>p_video</b></td>
			<td style="padding: 20px 10px; vertical-align: middle; text-align: center;">String</td>
			<td style="padding:20px 10px;vertical-align:middle;">1000</td>
			<td style="padding:20px 10px;text-align:center;vertical-align:middle;">영상 URL</td>
		</tr>
	</tbody>
</table>
<br>
<br>
<h2 style="font-size:15px;font-weight:bold;">4.Request Sample Code (JSON)</h2>
<div style="margin:20px 0 0 10px;padding:20px 15px;font-size:14px;color:#555;line-height:20px;border:1px solid #ddd;background:#f5f5f5">
<pre>
{
	"genre": "1100"  // 장르 구분 코드
	"title": ""
	"casting": ""
	"country": ""
	"year": ""
	"director": ""
}
</pre>
</div>
<br>
<br>
<h2 style="font-size:15px;font-weight:bold;">5.Response Sample Code (JSON)</h2>
<table id="total">
<tr><td>
<select id="genre" name="category" onchange="getAllListByGenre()">
<option selected="selected" disabled="disabled">카테고리 선택</option>
<c:forEach items="${cList}" var="c"> 
<option value="${c.genre}">${c.cat_name} / ${c.gen_name}</option>
</c:forEach>
</select>
</td>
</tr>
</table>
<div id="result"></div>
<pre>

</pre>
<%@ include file="../footer.jsp" %>
</div>
</body>
</html>