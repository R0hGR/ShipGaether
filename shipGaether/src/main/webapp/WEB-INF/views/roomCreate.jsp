<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.net.URLDecoder"%>

<head>
<link rel="stylesheet" href=<c:url value="/css/login.css" />>
</head>

<!-- <div class="login-div"> -->
<div class="create-container" id="container">
	<div class="card border-0">
		<div class="card-header border-0" style="background-color: white">
			<div class="row">
				<div class="col">
					<p class="text mb-1" style="color: black; font-size: 1.2em">채팅
						개설하기</p>
				</div>
			</div>
		</div>
		<form method="POST" id="roomMemberAdd" name="roomMemberAdd"
			action="/roomCreate">
			<div class="row m-0 p-0" style="overflow-y: auto; max-height: 650px">
				<c:forEach var="usr" items="${usrAll}">
					<c:if test="${usr.usrNum eq sessionId}">
						<input class="checkSelect" type="checkbox" id="roomMember"
							name="roomMember[]" value="${usr.usrNum}" style="display: none"
							checked>
					</c:if>
					<c:if test="${usr.usrNum ne sessionId}">
						<div class="card-body p-0" style="cursor: pointer;" href="/chat">
							<div class="d-flex justify-content-end align-items-center m-0">
								<c:if test="${usr.usrPhotoPath eq 'default'}">
									<img class="img-fluid rounded-circle m-3"
										style="width: 40; height: 40; position:;"
										src="/images/defaultPhoto.jpg" alt="..." />
								</c:if>
								<c:if test="${usr.usrPhotoPath ne 'default'}">
									<img class="img-fluid rounded-circle m-3"
										style="width: 40; height: 40; position:;"
										src="/images/ship/usr/${usr.usrNum}/${usr.usrPhotoPath}" alt="..." />
								</c:if>
								<div class="card-body p-0 me-4" id="chat" style="width: 300;">
									<div class="row">
										<div class="col-11">${usr.usrNickname}</div>
										<div class="col-1 p-0">
											<input class="checkSelect" id="roomMember" type="checkbox"
												name="roomMember[]" value="${usr.usrNum}">
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<div class="row m-0 p-0">
				<div id='result'></div>
				<p class="d-flex justify-content-end m-0">
					<input id="submit" type="submit" value="초대하기">
				</p>
			</div>
		</form>
	</div>
	<script>
	const submitButton = document.getElementById("submit");
	submitButton.addEventListener('click', () => {
		if($('input:checkbox[id="roomMember"]:checked').length < 2){
			alert("대화상대를 선택해주세요");
			$("#roomMemberAdd").submit(false);
		}
	});
	</script>

</div>