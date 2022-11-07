<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="chatting-container" id="container">
	<div class="card border-0">
		<div class="card-header border-0" style="background-color: white">
			<div class="row">
				<div class="col">
					<p class="text mb-1" style="color: black; font-size: 1.2em">채팅</p>
				</div>
				<div class="col">
					<i class="bi bi-plus border rounded-2 mt-1"
						style="float: right; color: black; font-size: 1.1em"
						onclick="openCreateModal()"></i>
				</div>
			</div>
		</div>
		<c:forEach var="room" items="${roomList}">
			<div class="card-body p-0" style="cursor: pointer;"
				onclick="roomOpen(${room.roomId})">
					<input type="hidden" id="roomId" name="roomId"
						value="${room.roomId}">
				<div class="d-flex justify-content-end align-items-center m-0">
					<img class="img-fluid rounded-circle m-3"
						style="width: 40px; height: 40px; position:;" src="/images/faviconcolor.png"
						alt="..." />
					<div class="card-body p-0 me-4" id="chat" style="width: 300;">
						<p class="fw-bold mb-0 wordOneline">${room.roomName}</p>
						<p class="text mb-0 wordOneline"
							style="color: #0000008c; font-size: 14px">${room.roomNum}</p>
					</div>
				</div>
			</div>
		</c:forEach>
		<script>
			function roomOpen(roomId){
				window.open("room?roomId="+roomId, "chat", "width=500, height=800, top=200, left=900");
				
			}
		</script>
	</div>
</div>