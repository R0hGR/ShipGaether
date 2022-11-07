<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	

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
									
									
				<!-- 내가 쓴 글 메인 시작  -->
				<main class="col-9 p-0" style="overflow: visible">
					<div class="col-10 p-3 mb-3" style="background-color: white;">

						
						<div class="card-body p-4 pb-2"
							style="float: none; margin: 0 auto;">
							<h5 style="font-weight:800;">내가 쓴 글</h5>
						</div>
						
						<div class="row d-flex justify-content-around align-items-center">
							<div class="col-5"
								style="width: 0 auto; padding-right: 0px;">
								<a href="#" class="btn w-100 border border-black" >
									게시글</a>
							</div>

							<div class="col-5"
								style="width: 0 auto; padding-left: 0px;">
								<a href="#" class="btn w-100 border border-black">
									댓글</a>
							</div>
						</div> 

					</div>
						<!-- 게시글 들어갈 부분 -->
						
								
								
			<!-- 하나의 게시글 시작 -->
			<div class="col-10 p-3 mb-3 card border-0 rounded-0 mb-3 main-box">

				<div class="card-header border-0 bg-white p-0">
					<div class="btn btn-more" onclick="showBoardMore(this)">
						<i class="fas fa-ellipsis-v"></i>
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
							<img class="img-fluid rounded-circle img-thumbnail" style="width: 40; height: 40; position:;" src="/images/logo.png" alt="..." />
						</div>
						<div class="col px-0 py-2" style="flex-direction: column;">
							<div class="BOARD_NUM" style="display: none;"></div>
							<p class="fw-bolder m-0 BOARD_WRITER" style="font-size: 0.9em;">${ item.crewNickname }</p>
							<p class="text m-0 BOARD_WDATE" style="font-size: 0.8em;">boardNum:${ item.boardNum } 게시날짜:${ item.boardWdate }</p>
						</div>
					</div>
				</div>
				<!-- 게시글 내용 시작 -->				
				
				<div class="row p-2 main-inside-box" style="float: none; margin: 0 auto;">

					<!-- 게시글에 사진포함 -->
					<div class="col-8 p-0 border border-white">
						<img class="img-fluid mx-auto" src="/images/sample1.jpg" style="object-fit: cover;" alt="..." />
					</div>
					<div class="col-4 p-0">
						<div class="row m-0 border border-white">
							<img class="img-fluid mx-auto p-0" src="/images/sample1.jpg" alt="..." />
						</div>
						<div class="row m-0 border border-white">
							<button onclick="openRead(${item.boardNum})" type="button" class="btn w-100 h-100 border-0 p-0" style="display: flex; align-items: center; justify-content: center;" >
								<i class="bi bi-plus" style="position: absolute; font-size: 1.4em">더 보기</i> <img class="img-fluid mx-auto p-0" src="/images/more_gray.png" style="width: 32%; position: absolute; opacity: 0.5;" alt="..." /> <img class="img-fluid mx-auto p-0" src="/images/sample1.jpg" style="overflow: hidden;" alt="..." />
							</button>
						</div>  
						
	
						
					</div>
					<!-- 게시글에 사진포함 끝 -->

					<div class="card-body">
						<div class="text BOARD_CONTENT">${ item.boardContent }</div>


	
						<!-- 게시글의 첨부파일 요약 시작 -->
					 	<div>
					 	<a href="#" contenteditable="false" class="row p-3 my-3 m-0 border-around bg-light" style="cursor:pointer;">
					 		<div class="col-12 d-flex justify-content-between" style="color: black;">
					 			<span class="row-6">파일 이름.jpg</span>
					 			<span class="row-6" style="opacity: .6;">7KB</span>
					 		</div>
					 	</a>
					 	</div>
					 	<!-- 게시글의 첨부파일 요약 끝 -->


						<div class="col">
							<div class="d-inline">
								<span class="BOARD_GOOD">좋아요</span> <span>${ item.boardGood }</span>
							</div>
							<button class="d-inline none-border-btn">
								댓글 <span>3</span>
							</button>
						</div>
					</div>


					<div class="eye-i-box d-flex justify-content-center align-items-center">
						<i class="fas fa-eye m-1"></i> <span>${ item.boardView }</span>
					</div>
				</div>
				
				
				
				<!-- 게시글 내용 끝 -->

				<!-- 좋아요 / 댓글달기 -->
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
				<!-- 좋아요 / 댓글달기 -->

				<c:forEach var="reply" items="${replys}">
					<c:if test="${ item.boardNum == reply.boardNum }">
						<%-- 댓글 하나 시작 --%>
						<div class="row m-0 bg-light p-0 border-line-both sub-box" style="heigth: 200px; color: #333;">
							<div class="row">
								<c:choose>
									<c:when test="${ reply.bundleDepth  lt 1 }">
										<%-- 1) 댓글의 프로필사진 --%>
										<div class="col-2 m-0 my-2 py-3 d-flex justify-content-center">
											<div class="d-flex justify-content-center align-items-start" onclick="location.href='#'">
												<i class="fas fa-user-circle fa-2x col-1 d-flex justify-content-center align-items-start reply-profile"></i>
											</div>
										</div>
										<%-- 1) 댓글의 프로필사진 끝 --%>


										<%--  댓글 작성자 + 내용 --%>
										<div class="col-10 p-0 py-3">
											<div class="row-2 fw-bolder m-0 reply-read-name">
												<div class="REPLY_NUM" style="display: none;"></div>
												<div class="reply-writer CREW_NUM">
													<strong class="text">${ reply.crewNickname }</strong>
												</div>
												<div class="row-2 REPLY_CONTENT">${ reply.replyContent }</div>
												<div class="row-2 d-flex flex-row jusify-content-between">
													<span class="REPLY_WDATE">${ reply.replyWdate }·</span>
													<button class="REPLY_GOOD none-border-btn">좋아요 ·</button>
													<button class="leave-reply none-border-btn">답글 쓰기</button>
												</div>
											</div>
										</div>
										<%-- 1) 댓글 작성자 + 내용  끝 --%>

									</c:when>
									<c:otherwise>
										<%-- 2) 대댓글인경우 시작 --%>
										<div class="row d-flex justify-content-center sub-box px-3 m-0">
											<%-- 2) 대댓글의 프로필사진 --%>
											<div class="col-2 m-0 my-2 py-3 d-flex justify-content-center">
												<div class="d-flex justify-content-center align-items-start" onclick="location.href='#'">
													<i class="fas fa-user-circle fa-2x col-1 d-flex justify-content-center align-items-start reply-profile"></i>
												</div>
											</div>
											<%-- 2) 대댓글의 프로필사진 끝 --%>

											<%-- 2) 댓글 작성자 + 내용 --%>
											<div class="col-10 p-0 py-3">
												<div class="row-2 fw-bolder m-0 reply-read-name">
													<div class="REPLY_NUM" style="display: none;"></div>
													<div class="reply-writer CREW_NUM">
														<strong class="text">${ reply.crewNickname }</strong>
													</div>

													<div class="row-2 REPLY_CONTENT">${ reply.replyContent }</div>
													<div class="row-2 d-flex flex-row jusify-content-between">
														<span class="REPLY_WDATE">${ reply.replyWdate } ·</span>
														<button class="REPLY_GOOD none-border-btn">좋아요 ·</button>
														<button class="leave-reply none-border-btn">답글 쓰기</button>
													</div>
												</div>
											</div>
											<%-- 2) 댓글 작성자 + 내용 끝 --%>
										</div>
										<%-- 2) 대댓글인경우 끝 --%>
									</c:otherwise>
								</c:choose>







								<%-- 1) or 2) 둘중하나 --%>



								<%-- ''' 표시 --%>
								<div class="btn-reply-more">
									<i class="fas fa-ellipsis-v"></i>
								</div>
								<!-- ''' 표시  끝-->
								<!-- ''' 표시 누를때 나오는 창 -->
								<div class="reply-menu-box px-0" style="display: none;">
									<ul>
										<li class="border-line-bottom"><a href="#">이 멤버의 댓글 차단하기</a></li>
										<li class=""><a href="#">신고하기</a></li>
									</ul>
									<ul>
										<li class="border-line-bottom"><a href="#">댓글 수정</a></li>
										<li class="border-line-bottom"><a href="#">댓글 삭제</a></li>
									</ul>
								</div>
								<%-- ''' 표시 누를때 나오는 창  끝 --%>
							</div>

							<%-- 대댓글 입력 부분 --%>
							<div class="bg-transparent reply-write-inner-space" style="display: none;">
								<div class="row d-flex justify-content-between align-items-center ms-3 me-1 my-3">
									<div class="col-1 btn-upload" onclick="location.href='#'" style="padding: 0;">
										<i class="far fa-plus-square align-items-center" style="color: #B3B3B3;"></i>
									</div>
									<div class="col-9 px-3 reply-write-box d-flex justify-content-start align-items-center" style="background: white;">
										<i class="fas fa-user col-1" style="color: #B3B3B3;"></i>
										<textarea name="replyContent" class="reply-write-textarea col-11 p-1 bg-white" placeholder="답글을 남겨주세요."></textarea>
									</div>
									<div class="col-2 " style="vertical-align: center;">
										<input type="button" class="reply-submit-btn text-white" onclick="location" value="보내기" />
									</div>
								</div>
							</div>
							<%-- 대댓글 입력 부분 끝 --%>
						</div>
						<%-- 댓글 하나 끝 --%>
					</c:if>
				</c:forEach>

				<%-- 댓글 입력 시작 게시글당 하나만 존재--%>
				<div class="bg-transparent reply-write-space p-0" style="display: none;">
					<div class="row d-flex justify-content-between align-items-center ms-1 my-3 pe-2">
						<div class="col-1 btn-upload" onclick="location.href='#'" style="padding: 0;">

							<i class="far fa-plus-square align-items-center" style="color: #B3B3B3;"></i>

						</div>
						<div class="col-9 px-3 reply-write-box d-flex justify-content-start align-items-center">
							<i class="fas fa-user col-1" style="color: #B3B3B3;"></i>
							<textarea class="reply-write-textarea col-11 p-1" placeholder="댓글을 남겨주세요."></textarea>

						</div>
						<div class="col-2 " style="vertical-align: center;">
							<input type="button" class="reply-submit-btn text-white" onclick="location" value="보내기" />
						</div>
					</div>
				</div>
				<%-- 댓글입력 끝 --%>

			</div>



			<%-- 하나의 게시글 끝 --%>
	
						
						
				<!-- 내가 쓴 글 메인 끝  -->

				
				
			

						
				

					
					
				</main>
			</div>
		</div>
	</div>

</body>
</html>