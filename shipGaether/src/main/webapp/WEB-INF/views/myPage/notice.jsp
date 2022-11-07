<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<html>

<head>
<%@include file="../header.jsp"%>
<style>
.btn-reply-more {
	right: -5;
	top: 10px;
	width: 20px;
	border-style: none;
	cursor: pointer;
}

.reply-menu-box {
	z-index: 5;
	position: absolute;
	right: -150px;
	top: 20px;
	height: auto;
	width: 153px;
	border: 1px solid #333;
	padding: 7px;
	background-color: white;
}
</style>


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


						<div class="card-body p-4 pb-2 border-bottom"
							style="float: none; margin: 0 auto;">
							<h5 style="font-weight: 800;">공지사항</h5>
						</div>
   
						<div class="mx-2 my-3">
						
							<!-- 관리자일 경우 -->
							<c:if test="${ sessionId == 0 }">	
							<div class="my-2 d-flex justify-content-end">
								<button type="button" onclick="noticeWriteBtn"
									class="mx-2 btn btn-light">
									<a href="/noticeWrite">글쓰기</a>
								</button>
							</div>
							</c:if>

							<div class="row p-2 border border-black"
								style="float: none; margin: 0 auto;">

								<div
									class="col-2 p-0 border border-black d-flex justify-content-center align-items-center"
									style="background-color: black; color: white">번 호</div>
								<div class="col-8 p-1 border border-black"
									style="background-color: black; color: white">제 목</div>
								<div
									class="col-2 p-1 border border-black d-flex justify-content-center align-items-center"
									style="background-color: black; color: white">날 짜</div>



								<c:forEach var="item" items="${ notice }">
									<div class="row py-2 px-0 border border-black notice-big-box"
										style="float: none; margin: 0 auto;">
										<div
											class="noticeNum col-2 p-0 d-flex justify-content-center align-items-center">${item.noticeNum}</div>
										<div
											class="noticeTitle col-8 p-1 d-flex justify-content-start align-items-center"
											onclick="noticeTitle(this)">${item.noticeTitle}</div>
										<div
											class="noticenum col-2 p-0 d-flex justify-content-center align-items-center"
											style="font-size: 14px; position: relative;">${item.noticeDate}
											&nbsp;&nbsp;&nbsp;
											
										<!-- 관리자일 경우 -->
											<c:if test="${ sessionId == 0 }">	
										<!-- ''' 버튼--> 
											<div class="btn-reply-more" onclick="showNoticeMore(this)"
												type="button">
												<i class="fas fa-ellipsis-v reply-more"></i>
											</div>
											</c:if>
											<!-- ''' 표시 누를때 나오는 창 -->
											<div class="reply-menu-box px-0 notice-menu-box"
												style="display: none;">
												<ul class="m-0 p-0">

													<li class="border-line-bottom"><a
														onclick="showUpdateReply(${item.noticeNum})"
														style="cursor: pointer">수정</a></li>

													<li><a onclick="showDeleteReply(${item.noticeNum})"
														style="cursor: pointer">삭제</a></li>
												</ul>

											</div>
										</div>

										<div class="col-2 p-0"></div>
										<div class="noticeContent col-8 p-1 mt-1"
											style="white-space: pre-wrap; font-size: 13px; display: none;">${item.noticeContent}</div>
										<div class="col-2 p-0"></div>
									</div>
								</c:forEach>
							</div>
						</div>

					</div>
				</main>
			</div>
		</div>
	</div>




</body>

<script>

var body = document.querySelector("body");
body.addEventListener('click', clickBodyEvent);
function clickBodyEvent(event) {
    let target = event.target;
    console.log("------------------------------------------- ");
    console.log(" 내가 찾은거 : "+target.className);
    console.log(" 내가 찾을거 : fas fa-ellipsis-v reply-more")
    console.log("------------------------------------------- ");
    let noticeMenuBox = document.querySelectorAll(".notice-menu-box");  
    
    if(target.className != "fas fa-ellipsis-v reply-more"){
    	for( MenuBox of noticeMenuBox){
    		MenuBox.style.display = "none";
    	}
    }
}

function showNoticeMore(el){
	let elGrandParent = el.closest("div .notice-big-box");
	let noticeMenuBox = elGrandParent.querySelector(".notice-menu-box");
	let boxes = document.querySelectorAll(".notice-menu-box");
	
	
	for( box of boxes ){
		if(noticeMenuBox == box)continue;
		box.style.display ="none";
	}
	
	if(noticeMenuBox.style.display == "none")noticeMenuBox.style.display = "block";											
	else noticeMenuBox.style.display = "none";
}

function showUpdateReply(num){
	console.log("num");
	alert(num);   
	location.href="/noticeUpdate?noticeNum="+num;  // "?" noticeNum  	
}

function showDeleteReply(noticeNum){
	console.log("noticeNum");
	console.log(noticeNum);  //ajax로 보내는데 de이 필요한지
	
	$.ajax({
		url : "/rest/deleteNotice",
		type :'post',
		data :{noticeNum:noticeNum}, 
		success : function(data){
			if(data!=null){
				alert("공지사항이 삭제되었습니다.");
				location.href="/notice";	
					}
				}
			});
	
} 

										

function noticeTitle(el){
		console.log(el);
		let closestParenet = el.closest("div .row");
		console.log(closestParenet);
		
	let originData = closestParenet.querySelector(".noticeContent");
	console.log(originData);
	
	if(originData.style.display != "block"){
 		originData.style.display = "block";
 	}else{
 		originData.style.display = "none";
	}
}

function noticeWriteBtn(){
	location.href="/noticeWrite";	
}

</script>
<!--아이콘 추가 -->
<script src="https://kit.fontawesome.com/6478f529f2.js"
	crossorigin="anonymous"></script>
</html>