<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-euiv="Content-Type" content="text/html; charset=utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrapbh.css"> <!--  이부분이 없으면 아예 채팅이 안뜸 -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custombh.css"> <!--  이부분이 없으면 아예 채팅이 안뜸 -->
      <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	  <script src="${pageContext.request.contextPath}/resources/js/bootstrapbh.js"></script> 
<style>
		
.chating{
	overflow: auto;
	border: 2px solid #dedede;
    background-color: #fff;
    border-radius: 5px;
    padding: 10px;
    margin: 10px 0;
}
.chating .me{
	color: #000000;
	text-align: right;
	border-color: #ccc;
  	background-color: #ddd;
}
.chating .others{
	color: #000000;
	text-align: left;
	border-color: #ccc;
  	background-color: #C1F3FF;
}
#member_sub{
	background-color: #686868;
	font: 12px sans-serif;
	color: white;
	
}

#yourMsg{
	display: none;
}
#yourNameDel{
	display: none;
}

button {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}

button{	
	background-color: #ff7f00;
	font: 12px sans-serif;
	/* font-weight: bold; */
  	text-align: center;
  	text-decoration: none;
	color: black;
	width: 130;
	height: 30;
  	padding: 10px 20px;
  	border: none;
  	border-radius: 8px;
  	/* margin: 4px 2px; */
  	display: inline-block;
  	cursor: pointer;
  	float: right;
}
button:hover {
  	background-color: #F5F5F5;
}

::-webkit-scrollbar
{
  width: 0.65em;  /* for vertical scrollbars */
  height: 0.65em; /* for horizontal scrollbars */
}

::-webkit-scrollbar-track
{
  background: rgba(0, 0, 0, 0.1);
}

::-webkit-scrollbar-thumb
{
  background: rgba(0, 0, 0, 0.3);
}

</style>
		
<script type="text/javascript">
	var ws;

	function wsOpen(){
		console.log("wsOpen  location.host: " + location.host);
		 var wsUri  = "ws://" + location.host + "/chating"; //내장용 톰캣
        // var wsUri  = "ws://" + location.host + "/BlockBuster/chating"; 외장용 톰캣. 내장용은 /Blockbuster 없이 /chating 만 
        // WebSocket 프로토콜을 사용하여 통신하기 위해서는 WebSocket객체를 생성. 
        // 객체는 자동으로 서버로의 연결
 		ws = new WebSocket(wsUri);
		wsEvt();
	}  
		
	function wsEvt() {
		console.log("wsEvt start... ");
		
		//소켓이 열리면 동작
		ws.onopen = function(data){
			console.log("wsEvt  소켓이 열리면 초기화 세팅하기..");
			}
			
		//메시지를 받으면 동작
		ws.onmessage = function(data) {
			
			var msg = data.data;
			var memberSave = false;
			// alert("ws.onmessage->"+msg)
			if(msg != null && msg.trim() != ''){
				memberSave = false;
				// JSON 오브젝트를 자바스크립트 오브젝트로 변환
			    var jsonMsg = JSON.parse(msg);
				// msg가 배열이고, 2개이상의 Count이면 , member 등록 대상 
                if (Array.isArray(jsonMsg)) {
                	if (Object.keys(jsonMsg).length > 1) {
                    	memberSave = true;
                       	//alert("JSONArray jsonMsg Count->"+ Object.keys(jsonMsg).length);
                	}
                }
				// 파싱한 객체의 type값을 확인하여 getId값이면 초기 설정된 값이므로 채팅창에 값을 입력하는게 아니라
				// 추가한 태그 sessionId에 값을 세팅
				if(jsonMsg.type == "getId"){
					var sid = jsonMsg.sessionId != null ? jsonMsg.sessionId : "";
					if(sid != ''){
						$("#sessionId").val(sid); 
						// session User 등록 수행
						sendUser();
					}
				}else if(jsonMsg.type == "message"){
					// type이 message인 경우엔 채팅이 발생한 경우.
	                // 상대방과 자신을 구분하기 위해 여기서 sessionId값을 사용
	                // 최초 이름을 입력하고 연결되었을때, 발급받은 sessionId값을 비교하여 같다면 자기 자신이 발신한
	                // 메시지이므로 오른쪽으로 정렬하는 클래스를 처리하고 메시지를 출력.     
	                // 비교하여 같지 않다면 타인이 발신한 메시지이므로 왼쪽으로 정렬하는 클래스를 처리하고 메시지를 출력
					if(jsonMsg.sessionId == $("#sessionId").val()){
						$("#chating").append("<p class='me'>나 :" + jsonMsg.msg + "</p>");	
					}else{
						$("#chating").append("<p class='others'>" + jsonMsg.userName + " :" + jsonMsg.msg + "</p>");
					}
				}else if(memberSave = true){
					//alert("userSave");
					$('#member_sub').remove();
					//  memberSave = true 면  -->	User 등록일경우
					// div로 감싸주면 재정의시 삭제(Refresh)후 다시 생성 
					//var str = " <div id='member_sub' class='member_sub'> ";
					var str = " ";
					str  += " <select name='member' id='member_sub' class='member_sub'> ";
					str  += " <option value='ALL'>전체 </option> "; 
					$(jsonMsg).each(
						function(){
							var str2 = "";
				            // User를 선택하여 message전송 가능토록 member에 등록 
							if(jsonMsg.sessionId == $("#sessionId").val()){
							//alert("내꺼임"+ $("#sessionId").val())
							} else {  // 타인 session일 경우 추가 등록 
								str2 += " <option value='"+this.sessionId + "'> "+this.userName  + "</option> "; 
								str  += str2 ;
							}
						}
					);
					str += " </select>"
					str += " </div><p>"
					$('#member').append(str);	
					memberSave = false;
					
				}else{
						console.warn("unknown type!");
				}
			}
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

	function chatName(){
		
		var userName = $("#userName").val();
		console.log("chatName userName: " + userName);
		wsOpen();
		$("#meName").append('나의이름:'+userName); 
		$("#yourName").hide();
		$("#yourMsg").show();
		$("#yourNameDel").show();
		
	}
	
	// User 등록 Message 전송 
	function sendUser() {
		var userOption ={
				type: "userSave",
				sessionId : $("#sessionId").val(),
				userName : $("#userName").val()
			}
		//alert("sendUser Start..")
		// 자바스크립트의 값을 JSON 문자열로 변환
		ws.send(JSON.stringify(userOption));
		// $('#chatting').val("");
	}
	
	// 전체 Message 전송 
	function send() {
		var option ={
			type: "message",
			sessionId : $("#sessionId").val(),
			userName : $("#userName").val(),
			yourName : $("#member_sub").val(),
			msg : $("#chatting").val()
		}
		// 자바스크립트의 값을 JSON 문자열로 변환
		ws.send(JSON.stringify(option));
		$('#chatting').val("");
	}
</script>
</head>
<br>
<br>

<body onload="chatName()">
	<div class="container bootstrap snippet">
		<div class="row">
			<div class="col-xs-12">
				<div class="portlet portlet-default">
					<div class="portlet-heading">
						<div class="portlet-title">
							<h4><i class="fa fa-circle text-green">&nbsp;</i>실시간 채팅</h4>	
						</div>
						<div class="clearfix"></div>
				    </div>
		   
		   <div id="chat" class="panel-collapse collapse in">		
				<div id="chatList" class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 600px;">
				<input type="hidden" id="sessionId" value="">
				<div id="chating" class="chating"></div>
				</div>
				
				<div class="portlet-footer">
					<input type="hidden" id="sessionId" value="">	
					<div id="meName" style="display: none"></div>
					<div id="member" class="member"></div>
					<div class="row">		
						<div style="display: none">
							<div id="yourName">
							<input type="hidden" class="userName" id="userName" value="${chatNameNickname}">													
							</div>
						</div> <!-- hidden class 끝 -->			
					</div>  <!-- row 끝 -->	
					
				   <div id="yourMsg">
		   		   
		   		   <div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
					<div class="row">
						<div class="col-sm-10">
							<textarea maxlength="300" id="chatting" class="form-control" rows="3" placeholder="메시지를 입력하세요"></textarea>
						</div>
			
						<div class="col-sm-2">
							<button type="button" id="btnReplySave" onclick="send()" style="width: 100%; margin-top: 0px">전송</button>
						</div>					
					</div> <!-- 채팅내용 입력,전송 row 끝 -->
		   		   </div>
		   		   
				   </div> <!-- yourMsg end -->				   
		    	   </div> <!-- portlet-footer end -->	    	   
		   </div> <!-- collapse in 끝 -->
	  </div>
<%@include file="footer.jsp" %>
			</div> <!-- col-xs-12 끝 -->
		</div> <!-- 큰 row 끝 -->
	</div> <!-- container 끝 -->
</body>
</html>