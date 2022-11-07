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
							<li class="nav-item col-4 p-1 border border-black d-flex justify-content-center align-items-center">
							<a href="/mySettingHelp/1" class="nav-link link-dark" > 
							<use xlink:href="#optionhelp_c1"></use>자주 묻는 질문
							</a></li>
							
							
							<li class="col-4 p-1 border border-black d-flex justify-content-center align-items-center"
							style="background-color:#5bb9eb;">
							<a href="/mySettingHelp/2" class="nav-link" style="color:white"> 
							<use xlink:href="#optionhelp_c2"></use>프로필
							</a></li>
							
							<li class="col-4 p-1 border border-black d-flex justify-content-center align-items-center">
							<a href="/mySettingHelp/3" class="nav-link link-dark"> 
							<use xlink:href="#optionhelp_c3"></use>회원정보/인증
							</a></li>
							
							</ul>
							</div>
							
						<div class="row p-0">
						<ul class="nav nav-pills flex-row mb-auto">
							<li class="nav-item col-4 p-1 border border-black d-flex justify-content-center align-items-center">
							<a href="/mySettingHelp/4" class="nav-link link-dark" > 
							<use xlink:href="#optionhelp_c4"></use> ship설정
							</a></li>
							
							
							<li class="col-4 p-1 border border-black d-flex justify-content-center align-items-center">
							<a href="/mySettingHelp/5" class="nav-link link-dark"> 
							<use xlink:href="#optionhelp_c5"></use> ship멤버
							</a></li>
							
							<li class="col-4 p-1 border border-black d-flex justify-content-center align-items-center">
							<a href="/mySettingHelp/6" class="nav-link link-dark"> 
							<use xlink:href="#optionhelp_c6"></use> 콘텐츠
							</a></li>
							
						</ul>
						</div>
						
						
						</div>
					</div>
					<br>


					<div class="col-10 p-0" style="background-color: white;">
						<div class="row p-2 border border-black"
							style="float: none; margin: 0 auto; background-color: #d9dbdd">
							프로필</div>
						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto; font-size: 10pt">생일 또는
							휴대폰 번호 공개여부를 설정할 수 있나요?</div>
						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto; font-size: 10pt">내 프로필
							사진을 변경하고 싶어요.</div>
						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto; font-size: 10pt">생일/성별
							정보가 변경이 안돼요.</div>
						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto; font-size: 10pt">
							ship별로 프로필을 다르게 설정할 수 있나요?</div>
						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto; font-size: 10pt">전화번호
							일부가 * 표시되서 보여지는데 공개할 수 없나요?</div>

					</div>
				</main>
			</div>
		</div>
	</div>

</body>



</html>