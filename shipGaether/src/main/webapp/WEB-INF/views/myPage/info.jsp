<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<!-- 아이콘 css(회원정보 아이콘) -->
<script src="https://kit.fontawesome.com/6478f529f2.js"
	crossorigin="anonymous"></script>
<style>
/* .reply-read-profile a {
    background-color: #B3B3B3;
    border: 1px solid rgba(0,0,0,.05);
    border-radius: 50%;
    text-decoration: none;
    width: 45px;
    height: 45px;
   cursor: pointer;
} */
</style>

<head>

<%@include file="../header.jsp"%>

</head>

<body style="background-color: #e9ecef">
	<div class="row h-100 px-5" style="padding-top: 72px;">

		<div class="col-2 mt-3"></div>
		<div class="col-8 mt-3">

			<div class="row">
				<div class="col-3 p-0">

					<!-- MypageSidebar -->
					<%@include file="myPageSidebar.jsp"%>

				</div>

				<!-- 내 정보 메인 시작  -->
				<main class="col-9 p-0" style="overflow: visible">
					<div class="col-10 p-3" style="background-color: white;">

						<!-- 내 정보 상단 문구 -->
						<div class="card-body p-4 pb-2 border-bottom"
							style="float: none; margin: 0 auto;">
							<h5 style="font-weight: 800;">내 정보</h5>
						</div>


						<div
							class="row p-3 pt-0 d-flex flex-row justify-content-between align-items-center text-secondary"
							style="float: none; margin: 0 auto; width: 100%; color: #333;">
							<div class="row-12">


								<!-- 1. 개인정보 -->
								<div class="row my-3 border-bottom">
									<div
										class="pb-3 pe-0 d-flex flex-row justify-content-between align-items-start">
										<span class="col-2 my-3 text-dark">개인정보</span>
										<div class="col-10 d-flex flex-column justify-content-between">
											<!-- 사진 -->
											<div
												class="userModifyDiv m-2 d-flex justify-content-center align-items-center">

												<a class="crew-info-img-box"
													onclick="$('#usr-setting-photo').click()"> <c:if
														test="${usrInfo.usrPhotoPath eq 'default'}">
														<img id="crewPhoto"
															class="img-fluid rounded-circle img-thumbnail my-4"
															src="/images/defaultPhoto.jpg"
															style="width: 150; height: 150; position:; opacity: 1"
															alt="..." />
														<i class="fas fa-camera fa-3x"></i>
													</c:if> <c:if test="${usrInfo.usrPhotoPath ne 'default'}">
														<img id="crewPhoto"
															class="img-fluid rounded-circle img-thumbnail my-4"
															src="/images/ship/usr/${usrInfo.usrNum}/${usrInfo.usrPhotoPath}"
															style="width: 150; height: 150; position:; opacity: 1"
															alt="..." />
														<i class="fas fa-camera fa-3x"></i>
													</c:if>
												</a> <input id="usr-setting-photo" type="file"
													accept="image/png, image/gif, image/jpeg"
													style="display: none;" onchange="checkUsrPhoto(this)" /> <input
													id="crewPhotoDumpName" type="hidden"> <input
													id="crewPhotoStatus" type="hidden">
												<script>
function checkUsrPhoto(inputElement) {
	let extensions = ["jpg","jpeg","png","gif","jfif","pjpeg","pjp"] // 허용할 확장자명들 (제약조건)
	let file = inputElement.files[0];
	let fileName = file.name; //	파일의 이름
	let slices = fileName.split(".");		
	let lastIndex = slices.length-1;	
	let usrExtension = slices[lastIndex];	// 유저의 파일  "." 으로 잘라서 마지막값
	let checkList = [];
	// 유저가 확장자를 대문자로 저장했을수도 있으니까 includes 말고 하나씩 비교 해야할듯
	for( extension of extensions ){
		if( usrExtension.toUpperCase() == extension.toUpperCase()){
			checkList.push("ok");
		}		
	}  
	
	if (checkList.length>0){
		$("#crewPhotoStatus").val("1");		
		let reader = new FileReader();		
		reader.readAsDataURL(file)
		reader.onload = function (e) {			
			$('#crewPhoto').attr('src', e.target.result); 
        }
	}else{
		alert(" # 사진파일만 가능합니다. 확장자명을 확인해주세요!");
		inputElement.value=""; // hidden되있는 사진 input 초기화
	}
	console.log("usr-setting-photo");
	console.log();
	insertUsrPhoto();
	$.ajax({
		url:"/rest/updateUsrPhotoPath",
		type:"post",
		data:{usrNum:"${usrInfo.usrNum}",usrPhotoPath:$("#crewPhotoDumpName").val()},
		async:false,
		success:function(data){		
		},	
	});
}


function insertUsrPhoto(){
	var inputElement = $("#usr-setting-photo")[0];
	var photoFile = inputElement.files[0];
	var photoFileName = photoFile.name; //	파일의 이름
	
	console.log(photoFile);
	let form = new FormData();		
	form.append( photoFile.name, photoFile );
	
	let usrNum = $("#myUsrNum").val();
	console.log(form);
	$.ajax({
		url:"/rest/getUsrPhotoInfo/"+usrNum, 
		type:"post" ,
		processData : false,
		contentType : false,
		async: false,
		data : form,
		dataType : "json",
		success: function(data){
			console.log("checkPhoto 갔다옴");
			console.log(data);
			
			var comeBackPhotoFile = {
					name : data.ofnames[0],
					dumpName : data.savefnames[0],
					fsize : data.fsizes[0]
			};
			console.log(comeBackPhotoFile);
			$("#crewPhotoDumpName").val(comeBackPhotoFile.dumpName);	
		}
	});
	
}
</script>
											</div>

											<!-- 이름 -->
											<div
												class="userModifyDiv m-2 d-flex justify-content-between align-items-center">
												<span class="col-2 p-0 ms-2">이름</span> <input id="myName"
													class="originData col-6 p-0" value="${ usrInfo.usrName }"
													readonly="readonly" />

												<button onclick="updateMyName(this)"
													class="ms-2 col-3 btn border rounded-0 btn-outline-white p-2 m-1"
													style="font-size: 13px; width: 80px;">수정하기</button>
											</div>

											<!-- 닉네임 -->
											<div
												class="userModifyDiv m-2 d-flex justify-content-between align-items-center">
												<span class="col-2 p-0 ms-2">닉네임</span> <input
													id="myNickname" class="originData col-6 p-0"
													value="${ usrInfo.usrNickname }" readonly="readonly" />

												<button onclick="updateMyNickname(this)"
													class="ms-2 col-3 btn border rounded-0 btn-outline-white p-2 m-1"
													style="font-size: 13px; width: 80px;">수정하기</button>
											</div>

											<!-- 생년월일 -->
											<div
												class="m-2 d-flex justify-content-between align-items-center">
												<span class="col-2 ms-2 p-0">생년월일</span>
												<div class="col-6 p-0 beforeUsrBirth"
													style="display: block;">
													<input class="col-6 p-0" value="${ usrInfo.usrBirth }"
														readonly="readonly" />
												</div>
												<div class="col-6 p-0 afterUsrBirth" style="display: none;">
													<div class="login-birth-div justify-content-around">
														<input id="myYear" class="col-sm-5" size="20" type="text"
															placeholder="년(4자) " maxlength="4" onblur=""> <select
															id="myMonth" class="col-sm-3" name="usrMonth" onchange="">
															<option value="00">월</option>
															<option value="01">1월</option>
															<option value="02">2월</option>
															<option value="03">3월</option>
															<option value="04">4월</option>
															<option value="05">5월</option>
															<option value="06">6월</option>
															<option value="07">7월</option>
															<option value="08">8월</option>
															<option value="09">9월</option>
															<option value="10">10월</option>
															<option value="11">11월</option>
															<option value="12">12월</option>
														</select> <input id="myDay" class="col-sm-3 m-0" type="text"
															placeholder="일" maxlength="4" onblur="">
													</div>
												</div>
												<button
													class="ms-2 col-3 btn border rounded-0 btn-outline-white p-2 m-1"
													style="font-size: 13px; width: 80px;"
													onclick="updateUsrBirth()">수정하기</button>
											</div>

											<!-- 성별 -->
											<div
												class="m-2 d-flex justify-content-between align-items-center">
												<span class="col-2 p-0 ms-2">성별</span>
												<div class="col-6 p-0 beforeUsrGender">
													<input class="col-6 p-0" value="${ usrInfo.usrGender }"
														readonly="readonly" />
												</div>
												<div class="col-6 p-0 afterUsrGender" style="display: none;">
													<select id="myUsrGender" class="login-input text-end"
														onchange="">
														<option value="0">성별</option>
														<option value="female">여자</option>
														<option value="male">남자</option>
													</select>
												</div>

												<button
													class="ms-2 col-3 btn border rounded-0 btn-outline-white p-2 m-1"
													style="font-size: 13px; width: 80px;"
													onclick="updateUsrGender()">수정하기</button>
											</div>
										</div>
									</div>
								</div>
								<script>
									function updateUsrGender() {
										let beforeUsrGenderDiv = $(".beforeUsrGender")[0];
										let afterUsrGenderDiv = $(".afterUsrGender")[0];
										if (afterUsrGenderDiv.style.display == "block") {
											let usrNum = $("#myUsrNum").val();
											let usrGender = $("#myUsrGender")
													.val();
											if (usrGender == 0) {
												alert("성별을 선택해주세요!")
											} else {
												$
														.ajax({
															url : "/rest/updateMyUsrGender",
															type : "post",
															data : {
																usrNum : usrNum,
																usrGender : usrGender
															},
															success : function(
																	data) {
																alert("성별이 변경되었습니다.")
																location
																		.reload();
															},

														});
											}
										}
										beforeUsrGenderDiv.style.display = "none";
										afterUsrGenderDiv.style.display = "block";

									}

									function updateUsrBirth() {
										let beforeUsrBirthDiv = $(".beforeUsrBirth")[0];
										let afterUsrBirthDiv = $(".afterUsrBirth")[0];

										console.log(beforeUsrBirthDiv)
										console.log(afterUsrBirthDiv)
										if (afterUsrBirthDiv.style.display == "block") {

											let usrNum = $("#myUsrNum").val();
											let year = $("#myYear").val();
											let month = $("#myMonth").val();
											let day = $("#myDay").val();
											let usrBirth = year + "-" + month
													+ "-" + day;

											$.ajax({
												url : "/rest/updateMyUsrBirth",
												type : "post",
												data : {
													usrNum : usrNum,
													usrBirth : usrBirth
												},
												success : function(data) {
													alert("생년월일이 변경되었습니다.")
													location.reload();
												},

											});

										}
										beforeUsrBirthDiv.style.display = "none";
										afterUsrBirthDiv.style.display = "block";

									}
								</script>

								<!-- 2.로그인 계정 -->
								<div class="row my-3 border-bottom">

									<div
										class="pb-3 pe-0 d-flex flex-row justify-content-between align-items-start">
										<span class="col-2 my-3 text-dark">로그인 계정</span>

										<div class="col-10 d-flex flex-column justify-content-between">
											<!-- 이메일 -->
											<div
												class="userModifyDiv m-2 d-flex justify-content-between align-items-between align-items-center">
												<span class="col-2 ms-2">이메일</span> <input id="myEmail"
													value="${ usrInfo.usrEmail }" readonly="readonly"
													class="originData col-6" type="text" />
												<button onclick="updateMyEmail(this)"
													class="ms-2 col-3 btn border rounded-0 btn-outline-white p-2 m-1"
													style="font-size: 13px; width: 80px;">수정하기</button>
											</div>
											<!-- 휴대폰 번호 -->
											<div
												class="userModifyDiv m-2 d-flex justify-content-between align-items-between align-items-center">
												<span class="col-2 ms-2" style="word-break: keep-all;">휴대폰
													번호</span> <input id="myPhone" value="${ usrInfo.usrPhone }"
													readonly="readonly" class="originData col-6" type="text" />
												<button onclick="updateMyPhone(this)"
													class="col-3 btn border rounded-0 btn-outline-white p-2 m-1"
													style="font-size: 13px; width: 80px;">수정하기</button>
											</div>
											<!-- 현재 비밀번호 -->
											<div
												class="m-2 d-flex justify-content-between align-items-between align-items-center">
												<span class="col-2 ms-2" style="word-break: keep-all;">현재
													비밀번호</span> <input id="curPwd" class="col-6 fs-8" type="password" />
												<button onclick="checkCurPwd()"
													class="ms-2 col-3 btn border rounded-0 btn-outline-white p-2 m-1"
													style="font-size: 13px; width: 80px;">확인</button>
											</div>

											<input id="myPwd" type="hidden" value="${ usrInfo.usrPwd }">

											<!-- 비밀번호 -->
											<div
												class="m-2 d-flex justify-content-between align-items-between align-items-center">
												<span class="col-2 ms-2">새 비밀번호</span> <input id="nextPwd1"
													class="col-6 fs-8" type="password" />
												<div class="ms-2 col-3 p-2 m-1" style="width: 80px;"></div>
											</div>
											<!-- 비밀번호 확인-->
											<div
												class="m-2 d-flex justify-content-between align-items-between align-items-center">
												<span class="col-2 ms-2" style="word-break: keep-all;">비밀번호
													확인</span> <input id="nextPwd2" class="col-6" type="password" />
												<button onclick="updateMyPwd()"
													class="ms-2 col-3 btn border rounded-0 btn-outline-white p-2 m-1"
													style="font-size: 13px; width: 80px;">수정하기</button>
											</div>
										</div>
									</div>
								</div>


								<!-- 3.관심 지역 -->
								<div class="row my-3 border-bottom">

									<div
										class="pe-0 d-flex flex-row justify-content-between align-items-start">
										<span class="col-2 my-3 text-dark">관심 지역</span>
										<div
											class="col-10 my-3 d-flex justify-content-between align-items-center">

											<!-- 시/도 -->
											<div class="col-3 p-0">
												<select class="login-input text-end" id="signUsrCity1"
													name="cityNum" onchange="getTowns(this)">
													<option value="0">시/도</option>
													<c:forEach var="item" items="${ cities }">
														<option value="${ item.cityNum }">${ item.cityName }</option>
													</c:forEach>
												</select>
											</div>

											<!-- 군/구 -->
											<div class="col-3 p-0">
												<select class="login-input" id="signUsrTown1" name="usrTown"
													onchange="getDongs(this)">
													<option value="0">상관없음</option>
												</select>
											</div>

											<!-- 동 -->
											<div class="col-3 p-0">
												<select class="login-input" id="signUsrDong1" name="usrDong">
													<option value="0">읍/면/동</option>
												</select>
											</div>
											<button onclick="updateMyCity()"
												class="ms-2 col-3 btn border rounded-0 btn-outline-white p-2 m-1"
												style="font-size: 13px; width: 80px;">수정하기</button>
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

	<input id="myUsrNum" value="${ usrInfo.usrNum }" type="hidden">


	<script>
		var pwdStatus = false;

		function checkCurPwd() {
			let myPwd = $("#myPwd").val()
			let curPwd = $("#curPwd").val()
			if (curPwd.length < 1) {
				alert("현재 비밀번호를 입력해주세요");
				$("#curPwd").focus();
			} else {

				if (myPwd == curPwd) {
					alert("비밀번호가 확인되었습니다.")
					pwdStatus = true;
					$("#nextPwd1").focus();
				} else {
					alert("현재 비밀번호가 다르게 입력되었습니다.")
					$("#curPwd").focus();
				}
			}
		}

		function updateMyPwd() {
			let nextPwd1 = $("#nextPwd1").val();
			let nextPwd2 = $("#nextPwd2").val();

			if (pwdStatus == false) {
				alert("비밀번호확인을 먼저 진행해주세요!")
				$("#curPwd").focus();
				return;
			}

			if (nextPwd1.length < 1) {
				alert("변경할 비밀번호를 입력해주세요");
				$("#nextPwd1").focus();
			} else if (nextPwd2.length < 1) {
				alert("변경할 비밀번호를 입력해주세요");
				$("#nextPwd2").focus();
			} else {
				if (nextPwd1 == nextPwd2) {

					let usrNum = $("#myUsrNum").val();

					$.ajax({
						url : "/rest/updateMyUsrPwd",
						type : "post",
						data : {
							usrNum : usrNum,
							usrPwd : nextPwd2
						},
						success : function(data) {
							alert("비밀번호가 변경되었습니다");
							location.reload();

						},
					});

				} else {
					alert("변경할 비밀번호를 확인해주세요");
					$("#nextPwd2").focus();
				}

			}
		}
		
		function updateMyCity() {
			let usrNum = $("#myUsrNum").val();
			let usrCity = $("#signUsrCity1").val();
			let usrTown = $("#signUsrTown1").val();

					$.ajax({
						url : "/rest/updateMyCity",
						type : "post",
						data : {
							usrNum : usrNum,
							usrCity : usrCity,
							usrTown : usrTown
						},
						success : function(data) {
							alert("관심지역이 변경되었습니다");
							location.reload();

						},
					});
				}

		function updateMyPhone(el) {

			//이름, 이메일, 휴대폰 번호의 수정하기 버튼을 누르면 readOnly 해제로 수정 가능 (일단 input만)
			let closestParenet = el.closest("div .userModifyDiv");
			let originData = closestParenet.querySelector(".originData");

			if (originData.readOnly == false) {

				let usrPhone = $("#myPhone").val();

				$.ajax({
					url : "/rest/updateMyUsrPhone",
					type : "post",
					data : {
						usrNum : usrNum,
						usrPhone : usrPhone
					},
					success : function(data) {
						alert("휴대폰번호가 변경되었습니다.")
						location.reload();
					},
				});
			} else {
				originData.readOnly = false;
			}
		}

		function updateMyEmail(el) {

			//이름, 이메일, 휴대폰 번호의 수정하기 버튼을 누르면 readOnly 해제로 수정 가능 (일단 input만)
			let closestParenet = el.closest("div .userModifyDiv");
			let originData = closestParenet.querySelector(".originData");

			if (originData.readOnly == false) {

				let usrNum = $("#myUsrNum").val();
				let usrEmail = $("#myEmail").val();

				$.ajax({
					url : "/rest/updateMyUsrEmail",
					type : "post",
					data : {
						usrNum : usrNum,
						usrEmail : usrEmail
					},
					success : function(data) {
						alert("이메일이 변경되었습니다.")
						location.reload();
					},
				});
			} else {
				originData.readOnly = false;
			}
		}

		function updateMyName(el) {

			//이름, 이메일, 휴대폰 번호의 수정하기 버튼을 누르면 readOnly 해제로 수정 가능 (일단 input만)
			let closestParenet = el.closest("div .userModifyDiv");
			let originData = closestParenet.querySelector(".originData");

			if (originData.readOnly == false) {

				let usrNum = $("#myUsrNum").val();
				let usrName = $("#myName").val();

				$.ajax({
					url : "/rest/updateMyUsrName",
					type : "post",
					data : {
						usrNum : usrNum,
						usrName : usrName
					},
					success : function(data) {
						alert("이름이 변경되었습니다.")
						location.reload();
					},
				});
			} else {
				originData.readOnly = false;
			}
		}

		function updateMyNickname(el) {

			//이름, 이메일, 휴대폰 번호의 수정하기 버튼을 누르면 readOnly 해제로 수정 가능 (일단 input만)
			let closestParenet = el.closest("div .userModifyDiv");
			let originData = closestParenet.querySelector(".originData");

			if (originData.readOnly == false) {

				let usrNum = $("#myUsrNum").val();
				let usrNickname = $("#myNickname").val();

				$.ajax({
					url : "/rest/updateMyUsrNickname",
					type : "post",
					data : {
						usrNum : usrNum,
						usrNickname : usrNickname
					},
					success : function(data) {
						alert("닉네임이 변경되었습니다.")
						location.reload();
					},
				});

			} else {
				originData.readOnly = false;
			}
		}
		
		function getTowns(el) {
			var cityNum = el.value;
			if(cityNum=="0"){
				var html="";
				html += "<option value="+"0"+">상관없음</option>";
				$("#signUsrTown1").html(html);		
			}else{
				$.ajax({
					url: "/rest/town.json",
					type:"get",
					data:{cityNum:cityNum},
					success : function(data){				
						var html="";
						html += "<option value="+"0"+">상관없음</option>";					
						for(let townList of data) {
//							alert("# townList "+townList); 
							html += "<option value="+townList.townNum+">"+townList.townName+"</option>"
						}
						$("#signUsrTown1").html(html);
					},
				});
			}
		}

		function getDongs(el) {
			var townNum = el.value;
			if(townNum=="0"){
				var html="";
				html += "<option value="+"0"+">상관없음</option>";
				$("#signUsrDong1").html(html);		
			}else{
				$.ajax({
					url: "/rest/dong.json",
					type:"get",
					data:{townNum:townNum},
					success : function(data){				
						var html="";
						html += "<option value="+"0"+">상관없음</option>";					
						for(let dongList of data) {
//							alert("# townList "+townList); 
							html += "<option value="+dongList.dongNum+">"+dongList.dongName+"</option>"
						}
						$("#signUsrDong1").html(html);
					},
				});
			}
		}
	</script>

</body>

</html>