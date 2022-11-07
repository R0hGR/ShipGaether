<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<div class="col-10 p-3 mb-3" style="background-color: white;">


						<div class="card-body p-4 pb-2 " style="float: none; margin: 0 auto;">
							<h5 style="font-weight: 800;">가입한 SHIP</h5>
						</div>

						<div class="row d-flex justify-content-around">
							<div class="card-footer bg-transparent">
								<div class="row bg-white  mx-0 mb-0 p-0 border-bottom border-top">
									<div class="col m-0 p-0 show-latest-div " style="background-color: rgb(173, 181, 189);">
										<button class="btn w-100 show-latest-btn" onclick="showAllShip(this)">전체보기</button>
									</div>
									<div class="col m-0 p-0 show-early-div" style="">
										<button class="btn w-100 show-early-btn" onclick="showBookmarkShip(this)">즐겨찾기</button>
									</div>
								</div>
							</div>
						</div>

						<script>
							function showAllShip(el){												
								let parent = el.closest("div .card-footer");
								
								let showAllShipDiv = parent.querySelector(".show-latest-div");
								let showBookmarkShipDiv= parent.querySelector(".show-early-div");
								
								showAllShipDiv.style.backgroundColor='rgb(173, 181, 189)';
								showBookmarkShipDiv.style.backgroundColor='';
								
								
								let AllShipDiv = document.querySelector(".all-ship");
								let BookmarkDiv = document.querySelector(".bookmark-ship");								
								
								AllShipDiv.style.display="block";
								BookmarkDiv.style.display="none";
								
							}
							function showBookmarkShip(el){
								let parent = el.closest("div .card-footer");	
								
								let showAllShipDiv  = parent.querySelector(".show-latest-div");
								let showBookmarkShipDiv= parent.querySelector(".show-early-div");
								
								showAllShipDiv.style.backgroundColor='';
								showBookmarkShipDiv.style.backgroundColor='rgb(173, 181, 189)';
								
								let AllShipDiv = document.querySelector(".all-ship");
								let BookmarkDiv = document.querySelector(".bookmark-ship");
								
								AllShipDiv.style.display="none";
								BookmarkDiv.style.display="block";
							}		
						</script>

						<!-- 모든 SHIP 리스트 시작 -->

						<ul class="m-0 all-ship">

							<c:forEach var="myShip" items="${ myShips }">
								<!-- 첫번째 리스트 시작 -->
								<li class="ps-3 px-1 py-3 d-flex flex-row justify-content-between align-items-center border-bottom">
									<div class="row d-flex flex-row col-9">
										<c:if test="${ myShip.shipSample == 0 }">
											<div class="col-2">
												<img onclick="location.href='/ship/${ myShip.shipNum }';"  class="img-fluid " style="width: 40; height: 40; cursor:pointer;" src="/images/ship/sample/${ myShip.shipSampleName }" alt="...">
											</div>
										</c:if>
										<c:if test="${ myShip.shipSample == 1 }">
											<div class="col-2">
												<img onclick="location.href='/ship/${ myShip.shipNum }';" class="img-fluid " style="width: 40; height: 40; cursor:pointer;" src="/images/ship/${ myShip.shipNum }/${ myShip.shipPhotoName }" alt="...">
											</div>
										</c:if>
										<div class="col">
											<button class="row accordion-button collapsed col-3" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne-${ myShip.shipNum }" aria-expanded="false" aria-controls="flush-collapseOne">
												<div class="col text-truncate">${ myShip.shipName }</div>
											</button>

											<!-- 전체 내용 -->
											<div id="flush-collapseOne-${ myShip.shipNum }" class="accordion-collapse collapse">
												<div class="col ms-3 my-0 py-0 accordion-body">
													<div class="row my-0 py-1">

														<c:choose>
															<c:when test="${myShip.shipBannerName == 'default'}">
																<img class="img-fluid mx-auto w-100 mb-3" src="/images/ship/sample/banner1.jpg" alt="..." />
															</c:when>
															<c:when test="${myShip.shipBannerName == 'banner1.jpg'}">
																<img class="img-fluid mx-auto w-100 mb-3" src="/images/ship/sample/banner1.jpg" alt="..." />
															</c:when>
															<c:when test="${myShip.shipBannerName == 'banner2.jpg'}">
																<img class="img-fluid mx-auto w-100 mb-3" src="/images/ship/sample/banner2.jpg" alt="..." />
															</c:when>
															<c:when test="${myShip.shipBannerName == 'banner3.jpg'}">
																<img class="img-fluid mx-auto w-100 mb-3" src="/images/ship/sample/banner3.jpg" alt="..." />
															</c:when>
															<c:otherwise>
																<img class="img-fluid mx-auto w-100 mb-3" src="/images/ship/${ myShip.shipNum }/${myShip.shipBannerName}" alt="..." />
															</c:otherwise>
														</c:choose>

													</div>
													<div class="row my-0 py-2">밴드캡틴 : ${ myShip.shipCaptain }</div>
													<div class="row my-0 py-2">밴드소개 : ${ myShip.shipTitle }</div>
													<div class="row my-0 py-2">개설날짜 : ${ myShip.shipCdate }</div>
													<div class="row my-0 py-2">크루원 수 : ${ myShip.shipCount }</div>
												</div>
											</div>
										</div>
										<!-- 간단히 보여질 내용 -->
									</div> <c:if test="${ myShip.crewBookmark == 0 }">
										<button id="bookmarkOn" class="btn" onclick="updateBookmarkOn(this,${ myShip.myUsrNum },${ myShip.shipNum })" style="display: block;">
											<i class="bi bi-star fs-5"></i>
										</button>
										<button id="bookmarkOff" class="btn" onclick="updateBookmarkOff(this,${ myShip.myUsrNum },${ myShip.shipNum })" style="display: none;">
											<i class="bi bi-star-fill fs-5" style="color: burlywood;"></i>
										</button>
									</c:if> <c:if test="${ myShip.crewBookmark == 1 }">
										<button id="bookmarkOn" class="btn" onclick="updateBookmarkOn(this,${ myShip.myUsrNum },${ myShip.shipNum })" style="display: none;">
											<i class="bi bi-star fs-5"></i>
										</button>
										<button id="bookmarkOff" class="btn" onclick="updateBookmarkOff(this,${ myShip.myUsrNum },${ myShip.shipNum })" style="display: block;">
											<i class="bi bi-star-fill fs-5" style="color: burlywood;"></i>
										</button>
									</c:if>


									<button class="col-3 btn border rounded-0 btn-outline-white p-2 m-1" style="font-size: 13px; width: 80px;">탈퇴</button>
								</li>
								<!-- 첫번째 리스트 끝 -->
							</c:forEach>
						</ul>
						<!-- 모든 SHIP 리스트 끝 -->








						<!-- 즐겨찾기한 SHIP 리스트 시작 -->

						<ul class="m-0 bookmark-ship" style="display: none;">
							<c:forEach var="myBookmarkShip" items="${ myBookmarkShips }">
								<!-- 첫번째 리스트 시작 -->
								<li class="ps-3 px-1 py-3 d-flex flex-row justify-content-between align-items-center border-bottom">
									<div class="row d-flex flex-row col-9">
										<c:if test="${ myBookmarkShip.shipSample == 0 }">
											<div class="col-2">
												<img onclick="location.href='/ship/${ myBookmarkShip.shipNum }';" class="img-fluid " style="width: 40; height: 40; cursor:pointer;" src="/images/ship/sample/${ myBookmarkShip.shipSampleName }" alt="...">
											</div>
										</c:if>
										<c:if test="${ myBookmarkShip.shipSample == 1 }">
											<div class="col-2">
												<img onclick="location.href='/ship/${ myBookmarkShip.shipNum }';" class="img-fluid " style="width: 40; height: 40; cursor:pointer;" src="/images/ship/${ myBookmarkShip.shipNum }/${ myBookmarkShip.shipPhotoName }" alt="...">
											</div>
										</c:if>
										<div class="col">
											<button class="row accordion-button collapsed col-3" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne-${ myBookmarkShip.shipNum }" aria-expanded="false" aria-controls="flush-collapseOne">
												<div class="col text-truncate">${ myBookmarkShip.shipName }</div>
											</button>

											<!-- 전체 내용 -->
											<div id="flush-collapseOne-${ myBookmarkShip.shipNum }" class="accordion-collapse collapse">
												<div class="col ms-3 my-0 py-0 accordion-body">
													<div class="row my-0 py-1">

														<c:choose>
															<c:when test="${myBookmarkShip.shipBannerName == 'default'}">
																<img class="img-fluid mx-auto w-100 mb-3" src="/images/ship/sample/banner1.jpg" alt="..." />
															</c:when>
															<c:when test="${myBookmarkShip.shipBannerName == 'banner1.jpg'}">
																<img class="img-fluid mx-auto w-100 mb-3" src="/images/ship/sample/banner1.jpg" alt="..." />
															</c:when>
															<c:when test="${myBookmarkShip.shipBannerName == 'banner2.jpg'}">
																<img class="img-fluid mx-auto w-100 mb-3" src="/images/ship/sample/banner2.jpg" alt="..." />
															</c:when>
															<c:when test="${myBookmarkShip.shipBannerName == 'banner3.jpg'}">
																<img class="img-fluid mx-auto w-100 mb-3" src="/images/ship/sample/banner3.jpg" alt="..." />
															</c:when>
															<c:otherwise>
																<img class="img-fluid mx-auto w-100 mb-3" src="/images/ship/${ myBookmarkShip.shipNum }/${myBookmarkShip.shipBannerName}" alt="..." />
															</c:otherwise>
														</c:choose>

													</div>
													<div class="row my-0 py-2">밴드캡틴 : ${ myBookmarkShip.shipCaptain }</div>
													<div class="row my-0 py-2">밴드소개 : ${ myBookmarkShip.shipTitle }</div>
													<div class="row my-0 py-2">개설날짜 : ${ myBookmarkShip.shipCdate }</div>
													<div class="row my-0 py-2">크루원 수 : ${ myBookmarkShip.shipCount }</div>
												</div>
											</div>
										</div>
										<!-- 간단히 보여질 내용 -->

										<%-- 									<span class="col mx-3">${ myBookmarkShip.shipName } --%>
										<!-- 									</span> -->

									</div> <c:if test="${ myBookmarkShip.crewBookmark == 0 }">
										<button id="bookmarkOn" class="btn" onclick="updateBookmarkOn(this,${ myBookmarkShip.myUsrNum },${ myBookmarkShip.shipNum })" style="display: block;">
											<i class="bi bi-star fs-5"></i>
										</button>
										<button id="bookmarkOff" class="btn" onclick="updateBookmarkOff(this,${ myBookmarkShip.myUsrNum },${ myBookmarkShip.shipNum })" style="display: none;">
											<i class="bi bi-star-fill fs-5" style="color: burlywood;"></i>
										</button>
									</c:if> <c:if test="${ myBookmarkShip.crewBookmark == 1 }">
										<button id="bookmarkOn" class="btn" onclick="updateBookmarkOn(this,${ myBookmarkShip.myUsrNum },${ myBookmarkShip.shipNum })" style="display: none;">
											<i class="bi bi-star fs-5"></i>
										</button>
										<button id="bookmarkOff" class="btn" onclick="updateBookmarkOff(this,${ myBookmarkShip.myUsrNum },${ myBookmarkShip.shipNum })" style="display: block;">
											<i class="bi bi-star-fill fs-5" style="color: burlywood;"></i>
										</button>
									</c:if>


									<button class="col-3 btn border rounded-0 btn-outline-white p-2 m-1" style="font-size: 13px; width: 80px;">탈퇴</button>
								</li>

							</c:forEach>

						</ul>
						<!-- 즐겨찾기한 SHIP 리스트 끝 -->

						<!-- 갱신 -->
						<div class="card-footer bg-transparent">
							<div class="row bg-white  mx-0 mb-0 p-0 border-bottom border-top">
								<div class="col m-0 p-0" style="background-color: rgb(173, 181, 189);">
									<button class="btn w-100" onclick="location.reload();">갱신</button>
								</div>
							</div>
						</div>
						<!-- 갱신 끝 -->



					</div>
				</main>

			</div>
		</div>
	</div>

</body>
<script>
							function updateBookmarkOn(btnEl,usrNum,shipNum){	
								//빈 별을 눌렀을때
								
								let unFillBtn = btnEl;
								let fillBtn = btnEl.nextElementSibling ;
								
								unFillBtn.style.display="none";
								fillBtn.style.display="block";
								
								$.ajax({
									url:"/rest/updateBookmarkOn",
									type:"post",
									data:{usrNum:usrNum,shipNum:shipNum},
									success:function(data){
// 										alert("다녀옴")										
									},
																		
								});
								
								
							}
							function updateBookmarkOff(btnEl,usrNum,shipNum){	
								//채워진 별을 눌렀을때
																
								let fillBtn = btnEl;
								let unFillBtn = btnEl.previousElementSibling;
								
								unFillBtn.style.display="block";
								fillBtn.style.display="none";
								
								$.ajax({
									url:"/rest/updateBookmarkOff",
									type:"post",
									data:{usrNum:usrNum,shipNum:shipNum},
									success:function(data){
// 										alert("다녀옴")										
									},
																		
								});
								
							}		
						</script>
</html>