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

				<!-- main  -->
				<main class="col-9 p-0" style="overflow: visible">
					<div class="col-10 p-0" style="background-color: white;">
						<div class="col-12 p-0 border border-black"
							style="float: none; margin: 0 auto;">
							<div class="row p-0">
								<div class="col-1 px-0 py-2" style="flex-direction: column;">
								</div>
								<div class="col-11 px-0 py-2" style="flex-direction: column;">공지사항</div>
							</div>
						</div>

						<!-- notice list-->
						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto;">
							ship이 10살을 맞이 했어요! <br>
							<br>
							<div style="font-size: 8pt;">2022년8월30일</div>
						</div>

						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto;">
							ship "피망 뉴맞고 " 서비스 종료 안내 드립니다 <br>
							<br>
							<div style="font-size: 8pt;">2022년8월30일</div>
						</div>

						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto;">
							ship 지역 소모임 OPEN <br>
							<br>
							<div style="font-size: 8pt;">2022년8월30일</div>
						</div>

						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto;">
							ship 이용중 네이버 화면이 나온다면 주의해주세요 <br>
							<br>
							<div style="font-size: 8pt;">2022년8월30일</div>
						</div>
						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto;">
							[캠페인]SNS에서 사칭 조심하세요! <br>
							<br>
							<div style="font-size: 8pt;">2022년8월30일</div>
						</div>
						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto;">
							불법촬영등 유통방지를 위한 기술적 조치적 적용을 안내드립니다 <br>
							<br>
							<div style="font-size: 8pt;">2022년8월30일</div>
						</div>

					</div>
				</main>
			</div>

		</div>
	</div>



</body>



</html>