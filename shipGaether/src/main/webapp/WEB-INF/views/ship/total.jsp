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

.total-modal-content {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 5;
}

.total-modal-layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.8);
	z-index: 4;
}

.total-modal-timesicon {
	position: absolute;
	right: 10px;
	top: 10px;
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


							<!--total 앨범 위에 설명 구간    main-box div 가 아래 앨범도 묶어줘야함  -->

							<div class="card border-0 rounded-0 mb-3 main-box">
								<div class="card-header border-0 bg-white p-0">
									<div class="row" style="float: none; margin: 0 auto;">

										<div class="col px-0 py-2 border-bottom"
											style="flex-direction: column;">
											<div class="card-body p-3 ">
												<p class="fw-bolder m-0 " style="float: left;">전체 사진
													{숫자}</p>
												<label type="button" for="input-file" style="float: right;">사진 올리기</label>
												<input style="display: none" type="file" id="input-file"
													class="_fileInput" multiple="" title="추가"
													accept="image/png,image/jpg,image/jpeg,image/gif,image/*,video/avi,video/wmv,video/mpg,video/mpeg,video/mov,video/asf,video/skm,video/k3g,video/flv,video/mp4,video/3gp,video/m4v,video/mts,video/ts,video/*"
													name="attachment" />
											</div>
										</div>
										<div class="bg-light" style="color: #0000008c;">


											<select class="fw-bolder m-0"
												style="float: left; font-size: 13px;">
												<option value="recent" {
													% if so=='recent' %}selected{% endif %}>최신순
												</option>
												<option value="old" {% if so=='old' %}selected{% endif %}>오래된
													순</option>
												<option value="recommend" {% if so=='recommend' %}selected{% endif %}>추천순</option>
												<option value="popular" {% if so=='popular' %}selected{% endif %}>인기순</option>
											</select>



											<!--관리버튼 누르면 저장, 삭제 활성화 -->
											<div class="action"
												style="float: right; font-size: 13px; border: 0;">
												<button class="fw-bolder m-0 " id='btn2'
													onclick='toggleBtn1()' style="border: 0;">관리</button>
												<div id='btn1' style="display: none">
													<button type="button" style="border: 0; font-size: 13px;">저장</button>
													<span></span>
													<button type="button" style="border: 0; font-size: 13px;">삭제</button>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!--total 앨범 적용 구간 -->
								<div class="row p-2" style="float: none; margin: 0 auto;">
									<div class="col-4 p-0">
										<div class="row m-0 border border-white" id="total-modal-open">
											<img class="img-fluid mx-auto p-0" src="images/sample3.jpg"
												alt="..." />
										</div>
										<div class="row m-0 border border-white"
											style="cursor: pointer;" onclick="location.href='/total';">
											<img class="img-fluid mx-auto p-0" src="images/sample3.jpg"
												alt="..." />
										</div>
									</div>
									<div class="col-4 p-0">
										<div class="row m-0 border border-white"
											style="cursor: pointer;" onclick="location.href='/total';">
											<img class="img-fluid mx-auto p-0" src="images/sample3.jpg"
												alt="..." />
										</div>
										<div class="row m-0 border border-white"
											style="cursor: pointer;" onclick="location.href='/total';">
											<img class="img-fluid mx-auto p-0" src="images/sample3.jpg"
												alt="..." />
										</div>
									</div>
									<div class="col-4 p-0">
										<div class="row m-0 border border-white"
											style="cursor: pointer;" onclick="location.href='/total';">
											<img class="img-fluid mx-auto p-0" src="images/sample3.jpg"
												alt="..." />
										</div>
										<div class="row m-0 border border-white"
											style="cursor: pointer;" onclick="location.href='/total';">
											<img class="img-fluid mx-auto p-0" src="images/sample3.jpg"
												alt="..." />
										</div>
									</div>
									<div class="col-4 p-0">
										<div class="row m-0 border border-white"
											style="cursor: pointer;" onclick="location.href='/total';">
											<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
												alt="..." />
										</div>
										<div class="row m-0 border border-white"
											style="cursor: pointer;" onclick="location.href='/total';">
											<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
												alt="..." />
										</div>
									</div>
									<div class="col-4 p-0">
										<div class="row m-0 border border-white"
											style="cursor: pointer;" onclick="location.href='/total';">
											<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
												alt="..." />
										</div>
										<div class="row m-0 border border-white"
											style="cursor: pointer;" onclick="location.href='/total';">
											<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
												alt="..." />
										</div>
									</div>
									<div class="col-4 p-0">
										<div class="row m-0 border border-white"
											style="cursor: pointer;" onclick="location.href='/total';">
											<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
												alt="..." />
										</div>
										<div class="row m-0 border border-white"
											style="cursor: pointer;" onclick="location.href='/total';">
											<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
												alt="..." />
										</div>
									</div>

									<div class="col-4 p-0">
										<div class="row m-0 border border-white"
											style="cursor: pointer;" onclick="location.href='/total';">
											<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
												alt="..." />
										</div>
										<div class="row m-0 border border-white"
											style="cursor: pointer;" onclick="location.href='/total';">
											<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
												alt="..." />
										</div>
									</div>
									<div class="col-4 p-0">
										<div class="row m-0 border border-white"
											style="cursor: pointer;" onclick="location.href='/total';">
											<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
												alt="..." />
										</div>
										<div class="row m-0 border border-white"
											style="cursor: pointer;" onclick="location.href='/total';">
											<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
												alt="..." />
										</div>
									</div>
									<div class="col-4 p-0">
										<div class="row m-0 border border-white"
											style="cursor: pointer;" onclick="location.href='/total';">
											<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
												alt="..." />
										</div>
										<div class="row m-0 border border-white"
											style="cursor: pointer;" onclick="location.href='/total';">
											<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
												alt="..." />
										</div>
									</div>
									
									
									</div>
									
									<div id='btn3' style="display: none">
									<button type="button" onclick='toggleBtn2()' style="border: 0; font-size: 1px;">나가기</button>
									
								</div>
								</div>
							</div>
					
						<!--오른족 더보기 사진첩 -->
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
				</main>
			</div>
		</div>
	</div>

	<div id="total-modal" style="display: none;">
		<div class="total-modal-content">
			<div
				class="col d-flex-column justify-content-center align-items-between total-modal-box">
				<header class="row-1">
					<span class="d-flex justify-content-center ">앨범 <i
						class="fas fa-times fa-1x total-modal-timesicon"></i> <img
						class="img-fluid mx-auto p-0" src="images/sample1.jpg">
				</header>



			</div>
		</div>
		<div class="total-modal-layer"></div>
	</div>


	<!-- 아이콘 추가 임포트 -->
	<script src="https://kit.fontawesome.com/6478f529f2.js"
		crossorigin="anonymous"></script>


	<script>
		$(document).ready(function(){
			
			  /* 댓글 쓰기 누르면 댓글창이 나온다 */
			$(".leave-reply-btn").on("click", function(e){
				
				//타겟의 부모 요소 찾기
 				let target = e.target;
				let targetparent = target.closest("div .main-box");
				//alert("targetparent" +targetparent);
				
				let realtarget = targetparent.querySelector(".reply-write-space"); 
				//alert("realtarget"+realtarget);
				
  				realtarget.style.display = "block";
  				realtarget.querySelector(".reply-write-textarea").focus();  
			});
		
			
			/* 앨범버튼 누르면 글쓰기 모달창이 나온다 */
			$("#total-modal-open").on("click", function(){
				document.querySelector("#total-modal").style.display = "block";
				
			});
			
			$(".total-modal-timesicon").on("click", function(){
				document.querySelector("#total-modal").style.display = "none";
			});
		});
	
		//버튼 토글
		function toggleBtn1() {
			  // 토글 할 버튼 선택 (btn1) 생기는 토글
			  const btn1 = document.getElementById('btn1');
			  
			// btn1 숨겨져 있는 상태에서 btn2 클릭
			  if(btn1.style.display == 'none') {
				btn1.style.display = 'block';
			    btn2.style.display = 'none';
			    btn3.style.display = 'block';
			   // btn2.style.display = 'none';
			  }
			}
		function toggleBtn2() {
			  // 토글 할 버튼 선택 (btn2) 기존에 있던 토글
			  const btn2 = document.getElementById('btn2');
			  
			  // btn2 숨겨져 있는 상태에서 btn3 클릭
			  if(btn2.style.display == 'none') {
				btn1.style.display = 'none';
			    btn2.style.display = 'block';
			    btn3.style.display = 'none';
			   // btn2.style.display = 'none';
			  }
			}
	</script>

</body>
</html>