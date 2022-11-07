<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<%@include file="../header.jsp"%>
</head>

<body style="background-color: #e9ecef">
	<div class="row h-100 px-5" style="padding-top: 72px;">

		<div class="col-2 mt-3"></div>
		<div class="col-8 mt-3">

			<!-- MypageSidebar -->
			<div class="row">
				<div class="col-3 p-0">
					<%@include file="mySettingSidebar.jsp"%>
				</div>

				<!-- main  -->
				<main class="col-9 p-0" style="overflow: visible">
					<div class="col-10 p-0" style="background-color: white;">

						<div class="col-12 p-0 border border-black"
							style="float: none; margin: 0 auto;">
							<div class="row p-0">
								<div class="col-1 px-0 py-2" style="flex-direction: column;">
								</div>
								<div class="col-11 px-0 py-2" style="flex-direction: column;">도움말</div>
							</div>
						</div>

						<!-- 질문 카테고리 -->
						<div
							class="row p-3 border border-black d-flex justify-content-center align-items-center"
							style="float: none; margin: 0 auto">
							
							<div class="row p-0">
							<ul class="nav nav-pills flex-row mb-auto">
							<li class="nav-item col-4 p-1 border border-black d-flex justify-content-center align-items-center"
							style="background-color:#5bb9eb;">
							<a href="/mySettingHelp/1" class="nav-link" style="color:white"> 
							<use xlink:href="#mySettingHelp_1"></use>자주 묻는 질문
							</a></li>
							
							
							<li class="col-4 p-1 border border-black d-flex justify-content-center align-items-center">
							<a href="/mySettingHelp/2" class="nav-link link-dark"> 
							<use xlink:href="#mySettingHelp_2"></use>프로필
							</a></li>
							
							<li class="col-4 p-1 border border-black d-flex justify-content-center align-items-center">
							<a href="/mySettingHelp/3" class="nav-link link-dark"> 
							<use xlink:href="#mySettingHelp_3"></use>회원정보/인증
							</a></li>
							
							</ul>
							</div>
							
						<div class="row p-0">
						<ul class="nav nav-pills flex-row mb-auto">
							<li class="nav-item col-4 p-1 border border-black d-flex justify-content-center align-items-center">
							<a href="/mySettingHelp/4" class="nav-link link-dark" > 
							<use xlink:href="#mySettingHelp_4"></use> ship설정
							</a></li>
							
							
							<li class="col-4 p-1 border border-black d-flex justify-content-center align-items-center">
							<a href="/mySettingHelp/5" class="nav-link link-dark"> 
							<use xlink:href="#mySettingHelp_5"></use> ship멤버
							</a></li>
							
							<li class="col-4 p-1 border border-black d-flex justify-content-center align-items-center">
							<a href="/mySettingHelp/6" class="nav-link link-dark"> 
							<use xlink:href="#mySettingHelp_6"></use> 콘텐츠
							</a></li>
							
						</ul>
						</div>
						</div>
					</div>
					<br>
					<!-- 카테고리 끝 -->

					<!-- 자주 묻는 질문-->
					<div class="col-10 p-0" style="background-color: white;">
						<div class="row p-2 border border-black"
							style="float: none; margin: 0 auto; background-color: #d9dbdd">
							자주 묻는 질문</div>
						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto; font-size: 10pt">
							[이용약관,개인정보처리방침] 어디에서 확인할 수 있나요?</div>
						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto; font-size: 10pt">가입한
							ship이 모두 사라졌어요.</div>
						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto; font-size: 10pt">"이
							브라우저에서 다시 묻지 않기"를 해도 계속 인증요청이 와요.</div>
						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto; font-size: 10pt">다른
							사람에게 리더를 위임하고 싶어요.</div>
						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto; font-size: 10pt">가입중인
							ship에서 탈퇴하고 싶어요.</div>
						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto; font-size: 10pt">인증번호가
							오지 않아요.</div>
						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto; font-size: 10pt">하루에
							가입/연동할 수 있는 횟수에 제한이 있나요?</div>
						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto; font-size: 10pt">로그아웃은
							어떻게 하나요?</div>
						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto; font-size: 10pt">
							불법물촬영등에 대해 신고하고 싶어요.</div>




					</div>
				</main>
			</div>
		</div>
	</div>



</body>



</html>