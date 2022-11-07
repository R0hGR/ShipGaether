<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="source.jsp"%>
<html lang="en">
<head>
<title>SHIP GÆTHER</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="/images/faviconcolor.png" />
</head>


<!-- Navigation-->

<nav
	class="navbar navbar-expand-lg navbar-white bg-white rounded-0 w-100"
	style="position: fixed; z-index: 3000;">
	<div class="row w-100">
		<div class="col-2"></div>
		<div class="col-8 p-0">
			<div class="container-fluid p-0">

				<div class="d-flex justify-content-end align-items-center m-0">
					<a class="navbar-brand p-2" href="../../../"><img
						src="/images/logo_flat.png" width="175" height="40" border="0"></a>
					<form
						class="d-flex border border-1.5 rounded-5 border-light bg-light justify-content-start align-items-center m-0"
						action="../../../search/" role="search" method="get">
						<input class="form-control p-0 ps-2" name="search" type="search"
							placeholder="Search....." aria-label="Search"
							style="border: 0; font-size: 0.9em; color: #0000008c; background-color: transparent;">
						<div
							class="d-flex align-items-center me-lg-0 mb-2 mb-lg-0 ms-auto  p-0">
							<button class="btn" type="submit">
								<i class="bi-search" style="color: #0000008c"></i>
							</button>
						</div>
					</form>
					<div
						class="d-flex justify-content-end align-items-center me-lg-0 mb-2 mb-lg-0 ms-auto ">
						<button class="navbar-toggler collapsed" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<form class="d-inline-flex me-lg-0 mb-2 mb-lg-0 ms-auto">
							<c:choose>
								<c:when test="${login eq true}">
									<button class="btn btn-outline-secondary border-0"
										style="font-size: 1.3em" type="button" id="calendar"
										onclick="location.href='../../../../../../fullcalendar/myCalendar'">
										<i class="bi bi-calendar4-event"></i>
									</button>
									   &nbsp;&nbsp;
									<button class="btn btn-outline-secondary border-0"
										style="font-size: 1.3em" type="button"
										id="chatting_modal_opne_btn" onclick="openChattingModal()">
										<i class="bi bi-chat-dots me-1"></i>
									</button>
									   &nbsp;&nbsp;
									<button
                              class="btn btn-sm btn-outline-secondary border-secondary border-2"
                              type="button" onclick="logout()">
                              <i class="bi-key-fill me-1"></i> Logout
                           </button>
                           <script>
                           function logout(){
                              sessionStorage.clear();
                              location.href='/logout';                              
                           }
                           </script>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            	<button
										class="btn btn-sm btn-outline-secondary border-secondary border-2"
										type="button" onclick="location.href='/info'">
										<i class="bi-person-fill me-1"></i> MyPage
									</button>
								</c:when>
								<c:otherwise>
									<button
										class="btn btn-sm btn-outline-secondary border-secondary border-2"
										type="button" id="login_modal_open_btn"
										onclick="openLoginModal()">
										<i class="bi-key-fill me-1"></i> Login
									</button>
							&nbsp;&nbsp;&nbsp;
							<button
										class="btn btn-sm btn-outline-secondary border-secondary border-2"
										type="button" id="signup_modal_open_btn"
										onclick="openSignUpModal()">
										<i class="bi-person-fill me-1"></i> Sign Up
									</button>
								</c:otherwise>
							</c:choose>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</nav>


<!-- 로그인 모달 -->
<div id="login_modal">
	<div class="modal_content">
		<%@include file="login.jsp"%>
	</div>
	<div class="modal_layer"></div>
	<button class="btn" type="button" id="login_modal_close_btn"
		onclick="closeLoginModal()">
		<i class="bi-x-lg me-1"
			style="color: white; font-size: 1.5em; position: fixed; top: 100px;"></i>
	</button>
</div>

<!-- 회원정보 찾기 모달 -->
<div id="find_modal">
	<div class="modal_content">
		<%@include file="find.jsp"%>
	</div>
	<div class="modal_layer"></div>
	<button class="btn" type="button" id="find_close_btn"
		onclick="closeFindModal()">
		<i class="bi-x-lg me-1"
			style="color: white; font-size: 1.5em; position: fixed;"></i>
	</button>
</div>
<!-- 회원가입 모달 -->
<div id="signup_modal">
	<div class="modal_content">
		<%@include file="signup.jsp"%>
	</div>
	<div class="modal_layer"></div>
	<button class="btn" type="button" id="signup_modal_close_btn"
		onclick="closeSignUpModal()">
		<i class="bi-x-lg me-1"
			style="color: white; font-size: 1.5em; position: fixed; top: 100px"></i>
	</button>
</div>

<!-- 채팅 모달 -->
<div id="chatting_modal">
	<div id="MyDiv" class="modal_content">
		<%@include file="room.jsp"%>
	</div>
	<div class="modal_layer" id="chatting_modal_close_btn"
		onclick="closeChattingModal()"></div>
</div>

<!-- 채팅 생성 -->
<div id="create_modal">
	<div class="modal_content">
		<%@include file="roomCreate.jsp"%>
	</div>
	<div class="modal_layer"></div>
	<button class="btn" type="button" id="create_modal_close_btn"
		onclick="closeCreateModal()">
		<i class="bi-x-lg me-1"
			style="color: white; font-size: 1.5em; position: fixed; top: 100px;"></i>
	</button>
		<!-- 	회원가입 기능들 모음집 -->
	<script src="/js/register.js"></script>
</div>