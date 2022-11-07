<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<%@include file="../header.jsp"%>
<script>
	document.addEventListener('scroll', function() {
		const factor = document.getElementById('stickyY');
		const target = document.getElementById('sticky');
		const clientRect = factor.getBoundingClientRect();
		const fixedRect = target.getBoundingClientRect();
		const relativeTop = clientRect.top;
		const relativeLeft = clientRect.left;
		const fixedLeft = fixedRect.left;
		const fixedRight = fixedRect.right;
		if (relativeTop <= 88) {
			target.style.position = "fixed";
			target.style.top = "88px";
			target.style.left = fixedLeft+"px";
			target.style.width = (fixedRight-fixedLeft)+"px";
		} else {
			target.style.position = "static";
			target.removeProperty('top');
			target.removeProperty('left');
			target.removeProperty('width');
		}
	});
</script>

<!-- css 추가 -->
<style>
a {
	text-decoration: none;
	!
	important
}

a:hover {
	text-decoration: none;
	!
	important
}

a:visited {
	text-decoration: none;
	!
	important
}

.invite-modal-content {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	width: 360px;
	z-index: 5;
}

.invite-modal-layer {
	position: fixed;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 4;
}

.invite-modal-timesicon {
	position: absolute;
	right: 30px;
	top: 15px;
	cursor: pointer;
}
</style>

</head>
<body style="background-color: #e9ecef">
	<div class="row h-100 px-5" style="padding-top: 72px;">
		<div class="col-2 mt-3"></div>
		<div class="col-8 mt-3">
			<div class="row">
				<div class="col-3 p-0">
					<%@include file="sidebar.jsp"%>
				</div>
				<main class="col-9 p-0" style="overflow: visible">
					<img class="img-fluid mx-auto w-100 mb-3" style="height: 240px;"
						src="images/sample3.jpg" alt="..." />

					<div id="stickyY" class="row">

						<div class="col-8">
							<!-- div추가 main-box 추가 -->
							<div>
								<div class="card border-0 rounded-0 mb-3 main-box">
									<div class="card-header border-0 bg-white p-0">
										<div class="col px-0 py-2 border-bottom"
											style="flex-direction: column;">
											<div class="card-body p-3"">
												<p class="fw-bolder m-0 ">멤버 초대</p>
											</div>
										</div>
									</div>
									<center>
										<div class="col px-2 py-2 border-bottom "
											id="invite-modal-open">
											<button class="col px-5 py-5">초대링크 공유하기</button>

										</div>
									</center>
									<div class="px-2 py-2">사용중인 초대 링크 {숫자}개</div>
								</div>
							</div>
						</div>
						
				<!-- 오른쪽 사이드 바 -->
						<div class="col-4 py-0 ps-0 pe-3" id="sticky">
							<div class="card border-0 rounded-0">
								<div class="card-header border-0 bg-white p-0">
									<div class="row" style="float: none; margin: 0 auto;">
										<div class="col" style="float: none; margin: auto 0;">
											사진첩</div>
										<div class="col" style="text-align: end">
											<button class="btn w-100" onclick="location">
												<p class="text m-0"
													style="font-size: 12px; color: #0000008c;">&nbsp;&nbsp;더
													보기</p>
											</button>
										</div>
									</div>
								</div>
								<div class="card-body p-0">
									<div class="row p-2" style="float: none; margin: 0 auto;">
										<div class="col-4 p-0">
											<div class="row m-0 border border-white">
												<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
													alt="..." />
											</div>
											<div class="row m-0 border border-white">
												<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
													alt="..." />
											</div>
										</div>
										<div class="col-4 p-0">
											<div class="row m-0 border border-white">
												<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
													alt="..." />
											</div>
											<div class="row m-0 border border-white">
												<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
													alt="..." />
											</div>
										</div>
										<div class="col-4 p-0">
											<div class="row m-0 border border-white">
												<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
													alt="..." />
											</div>
											<div class="row m-0 border border-white">
												<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
													alt="..." />
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
			</div>
			</main>
		</div>
	</div>
	
<!-- 모달창 -->

	<div id="invite-modal" style="display: none;">
		<div class="invite-modal-content">
			<div
				class="col d-flex-column justify-content-center align-items-between p-3">
				<header class="row-1">
					<span class="d-flex justify-content-center border-bottom">링크
						공유하기</span> <i class="fas fa-times fa-1x invite-modal-timesicon"></i>
				</header>
				<p style="color: #0000008c; margin-bottom: 0.1rem;">초대링크 복사 후,
					원하는 곳에 링크를 공유하세요.</p>
				<input value="{url ~~!}" style="width: 330px;">
				<div class="row-1">
					<footer>
						<button type="button"
							style="color: #0000008c; border-color: #0000008c; margin-top: 0.5rem;">복사</button>

					</footer>
				</div>
			</div>
		</div>
		<div class="invite-modal-layer"></div>
	</div>
	<!-- 아이콘 추가 임포트 -->
	<script src="https://kit.fontawesome.com/6478f529f2.js"
		crossorigin="anonymous"></script>

	<script>
		$(document).ready(function(){
			/* 앨범버튼 누르면 글쓰기 모달창이 나온다 */
			$("#invite-modal-open").on("click", function(){
				document.querySelector("#invite-modal").style.display = "block";
			});
			
			$(".invite-modal-timesicon").on("click", function(){
				document.querySelector("#invite-modal").style.display = "none";
			});
		});
	</script>
</body>
</html>