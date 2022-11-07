<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
				<!-- 스타일 수정 -->
				<main class="col-9 p-0" style="overflow: visible">
					<div class="col-10 p-3 mb-3" style="background-color: white;">


						<div class="card-body"
							style="float: none; margin: 0 auto;">
							<h5 style="font-weight: 800;">내가 쓴 글</h5>
						</div>
					</div>
					<!-- 게시글 들어갈 부분 -->



					<!-- 하나의 게시글 시작 -->
					<c:forEach var="board" items="${ boardMy }">
						<div class="col-10 mb-4" style="overflow:hidden">
							<div class="card border-0 rounded-0"  style="overflow:hidden">
								<div class="card-header" style="background-color: white">
									<a href="/ship/${ board.crewNum }#board-${ board.boardNum }" style="text-decoration-line: none; color: black"><span>[${board.boardText}] ${board.boardSubject}</span></a>
								</div>
								<div class="card-body pb-0" style="height:120px">
									<div class="row">
										<div class="col-12">
											<div class="word">
												<a href="/ship/${ board.crewNum }#board-${ board.boardNum }"
													style="text-decoration-line: none; color: black; font-size: 13px">${board.boardContent}</a>
											</div>
										</div>
										
									</div>
								</div>
								<div class="card-footer"
									style="background-color: white; border-top: 0;">
									<a href="/ship/${ board.crewNum }#board-${ board.boardNum }" style="text-decoration-line: none;"><i
										class="bi bi-hand-thumbs-up me-1"
										style="color: #0000008c; font-size: 13px">${board.boardGood}개</i>
										<span style="color: #0000008c; font-size: 13px">댓글
											${board.boardReply}개</span></a>
								</div>
							</div>
						</div>
					</c:forEach>
				</main>
			</div>
			<%-- 댓글입력 끝 --%>
		</div>
		<%-- 하나의 게시글 끝 --%>


	</div>

	<script>
	
	//게시글 더보기 버튼(''')만 복사
	function showBoardMore(el) {	
		let elGrandParent = el.closest("div .main-box");	
		let boardMenu = elGrandParent.querySelector('.board-menu');
		
		if(boardMenu.style.display=="none"){		
			boardMenu.style.display='block';		
		}else{		
			boardMenu.style.display="none";
		}	
	}
	
	</script>

	<script src="https://kit.fontawesome.com/6478f529f2.js"
		crossorigin="anonymous"></script>
	
	<!-- 추가 import -->
	<script src="/js/main.js"></script>

</body>
</html>