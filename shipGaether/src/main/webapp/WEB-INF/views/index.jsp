<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<%@include file="header.jsp"%>

</head>
<style>
/* .note-table >thead >tr >th,
.note-table >tbody >tr >td {
   text-align: center;
} */
table {
   table-layout: fixed;
   word-wrap: break-word;
}


.page-link {
  color: #000; 
  background-color: #fff;
  border: 1px solid #ccc; 
} 

.page-item.active .page-link {
 
 z-index: 1;
 color: #555;
 font-weight:bold;
 background-color: #f1f1f1;
 border-color: #ccc;
 
}

.page-link:focus, .page-link:hover {
  color: #000;
  background-color: #fafafa; 
  border-color: #ccc;
}
.active>.page-link, .page-link.active {
    z-index: 3;
    color: var(--bs-pagination-active-color);
    background-color: #6c757d;
    border-color: #6c757d;
}

</style>
<body>
	<div class="row h-100" style="padding-top: 72px;">
		<main class="col-12 p-0" style="overflow: visible">
			<div class="row mt-0"
				style="border-top: 0.1mm solid #E2E2E2; background-color: #F4F4F4; padding-left: 16.6%; padding-right: 16.6%;">
				<div class="card border-0 my-3">
					<div class="card-body rounded-3 py-3" style="text-align: center;">
						<a class="recomend" href="/recommendByLocation?locationX=${locationX}&locationY=${locationY}"
							style="text-decoration-line: none; color: black"> <i
							class="bi bi-geo-alt-fill me-1" style="color: #57ACE1;"></i> <span
							class="card-text">추천!! </span> <span class="card-text"
							style="color: #57ACE1;">${address}</span> <span class="card-text">의
								SHIP</span> <span class="card-text"
							style="color: #CECECE; font-size: 0.9em">></span></a>
					</div>
				</div>
				<c:choose>
					<%-- 로그인 세션 존재할때 = 로그인했을때 --%>
					<c:when test="${sessionId != null}">
						<!-- Your Ship -->
						<div class="bandName">
							<h5 class="sectionTitle mb-4">Your Ship</h5>
						</div>

						<!-- 밴드만들기 div -->
						<div
							class="card mb-4 rounded-3 border-light shadow-sm p-0 mx-2 bg-light index-club-main-div"
							style="cursor: pointer;" onclick="location.href='/ship/makeShip'">
							<div
								class="d-flex justify-content-center align-items-center  p-0 m-0 index-club-main-div-div"
								style="height: 220px">
								<i class="bi bi-plus-circle-dotted" style="font-size: 3em;"></i>
							</div>
							<div class="card-body rounded-3 py-3" style="overflow: hidden;">
								<p class="card-text" style="text-align: center;">만들기</p>
							</div>
						</div>


						<c:forEach var="item" items="${ usrShips }" varStatus="status">

							<div
								class="card mb-4 rounded-3 border-0 shadow-sm p-0 mx-2 index-club-main-div"
								style="cursor: pointer;"
								onclick="location.href='/ship/${ item.shipNum }';">
								<c:choose>
									<c:when test="${item.shipSample==1}">
										<img
											src="/images/ship/${ item.shipNum }/${ item.shipPhotoName }"
											class="card-img-top" alt="...">
									</c:when>
									<c:otherwise>
										<img src="/images/ship/sample/${ item.shipSampleName }"
											class="card-img-top" alt="...">
									</c:otherwise>
								</c:choose>
								<div class="card-body rounded-3 py-1" style="overflow: hidden;">
									<p class="card-text m-0 wordOneline" style="font-size: 15px;">${item.shipName}</p>
									<p class="card-text m-0"
										style="color: #0000008c; font-size: 13px;">멤버수 :
										${item.shipCount }</p>
								</div>
							</div>

						</c:forEach>


					</c:when>
					<%-- 세션 존재안할때 = 로그아웃했을때 --%>
					<c:otherwise>

					</c:otherwise>
				</c:choose>

				<!-- 임시로 추가 -->
				<!--<a href="/shipMain">go shipmain</a> -->
			</div>

			<!-- Recommended Ship -->
			<div class="row mt-0"
				style="background-color: #EEF0F3; padding-left: 16.6%; padding-right: 16.6%;">


				<div class="row my-4">
					<div class="col">
						<h5 class="text">Recommended Ship</h5>
					</div>
					<div class="col" style="text-align: right">
						<a class="text"
							style="text-decoration-line: none; color: #0000008c; font-size: 13px;"
							href="/search/?search=">모두 보기 ></a>
					</div>
				</div>


				<div id="recPagingDiv" class="row mb-3">
					<c:forEach var="item" items="${ recShips }">

						<div class="col-6 mb-4">
							<div class="card border-0" style="background-color: #EEF0F3">
								<div class="row">
									<div class="col-3">
										<c:choose>
											<c:when test="${item.shipSample==1}">
												<img class="img-fluid rounded-2"
													style="width: 100; height: 100; position:;"
													src="/images/ship/${ item.shipNum }/${ item.shipPhotoName }"
													alt="..." />
											</c:when>
											<c:otherwise>
												<img class="img-fluid rounded-2"
													style="width: 100; height: 100; position:;"
													src="/images/ship/sample/${ item.shipSampleName }"
													alt="..." />
											</c:otherwise>
										</c:choose>
									</div>
									<div class="col-9">
										<div class="card-body p-0">
											<p class="fw-bold mb-1" style="font-size: 1.2em">${ item.shipName }</p>
											<p class="text mb-2 wordOneline"
												style="color: #0000008c; font-size: 14px">${ item.shipTitle }</p>
											<a class="btn border rounded-5 btn-outline-white p-0"
												style="background-color: white"
												href="/ship/${ item.shipNum }"> <span
												class="fw-bolder ms-2" style="font-size: 11px;">${ item.shipName }</span>
												<span style="font-size: 11px;"> 더보기</span> <span
												class="me-2" style="font-size: 11px; color: #CECECE;">
													></span></a>
										</div>
									</div>
								</div>
							</div>
						</div>


					</c:forEach>
					<!-- 여기다가 페이징 -->
               <div class="d-flex justify-content-center">                  
                     <nav aria-label="Page navigation example ">
                        <ul id="recPagingUl" class="pagination">
                           <li class='page-item'><a class='page-link' aria-label='Previous' onclick='doRecPaging(1)' style='cursor: pointer;'> <span aria-hidden='true'>&laquo;</span>
                           </a></li>

                        
                           <c:if test="${recPVO.startPage ne 1 }">
                              <li class="page-item"><a class="page-link " onclick="doRecPaging(${recPVO.startPage-1})" style='cursor: pointer;'>&lt;</a></li>
                           </c:if>
                        <c:forEach begin="${recPVO.startPage }" end="${recPVO.endPage }" var="p">

                           <c:choose>
                              <c:when test="${p == recPVO.nowPage }">
                              <li class="page-item"><a class="page-link active" onclick="doRecPaging(${p})" style='cursor: pointer;'>${ p }</a></li>
                              </c:when>
                              <c:otherwise>
                              <li class="page-item"><a class="page-link" onclick="doRecPaging(${p})" style='cursor: pointer;'>${ p }</a></li>
                              </c:otherwise>
                           </c:choose>                           
                        </c:forEach>
                        <c:if test="${recPVO.endPage ne recPVO.lastPage}">                        
                        <li class="page-item"><a class="page-link " onclick="doRecPaging(${recPVO.endPage+1})" style='cursor: pointer;'>&gt;</a></li>                           
                        </c:if>

                        <li class="page-item"><a class="page-link" aria-label="Next" onclick="doRecPaging(${recPVO.lastPage})" style='cursor: pointer;'> <span aria-hidden="true">&raquo;</span>
                           </a></li>
                        </ul>
                     </nav>
               </div>
               
               <script>
                  function doRecPaging(p){
                     jsObject={total:'${countRecShips}', nowPage:p, cntPerPage:6}
                     
                     $.ajax({
                        url:"/rest/doRecPaging.json",
                        type:"post",
                        data:jsObject,
                        success:function(data){                           
                           let recShips= data.recShips;
                           console.log(" # recShips length : "+recShips.length);                           
                           let divHtml="";
                           for(let recShip of recShips) { 
                              divHtml += "<div class='col-6 mb-4'>";
                              divHtml += "<div class='card border-0' style='background-color: #EEF0F3'>";
                              divHtml += "<div class='row'>";                              
                              divHtml += "<div class='col-3'>"; 
                              if(recShip.shipSample == 1 ){
                                 divHtml += "<img class='img-fluid rounded-2' style='width: 100; height: 100; position:;' src='/images/ship/"+recShip.shipNum+"/"+recShip.shipPhotoName+"' alt='...' />";                                 
                              }else{
                                 divHtml += "<img class='img-fluid rounded-2' style='width: 100; height: 100; position:;' src='/images/ship/sample/"+recShip.shipSampleName+"' alt='...' />";
                              }
                              divHtml += "</div>";
                              divHtml += "<div class='col-9'>";
                              divHtml += "<div class='card-body p-0'>";
                              divHtml += "<p class='fw-bold mb-1' style='font-size: 1.2em'>"+recShip.shipName+"</p>";
                              divHtml += "<p class='text mb-2 wordOneline' style='color: #0000008c; font-size: 14px'> "+recShip.shipTitle+"</p>";
                              divHtml += "<a class='btn border rounded-5 btn-outline-white p-0' style='background-color: white' href='/ship/"+recShip.shipNum+"'> <span class='fw-bolder ms-2' style='font-size: 11px;'>"+recShip.shipName+"</span> <span style='font-size: 11px;'> 더보기</span> <span class='me-2' style='font-size: 11px; color: #CECECE;'> ></span></a>";
                              divHtml += "</div>";
                              divHtml += "</div>";
                              divHtml += "</div>";
                              divHtml += "</div>";
                              divHtml += "</div>";
                           }
                           divHtml += "<div class='d-flex justify-content-center'>";
                           divHtml += "<nav aria-label='Page navigation example '>";
                           divHtml += "<ul id='recPagingUl' class='pagination'>";
                           divHtml += "</ul>";
                           divHtml += "</nav>";
                           divHtml += "</div>";
                           
                           $('#recPagingDiv').html(divHtml);
                                                      
                           let recPVO= data.recPVO;
                           let startPage = recPVO.startPage;
                           let endPage = recPVO.endPage;
                           let nowPage = recPVO.nowPage;
                           let lastPage = recPVO.lastPage;
                           console.log(" # startPage : "+startPage);
                           console.log(" # endPage : "+endPage);
                           console.log(" # nowPage : "+nowPage);                           
                           //페이징 하는 번호들 실시간 변화
                           let html = "<li class='page-item'><a class='page-link' aria-label='Previous' onclick='doRecPaging(1)' style='cursor: pointer;'> <span aria-hidden='true'>&laquo;</span></a></li>";
                           if(startPage != 1){                              
                              html += "<li class='page-item'><a class='page-link ' onclick='doRecPaging("+(parseInt(startPage)-1)+")' style='cursor: pointer;'>&lt;</a></li>";
                           }
                           for ( let i = startPage ; i <= endPage ; i++ ){
                              if( i == nowPage ){
                                 html += "<li class='page-item'><a class='page-link active' onclick='doRecPaging("+i+")' style='cursor: pointer;'>"+i+"</a></li>";                                 
                              }else{
                                 html += "<li class='page-item'><a class='page-link' onclick='doRecPaging("+i+")' style='cursor: pointer;'>"+i+"</a></li>";
                              }                              
                           }
                           if(endPage != lastPage){
                              html += "<li class='page-item'><a class='page-link ' onclick='doRecPaging("+(parseInt(endPage)+1)+")' style='cursor: pointer;'>&gt;</a></li>";
                           }
                           html += "<li class='page-item'><a class='page-link' aria-label='Next' onclick='doRecPaging("+parseInt(lastPage)+")' style='cursor: pointer;'> <span aria-hidden='true'>&raquo;</span></a></li>";                           
                           $('#recPagingUl').html(html);
                        },                        
                     }); 
                  }
               </script>         
            </div>
         <!-- 6개의 게시글 감싸고 있는 DIV 끝 -->
         </div>
         <!-- Recommended Ship 끝 -->

			<!-- Best Story -->
			<div class="row mt-0"
				style="background-color: #F4F4F4; padding-left: 16.6%; padding-right: 16.6%;">
				<div class="row my-4">
					<div class="col">
						<h5 class="text">Best Story</h5>
					</div>
				</div>
				<div class="row mb-3">
					<c:forEach var="board" items="${ boards }">
						<div class="col-6 mb-4" style="overflow:hidden">
							<div class="card"  style="overflow:hidden">
								<div class="card-header" style="background-color: white">
									<a href="/ship/${ board.crewNum }#board-${ board.boardNum }" style="text-decoration-line: none; color: black"><span>${board.boardSubject}</span></a>
								</div>
								<div class="card-body pb-0" style="height:120px">
									<div class="row">
										<div class="col-9">
											<div class="word">
												<a href="/ship/${ board.crewNum }#board-${ board.boardNum }"
													style="text-decoration-line: none; color: black; font-size: 13px">${board.boardText}</a>
											</div>
										</div>
										<div class="col-3">
												${board.boardImg}
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
				</div>
			</div>

		</main>
	</div>

</body>
</html>