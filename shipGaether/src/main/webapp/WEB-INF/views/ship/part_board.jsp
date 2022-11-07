<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("repalceChar","\n"); %>

    <!-- AOS 라이브러리 불러오기-->
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<style>
.read-modal-layer {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;  
}  
.left-arrow {
  position: fixed;
  left: 13%;
  font-family: system-ui, serif;
  font-size: 2rem;
  padding: 3rem;
  border-radius: 1rem;
  
}


.right-arrow {
  position: fixed;
  right: 13%;
  font-family: system-ui, serif;
  font-size: 2rem;
  padding: 3rem;
  border-radius: 1rem;
  
}

.arrow {
    border: none;
	background-color:rgba(0, 0, 0, 0.0);
/* style="background-color: rgba(0, 0, 0, 0.0);" */
}

.arrow > i {
    border: none;
	background-color:rgba(0, 0, 0, 0.0);
    font-size: 400px;
    opacity: 1;
    color: darkgray;
/* style="background-color: rgba(0, 0, 0, 0.0);" */
}


</style>

<div class="col-8">
	<div style="flex-direction: column-reverse;">
		<!-- Search 시작 -->




		<div class="row w-100 ms-0 mb-3 border border-1.5 rounded-0 border-white bg-white">

			<div class="col-3 p-0">
				<select id="boardSearchCategory" class="login-input border border-1.5 rounded-0 border-white bg-white">
					<option value="all">통합검색</option>
					<option value="crewNickname">작성자</option>
					<option value="subject">제목</option>
					<option value="content">내용</option>
				</select>
			</div>
			<div class="col-8 p-0">
				<input id="boardSearchBox" class="form-control border-0" name="search" type="search" placeholder="Search....." aria-label="Search" style="background-color: transparent;" onkeypress="if( event.keyCode == 13 ){searchBoard();}">
			</div>

			<div class="col-1 d-flex justify-content-end align-items-center m-0 p-0">
				<button class="btn" type="button" onclick="searchBoard()">
					<i class="bi-search" style="color: #0000008c;"></i>
				</button>
			</div>
			<!-- 오토컴플리트 가져오느라 밑에 추가함 주석하나씩 테스트 -->
			
			<script src="http://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>
			<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script> 
			<script type="text/javascript">
			 $jQ = jQuery.noConflict();
			function searchBoard(){
				let category = $jQ("#boardSearchCategory").val();
				let keyword = $jQ("#boardSearchBox").val();
				
				if(category=="crewNickname"){					
// 					alert("닉네임으로 "+keyword+" 을 검색");
	        		$jQ.ajax({
	                    type: 'post',
	                    url: "/rest/board/crewNickname/${shipNum}.json",
	                    dataType: "json",	                    
	                    data: { crewNickname : keyword },	                    
	                    success: function(data) {
	                        
	                        let boards = $jQ(".main-box");
	                        for (let i=0 ; i<boards.length ; i++){
	                        	boards[i].style.display="none";
	                        } 
	                        for (item of data){
	                        	
	                        	$jQ("#board-"+item.boardNum).css('display', 'block');
	                        	
	                        }
	                        
// 	                        for (board of boards){
// 	                        	board.style.display="none";
// 	                        }
	                    }
	               });
	        		
				}else if(category=="subject"){
// 					alert("내용으로 "+keyword+"을 검색");
	        		$jQ.ajax({
	                    type: 'post',
	                    url: "/rest/board/subject/${shipNum}.json",
	                    dataType: "json",	                    
	                    data: { boardSubject : keyword },	                    
	                    success: function(data) {
	                        
	                        let boards = $jQ(".main-box");
	                        for (let i=0 ; i<boards.length ; i++){
	                        	boards[i].style.display="none";
	                        } 
	                        for (item of data){
	                        	
	                        	$jQ("#board-"+item.boardNum).css('display', 'block');
	                        	
	                        }
	                        
// 	                        for (board of boards){
// 	                        	board.style.display="none";
// 	                        }
	                    }
	               });
				}else if(category=="content"){
// 					alert("내용으로 "+keyword+"을 검색");
	        		$jQ.ajax({
	                    type: 'post',
	                    url: "/rest/board/content/${shipNum}.json",
	                    dataType: "json",
	                    data: { boardContent : keyword },	                    
	                    success: function(data) {
	                        
	                        let boards = $jQ(".main-box");
	                        for (let i=0 ; i<boards.length ; i++){
	                        	boards[i].style.display="none";
	                        } 
	                        for (item of data){
	                        	
	                        	$jQ("#board-"+item.boardNum).css('display', 'block');
	                        	
	                        }
	                        
// 	                        for (board of boards){
// 	                        	board.style.display="none";
// 	                        }
	                    }
	               });
				}else if(category=="all"){
// 					alert("내용으로 "+keyword+"을 검색");
	        		$jQ.ajax({
	                    type: 'post',
	                    url: "/rest/board/all/${shipNum}.json",
	                    dataType: "json",
	                    data: { keyword : keyword },	                    
	                    success: function(data) {
	                        
	                        let boards = $jQ(".main-box");
	                        for (let i=0 ; i<boards.length ; i++){
	                        	boards[i].style.display="none";
	                        } 
	                        for (item of data){
	                        	
	                        	$jQ("#board-"+item.boardNum).css('display', 'block');
	                        	
	                        }
	                        
// 	                        for (board of boards){
// 	                        	board.style.display="none";
// 	                        }
	                    }
	               });
				}
				

			}
		//검색할 때 입력한 글자만 진하게 나오는 부분
		
		$jQ(function(){
			
			$jQ.ui.autocomplete.prototype._renderItem = function (ul, item) {
			    item.label = item.label.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)(" + $jQ.ui.autocomplete.escapeRegex(this.term) + ")(?![^<>]*>)(?![^&;]+;)", "gi"), "<strong>$1</strong>");
			    return $jQ("<li></li>")
			            .data("item.autocomplete", item)			            
			            .append("<a>"+item.photo+ item.label + "</a>")
			            .appendTo(ul); 
			};
			
			
					
			//input 태그 id가 name
		    $jQ( "#boardSearchBox" ).autocomplete({
		        source : function( request, response ) {
		        	console.log($jQ("#boardSearchCategory").val()=="crewNickname");
		        	if($("#boardSearchCategory").val()=="crewNickname"){
		        		
		        		$jQ.ajax({
		                    type: 'post',
		                    url: "/rest/crewNickname/autoData/${shipNum}.json",
		                    dataType: "json",
		                    term : $jQ("#autocomplete").val(),
		                    data: { crewNickname : $("#boardSearchBox").val()},
		                    //select * from BOARD where writer like %?%;
		                    success: function(data) {
		                        //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
		                        response(
		                        		$jQ.map(data, function(item) {
		                            	
		                            	if(item.crewPhoto=='default'){
		                            		item.crewPhoto="<img class='img-fluid rounded-circle' style='opacity: 0.5; width: 40; height: 40; position:;' src='/images/defaultPhoto.jpg' alt='...'>";
		                            	}else{
		                            		item.crewPhoto="<img class='img-fluid rounded-circle' style='width: 40; height: 40; position:;' src='/images/ship/${shipNum}/"+item.crewPhoto+"' alt='...'>";
		                            	}
		                            	
										 return {
												label: item.crewNickname,
												value: item.crewNickname,
												photo: item.crewPhoto
										 }		                               
		                            })
		                        );
		                    }
		               }); 	
		        		
		        	}else if($jQ("#boardSearchCategory").val()=="subject"){
		        		
		        		$jQ.ajax({
		                    type: 'post',
		                    url: "/rest/subject/autoData/${shipNum}.json",
		                    dataType: "json",
		                    term : $jQ("#autocomplete").val(),
		                    data: { boardSubject : $("#boardSearchBox").val()},
		                    //select * from BOARD where writer like %?%;
		                    success: function(data) {
		                        //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
		                        response(
		                        		$jQ.map(data, function(item) {
												 return {
														label: item.boardSubject, 
														value: item.boardSubject,
														photo: ""
												 }		                               
		                            })
		                        );
		                    }
		               });
		        		
		        		
		        	}else if($jQ("#boardSearchCategory").val()=="content"){
		        		
		        	}
		             
		             
		             
		             
		            },
		        //조회를 위한 최소글자수
		        minLength: 1,
		        select: function( event, ui ) {
		            // 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생   
//                 	alert("선택된 아이템: " + ui.item.value);   
		        }
		    });
		})



</script>

			<!-- 찾을 방식 -->

		</div>

		<!-- Search 끝 -->
		<!-- 게시글 작성 시작 -->
		<div class="card mb-3 border-0 rounded-0 mb-3">
			<div class="card-body p-3" id="write-modal-open">
				<button class="w-100 h-100 border-0 bg-white p-0" type="button" style="color: #0000008c; text-align: start">
					Please tell your new story..<br> <br>
				</button>
			</div>

			<!-- 아이콘 크기 키움 -->
			<div class="card-footer border-0 bg-transparent d-flex justify-content-around">
			
				<button class="btn col-5" onclick="$('#write-modal-open').click();">
					<i class="bi bi-image fs-5" style="color: #0000008c;"></i>
				</button>				
				<button class="btn col-5" onclick="$('#write-modal-open').click();">
					<i class="bi bi-paperclip fs-5" style="color: #0000008c;"></i>
				</button>
			</div>
		</div>
		<!-- 게시글 작성 끝 -->



		<%-- 		내 쉽 정보 : ${ shipNum } <br> --%>
		<%-- 		내 크루정보 : ${ myCrewInfo }  --%>
		<%-- 		댓글 좋아요들 : ${ replyGoods } --%>
		<%-- 		${ replys[0] } --%>


		<input id="shipNum" type="hidden" value="${ shipNum }" />
		<div class="container"></div>

		<div class="card-footer bg-transparent">
			<div class="row bg-white  mx-0 mb-3 p-0">
			
				<div id="orderByWdate" class="col m-0 p-0 show-div-Board_Wdate order-div" style="background-color: #adb5bd;">
					<button class="btn w-100 show-date-btn" name="Board_Wdate" onclick="orderBy(this)">게시날짜</button>
				</div>
				
				<div id="orderByGood" class="col m-0 p-0 border-end show-div-Board_Good order-div">
					<button class="btn w-100 show-good-btn" name="Board_Good" onclick="orderBy(this);">좋아요</button>
				</div>

				<div id="orderByView" class="col m-0 p-0 border-end show-div-Board_View order-div" >
					<button class="btn w-100 show-view-btn" name="Board_View" onclick="orderBy(this)">조회수</button>
				</div>

				<div id="orderByReply" class="col m-0 p-0 border-end show-div-Board_Reply order-div">
					<button class="btn w-100 show-reply-btn" name="Board_Reply" onclick="orderBy(this)">댓글수</button>
				</div>


			</div>
		</div>
		<form id="orderForm" name="orderFrom" action="/ship/${ shipNum }" method="get">
			<input id="orderInput" name="keyword" value="" type="hidden">
		</form>

		<script>
			function orderBy(el){				
				sessionStorage.setItem("sessionOrderBy",el.name);				
				$('#orderInput').val(el.name);				
				orderForm.submit();
			}
	
			

		
		</script>

		<div class="card-footer bg-transparent">
			<div class="row bg-white  mx-0 mb-3 p-0">
				<div class="col m-0 p-0 show-latest-div " style="background-color: #adb5bd;">
					<button class="btn w-100 show-latest-btn" onclick="showLatest(this)">최신순</button>
				</div>
				<div class="col m-0 p-0 show-early-div">
					<button class="btn w-100 show-early-btn" onclick="showEarly(this)">오래된순</button>
				</div>
			</div>
		</div>



		<script>
			function showLatest(el){
				let parent = el.closest("div .card-footer");				
				
				let latestDiv  = parent.querySelector(".show-latest-div");
				let earlyDiv= parent.querySelector(".show-early-div");
				
				
				latestDiv.style.backgroundColor='rgb(173, 181, 189)';
				earlyDiv.style.backgroundColor='';
				
				let boardPlace = document.querySelector("div .board-place");				
				boardPlace.style.flexDirection="column";
				
				let boards = document.querySelectorAll(".main-box");
				
				if(boards[0].style.order<0){
					for(board of boards){						
						board.style.order=-board.style.order;
					}
				}
				
				
				AOS.init();
				
				sessionStorage.setItem("sessionOrder",'asc');
				
			}
			function showEarly(el){
				
				let parent = el.closest("div .card-footer");	
				
				let latestDiv  = parent.querySelector(".show-latest-div");
				let earlyDiv= parent.querySelector(".show-early-div");
				
				latestDiv.style.backgroundColor='';
				earlyDiv.style.backgroundColor='rgb(173, 181, 189)';
				

// 				let boardPlace = document.querySelector("div .board-place");				
// 				boardPlace.style.flexDirection="column-reverse";
				
				
				let boards = document.querySelectorAll(".main-box");
				if(boards[0].style.order>0){
					for(board of boards){						
						board.style.order=-board.style.order;
					}
				}
				AOS.init();
				
				sessionStorage.setItem("sessionOrder",'desc');
	
			}		
			

		
		</script>
<script>
  AOS.init();
</script>

		<div id="board-place" class="board-place" style="display: flex; flex-direction: column;">
			<c:forEach var="item" items="${ boards }" varStatus="status">
				<!-- 하나의 게시글 시작 -->
				<div id="board-${ item.boardNum }" data-aos="zoom-in-up" data-aos-duration="700" class="card border-0 rounded-0 mb-3 main-box" style="order: ${status.count}"> 

					<div class="card-header border-0 bg-white p-0">
						<div class="btn btn-more" onclick="showBoardMore(this)">
							<i class="fas fa-ellipsis-v"></i>
						</div>
						<!-- 내가 쓴 글일 경우 -->
						<div class="post-menu-box px-0 board-menu" style="display: none; height: auto;">
							<ul class="m-0 p-0">

								<c:if test="${ item.crewNum eq myCrewInfo.crewNum }">
									<li class="border-line-bottom"><a style="cursor: pointer;" onclick="openUpdate(${ item.boardNum },${ shipNum })">글 수정</a></li>
									<li class=""><a style="cursor: pointer;" onclick="deleteBoard(${ item.boardNum })">삭제하기</a></li>
								</c:if>
								<c:if test="${ item.crewNum ne myCrewInfo.crewNum }">
									<li class=""><a style="cursor: pointer;" onclick="reportBoard(${ item.boardNum })">신고하기</a></li>
								</c:if>


							</ul>
						</div>




						<div class="row" style="float: none; margin: 0 auto;">
							<div class="col-2 pe-0 text-center" style="float: none; margin: auto;">
								<c:if test="${ item.crewPhoto eq 'default' }">
									<img class="img-fluid rounded-circle" style="opacity: 0.5; width: 40; height: 40; position:;" src="/images/defaultPhoto.jpg" alt="...">
								</c:if>
								<c:if test="${ item.crewPhoto ne 'default' }">
									<img class="img-fluid rounded-circle" style="width: 40; height: 40; position:;" src="/images/ship/${ shipNum }/${ item.crewPhoto }" alt="...">
								</c:if>

							</div>
							<div class="col px-0 py-2" style="flex-direction: column;">
								<div class="BOARD_NUM" style="display: none;"></div>
																<%-- 글 작성자 클릭 시, 나오는 쪽지 메뉴 --%>
								<div class="board-note-menu-box noteBox px-0" style="display: none;">
									<ul class="m-0 p-0">
										<li><a style="cursor: pointer">쪽지 보내기</a></li>
									</ul>
								</div>
								<%-- 글 작성자 클릭 시, 나오는 쪽지 메뉴--%>
										
									
								<!-- cursor: pointer; 추가 / span으로 변경  /  span 바깥  div 추가-->
								<div>
									<span class="fw-bolder m-0" onclick="showBoardNote(this,${item.crewNum},'${ item.crewNickname }')" style="cursor: pointer; font-size: 1em;">${ item.crewNickname }</span>
								</div>
								
								<p class="text m-0 BOARD_WDATE" style="font-size: 0.9em;">
									${ item.boardWdate }
									<c:if test="${ item.boardChange eq 1 }">
										<span class="small mark">수정됨</span>
									</c:if>
								</p>
							</div>
						</div>
					</div>
					<!-- 게시글 내용 시작 -->
					<div class="row p-2 main-inside-box border-line-top" style="float: none; margin: 0;">

						<!-- 게시글에 사진포함 -->

						<c:choose>
							<c:when test="${ item.boardFileCount eq 0 }">
							
							</c:when>
					
							<c:when test="${ item.boardFileCount eq 1 }">							
								<c:forEach var="boardFile" items="${ boardFiles }">								
									<c:if test="${ item.boardNum == boardFile.boardNum }">
										<%-- 사진 1개일때 --%>
										
										<div class="col-12 d-flex p-0">
											<div class="col-12 p-0 border border-white d-flex ">
												<img class="img-fluid mx-auto align-items-center" src="/images/ship/${ shipNum }/${ boardFile.boardFileSaveName }" style="object-fit: cover;" alt="...">
											</div>
										</div>
									</c:if>
								</c:forEach>							
							</c:when>

							<c:when test="${ item.boardFileCount eq 2 }">
								<%-- 사진 2개일때 --%>
								<div class="col-12 d-flex justify-content-between p-0">

									<c:forEach var="boardFile" items="${ boardFiles }" varStatus="status">
										<c:choose>
											<c:when test="${ item.boardNum == boardFile.boardNum and status.count%2 == 0 }">
												<div class="col-6 row m-0 pe-1 border border-white">
													<img class="img-fluid mx-auto p-0" src="/images/ship/${shipNum}/${boardFile.boardFileSaveName}" alt="...">
												</div>
											</c:when>
											<c:when test="${ item.boardNum == boardFile.boardNum and status.count%2 == 1 }">
												<div class="col-6 row m-0 ps-1 border border-white">
													<img class="img-fluid mx-auto p-0" src="/images/ship/${shipNum}/${boardFile.boardFileSaveName}" alt="...">
												</div>
											</c:when>
										</c:choose>
									</c:forEach>
								</div>
							</c:when>

							<c:when test="${ item.boardFileCount ge 3 }">
								<%-- 사진 3개일때 --%>
								<div class="col-12 d-flex justify-content-between p-0">

									<c:set var="loop" value="2" />
									<c:forEach var="boardFile" items="${ boardFiles }" varStatus="status">
										<c:if test="${ item.boardNum == boardFile.boardNum and loop eq 1 }">
											<div class="col-6 row m-0 pe-1 border border-white">
												<button onclick="openRead(${shipNum},${item.boardNum})" type="button" class="btn w-100 h-100 border-0 p-0" style="display: flex; align-items: center; justify-content: center;">
													<i class="bi bi-plus" style="position: absolute; font-size: 1.4em">더 보기</i> <img class="img-fluid mx-auto p-0" src="/images/more_gray.png" style="width: 40%; position: absolute; opacity: 0.5;" alt="..." /> <img class="img-fluid mx-auto p-0" src="/images/ship/${shipNum}/${boardFile.boardFileSaveName}" style="overflow: hidden;" alt="..." />
												</button>
											</div>
											<c:set var="loop" value="3" />
										</c:if>
										<c:if test="${ item.boardNum == boardFile.boardNum and loop eq 2 }">
											<div class="col-6 row m-0 ps-1 border border-white">
												<img class="img-fluid mx-auto p-0" src="/images/ship/${shipNum}/${boardFile.boardFileSaveName}" alt="...">
											</div>
											<c:set var="loop" value="1" />
										</c:if>

									</c:forEach>
								</div>
							</c:when>


						</c:choose>













						<!-- 게시글에 사진포함 끝 -->

						<div class="mt-3 mb-5 col-12">
							<div class="text">${ item.boardSubject }</div>
							<div class="more-content">
								<br>								
								
								${item.boardContent.replaceAll('<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>', '')}
								
								
								<br>
								<br>

								<a onclick="openRead(${shipNum},${item.boardNum})" style="cursor: pointer; color: #558ee0;     font-size: 13;">
								더보기
								</a>
								<!-- 게시글의 첨부파일 요약 시작 -->
								<div id="documentFile-${ item.boardNum }" style="display: none;">
									<a class="aclass row p-3 my-3 m-0 border-around bg-light" style="cursor: pointer;">
										<div class="col-12 d-flex justify-content-between" style="color: black;">
											<span class="col-6"><i class="bi bi-paperclip"></i>첨부파일이 있습니다.</span> <span id="documentFileCount-${ item.boardNum }" class="col-4" style="opacity: .6;">총 n개의 파일...</span>
										</div>
									</a>
								</div>
								<!-- 게시글의 첨부파일 요약 끝 -->
							</div>

						</div>
						<div class="good-i-box d-flex align-items-center">
							<span id="boardGood-${ item.boardNum }"><i class="bi bi-hearts"></i> 0</span> <span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span> <span id="boardReplyCount-${ item.boardNum }"> <i class="bi bi-chat-text"></i> 0
							</span>
						</div>

						<div class="eye-i-box d-flex justify-content-center align-items-center">
							<i class="fas fa-eye m-1"></i> <span id="board-view-${ item.boardNum }">${ item.boardView }</span>
						</div>
					</div>
					<!-- 게시글 내용 끝 -->

					<!-- 좋아요 / 댓글달기 -->
					<div class="card-footer bg-transparent">
						<div class="row">
							<div class="col">
								<button id="addBoardGood-${ item.boardNum }" class="btn w-100" onclick="addBoardGood(${item.boardNum} , ${ myCrewInfo.crewNum })">
									<i class="bi bi-heart-fill" style="color: #0000008c;">&nbsp;&nbsp;좋아요</i>
								</button>
								<button id="cancelBoardGood-${ item.boardNum }" style="display: none;" class="btn w-100" onclick="cancelBoardGood(${item.boardNum} , ${ myCrewInfo.crewNum })">
									<i class="bi bi-heartbreak" style="color: #0000008c;">&nbsp;&nbsp;좋아요 취소</i>
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

					<div class="card-footer bg-transparent">
						<div class="d-flex justify-content-center ">
							<a id="foldReply-${ item.boardNum }" name="${ item.boardNum }" onclick="foldReply(this)" style="display: none;">댓글 숨기기<i class="bi bi-caret-up-fill fs-5"></i></a> <a id="unfoldReply-${ item.boardNum }" name="${ item.boardNum }" onclick="unfoldReply(this)" style="display: block;">댓글 더보기<i class="bi bi-caret-down-fill fs-5"></i></a>
						</div>
					</div>
					<script>
					function foldReply(el){
						let divNum = el.name;
						
						sessionStorage.setItem(divNum,'fold');

						
						let mainBox = el.closest("div .main-box");
						let replyDivs = mainBox.querySelectorAll('div .sub-box');
						
						el.style.display="none";
						el.nextElementSibling.style.display="block";
						
						for ( replyDiv of replyDivs){
							replyDiv.style.display="none";							
						}
					}
					function unfoldReply(el){
						let divNum = el.name;
						
						sessionStorage.setItem(divNum,'unfold');
						
						let mainBox = el.closest("div .main-box");
						let replyDivs = mainBox.querySelectorAll('div .sub-box');
						
						el.style.display="none";
						el.previousElementSibling.style.display="block";
						
						for ( replyDiv of replyDivs){
							replyDiv.style.display="block";							
						}						
					}
				
				</script>

					<c:forEach var="reply" items="${replys}">
						<c:if test="${ item.boardNum == reply.boardNum }">
							<%-- 댓글 하나 시작 --%>

							<c:choose>
								<c:when test="${ reply.bundleDepth  lt 1 }">

									<c:if test="${ myCrewInfo.crewNum eq reply.crewNum }">
										<div class="row m-0 bg-light p-0 border-line-both sub-box" style="heigth: 200px; color: #333; display: none;">
									</c:if>
									<c:if test="${ myCrewInfo.crewNum ne reply.crewNum }">
										<div class="row m-0 bg-white p-0 border-line-both sub-box" style="heigth: 200px; color: #333; display: none;">
									</c:if>



									<input type="number" name="bundleNum" value="${ reply.bundleNum }" style="display: none;">
									<input type="number" name="bundleOrder" value="${ reply.bundleOrder }" style="display: none;">
									<input type="number" name="bundleDepth" value="${ reply.bundleDepth }" style="display: none;">
									<!-- postion:relative; 추가 -->
									<div class="row reply-box" style="postion:relative;">
										<%-- 1) 댓글의 프로필사진 --%>
										<div class="col-2 m-0 my-2 py-3 d-flex justify-content-center">
											<div class="d-flex justify-content-center align-items-start" onclick="location.href='#'">
												<c:if test="${ reply.crewPhoto eq 'default' }">
													<img class="img-fluid rounded-circle" style="opacity: 0.5; width: 40; height: 40; position:;" src="/images/defaultPhoto.jpg" alt="...">
												</c:if>
												<c:if test="${ reply.crewPhoto ne 'default' }">
													<img class="img-fluid rounded-circle" style="width: 40; height: 40; position:;" src="/images/ship/${ shipNum }/${ reply.crewPhoto }" alt="...">
												</c:if>
											</div>
										</div>
										<%-- 1) 댓글의 프로필사진 끝 --%>


										<%--  댓글 작성자 + 내용 --%>
										<div class="col-10 p-0 py-3">
											<div class="row-2 fw-bolder m-0 reply-read-name">
												<div class="REPLY_NUM" style="display: none;"></div>
												<%-- 댓글 작성자 클릭 시, 쪽지 메뉴 시작 --%>
												<div class="reply-note-menu-box noteBox px-0" style="display: none; top: 38px; left: 144px; color: black;">
													<ul class="m-0 p-0">
														<li><a style="color: black; cursor: pointer">쪽지 보내기</a></li>
													</ul>
												</div> 
												<%-- 댓글 작성자 클릭 시, 쪽지 메뉴 끝 --%>
												
												<div class="reply-writer CREW_NUM" onclick="showReplyNote(this , ${reply.crewNum},'${ reply.crewNickname }')">
													<strong class="text" style="cursor: pointer;">${ reply.crewNickname }</strong>
												</div>

												<%-- 												작성자 크루넘 : ${ item.crewNum }<br> --%>
												<%-- 												보는사람 크루넘 : ${ myCrewInfo.crewNum }<br> --%>
												<%-- 												해당 댓글의 공개여부 : ${ reply.replyOpen } --%>


												<c:if test="${ reply.replyOpen eq 1 }">
													<i class="bi bi-lock-fill" style="color: black;">비밀댓글입니다.</i>
												</c:if>
												<div class="row-2 d-flex REPLY_CONTENT">

													<c:if test="${ reply.replyChange eq 1 }">
														<span class="small mark">수정됨</span>
													</c:if>

													<c:if test="${ reply.replyOpen eq 0 or item.crewNum eq myCrewInfo.crewNum or reply.crewNum eq myCrewInfo.crewNum }">
													${ reply.replyContent }
												</c:if>



												</div>
												<div class="row-2 d-none flex-row jusify-content-between update-box">
													<div class="col-9 px-3 reply-write-box d-flex justify-content-start align-items-center" style="background: white;">
														<textarea name="replyContent" class="reply-write-textarea col-12 p-1 bg-white update-box-text">${ reply.replyContent }</textarea>
													</div>
													<button type="button" class="btn btn-secondary btn-sm" onclick="updateReply(this,${reply.replyNum})">수정</button>
													&nbsp;
													<button type="button" class="btn btn-secondary btn-sm update-box-cancel" onclick="cancelUpdateReply(this)">취소</button>
												</div>


												<div class="row-2 d-flex flex-row jusify-content-between">
													<span class="REPLY_WDATE">${ reply.replyWdate } · </span>
													<button class="leave-reply none-border-btn">답글 쓰기 ·</button>

													<button id="addReplyGood-${ reply.replyNum }" class="REPLY_GOOD none-border-btn reply-good" onclick="addReplyGood(${reply.replyNum} , ${myCrewInfo.crewNum})">추천 ·</button>

													<button id="deleteReplyGood-${ reply.replyNum }" style="display: none;" class="REPLY_GOOD none-border-btn reply-good-cancel" onclick="cancelReplyGood(${reply.replyNum} , ${myCrewInfo.crewNum})">추천취소 ·</button>

													<i id="replyGood-${ reply.replyNum }" class="bi bi-hand-thumbs-up"> 0 </i>
												</div>
											</div>
										</div>
										<%-- 1) or 2) 둘중하나 --%>
										<%-- ''' 표시 --%>
										<div class="btn-reply-more">
											<i class="fas fa-ellipsis-v reply-more"></i>
										</div>
										<!-- ''' 표시  끝-->
										<!-- ''' 표시 누를때 나오는 창 -->
										<div class="reply-menu-box px-0" style="display: none;">
											<ul class="m-0 p-0">
												<c:if test="${ myCrewInfo.crewNum eq reply.crewNum }">
													<li class="border-line-bottom"><a onclick="showUpdateReply(this)" style="cursor: pointer">댓글 수정</a></li>
													<li><a onclick="ConfirmReply(${reply.replyNum})" style="cursor: pointer">댓글 삭제</a></li>
												</c:if>
												<c:if test="${ myCrewInfo.crewNum ne reply.crewNum }">
													<li><a onclick="alert('신고하기');" style="cursor: pointer">신고하기</a></li>
												</c:if>
											</ul>
										</div>
										<%-- ''' 표시 누를때 나오는 창  끝 --%>
									</div>

									

									<%-- 대댓글 입력 부분 --%>
									<div class="bg-transparent reply-write-inner-space" style="display: none;">
										<div class="row d-flex justify-content-between align-items-center ms-3 me-1 my-3">


											<c:if test="${ myCrewInfo.crewNum eq reply.crewNum }">
												<button name="0" onclick="setOpen(this)" class="col-1 bg-light btn-upload" style="background-color: white; border: 0; outline: 0; padding: 0;">
												<i class="bi bi-unlock-fill" style="color: #B3B3B3;"></i>
											</button>
											</c:if>
											<c:if test="${ myCrewInfo.crewNum ne reply.crewNum }">
												<button name="0" onclick="setOpen(this)" class="col-1 bg-white btn-upload" style="background-color: white; border: 0; outline: 0; padding: 0;">
													<i class="bi bi-unlock-fill" style="color: #B3B3B3;"></i>
											</button>
											</c:if>





											
											<div class="col-9 px-3 reply-write-box d-flex justify-content-start align-items-center" style="background: white;">
												<i class="fas fa-user col-1" style="color: #B3B3B3;"></i>
												<textarea name="replyContent" class="reply-write-textarea col-11 p-1 bg-white" placeholder="답글을 남겨주세요."></textarea>
											</div>
											<div class="col-2 " style="vertical-align: center;">
												<input type="button" name="${ item.boardNum }" class="reply-submit-btn text-white" onclick="insertDeepReply(this)" value="입력" />
											</div>
										</div>
									</div>
									<%-- 대댓글 입력 부분 끝 --%>
				</div>
				<%-- 댓글 하나 끝 --%>
				<%-- 1) 댓글 작성자 + 내용  끝 --%>

				</c:when>
				<c:otherwise>
					<c:if test="${ myCrewInfo.crewNum eq reply.crewNum }">
						<div class="row m-0 bg-light ps-5 border-line-both sub-box" style="heigth: 200px; color: #333; display: none;">
					</c:if>
					<c:if test="${ myCrewInfo.crewNum ne reply.crewNum }">
						<div class="row m-0 bg-white ps-5 border-line-both sub-box" style="heigth: 200px; color: #333; display: none;">
					</c:if>


					<input type="number" name="bundleNum" value="${ reply.bundleNum }" style="display: none;">
					<input type="number" name="bundleOrder" value="${ reply.bundleOrder }" style="display: none;">
					<input type="number" name="bundleDepth" value="${ reply.bundleDepth }" style="display: none;">
					<div class="row">
						<%-- 1) 댓글의 프로필사진 --%>
						<div class="col-2 m-0 my-2 py-3 d-flex justify-content-center">
							<div class="d-flex justify-content-center align-items-start" onclick="location.href='#'">
								<c:if test="${ reply.crewPhoto eq 'default' }">

									<img class="img-fluid rounded-circle" style="opacity: 0.5; width: 40; height: 40; position:;" src="/images/defaultPhoto.jpg" alt="...">
								</c:if>
								<c:if test="${ reply.crewPhoto ne 'default' }">
									<img class="img-fluid rounded-circle" style="width: 40; height: 40; position:;" src="/images/ship/${ shipNum }/${ reply.crewPhoto }" alt="...">
								</c:if>

							</div>
						</div>
						<%-- 1) 댓글의 프로필사진 끝 --%>


						<%--  댓글 작성자 + 내용 --%>
						<div class="col-10 p-0 py-3">
							<div class="row-2 fw-bolder m-0 reply-read-name">
								<%-- 대댓글 작성자 클릭 시, 쪽지 메뉴 시작 --%>
								<div class="reply-reply-note-menu-box noteBox px-0"
									style="display: none; top: 38px; left: 180px; color: black;">
									<ul class="m-0 p-0">
										<li><a style="color: black; cursor: pointer">쪽지 보내기</a></li>
									</ul>
								</div>
								<%-- 대댓글 작성자 클릭 시, 쪽지 메뉴 끝 --%>


								<div class="REPLY_NUM" style="display: none;"></div>
								<div class="reply-writer CREW_NUM" onclick="showReplyReplyNote(this,${reply.crewNum},'${ reply.crewNickname }')">
									<strong class="text">${ reply.crewNickname }</strong>
								</div>
								<c:if test="${ reply.replyOpen eq 1 }">
									<i class="bi bi-lock-fill" style="color: black;">비밀댓글입니다.</i>
								</c:if>
								<div class="row-2 d-flex REPLY_CONTENT">

									<c:if test="${ reply.replyChange eq 1 }">
										<span class="small mark">수정됨</span>
									</c:if>

									<c:if test="${ reply.replyOpen eq 0 or item.crewNum eq myCrewInfo.crewNum or reply.crewNum eq myCrewInfo.crewNum }">
													${ reply.replyContent }
												</c:if>



								</div>

								<div class="row-2 d-none flex-row jusify-content-between update-box">
									<div class="col-9 px-3 reply-write-box d-flex justify-content-start align-items-center" style="background: white;">
										<textarea name="replyContent" class="reply-write-textarea col-12 p-1 bg-white update-box-text">${ reply.replyContent }</textarea>
									</div>
									<button type="button" class="btn btn-secondary btn-sm" onclick="updateReply(this,${reply.replyNum})">수정</button>
									&nbsp;
									<button type="button" class="btn btn-secondary btn-sm update-box-cancel" onclick="cancelUpdateReply(this)">취소</button>
								</div>

								<div class="row-2 d-flex flex-row jusify-content-between">
									<span class="REPLY_WDATE">${ reply.replyWdate } · </span>
									<button class="leave-reply none-border-btn">답글 쓰기 ·</button>

									<button id="addReplyGood-${ reply.replyNum }" class="REPLY_GOOD none-border-btn reply-good" onclick="addReplyGood(${reply.replyNum} , ${myCrewInfo.crewNum})">추천 ·</button>

									<button id="deleteReplyGood-${ reply.replyNum }" style="display: none;" class="REPLY_GOOD none-border-btn reply-good-cancel" onclick="cancelReplyGood(${reply.replyNum} , ${myCrewInfo.crewNum})">추천취소 ·</button>

									<i id="replyGood-${ reply.replyNum }" class="bi bi-hand-thumbs-up"> 0 </i>
								</div>
							</div>
						</div>
						<%-- 1) or 2) 둘중하나 --%>
						<%-- ''' 표시 --%>
						<div class="btn-reply-more">
							<i class="fas fa-ellipsis-v"></i>
						</div>
						<!-- ''' 표시  끝-->
						<!-- ''' 표시 누를때 나오는 창 -->
						<div class="reply-menu-box px-0" style="display: none;">
							<c:if test="${ myCrewInfo.crewNum eq reply.crewNum }">
								<ul>
									<li class="border-line-bottom"><a onclick="showUpdateReply(this)" style="cursor: pointer">댓글 수정</a></li>
									<li class="border-line-bottom"><a onclick="ConfirmReply(${reply.replyNum})" style="cursor: pointer">댓글 삭제</a></li>
								</ul>
							</c:if>
							<c:if test="${ myCrewInfo.crewNum ne reply.crewNum }">
								<ul>
									<li class=""><a onclick="alert('신고하기');" style="cursor: pointer">신고하기</a></li>
								</ul>
							</c:if>



						</div>
						<%-- ''' 표시 누를때 나오는 창  끝 --%>
					</div>

					<%-- 대댓글 입력 부분 --%>
					<div class="bg-transparent reply-write-inner-space" style="display: none;">
						<div class="row d-flex justify-content-between align-items-center ms-3 me-1 my-3">

							<c:if test="${ myCrewInfo.crewNum eq reply.crewNum }">
								<button name="0" onclick="setOpen(this)" class="col-1 bg-light btn-upload" style="background-color: white; border: 0; outline: 0; padding: 0;">
							</c:if>
							<c:if test="${ myCrewInfo.crewNum ne reply.crewNum }">
								<button name="0" onclick="setOpen(this)" class="col-1 bg-white btn-upload" style="background-color: white; border: 0; outline: 0; padding: 0;">
							</c:if>


							<i class="bi bi-unlock-fill" style="color: #B3B3B3;"></i>
							</button>
							<div class="col-9 px-3 reply-write-box d-flex justify-content-start align-items-center" style="background: white;">
								<i class="fas fa-user col-1" style="color: #B3B3B3;"></i>
								<textarea name="replyContent" class="reply-write-textarea col-11 p-1 bg-white" placeholder="답글을 남겨주세요."></textarea>
							</div>
							<div class="col-2 " style="vertical-align: center;">
								<input type="button" name="${ item.boardNum }" class="reply-submit-btn text-white" onclick="insertDeepReply(this)" value="입력" />
							</div>
						</div>
					</div>
					<%-- 대댓글 입력 부분 끝 --%>
		</div>
		<%-- 댓글 하나 끝 --%>
		<%-- 1) 댓글 작성자 + 내용  끝 --%>
		</c:otherwise>
		</c:choose>

		</c:if>
		</c:forEach>
		
		

		<%-- 댓글 입력 시작 게시글당 하나만 존재--%>
		<div name="" class="bg-transparent reply-write-space p-0" style="display: none;">
			<div class="row d-flex justify-content-between align-items-center ms-1 my-3 pe-2">
				<button name="0" onclick="setOpen(this)" class="col-1 btn-upload" style="background-color: white; border: 0; outline: 0; padding: 0;">
					<i class="bi bi-unlock-fill" style="color: #B3B3B3;"></i>
				</button>
				<div class="col-9 px-3 reply-write-box d-flex justify-content-start align-items-center">
					<i class="fas fa-user col-1" style="color: #B3B3B3;"></i>
					<textarea class="reply-write-textarea col-11 p-1" placeholder="댓글을 남겨주세요."></textarea>
				</div>
				<div class="col-2 " style="vertical-align: center;">
					<input type="button" name="${ item.boardNum }" class="reply-submit-btn text-white" onclick="insertReply(this)" value="입력" />
				</div>
			</div>
		</div>
		<%-- 댓글입력 끝 --%>

	</div>
	<%-- 하나의 게시글 끝 --%>
	</c:forEach>

</div>
</div>
</div>


<!-- 글쓰기 모달창 시작 -->
<div id="write-modal" style="display: none;">
	<div class="write-modal-content">
		<form name="writeBoard" class="col d-flex-column justify-content-center align-items-between p-3 write-modal-box" method="post" action="/ship/${ shipNum }/board/write">

         <!-- 미리 준비해둔 내 CREW_NUM -->
         <input id="crewNum" name="crewNum" type="hidden" value="${ myCrewInfo.crewNum }">

         <!-- 최상단 글쓰기 + X 시작-->
         <div class="row-1 justify-content-between ">
         
         <!-- boardModalTitle 추가 -->
            <div class="d-flex justify-content-center">
               <span class="boardModalTitle">글쓰기</span>
            </div>
            <i class="fas fa-times fa-2x write-modal-close-i"></i>
         </div>
         <!-- 최상단 글쓰기 + X 끝 -->



         <!-- 글내용 작성 시작 -->
			<div>
				<!-- 게시글제목 -->
				<div class="input-group mb-3" style="margin-bottom: 0rem !important; margin-top: 1rem !important;">
					<span class="input-group-text" id="inputGroup-sizing-default">제목</span> <input id="writeBoardSubject" name="boardSubject" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="게시글을 대표하는 문구입니다.">
				</div>
				<!-- 게시글 끝 -->
				<!-- 게시글 본문 -->
				<div id="boardWriteDiv" class="row-9 m-3 py-4 write-modal-textarea border-line-top" contenteditable="true" style="position: relative;">새로운 소식을 남겨보세요.</div>
				<input id="boardContent" name="boardContent" type="hidden" value="">
				<!-- 게시글 본문  끝 -->
			</div>
			<!-- 글내용 작성 끝 -->

			<!-- 첨부파일 시작 -->
			<div class="row-1">
				<div class="card-footer border-0 bg-transparent d-flex justify-content-around p-3">
					<button class="btn" style="size: 10px" onclick="">
						<input id="writeBoardPhoto" type="file" class="img-input" accept="image/*" name="1" onchange="checkPhoto(this)" /> <i class="bi bi-image fs-5" style="color: #0000008c;"></i>
					</button>
					<button class="btn" onclick="video">
						<input type="file" class="video-input" accept="video/*" name="2" /> <i class="bi bi-play-circle fs-5" style="color: #0000008c;"></i>
					</button>
					<button class="btn" onclick="file">
						<input type="file" class="file-input" accept="*" name="3" onchange="checkFile(this)" /> <i class="bi bi-paperclip fs-5" style="color: #0000008c;"></i>
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
			<!-- 첨부파일 끝 -->

			<!-- 글쓰기 최하단 시작 -->
			<div class="row-1 border-line-top d-flex justify-content-between align-items-center py-4">
				<div id="dragDropDiv" class="col-10 d-inline p-2 px-3" style="border: 1px solid #B3B3B3; border-radius: 12px;">
					<span> 파일 드래그!</span>





				</div>
				<input id="write-board-submit-btn" type="button" class="write-modal-submit-btn col-2" value="작성하기" onclick="checkBeforeSubmit('write')" /> <input id="update-board-submit-btn" type="button" class="write-modal-submit-btn col-2" value="수정하기" onclick="checkBeforeSubmit('update')" />
			</div>
			<!-- 글쓰기 최하단 끝 -->
			<div id="fileList" style="display: none;"></div>


		</form>
	</div>
	<div class="write-modal-layer"></div>
	<input id="boardNum" type="hidden" value="">
</div>
<!-- 글쓰기 모달창 끝 -->

<!-- 쪽지 모달창 시작 -->
<div class="note-modal" style="display: none;">
	<div class="note-modal-content p-4">

		<div class="d-flex flex-column justify-content-center align-items-between" style="color: #0000008c;" >
			<div class="row-1 p-4 pb-2 border-bottom">
				<h5 class="d-flex justify-content-center">쪽지</h5>
				<i class="fas fa-times fa-2x note-modal-close-i"></i>
			</div>
			<div class="col d-flex flex-column justify-content-between align-items-center p-3" style="color: #0000008c;" >

				<div class="w-100 my-2 d-flex justify-content-start">
					
					<span class="me-3 mb-2" style="font-weight:800;">받는 사람 </span>
					<span id="noteReceiverCrewNickname" class=""></span>
					<input id="noteReceiver" type="hidden">
					<input id="noteSender" type="hidden">
					
				</div>
				<div class="row-9  border w-100" style="height:auto;">
					<textarea id="noteContent" class="w-100 note-modal-textarea"></textarea>
				</div>

				<div class="my-4 d-flex justify-content-center">
					<button class="btn border btn-outline-dark border-dark rounded-0 p-2 m-3 btn-send-note" style="font-size: 13px; width: 90px;">보내기</button>
					<button class="btn border btn-outline-dark border-dark rounded-0 p-2 m-3 btn-cancel-note" style="font-size: 13px; width: 90px;">취소</button>
				</div>
			</div>
		</div>
	</div>
	<div class="write-modal-layer"></div>
</div>
<!-- 쪽지 모달창  끝 -->



<script>
 

function checkCrew(){
	   let crewNum= '${myCrewInfo.crewNum}';
	   if(crewNum.length <1){
	      alert("SHIP에 가입하지 않아 권한이 없습니다!"); 
	      return false;
	   }else return true;
	}
	
$(document).ready(function(){

// 	쪽지 모달창

	/*쪽지 보내기 클릭시 모달창  */
	$(".noteBox").on("click", function(e){
		document.querySelector(".note-modal").style.display = "block";
		let notBox = e.target.closest("div .noteBox");
		notBox.style.display = "none";
		$("#noteContent").val("");

	}); 
	/* 쪽지 모달창  X 버튼 */ 
	$(".note-modal-close-i").on("click", function(){
		document.querySelector(".note-modal").style.display = "none";
	});
	/* 쪽지 관리 취소 버튼 */ 
	$(".btn-cancel-note").on("click", function(){
		document.querySelector(".note-modal").style.display = "none";
		
	});
	/*쪽지 보내기 버튼 */ 
	$(".btn-send-note").on("click", function(){		
		
		let noteContent = $("#noteContent").val();
		
		if( noteContent.length < 1 ){
			alert("쪽지 내용을 입력해주세요!");			
		}else{			
			
			let noteSender = $("#noteSender").val();
			let noteReceiver = $("#noteReceiver").val();
			
			 
			$.ajax({
				url:"/rest/sendNote",
				type:"post",
				data:{noteSender:noteSender,noteReceiver:noteReceiver,noteContent:noteContent},				
				success:function(data){
					
					alert("쪽지를 보냈습니다!");
					document.querySelector(".note-modal").style.display = "none";					
					
				},
				
				
			});
			
			
		}
		
		
		
	});
	
	
	//최신순 오래된순 세션이용해서 다시 클릭
	if(sessionStorage.getItem("sessionOrder")=="asc"){
		$(".show-latest-btn").click();				
	}else if (sessionStorage.getItem("sessionOrder")=="desc"){
		$(".show-early-btn").click();		
	}else{
		$(".show-latest-btn").click();
	}
	
	
	//페이지 로드되면 댓글열었던 게시글을 다시 열어주기
	for( key in sessionStorage){
		if (!sessionStorage.hasOwnProperty(key)) {
		    continue;
		  }
		if(sessionStorage.getItem(key) == "fold"){
			$('#foldReply-'+key).click();						
		}else if(sessionStorage.getItem(key) == "unfold"){
			$('#unfoldReply-'+key).click();
		}
	}
	
	let divs = $(".order-div");	
	for(div of divs){		
		div.style.backgroundColor='';
	}	
	
	  
	

	
	
// 	show-latest-btn show-early-btn
	if(sessionStorage.getItem("sessionOrderBy")=="Board_Good"){
		$("#orderByGood").css('background-color', 'rgb(173, 181, 189)');
		$(".show-latest-btn").text("많은순");
		$(".show-early-btn").text("적은순");
	}else if(sessionStorage.getItem("sessionOrderBy")=="Board_View"){
		$("#orderByView").css('background-color', 'rgb(173, 181, 189)');
		$(".show-latest-btn").text("많은순");
		$(".show-early-btn").text("적은순");
	}else if(sessionStorage.getItem("sessionOrderBy")=="Board_Reply"){
		$("#orderByReply").css('background-color', 'rgb(173, 181, 189)');
		$(".show-latest-btn").text("많은순");
		$(".show-early-btn").text("적은순");
	}else if(sessionStorage.getItem("sessionOrderBy")=="Board_Wdate"){
		$("#orderByWdate").css('background-color', 'rgb(173, 181, 189)');
		$(".show-latest-btn").text("최신순");
		$(".show-early-btn").text("오래된순");
	}
	

	
	$.ajax({
		url:"/rest/getBoardDocumentFileCounts.json",
		type:"post",
		data:{request:"getBoardDocumentFileCounts"},
		success:function(data){ 
			for( file of data){
				$('#documentFile-'+file.boardNum).css("display","block");
				$('#documentFileCount-'+file.boardNum).html("총 "+file.count+"개의 파일.."); 
			}			
		},
	});
	
	$.ajax({
		url:"/rest/getReplyCounts.json",
		type:"post",
		data:{request:"getReplyCounts"},
		success:function(data){
			for( reply of data){
				$('#boardReplyCount-'+reply.boardNum).html("<i class='bi bi-chat-text'> "+reply.count);				
			}			
		},
	});
	
	$.ajax({
		url:"/rest/getBoardGoodCounts.json",
		type:"post",
		data:{request:"getBoardCounts"},
		success:function(data){
			for( BoardCount of data){
				$('#boardGood-'+BoardCount.boardNum).html("<i class='bi bi-hearts'> "+BoardCount.count+" ");				
			}
			
		},
	});
	
	$.ajax({
		url:"/rest/getBoardGood.json",
		type:"post",
		data:{request:"getBoardGood"},
		success:function(data){
			for( boardGood of data){				
				if("${myCrewInfo.crewNum}" == boardGood.crewNum){
					$('#addBoardGood-'+boardGood.boardNum).css("display","none");
					$('#cancelBoardGood-'+boardGood.boardNum).css("display","block");					
				}
				
			}
		},
	});	
	
	$.ajax({
		url:"/rest/getReplyGoodCounts.json",
		type:"post",
		data:{request:"getReplyCounts"},
		success:function(data){
			
			for( replyCount of data){
				$('#replyGood-'+replyCount.replyNum).text(" "+replyCount.count+" ");
			}
			
		},
	});	
	
	
	$.ajax({
		url:"/rest/getReplyGood.json",
		type:"post",
		data:{request:"getReply"},
		success:function(data){
			for( replyGood of data){
				
				if("${myCrewInfo.crewNum}" == replyGood.crewNum){
					$('#addReplyGood-'+replyGood.replyNum).css("display","none");
					$('#deleteReplyGood-'+replyGood.replyNum).css("display","block");					
				}
				
			}
		},
	});	
	
});


//note 시작
function showBoardNote(el,crewNum,crewNickname) {	
	let myCrewNum = '${myCrewInfo.crewNum}';
	
	let crewNicknameSpan = $("#noteReceiverCrewNickname")[0];
	crewNicknameSpan.innerText=crewNickname;	
	
	$("#noteReceiver").val(crewNum);
	$("#noteSender").val(myCrewNum); 
	
		
	
	
	
	let elGrandParent = el.closest("div .main-box");	
	let boardNote = elGrandParent.querySelector('.board-note-menu-box');
	
	if(boardNote.style.display=="none"){		
		boardNote.style.display='block';		
	}else{		
		boardNote.style.display="none";
	}	
}
function showReplyNote(el,crewNum,crewNickname) {		
	let myCrewNum = '${myCrewInfo.crewNum}';
	let elGrandParent = el.closest("div .reply-box");	
	let replyNote = elGrandParent.querySelector('.reply-note-menu-box');	
	
	if(replyNote.style.display=="none"){
		replyNote.style.display='block';
	}else{
		replyNote.style.display="none";
	}
	
	
	
	
	let crewNicknameSpan = $("#noteReceiverCrewNickname")[0];
	crewNicknameSpan.innerText=crewNickname;
	
		
	
	$("#noteReceiver").val(crewNum);
	$("#noteSender").val(myCrewNum);
	
	
} 
function showReplyReplyNote(el,crewNum,crewNickname) {
	let myCrewNum = '${myCrewInfo.crewNum}';
	let elGrandParent = el.closest("div .sub-box");	
	let replyReplyNote = elGrandParent.querySelector('.reply-reply-note-menu-box');
	
	if(replyReplyNote.style.display=="none"){		
		replyReplyNote.style.display='block';		
	}else{		
		replyReplyNote.style.display="none";
	}
	
	
	
	
	
	let crewNicknameSpan = $("#noteReceiverCrewNickname")[0];
	crewNicknameSpan.innerText=crewNickname;
	
		
	
	$("#noteReceiver").val(crewNum);
	$("#noteSender").val(myCrewNum);
	
	
}
//note 끝

function cancelBoardGood(boardNum,crewNum){
	if(!checkCrew())return false;
	
	var jsObj = {crewNum:crewNum,boardNum:boardNum};
	$.ajax({
		url : "/rest/cancelBoardGood.json",
		type : "post",
		data : jsObj,
		success : function(data){
			if(data != ""){
				$('#boardGood-'+data.boardNum).html("<i class='bi bi-hearts'> "+data.count);
			}else{
				$('#boardGood-'+boardNum).html("<i class='bi bi-hearts'> "+0);
			}
			$('#addBoardGood-'+boardNum).css("display","block");
			$('#cancelBoardGood-'+boardNum).css("display","none"); 
			
		},
	});
}

function addBoardGood(boardNum , crewNum){
	if(!checkCrew())return false;
	
	var jsObj = {crewNum:crewNum,boardNum:boardNum};
	$.ajax({
		url : "/rest/addBoardGood.json",
		type : "post",
		data : jsObj,
		success : function(data){
			$('#boardGood-'+data.boardNum).html("<i class='bi bi-hearts'> "+data.count);
			$('#addBoardGood-'+data.boardNum).css("display","none");
			$('#cancelBoardGood-'+data.boardNum).css("display","block");	 
			
		},
	});
}

 
function addReplyGood(replyNum , crewNum){	
	if(!checkCrew())return false;
	
	var jsObj = {crewNum:crewNum,replyNum:replyNum};
	$.ajax({
		url : "/rest/addReplyGood.json",
		type : "post",
		data : jsObj,
		success : function(data){
			$('#replyGood-'+data.replyNum).text(" "+data.count+" ");
			$('#addReplyGood-'+data.replyNum).css("display","none");
			$('#deleteReplyGood-'+data.replyNum).css("display","block");	 
			
		},
	});

} 

function cancelReplyGood(replyNum , crewNum){	
	if(!checkCrew())return false;

	var jsObj = {crewNum:crewNum,replyNum:replyNum};
	var json = JSON.stringify(jsObj);
	$.ajax({
		url : "/rest/cancelReplyGood.json",
		type : "post",
		data: jsObj,
		success : function(data){
			if(data != ""){
				$('#replyGood-'+data.replyNum).text(" "+data.count+" ");
			}else{
				$('#replyGood-'+replyNum).text(" 0 ");
			}
			$('#addReplyGood-'+replyNum).css("display","block");
			$('#deleteReplyGood-'+replyNum).css("display","none");
			
		},
	});
}







function downloadFile(el){
	url="/download.do/${shipNum}/?fname="+el.name;
	location.href=url;
}







var shipNum = $('#shipNum').val();

var allFiles = []; // 무조건 업로드가 된 애들

var insertFiles = []; // db insert 업로드가 된 애들
var deleteFiles = []; // 무조건 업로드가 된 애들

var formBox = new FormData();	//file핸들링 박스
var fileSet = new Set();		//단순중복확인
$(document).ready(function() {		
	   //색 수정
	   $("#dragDropDiv").on("dragover",
	         function(e) {
	            e.stopPropagation(); // 상위로 이벤트 전파 막기용
	            e.preventDefault();   //   브라우저의 다른 기능 막기용
	            $(this).css('border', '2px solid rgb(19, 38, 80)');
	   });   
	   $("#dragDropDiv").on("drop", function(e) {
	      $(this).css('border', '1px solid #B3B3B3'); 
		e.preventDefault(); // 브라우저의 다른 기능 막기용 내가 드롭하는거에만 집중
		//DROP 되는 위치에 들어온 파일 정보를 배열 형태로 받아온다.
		var files = e.originalEvent.dataTransfer.files;
		for(var i=0 ; i < files.length ; i++){
			if(!fileSet.has(files[i].name)){
				formBox.append(files[i].name,files[i]);
				fileSet.add(files[i].name);
				$.ajax({
					url : "/rest/fileUpload/"+shipNum ,
					type:"post" ,
					processData : false,
					contentType : false,
					async: false,
					data : formBox,
					dataType : "json",
					success: function(data){						
						var comeBackFile = {
								name : data.ofnames[0],
								dumpName : data.savefnames[0],
								fsize : data.fsizes[0]
						};					
						allFiles.push(comeBackFile);						
						let prettyFsize = getPrettyFsize(comeBackFile);
						
 						let divHtml = "<div id=\""+comeBackFile.fsize+"\"><a href='#' contenteditable='false' class='aclass row p-3 my-3 m-0 border-around bg-light' style='cursor: pointer;'><div class='col-12 d-flex justify-content-between' style='color: black;'><span class='col-8'>"+comeBackFile.name+"</span> <span class='col-3' style='opacity: .6;'>"+prettyFsize+"</span>";
 						divHtml +="<button id=\""+comeBackFile.name+"\" type='button' class='col-1 delete-btn' style='opacity: .6;' name='"+comeBackFile.dumpName+"' onclick='deleteFileDiv(this)'><i class='bi bi-x-lg'></i></button>";
						divHtml +="<button id=\""+comeBackFile.name+"\" type='button' class='col-1 download-btn' style='opacity: .6; display:none;' name='"+comeBackFile.dumpName+"' onclick='downloadFile(this)'><i class='bi bi-arrow-down'></i></button>";  
						divHtml	+="</div></a></div>";
						let html = $('#boardWriteDiv').html();
						html += divHtml;
						$('#boardWriteDiv').html(html); 
						formBox = new FormData();
					}					
				});
			}else{
				alert("이미 첨부한 파일입니다!");
			}			
		}
	});
});
 
function deleteFileDiv(el){
	fileName = el.id;
	let parentDiv = el.parentElement.parentElement.parentElement;
	parentDiv.remove();
	fileSet.delete(fileName);
	for( let file of allFiles ){
		if( file.dumpName == el.name ){
			deleteFiles.push(file.dumpName);						
		}
	}
	for( let file of beforeFiles ){
		if( file.dumpName == el.name ){
			deleteFiles.push(file.dumpName);						
		}
	}
	
	
	el.value="";	 
}

function getPrettyFsize(file){						
	var prettyFsize = "";
	var sizeKB = file.fsize / 1024;
	if (parseInt(sizeKB) > 1024) {
		var sizeMB = sizeKB / 1024;
		prettyFsize = sizeMB.toFixed(2) + " MB";
	} else {
		prettyFsize = sizeKB.toFixed(2) + " KB";
	}
	return prettyFsize;
}

function checkFile(inputElement) { // 마우스 클릭으로 파일을 첨부할때
	var uploadFile = inputElement.files[0];		
	if(!fileSet.has(uploadFile.name)){
		let form = new FormData();
		form.append( uploadFile.name, uploadFile );
		fileSet.add(uploadFile.name);
		$.ajax({
			url : "/rest/fileUpload/"+shipNum ,
			type:"post" ,
			processData : false,
			contentType : false,
			data : form,
			async: false,
			dataType : "json",
			success: function(data){				
				let comeBackFile = {
						name : data.ofnames[0],
						dumpName : data.savefnames[0],
						fsize : data.fsizes[0]								
				};				
				allFiles.push(comeBackFile);
				
				var prettyFsize = getPrettyFsize(comeBackFile);
				
				let divHtml = "<div id=\""+comeBackFile.fsize+"\"><a href='#' contenteditable='false' class='aclass row p-3 my-3 m-0 border-around bg-light' style='cursor: pointer;'><div class='col-12 d-flex justify-content-between' style='color: black;'><span class='col-8'>"+comeBackFile.name+"</span> <span class='col-3' style='opacity: .6;'>"+prettyFsize+"</span>";
				divHtml +="<button id=\""+comeBackFile.name+"\" type='button' class='col-1 delete-btn' style='opacity: .6;' name='"+comeBackFile.dumpName+"' onclick='deleteFileDiv(this)'><i class='bi bi-x-lg'></i></button>";
				divHtml +="<button id=\""+comeBackFile.name+"\" type='button' class='col-1 download-btn' style='opacity: .6; display:none;' name='"+comeBackFile.dumpName+"' onclick='downloadFile(this)'><i class='bi bi-arrow-down'></i></button>"; 
				divHtml	+="</div></a></div>";
				
				let html = $('#boardWriteDiv').html();
				html += divHtml;
				$('#boardWriteDiv').html(html);
				
				formBox = new FormData();
				
				inputElement.value="";
			}					
		});
	}else{ 
		inputElement.value="";
		alert(" 이미 첨부된 파일입니다!");
	}
}
</script>



<!-- 게시글 읽기 모달창 시작 -->
<div id="read-modal" style="display: none;">
	<div class="read-modal-content">
		<form name="readBoard" class="col d-flex-column justify-content-center align-items-between p-3 read-modal-box" method="post">

			<!-- 미리 준비해둔 내 CREW_NUM -->
			<input id="readCrewNum" name="crewNum" type="hidden" value="${ myCrewInfo.crewNum }">


			<!-- 최상단 작성자 프로필 + X 시작-->
         <i class="fas fa-times fa-2x read-modal-close-i"></i>
         
         <div class="row" style="float: none; margin: 0 auto;">
            <div class="col-2 pe-0 text-center" style="float: none; margin: auto;">
               
               <img id="readBoardCrewPhoto" class="img-fluid rounded-circle" style="width: 50; height: 50; position:;" src="/images/defaultPhoto.jpg" alt="...">

            </div>
            <div class="col px-0 py-2" style="flex-direction: column;">
               <div class="BOARD_NUM" style="display: none;"></div>
               
               <%-- 글 작성자 클릭 시, 나오는 쪽지 메뉴 --%>
               <div class="board-note-menu-box noteBox px-0" style="display: none;">
                  <ul class="m-0 p-0">
                     <li><a style="cursor: pointer">쪽지 보내기</a></li>
                  </ul>
               </div>
               <%-- 글 작성자 클릭 시, 나오는 쪽지 메뉴--%>
                     
                     
<!--                <div> -->
<%--                   <span class="fw-bolder m-0" onclick="showBoardNote(this,${item.crewNum},'${ item.crewNickname }')" style="cursor: pointer; font-size: 1em;">${ item.crewNickname }item.crewNickname1</span> --%>
<!--                </div> -->
               <div class="row-1">
                  <div id="readBoardCrewInfo">item.crewNickname2</div>                               
                  <!-- 게시글 읽기 최하단 시작 - 위치 변경-->
                  <span id="readBoardWDate">작성 날짜 : 2019/05/02</span>                           
               </div>
            </div>
         </div>
			<!-- 최상단 작성자 프로필 + X 끝 -->



			<!-- 글내용 시작 -->
			<div>
				<!-- 게시글제목 -->
				 <div class="input-group mb-3 px-3" style="margin-bottom: 0rem !important; margin-top: 1rem !important;">
               <span class="input-group-text" id="inputGroup-sizing-default">제목</span> 
               <input readonly="readonly" id="readBoardSubject" type="text" class="form-control bg-white" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
            </div>
				<!-- 게시글 끝 -->
				<!-- 게시글 본문 -->
				<div id="readBoardDiv" class="row-9 m-3 py-4 read-modal-textarea border-line-top" contenteditable="false" style="position: relative;"></div>
				<input id="readBoardContent" name="boardContent" type="hidden" value="">
				<!-- 게시글 본문  끝 -->
			</div>
			<!-- 글내용  끝 -->
			<!-- 게시글 읽기 최하단 시작 -->
			
			<!-- 게시글 읽기 최하단 끝 -->


		</form>

	</div>

	<div class="read-modal-layer">
	
	<div id="left-arrow-div" class="left-arrow p-0 m-0" style="background-color: rgba(0, 0, 0, 0.0);">
		
	</div> 
	<div id="right-arrow-div" class="right-arrow p-0 m-0" style="background-color: rgba(0, 0, 0, 0.0);">
		
	</div> 
	
	
	
	</div>
</div>

<!-- 게시글 모달창 끝 -->




<!-- confirm 창 -->
<div class="modal" id="msg_popup" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-body text-center">
				<!-- MSG Space-->
			</div>
			<div class="d-flex flex-row justify-content-center modal-footer" id="btn_confirm">
				<button type="button" id="confirm_yes" class="btn btn-dark" data-dismiss="modal">삭제</button>
				<button type="button" id="confirm_no" class="btn btn-secondary" data-dismiss="modal">취소</button>
			</div>
			<div class="modal-footer" id="btn_alert">
				<button type="button" id="alert_ok" class="btn btn-primary" data-dismiss="modal">OK</button>
			</div>
		</div>
	</div>
</div>
<!-- confirm 창 -->








<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="/js/bootstrap/bootstrap.bundle.min.js"></script>
<script>


function updateReply(el,replyNum){
	let elGrandParent = el.closest("div .sub-box");
	let elUpdateBoxText = elGrandParent.querySelector("div .update-box-text");	
	let elDeleteButton = elGrandParent.querySelector(".update-box-cancel");	
	let replyContent = elUpdateBoxText.value;
	
	
	let jsObj = {
			replyNum : replyNum ,
			replyContent : replyContent
			}
	
	MsgBox.Confirm("댓글을 수정하시겠습니까 ?","update", function() {updateReplyDo(jsObj)} , function(){elDeleteButton.click()});	
}


function updateReplyDo(jsObj){
		
	$.ajax({
		url:"/rest/updateReply",
		type:"post",
		data:jsObj,
		success:function(){
			location.reload();
		},
	});
}

function cancelUpdateReply(el){	
	let elGrandParent = el.closest("div .sub-box");
	let elReplyBox = elGrandParent.querySelector("div .REPLY_CONTENT");
	let elUpdateDiv = elGrandParent.querySelector("div .update-box");
	let elUpdateBoxText = elGrandParent.querySelector("div .update-box-text");
	

	
	if(elUpdateDiv.className =="row-2 d-flex flex-row jusify-content-between update-box" ){
		elUpdateDiv.className="row-2 d-none flex-row jusify-content-between update-box";
		elReplyBox.className="row-2 d-flex REPLY_CONTENT";
	}else{
		elUpdateDiv.className="row-2 d-flex flex-row jusify-content-between update-box";		
		elReplyBox.className="row-2 d-none REPLY_CONTENT";
	}
}


function showUpdateReply(el){
	let elGrandParent = el.closest("div .sub-box");
	let elMoreBox = elGrandParent.querySelector("div .reply-menu-box");
	let elUpdateDiv = elGrandParent.querySelector("div .update-box");
	elMoreBox.style.display = "none";
	
	let elReplyBox = elGrandParent.querySelector("div .REPLY_CONTENT");
	var originContent = elReplyBox.innerText;
	
		
	if(elUpdateDiv.className == "row-2 d-flex flex-row jusify-content-between update-box" ){
		elUpdateDiv.className="row-2 d-none flex-row jusify-content-between update-box";
		elReplyBox.className="row-2 d-flex REPLY_CONTENT";
	}else{
		elUpdateDiv.className="row-2 d-flex flex-row jusify-content-between update-box";		
		elReplyBox.className="row-2 d-none REPLY_CONTENT";
	}
	
	let elUpdateBoxText = elGrandParent.querySelector("div .update-box-text");	
	elUpdateBoxText.value=originContent;
	
}


function insertDeepReply(el){
	if(!checkCrew())return false;
	
	let elGrandParent = el.closest("div .sub-box");
	let egpc = elGrandParent.children;
		
	let replyDiv = el.parentElement.parentElement;
	let children = replyDiv.children;
	let replyOpen = children[0].name;
	let replyContent = children[1].children[1].value;
	
	let bundleNum = parseInt(egpc[0].value);
	let bundleOrder = parseInt(egpc[1].value)+1;
	let bundleDepth = parseInt(egpc[2].value)+1;
	
	
	
	if(replyContent.length <1){
		alert("내용을 입력해주세요 !");
		return false;
	}
	
	let jsObject = {
			crewNum : "${myCrewInfo.crewNum}",
			boardNum : el.name,
			bundleNum : bundleNum,
			bundleOrder : bundleOrder,
			bundleDepth : bundleDepth,
			replyContent : replyContent,
			replyOpen : replyOpen
	};
	
	$.ajax({
		url:"/rest/insertReply",
		type:"post",
		data:jsObject,
		success:function(data){
			location.reload();		
		},
	});
	
}


function insertReply(el){
	
	if(!checkCrew())return false;
	
	let replyDiv = el.parentElement.parentElement;
	let children = replyDiv.children;
	let replyOpen = children[0].name;
	let replyContent = children[1].children[1].value;
	
	
	
	if(replyContent.length <1){
		alert("내용을 입력해주세요 !");
		return false;
	}
	
	let jsObject = {
			crewNum : "${myCrewInfo.crewNum}",
			boardNum : el.name,
			replyContent : replyContent,
			replyOpen : replyOpen
	};
	
	$.ajax({
		url:"/rest/insertReply",
		type:"post",
		data:jsObject,
		success:function(data){
			location.reload();		
		},
	});
	
}

function showBoardMore(el) {	
	let elGrandParent = el.closest("div .main-box");	
	let boardMenu = elGrandParent.querySelector('.board-menu');
	
	if(boardMenu.style.display=="none"){		
		boardMenu.style.display='block';		
	}else{		
		boardMenu.style.display="none";
	}	
}

$(document).ready(function() { /*글쓰기 버튼 활성화*/
	$(".write-modal-textarea").on("keyup",function() {
		$(".write-modal-submit-btn").css("background-color","#132650");
				$(".write-modal-submit-btn").attr("disabled",false);
	});
	$(".btn-more").focusout(function(){
		$(".others-post-menu-box").css("display","none");
	});
});


function deleteBoard(boardNum){		
	MsgBox.Confirm("게시글을 삭제하시겠습니까 ?","delete", function() {deleteBoardDo(boardNum)});
}

function deleteBoardDo(boardNum){	
	
	$.ajax({
		url:"/rest/deleteBoard",
		type:"post",
		data:{boardNum:boardNum},
		success:function(data){
			location.reload();			
		},		
	});
	
}

function reportBoard(boardNum){ 
	
	MsgBox.Confirm("게시글을 신고 하시겠습니까 ?","report", function() {reportBoardDo(boardNum)});
}

function reportBoardDo(boardNum){
	alert(boardNum+"번 게시글 신고 로직");

	
}


function ConfirmReply(replyNum){
	MsgBox.Confirm("댓글을 삭제하시겠습니까 ?","delete", function() {deleteReply(replyNum)});
}





function deleteReply(replyNum){
	
	console.log(typeof(replyNum));	
	$.ajax({
		url:"/rest/deleteReply",
		type:"post",
		data:{replyNum:replyNum},
		success:function(){
			location.reload();
		},
	});
}

 
var MsgBox = {
	    /* Alert */
	    Alert: function(msg, okhandler) {
	        new Promise((resolve, reject) => {
	            $("#msg_popup #btn_confirm").hide();
	            $("#msg_popup #btn_alert").show();
	            
	            $("#msg_popup #alert_ok").unbind();
	            $("#msg_popup .modal-body").html(msg);
	            $('#msg_popup').modal('show');

	            $("#msg_popup #alert_ok").click(function() {
	                $('#msg_popup').modal('hide');
	            });

	            $("#msg_popup").on("hidden.bs.modal", function(e) {
	                e.stopPropagation();
	                if(okhandler != null) resolve();
	                else reject();
	            });
	        }).then(okhandler).catch(function() {});
	    },

	    /* Confirm */
	    Confirm: function(msg,type, yeshandler, nohandler) {
	        new Promise((resolve, reject) => {
	        	
	        	
	            var flag = false;
	            $("#msg_popup #btn_alert").hide();
	            $("#msg_popup #btn_confirm").show();
	            
	            $("#msg_popup #confirm_yes").unbind();
	            $("#msg_popup #confirm_no").unbind();
	            
	            
	            if( type == "delete" ){
	            	$("#msg_popup #confirm_yes").html("삭제");
	            }else if( type == "update"){
	            	$("#msg_popup #confirm_yes").html("수정");
	            }else if( type == "report"){
	            	$("#msg_popup #confirm_yes").html("신고");	            	
	            }
	            
	            
	            $("#msg_popup .modal-body").html(msg);
	            
	            $('#msg_popup').modal('show');
	            

	            $('#msg_popup').on('keypress', function (e) {
	                var keycode = (e.keyCode ? e.keyCode : e.which);
	                if(keycode == '13') {
	                    flag = true;
	                    $('#msg_popup').modal('hide');
	                }
	            });
	            
	            
	            $("#msg_popup #confirm_yes").click(function() {
	                flag = true;
	                $('#msg_popup').modal('hide');
	            });
	            $("#msg_popup #confirm_no").click(function() {
	                flag = false;
	                $('#msg_popup').modal('hide');
	            });
	            
	            

	            $("#msg_popup").on("hidden.bs.modal", function(e) {
	                e.stopPropagation();
	                if(yeshandler != null && flag == true) resolve(1); 
	                else if(nohandler != null && flag == false) resolve(2);
	                else reject();
	            }); 

	        }).then(function(value) {
	            if(value == 1) yeshandler();
	            else if(value == 2) nohandler();
	        }).catch(function() {});
	    },
	}
	
	
 

</script>

<script>
/*댓글 달기 버튼을 클릭 시*/
$(".leave-reply-btn").on("click", function(e){

	//타겟의 부모 요소 찾기
	let target = e.target;
	let targetParent = target.closest("div .main-box");
	let realTarget = targetParent.querySelector(".reply-write-space");	
	if(realTarget.style.display == "none"){
		realTarget.style.display = "block";
	}else{ 
		realTarget.style.display = "none";
	}		
	realTarget.querySelector(".reply-write-textarea").focus(); 
}) 

/*답글 쓰기 클릭 시*/
$(".leave-reply").on("click", function(e){ 
	//타겟의 부모 요소 찾기
	let target = e.target;		
	let targetParent = target.closest("div .sub-box");
	
	
	let realTarget = targetParent.querySelector(".reply-write-inner-space");
	if(realTarget.style.display == "none"){
		realTarget.style.display = "block";
	}else{
		realTarget.style.display = "none";
	}
	
	//realTarget.querySelector(".reply-write-textarea").focus(); 
});

$(".reply-submit-btn").on("click", function(){
	
	
});

/* 글쓰기 모달창 */
$("#write-modal-open").on("click", function(){
	
	
	
	let crewNum= '${myCrewInfo.crewNum}';
	$('.boardModalTitle').text("글쓰기");
	$("#update-board-submit-btn").css("display","none");
	$("#write-board-submit-btn").css("display","block");
	$('#writeBoardSubject').val("");
	$('#boardWriteDiv').html("");	
	
	if(crewNum.length <1){
		alert("SHIP에 가입하여야 글을 쓸수 있습니다."); 
		return false;
	}

	$("#update-board-submit-btn").css("display","none");
	$("#write-board-submit-btn").css("display","block");
	document.querySelector("#write-modal").style.display = "block";
	
});

$(".write-modal-close-i").on("click", function(){
	document.querySelector("#write-modal").style.display = "none";
});

/* 게시글 읽기 모달창 */

$(".read-modal-close-i").on("click", function(){
	document.querySelector("#read-modal").style.display = "none";
//	location.reload();
});
 
/* 게시글 수정 모달창 */

$(".close-update").on("click", function(){
	document.querySelector("#update-modal").style.display = "none";
//	location.reload();
});

</script>
<script src="/js/board-write.js"></script>


