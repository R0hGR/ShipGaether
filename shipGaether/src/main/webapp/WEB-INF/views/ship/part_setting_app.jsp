<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<div class="col-8">

	<!-- ship 관리 상단 메뉴탭 -->
	<div class="card border-0 rounded-0 mb-3 d-flex">
		<div class="row p-3 pb-1 d-flex justify-content-center align-items-between">
			<a href="/ship/${ship.shipNum}/setting/app" class="p-0 m-3 text-center" style="width: 17%; color: black; font-weight: 800; border-bottom: 2px solid #000;">가입신청서</a> <a href="/ship/${ship.shipNum}/setting/info" class="p-0 m-3 text-center" style="width: 17%; color: black; font-weight: 700;">정보수정</a> <a href="/ship/${ship.shipNum}/setting/photo" class="p-0 m-3 text-center" style="width: 17%; color: black; font-weight: 700;">대표사진</a> <a href="/ship/${ship.shipNum}/setting/remove" class="p-0 m-3 text-center" style="width: 17%; color: black; font-weight: 700;">삭제하기</a>
		</div>
	</div>


	<!-- 가입 신청서 리스트 시작 -->
	<div class="card border-0 rounded-0 mb-3 p-2">
		<div class="card-header border-0 bg-white p-0">
			<div class="row" style="float: none; margin: 0 auto;">

				<div class="col px-0 py-2 mb-3 border-bottom" style="flex-direction: column;">

					<div class="card-body p-3">
						<h5 class="fw-bold m-0 " style="float: left;">가입 신청서 내역</h5>
					</div>
				</div>

			</div>
		</div>
		<c:if test="${empty appsWithUsr}">
			<div class="d-flex justify-content-center align-items-center" style="height: 500px;">
				<p class="">가입 신청서 내역이 없습니다.</p>
			</div>

		</c:if>
		<c:forEach items="${appsWithUsr}" var="item">
			<div class="ship-application-box row p-3 ps-5 d-flex flex-row justify-content-between align-items-center border-bottom text-secondary" style="float: none; margin: 0 auto; width: 100%; color: #333;">
				<div class="row">
					<input class="col-1 p-0 ship-app-num" hidden="" value="${item.appNum}">
					<div class="col-11 p-0">
						<div class="row">
							<div class="col-sm-12">
								<input type="hidden" value="${item.usrNum}" class="ship-app-usr-num" />

								<div class="row">
									<span class="col-3">이름</span> <span class="col-9">${item.usrName}</span>
								</div>
								<div class="row">
									<span class="col-3">닉네임</span> <span class="col-9 ship-app-usr-nickname">${item.usrNickname}</span>
								</div>
								<div class="row">
									<span class="col-3">성별</span> <span class="col-9">${item.usrGender}</span>
								</div>
								<div class="row">
									<span class="col-3">질문 답변</span> <span class="col-9 mb-3">${item.appAnswer}</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="d-flex justify-content-end p-0">
					<button class="accept-crew-btn btn border rounded-0 btn-outline-white p-2 m-1" style="font-size: 13px; width: 80px;">수락</button>
					<button class="reject-crew-btn btn border rounded-0 btn-outline-white p-2 m-1" style="font-size: 13px; width: 80px;">거절</button>
				</div>

			</div>
		</c:forEach>

	</div>

	<!-- 가입 신청서 리스트 끝 -->
</div>

<script>

$(document).ready(function(){
	//신청서 거절 버튼 누를 때, 신청서 상태 변경 시작
	$(".reject-crew-btn").on("click", function(e){

 		let target = e.target;
		let targetParent = target.closest("div .ship-application-box");
		let t = targetParent.querySelector(".ship-app-num");
		let appNum = targetParent.querySelector(".ship-app-num").value;
		appNum = parseInt(appNum); 
	
		$.ajax({
			url: "/rest/app/rejection",
			type: "post",
			data: {appNum : appNum},
			success: function(result){
				alert(result)
				location.href="/ship/"+${shipNum}+"/setting/app";
			},
			error: function(error){
				alert(error)
				alert("fail")
			}
		}) 
	})
	//신청서 거절 버튼 누를 때, 신청서 상태 변경 끝

	
	//신청서 수락 버튼 누를 때, 크루로 수락 시작
	$(".accept-crew-btn").on("click",function(e){

		let target = e.target;
		let targetParent = target.closest("div .ship-application-box");
	
		let usrNum = targetParent.querySelector(".ship-app-usr-num").value;
		let usrNickname = targetParent.querySelector(".ship-app-usr-nickname").innerHTML;
		usrNum = parseInt(usrNum);
		
		let shipNum = ${ship.shipNum};
		
		console.log("usrNum: "+usrNum);
		console.log("usrNickname: "+usrNickname);
		console.log("shipNum: "+shipNum);

		jsObj = {
			usrNum : usrNum,
			crewNickname : usrNickname,
			shipNum : shipNum,

		}
		$.ajax({
			url: "/rest/app/acception",
			method: "post",
			contentType: 'application/json;',
			data: JSON.stringify(jsObj),
			success:function(data){
				alert(data);
				location.href="/ship/"+${shipNum}+"/setting/app";
			},
			error: function(error){
				alert(error + "에러");
			}
		}) 
		//신청서 수락 버튼 누를 때, 크루로 수락 끝
	});
	
});

</script>
