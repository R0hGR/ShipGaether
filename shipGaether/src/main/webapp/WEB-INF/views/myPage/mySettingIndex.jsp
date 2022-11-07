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
								<div class="col-11 px-0 py-2" style="flex-direction: column;">설정</div>
							</div>
						</div>



						<!-- 일반 칸 -->
						<div class="row p-2 border border-black"
							style="float: none; margin: 0 auto;">
							<div
								class="col-3 p-5 border border-white d-flex justify-content-center align-items-center">일반</div>

							<div class="col-9 p-5 border border-white">
								<div class="row p-1" style="float: none; margin: 0 auto;">
									<div
										class="col-8 p-1 border border-white d-flex justify-content-start align-items-center">피드관리</div>
									<div
										class="col-4 p-1 border border-white d-flex justify-content-end align-items-center">
										<button type="submit">보기</button>
										
									</div>
								</div>

								<div class="row p-1" style="float: none; margin: 0 auto;">
									<div
										class="col-8 p-1 border border-white d-flex justify-content-start align-items-center">번역설정</div>
									<div
										class="col-4 p-1 border border-white d-flex justify-content-end align-items-center">
										<button type="submit">보기</button>
									</div>
								</div>

								<div class="row p-1" style="float: none; margin: 0 auto;">
									<div
										class="col-8 p-1 border border-white d-flex justify-content-start align-items-center">동영상
										재생 설정</div>
									<div
										class="col-4 p-1 border border-white d-flex justify-content-end align-items-center">
										<button type="submit">보기</button>
									</div>
								</div>


								<div class="row p-1" style="float: none; margin: 0 auto;">
									<div
										class="col-8 p-1 border border-white d-flex justify-content-start align-items-center">캘린더
										시작요일</div>
									<div
										class="col-4 p-1 border border-white d-flex justify-content-end align-items-center">
										<button type="submit">적용</button>
									</div>
								</div>

								<div class="row p-1" style="float: none; margin: 0 auto;">
									<div
										class="col-8 p-1 border border-white d-flex justify-content-start align-items-center">채팅,댓글
										전송방식</div>
									<div
										class="col-4 p-1 border border-white d-flex justify-content-end align-items-center">
										<button type="submit">적용</button>
									</div>
								</div>


								<!-- 일반-하위설정 끝 -->

							</div>
						</div>


						<!-- 프라이버시 칸 -->
						<div class="row p-2 border border-black"
							style="float: none; margin: 0 auto;">
							<div
								class="col-3 p-5 border border-white d-flex justify-content-center align-items-center">프라이버시</div>

							<div class="col-9 p-5 border border-white">
								<div class="row p-1" style="float: none; margin: 0 auto;">
									<div
										class="col-8 p-1 border border-white d-flex justify-content-start align-items-center">접속정보</div>
									<div
										class="col-4 p-1 border border-white d-flex justify-content-end align-items-center">
										<button type="submit">보기</button>
									</div>
								</div>

								<div class="row p-1" style="float: none; margin: 0 auto;">
									<div
										class="col-8 p-1 border border-white d-flex justify-content-start align-items-center">로그인
										인증 및 차단</div>
									<div
										class="col-4 p-1 border border-white d-flex justify-content-end align-items-center">
										<button type="submit">보기</button>
									</div>
								</div>

								<div class="row p-1" style="float: none; margin: 0 auto;">
									<div
										class="col-8 p-1 border border-white d-flex justify-content-start align-items-center">채팅
										차단 관리</div>
									<div
										class="col-4 p-1 border border-white d-flex justify-content-end align-items-center">
										<button type="submit">보기</button>
									</div>
								</div>


								<div class="row p-1" style="float: none; margin: 0 auto;">
									<div
										class="col-8 p-1 border border-white d-flex justify-content-start align-items-center">게시글,댓글
										차단관리</div>
									<div
										class="col-4 p-1 border border-white d-flex justify-content-end align-items-center">
										<button type="submit">보기</button>
									</div>
								</div>

								<!-- 프라이버시-하위설정 끝 -->

							</div>
						</div>


						<!-- 고객지원 칸 -->
						<div class="row p-2 border border-black"
							style="float: none; margin: 0 auto;">
							<div
								class="col-3 p-5 border border-white d-flex justify-content-center align-items-center">고객지원</div>

							<div class="col-9 p-5 border border-white">
								<div class="row p-1" style="float: none; margin: 0 auto;">
									<div
										class="col-8 p-1 border border-white d-flex justify-content-start align-items-center">이용약관</div>
									<div
										class="col-4 p-1 border border-white d-flex justify-content-end align-items-center">
										<button type="submit">보기</button>
									</div>
								</div>

								<div class="row p-1" style="float: none; margin: 0 auto;">
									<div
										class="col-8 p-1 border border-white d-flex justify-content-start align-items-center">개인정보처리방침</div>
									<div
										class="col-4 p-1 border border-white d-flex justify-content-end align-items-center">
										<button type="submit">보기</button>
									</div>
								</div>

								<div class="row p-1" style="float: none; margin: 0 auto;">
									<div
										class="col-8 p-1 border border-white d-flex justify-content-start align-items-center">서비스
										이용 동의</div>
									<div
										class="col-4 p-1 border border-white d-flex justify-content-end align-items-center">
										<button type="submit">보기</button>
									</div>
								</div>


								<div class="row p-1" style="float: none; margin: 0 auto;">
									<div
										class="col-8 p-1 border border-white d-flex justify-content-start align-items-center">서비스
										도움말</div>
									<div
										class="col-4 p-1 border border-white d-flex justify-content-end align-items-center">
										<button type="submit">보기</button>
									</div>
								</div>

								<!-- 고객지원-하위설정 끝 -->

							</div>
						</div>

						<!-- 언어,회원탈퇴 칸 -->
						<div class="row p-2 border border-black"
							style="float: none; margin: 0 auto;">
							<div
								class="col-3 p-5 border border-white d-flex justify-content-center align-items-center">
							</div>

							<div class="col-9 p-5 border border-white">
								<div class="row p-1" style="float: none; margin: 0 auto;">
									<div
										class="col-8 p-1 border border-white d-flex justify-content-start align-items-center">언어</div>
									<div
										class="col-4 p-1 border border-white d-flex justify-content-end align-items-center">
										<button type="submit">적용</button>
									</div>
								</div>

								<div class="row p-1" style="float: none; margin: 0 auto;">
									<div
										class="col-8 p-1 border border-white d-flex justify-content-start align-items-center">서비스
										탈퇴</div>
									<div
										class="col-4 p-1 border border-white d-flex justify-content-end align-items-center">
										<button type="submit">신청하기</button>
									</div>
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