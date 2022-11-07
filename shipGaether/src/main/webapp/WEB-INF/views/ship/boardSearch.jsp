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

<!-- board_search css 추가 -->
<style>

.board-search-option-select-box {
	
}
.board-search-option-select-box select,
.board-search-option-select-box select option {
	color: #666;
    border: 1px solid #B3B3B3;
    font-size: 13px;
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
						src="/images/sample3.jpg" alt="..." />

					<div id="stickyY" class="row">
						
						<!-- 게시판 검색 페이지 시작 -->
						<div class="col-8">

							<form
								class="d-flex border border-1.5 rounded-0 border-white bg-white justify-content-end align-items-center"
								action="/ship/board/search" role="search" method="get"> 
								<input class="form-control border-0" name="search" type="search"
									placeholder="Search....." aria-label="Search"
									style="background-color: transparent;">
								<div
									class="d-flex justify-content-end align-items-center me-lg-0 mb-2 mb-lg-0 ms-auto ">
									<button class="btn" type="submit">
										<i class="bi-search" style="color: #0000008c;"></i>
									</button>
								</div>
							</form>

							<div
								class="card border-0 rounded-0 border-bottom d-flex flex-row justify-content-around align-items-center py-2">
								<div class="" style="width: 70%;">
									<button
										class="btn btn-sm btn-outline-secondary border-1 rounded-4 border-around">글과 댓글</button>
									<button
										class="btn btn-sm btn-outline-secondary border-1 rounded-4 border-around">게시글만</button>
								</div>
								<div class="board-search-option-select-box">
									<select class="p-2">
										<option>전체기간</option>
										<option>1개월</option>
										<option>3개월</option>
										<option>6개월</option>
										<option>1년</option>
									</select>
								</div>
							</div>

							
							
	<!-- 첫번째 게시글 시작 -->
	<div class="card border-0 rounded-0 mb-3 main-box">
		<div>
			<div class="card-header border-0 bg-white p-0">
				<div class="btn btn-more" onclick="">
					<i class="fas fa-ellipsis-v"></i>
				</div>
				<!-- 다른 사람의 글일 경우 -->
				<div class="others-post-menu-box px-0" style="display: none;">
					<ul>
						<li class="border-line-bottom"><a href="#">북마크</a></li>
						<li class="border-line-bottom"><a href="#">이 멤버의 글 차단하기</a></li>
						<li class=""><a href="#">신고하기</a></li>
					</ul>
				</div>

				<!-- 내가 쓴 글일 경우 -->
				<div class="post-menu-box px-0" style="display: none;">
					<ul>
						<li class="border-line-bottom"><a href="#">글 수정</a></li>
						<li class="border-line-bottom"><a href="#">북마크</a></li>
						<li class=""><a href="#">삭제하기</a></li>
					</ul>
				</div>


				<div class="row" style="float: none; margin: 0 auto;">
					<div class="col-2" style="float: none; margin: auto;">
						<img class="img-fluid rounded-circle img-thumbnail"
							style="width: 40; height: 40; position:;" src="/images/logo.png"
							alt="..." />
					</div>
					<div class="col px-0 py-2" style="flex-direction: column;">
						<div class="BOARD_NUM" style="display: none;"></div>
						<p class="fw-bolder m-0 BOARD_WRITER" style="font-size: 0.9em;">@Crew</p>
						<p class="text m-0 BOARD_WDATE" style="font-size: 0.8em;">n
							hours ago</p>
					</div>
				</div>
			</div>

			<div class="row p-2 main-inside-box"
				style="float: none; margin: 0 auto;">
				<div class="col-8 p-0 border border-white">
					<img class="img-fluid mx-auto" src="/images/sample1.jpg"
						style="object-fit: cover;" alt="..." />
				</div>
				<div class="col-4 p-0">
					<div class="row m-0 border border-white">
						<img class="img-fluid mx-auto p-0" src="/images/sample1.jpg"
							alt="..." />
					</div>
					<div class="row m-0 border border-white">
						<img class="img-fluid mx-auto p-0" src="/images/sample1.jpg"
							alt="..." />
					</div>
					<div class="row m-0 border border-white">
						<button type="button" class="btn w-100 h-100 border-0 p-0"
							style="display: flex; align-items: center; justify-content: center;">
							<i class="bi bi-plus"
								style="position: absolute; font-size: 1.4em">더 보기</i> <img
								class="img-fluid mx-auto p-0" src="/images/more_gray.png"
								style="width: 32%; position: absolute; opacity: 0.5;" alt="..." />
							<img class="img-fluid mx-auto p-0" src="/images/sample1.jpg"
								style="overflow: hidden;" alt="..." />

						</button>
					</div>
				</div>

				<div class="card-body">
					<div class="text BOARD_CONTENT">
						Sample text area~~~~~~~<br>~~~~~~~~~~~~~~~<br>~~~~~~~~~~<br>
					</div>

					<div class="col">
						<div class="d-inline">
							<span class="BOARD_GOOD">좋아요</span> <span>5</span>
						</div>
						<button class="d-inline none-border-btn">
							댓글 <span>3</span>
						</button>
					</div>


				</div>


				<div
					class="eye-i-box d-flex justify-content-center align-items-center">
					<i class="fas fa-eye m-1"></i> <span>5</span>
				</div>
				
				
			
			</div>



			<!-- Product actions-->
			<!-- mb-3 지움 -->
			<div class="card-footer bg-transparent">
				<div class="row">
					<div class="col">
						<button class="btn w-100" onclick="location">
							<i class="bi bi-hand-thumbs-up" style="color: #0000008c;">&nbsp;&nbsp;좋아요</i>
						</button>
					</div>
					<div class="col">
						<button class="btn w-100 leave-reply-btn" onclick="">
							<i class="bi bi-chat-right-dots" style="color: #0000008c;">&nbsp;&nbsp;댓글달기</i>
						</button>
					</div>
				</div>
			</div>


			<div class="row m-0 bg-light p-0 border-line-both sub-box"
				style="heigth: 200px; color: #333;">
				<div class="row">

					<div class="btn-reply-more">
						<i class="fas fa-ellipsis-v"></i>
					</div>

					<!-- 다른 사람의 댓글일 경우 -->
					<div class="others-reply-menu-box px-0" style="display: none;">
						<ul>
							<li class="border-line-bottom"><a href="#">이 멤버의 댓글 차단하기</a></li>
							<li class=""><a href="#">신고하기</a></li>
						</ul>
					</div>

					<!-- 내가 쓴 댓글일 경우 -->
					<div class="reply-menu-box px-0" style="display: none;">
						<ul>
							<li class="border-line-bottom"><a href="#">댓글 수정</a></li>
							<li class="border-line-bottom"><a href="#">댓글 삭제</a></li>
						</ul>
					</div>


					<div class="col-2 m-0 my-2 py-3 d-flex justify-content-center">
						<div class="d-flex justify-content-center align-items-start"
							onclick="location.href='#'">
							<i
								class="fas fa-user-circle fa-2x col-1 d-flex justify-content-center align-items-start reply-profile"></i>

						</div>
					</div>
					<div class="col-10 p-0 py-3">

						<div class="row-2 fw-bolder m-0 reply-read-name">
							<div class="REPLY_NUM" style="display: none;"></div>
							<div class="reply-writer CREW_NUM">
								<strong class="text">작성자</strong>
							</div>

							<div class="row-2 REPLY_CONTENT">내용</div>
							<div class="row-2 d-flex flex-row jusify-content-between">
								<span class="REPLY_WDATE">9월 14일 오후 2:35 ·</span>
								<button class="REPLY_GOOD none-border-btn">좋아요 ·</button>
								<button class="leave-reply none-border-btn">답글 쓰기</button>
							</div>
						</div>
					</div>

				</div>

				<!-- 답글 입력 부분 -->
				<div class="bg-transparent reply-write-inner-space"
					style="display: none;">

					<div
						class="row d-flex justify-content-between align-items-center ms-3 me-1 my-3">
						<div class="col-1 btn-upload" onclick="location.href='#'"
							style="padding: 0;">

							<i class="far fa-plus-square align-items-center"
								style="color: #B3B3B3;"></i>

						</div>

						<div
							class="col-9 px-3 reply-write-box d-flex justify-content-start align-items-center"
							style="background: white;">
							<i class="fas fa-user col-1" style="color: #B3B3B3;"></i>
							<textarea name="replyContent"
								class="reply-write-textarea col-11 p-1 bg-white"
								placeholder="답글을 남겨주세요."></textarea>

						</div>
						<div class="col-2 " style="vertical-align: center;">
							<input type="button" class="reply-submit-btn text-white"
								onclick="location" value="보내기" />
						</div>
					</div>
				</div>

			</div>

		</div>

		<!-- 입력된 답글 -->

		<div class="row d-flex justify-content-center sub-box px-3 m-0">
			<div class="row">
				<div class="btn-reply-reply-more">
					<i class="fas fa-ellipsis-v"></i>
				</div>

				<!-- 다른 사람의 답글일 경우 -->
				<div class="others-reply-reply-menu-box px-0" style="display: none;">
					<ul>
						<li class="border-line-bottom"><a href="#">이 멤버의 댓글 차단하기</a></li>
						<li class=""><a href="#">신고하기</a></li>
					</ul>
				</div>

				<!-- 내가 쓴 답글일 경우 -->
				<div class="reply-reply-menu-box px-0" style="display: none;">
					<ul>
						<li class="border-line-bottom"><a href="#">댓글 수정</a></li>
						<li class="border-line-bottom"><a href="#">댓글 삭제</a></li>
					</ul>
				</div>


				<div class="col-2 m-0 my-2 py-3 d-flex justify-content-center">

					<div class="d-flex justify-content-center align-items-start"
						onclick="location.href='#'">
						<i
							class="fas fa-user-circle fa-2x col-1 d-flex justify-content-center align-items-start reply-profile"></i>
					</div>
				</div>
				<div class="col-10 p-0 py-3">

					<div class="row-2 fw-bolder m-0 reply-read-name">
						<div class="REPLY_NUM" style="display: none;"></div>
						<div class="reply-writer CREW_NUM">
							<strong class="text">답글 작성자</strong>
						</div>

						<div class="row-2 REPLY_CONTENT">내용</div>
						<div class="row-2 d-flex flex-row jusify-content-between">
							<span class="REPLY_WDATE">9월 14일 오후 2:35 ·</span>
							<button class="REPLY_GOOD none-border-btn">좋아요 ·</button>
							<button class="leave-reply none-border-btn">답글 쓰기</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 댓글 입력 부분-->
			<div class="bg-transparent reply-write-space p-0"
				style="display: none;">
				<div
					class="row d-flex justify-content-between align-items-center ms-1 my-3 pe-2">
					<div class="col-1 btn-upload" onclick="location.href='#'"
						style="padding: 0;">

						<i class="far fa-plus-square align-items-center"
							style="color: #B3B3B3;"></i>

					</div>
					<div
						class="col-9 px-3 reply-write-box d-flex justify-content-start align-items-center">
						<i class="fas fa-user col-1" style="color: #B3B3B3;"></i>
						<textarea class="reply-write-textarea col-11 p-1"
							placeholder="댓글을 남겨주세요."></textarea>

					</div>
					<div class="col-2 " style="vertical-align: center;">
						<input type="button" class="reply-submit-btn text-white"
							onclick="location" value="보내기" />
					</div>
				</div>
			</div>
		</div>

	</div>





</div>

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
												<img class="img-fluid mx-auto p-0" src="/images/sample1.jpg"
													alt="..." />
											</div>
											<div class="row m-0 border border-white">
												<img class="img-fluid mx-auto p-0" src="/images/sample1.jpg"
													alt="..." />
											</div>
										</div>
										<div class="col-4 p-0">
											<div class="row m-0 border border-white">
												<img class="img-fluid mx-auto p-0" src="/images/sample1.jpg"
													alt="..." />
											</div>
											<div class="row m-0 border border-white">
												<img class="img-fluid mx-auto p-0" src="/images/sample1.jpg"
													alt="..." />
											</div>
										</div>
										<div class="col-4 p-0">
											<div class="row m-0 border border-white">
												<img class="img-fluid mx-auto p-0" src="/images/sample1.jpg"
													alt="..." />
											</div>
											<div class="row m-0 border border-white">
												<img class="img-fluid mx-auto p-0" src="/images/sample1.jpg"
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

	<!-- 글쓰기 모달창 -->
	<div id="write-modal" style="display: none;">
		<div class="write-modal-content">
			<form class="col d-flex-column justify-content-center align-items-between p-3 write-modal-box" 
				method="post" action="">

				<div class="row-1">
					<span class="d-flex justify-content-center">글쓰기</span>
					<i class="fas fa-times fa-2x write-modal-close-i"></i>
				</div>
				<textarea
					class="row-9 m-3 py-4 write-modal-textarea border-line-top"></textarea>
				<div class="row-1">

					<div class="card-footer border-0 bg-transparent d-flex justify-content-around p-3">
						<button class="btn" onclick="picture" style="size:10px">
							<input type="file" class="img-input" accept="image/*" name="" />
							<i class="bi bi-image fs-5" style="color: #0000008c;"></i>
						</button>
						<button class="btn" onclick="video">
							<input type="file" class="video-input" accept="video/*" name=""/>
							<i class="bi bi-play-circle fs-5" style="color: #0000008c;"></i>
						</button>
						<button class="btn" onclick="file">
							<input type="file" class="file-input" accept="*" name=""/>
							<i class="bi bi-paperclip fs-5" style="color: #0000008c;"></i>
						</button>
						<button class="btn" onclick="calendar">
							<i class="bi bi-calendar4-week fs-5" style="color: #0000008c;"></i>
						</button>
						<button class="btn" onclick="todo">
							<i class="bi bi-ui-checks fs-5" style="color: #0000008c;"></i>
						</button>
						<button class="btn" onclick="location">
							<i class="bi bi-geo-alt fs-5" style="color: #0000008c;"></i>
						</button>
					</div>

				</div>

				<div class="row-1 border-line-top d-flex justify-content-between align-items-center py-4">
					<div class="col-10 d-inline">
						<button style="border-style: none; background-color: white;">
							<i class="fas fa-cog fa-lg cog-i"></i>
						</button>
						<span>글쓰기 설정</span>
					</div>
					<input type="button" class="write-modal-submit-btn col-2" value="작성" onclick="" />
				</div>
			</form>
		</div>
		<div class="write-modal-layer"></div>
	</div>
	
	<!-- join-answer-modal --> 
	
	<div id="join-answer-modal" style="display: none;">
		<div class="join-answer-modal-content">
			<form class="join-answer-modal-box d-flex-column justify-content-center align-items-between p-3 py-5">
				<div class="row-1 border-line-bottom">
					<h5 class="text-center">SHIP NAME</h5>
					<p class="text-center">가입 질문에 답해주세요.</p>
				</div>
				<div class="row-8 d-flex-column justify-content-center align-items-center">
					<div class="text-center my-3">이 밴드에 가입하시려는 이유가 무엇인가요?</div>
					<textarea name="" class="d-flex justify-content-center align-items-center my-3 p-3 join-textarea"
					placeholder="답변을 작성해주세요."></textarea>
				</div>
				<div class="row-2 d-flex justify-content-center align-items-center">
					<button class="join-cencel-btn m-1">취소</button>
					<input type="button" value="가입하기" class="join-btn m-1">
				</div>
			</form>
		</div>
		<div class="write-modal-layer"></div>	
	</div>


	<script src="/js/main.js"></script>

	<!-- 아이콘 추가 임포트 -->
	<script src="https://kit.fontawesome.com/6478f529f2.js"
		crossorigin="anonymous"></script>
</body>
</html>