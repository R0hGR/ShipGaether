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
					<%@include file="myPageSidebar.jsp"%>
				</div>


				<main class="col-9 p-0" style="overflow: visible">



					<div id="stickyY" class="row">
						<div class="col-8">
							<div class="wrap" style="background-color: white;">

								<div class="col-12 p-0 border border-black"
									style="float: none; margin: 0 auto;">
									<div class="row p-0">
										<div class="col-1 px-0 py-2" style="flex-direction: column;">
										</div>
										<div class="col-11 px-0 py-2" style="flex-direction: column;">
											북마크</div>
									</div>
								</div>

								<!-- 북마크 칸 -->
								<div class="row p-1 border border-black"
									style="float: none; margin: 0 auto;">
									<div
										class="col-12 p-1 border border-white d-flex justify-content-center align-items-center"
										style="height: 400px; width: 0 auto; color: #6c6c6c;">북마크된
										글이 없습니다</div>
								</div>
							</div>
						</div>

						<!-- right side -->
						<div class="col-4 py-0 ps-0 pe-3" id="sticky">
							<div class="card border-0 rounded-0">
								<div id="sideRight"
									style="display: block; background-color: #e9ecef; font-size: 5pt;">
									데스크탑 버전 다운로드
									<hr>
									Operating Policies and Terms&nbsp; 블로그&nbsp; 공지사항 &nbsp;스티커제안
									&nbsp;광고&nbsp; 이용약관 &nbsp;개인정보처리방침 &nbsp; 쿠키 설정 &nbsp;CCPA
									&nbsp;개인 정보 관리 &nbsp;청소년 보호를 위한 노력 활동정책 &nbsp;권리침해 신고안내
									&nbsp;개발자 도움말 <br>BAND © 2022
								</div>
							</div>
						</div>
					</div>
				</main>
			</div>
		</div>
	</div>

</body>
</html>