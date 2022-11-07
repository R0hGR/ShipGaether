<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="source.jsp"%>
<html>
<head>
<style>
div.header {
	position: sticky;
	top: 0;
	background-color: blue;
}

a {
	font-weight: bold;
	text-decoration: none;
	color: red;
}
</style>
<title>채팅</title>
<link rel="stylesheet" href="/resources/css/chat.css" />
<link rel="stylesheet" href="/resources/css/login.css" />
<link href="css/bootstrap/bootstrap.min.css" rel="stylesheet" />
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<div class="chat_wrap">
		<div class="header">
			<div class="row mx-4">
				<div class="col-10 wordOneline p-0"
					style="float: none; font-size: 16px; width: 80%; margin: auto">
					${roomName}</div>
				<div class="col-1 p-0"
					style="float: none; font-size: 16px; margin: auto">
					(${memberCount})</div>
				<div class="col-1 p-0"
					style="float: none; font-size: 16px; text-align: end; margin: auto">

					<button class="btn btn-outline-secondary border-0"
						style="color: white" type="button"
						id="chattingInfo_modal_opne_btn" onclick="openChattingInfoModal()">
						<i class="bi bi-three-dots-vertical"></i>
					</button>
				</div>
			</div>
			<input type="hidden" id="roomId" name="roomId" value="${roomId}">
		</div>
		<div id="chat">
			{{#each .}}
			<div class="{{printLeftRight chatSender}}">
				<div class="row">
					<div class="col-1 me-4">
						<div class="chatSender" style="display: {{printImg chatSender">
							<img src="{{usrPhotoPath}}"
								style="width: 50px; border-radius: 50%" />
						</div>
					</div>
					<div class="col">
						<div class="chatSender" style="display: {{printImg chatSender">
							{{chatSender}}</div>
						<div class="chatContent" style="display: {{printChat1 chatSender">
							<div class="chatContentIner">{{chatContent}}</div>
							&nbsp;&nbsp;<span style="font-size: 11px; align-self: end;">{{chatWdate}}</span>
						</div>
						<div class="chatContent" style="display: {{printChat2 chatSender">
							<span style="font-size: 11px; align-self: end;">{{chatWdate}}</span>
							<a href="{{chatId}}">삭제</a> &nbsp;&nbsp;
							<div class="chatContentIner"
								style="float: right; border: 1px solid #c4fcff; background-color: #c4fcff; display: {{printNone chatSender">{{chatContent}}</div>
						</div>
					</div>
				</div>
			</div>
			{{/each}}


		</div>
		<script id="temp" type="text/x-handlebars-template">
     {{#each .}}
    <div class="{{printLeftRight chatSender}}">
      <div class="row">
      <div class="col-1 me-4">
      	<div class="chatSender" style="display:{{printImg chatSender}}">
			<img src="{{usrPhotoPath}}" style="width:50px;border-radius:50%"/>
		</div>
		</div>
		<div class="col">
		<div class="chatSender" style="display:{{printImg chatSender}}">
		{{chatSender}}
		</div>
      		<div class="chatContent" style="display:{{printChat1 chatSender}}">
			<div class="chatContentIner">{{chatContent}} </div>
			&nbsp;&nbsp;<span style="font-size:11px; align-self:end;">{{chatWdate}}</span> 
		</div>
		<div class="chatContent" style="display:{{printChat2 chatSender}}">
			<span style="font-size:11px; align-self:end;">{{chatWdate}}</span>
			<a href="{{chatId}}" >삭제</a>
			&nbsp;&nbsp;
			<div class="chatContentIner" style="float:right; border: 1px solid #c4fcff; background-color:#c4fcff; display:{{printNone chatSender}}">{{chatContent}}</div>
		</div>
      	</div>
      </div>
      </div>
      {{/each}}
      </script>
		<script id="temp1" type="text/x-handlebars-template">
      	<div class="{{printLeftRight chatSender}}">
      <div class="row">
      <div class="col-1 me-4">
      	<div class="chatSender" style="display:{{printImg chatSender}}">
			<img src="{{usrPhotoPath}}" style="width:50px;border-radius:50%"/>
		</div>
		</div>
		<div class="col">
		<div class="chatSender" style="display:{{printImg chatSender}}">
		{{chatSender}}
		</div>
      		<div class="chatContent" style="display:{{printChat1 chatSender}}">
			<div class="chatContentIner">{{chatContent}} </div>
			&nbsp;&nbsp;<span style="font-size:11px; align-self:end;">{{chatWdate}}</span> 
		</div>
		<div class="chatContent" style="display:{{printChat2 chatSender}}">
			<span style="font-size:11px; align-self:end;">{{chatWdate}}</span>
			<a href="{{chatId}}" >삭제</a>
			&nbsp;&nbsp;
			<div class="chatContentIner" style="float:right; border: 1px solid #c4fcff; background-color:#c4fcff; display:{{printNone chatSender}}">{{chatContent}}</div>
		</div>
      	</div>
      </div>
      </div>
      </script>
		<script>
			var uid = "${sessionId}";
			Handlebars.registerHelper("printLeftRight", function(chatSender) {
				if (uid != chatSender) {
					return "left";
				} else {
					return "right";
				}
			});
			Handlebars.registerHelper("printNone", function(chatSender) {
				if (uid != chatSender)
					return "none";
			});
			Handlebars.registerHelper("printImg", function(chatSender) {
				if (uid == chatSender)
					return "none";
			});
			Handlebars.registerHelper("printChat1", function(chatSender) {
				if (uid == chatSender)
					return "none";
			});
			Handlebars.registerHelper("printChat2", function(chatSender) {
				if (uid != chatSender)
					return "none";
			});
		</script>
		<div class="input-div">
			<textarea style="resize: none; height: 100px" id="txtMessage"
				placeholder="메세지를 입력한 후 리턴키를 누르세요!"></textarea>
		</div>
	</div>
	<div id="chattingInfo_modal">
		<div class="modal_content">
			<div class="chattingInfo-container" id="container">
				<div class="card border-0 h-100" style="background-color: #82c1e9">
					<div class="card-header border-0">
						<div class="row">
							<div class="col-8">
								<p class="text mb-1" style="color: white;">Info</p>
							</div>
							<div class="col">
								<i class="bi bi-plus border rounded-2 mt-1"
									style="float: right; color: white;" onclick="openInviteModal()"></i>
							</div>
							<div class="col">
								<i class="bi bi bi-door-open mt-1"
									style="float: right; color: white;" onclick="roomExit()"></i>
							</div>
							<form id="roomExit" method="post" action="roomExit">
								<input type="hidden" id="roomIdx" name="roomIdx"
									value="${roomId}"> <input type="hidden" id="usrNumx"
									name="usrNumx" value="${sessionId}">
							</form>
							<script>
								function roomExit() {
									$('#roomExit').submit();
									window.close();
								}
							</script>
						</div>
					</div>
					<c:forEach var="member" items="${memberList}">
						<div class="card-body p-0"
							style="cursor: pointer; max-height: 60px; background-color: #82c1e9"
							onclick="">
							<form id="chatForm${member.usrNum}" method="post"
								action="memberSelect">
								<input type="hidden" id="usrNum" name="usrNum"
									value="${member.usrNum}">
							</form>
							<div class="d-flex justify-content-end align-items-center m-0">
								<c:if test="${member.usrPhotoPath eq 'default'}">
								<img class="img-fluid rounded-circle m-3"
									style="width: 40; height: 40; position:;"
									src="images/defaultPhoto.jpg" alt="..." />
									</c:if>
									<c:if test="${member.usrPhotoPath ne 'default'}">
								<img class="img-fluid rounded-circle m-3"
									style="width: 40; height: 40; position:;"
									src="images/ship/usr/${member.usrNum}/${member.usrPhotoPath}" alt="..." />
									</c:if>
									
									
								<div class="card-body p-0 me-4" id="chat" style="width: 280;">
									<p class="fw-bold mb-0 wordOneline" style="color: white">${member.usrNickname}</p>
								</div>
							</div>
						</div>
					</c:forEach>
					<script>
						
					</script>
				</div>
			</div>
		</div>
		<div class="modal_layer" id="chattingInfo_modal_close_btn"
			onclick="closeChattingInfoModal()"></div>
	</div>
	<div id="invite_modal">
		<div class="modal_content">
			<jsp:include page="roomInvite.jsp" flush="false">
				<jsp:param name="roomId" value="${roomId}"/>
				<jsp:param name="roomName" value="${roomName}"/>
				<jsp:param name="memberCount" value="${memberCount}"/>
				<jsp:param name="memberList" value="${memberList}"/>
				<jsp:param name="nonMemberList" value="${nonMemberList}"/>
			</jsp:include>
		</div>
		<div class="modal_layer"  id="invite_modal_close_btn"
			onclick="closeInviteModal()"></div>
	</div>
	<script>
		function openInviteModal() {
			document.getElementById("invite_modal").style.display = "block";
		}

		function closeInviteModal() {
			document.getElementById("invite_modal").style.display = "none";
		}

		function openChattingInfoModal() {
			document.getElementById("chattingInfo_modal").style.display = "block";
		}

		function closeChattingInfoModal() {
			document.getElementById("chattingInfo_modal").style.display = "none";
		}
	</script>
</body>
<script type="text/javascript">
	getList();
	var chatSender = "${sessionId}";
	var usrPhotoPath = "${ sessionUsr.usrPhotoPath }";
	//삭제
	$("#chat").on("click", ".chatContent a", function(e) {
		e.preventDefault();
		var chatId = $(this).attr("href");
		if (!confirm(chatId + "을(를) 삭제하실래요?"))
			return;
		$.ajax({
			type : "post",
			url : "/chat/delete",
			data : {
				"chatId" : chatId
			},
			success : function() {
				sock.send("delete");
				getList();
			}
		});
	});

	$("#txtMessage")
			.on(
					"keydown",
					function(e) {
						if (e.keyCode == 13 && !e.shiftKey) {
							e.preventDefault();
							var chatContent = $("#txtMessage").val();
							if (chatContent == "") {
								alert("내용을 입력하세요!");
								return;
							}
							$("#txtMessage").val("");
							let roomId = $('#roomId').val();
							let usrPhotoPath = "${ sessionUsr.usrPhotoPath }"
							console.log(usrPhotoPath);
							//메세지 테이블에 등록
							$.ajax({
								type : "post",
								url : "/chat/insert",
								data : {
									"roomId" : roomId,
									"chatSender" : chatSender,
									"chatContent" : chatContent,
									"usrPhotoPath" : usrPhotoPath
								},
								success : function(data) {
									//메세지 보내기...
									sock.send(roomId + "|" + chatSender + "|"
											+ chatContent + "|" + data + "|"
											+ usrPhotoPath);
									getList();
								}
							});
						}
					});

	//웹소켓 생성
	var sock = new SockJS("http://127.0.0.1:8080/echo/");
	console.log(sock);
	
	sock.onmessage = onMessage;

	//서버로부터 메세지 받기...
	function onMessage(msg) {
		var items = msg.data.split("|");
		console.log(items);
		var roomId = items[0];
		var chatSender = items[1];

		if (chatSender == "delete") {
			getList();
			return;
		}

		var chatContent = items[2];
		var chatId = items[3];
		var usrPhotoPath = items[4];
		var chatWdate = items[5];

		var data = {
			"roomId" : roomId,
			"chatContent" : chatContent,
			"chatSender" : chatSender,
			"chatWdate" : chatWdate,
			"chatId" : chatId,
			"usrPhotoPath" : usrPhotoPath
		};

		var template = Handlebars.compile($("#temp1").html());
		
		$("#chat").append(template(data));
		getList();
		//스크롤바 아래 고정
		window.scrollTo(0, $('#chat').prop('scrollHeight'));
	}

	function getList() {
		let roomId = $('#roomId').val();

		$.ajax({
			type : "get",
			url : "/chat.json",
			data : {
				roomId : roomId
			},
			//          dataType : "json",
			success : function(data) {
				var template = Handlebars.compile($("#temp").html());
				$("#chat").html(template(data));
			}
		});
	}
</script>
</html>



