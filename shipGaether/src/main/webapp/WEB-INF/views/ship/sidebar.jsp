<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="d-flex flex-column flex-shrink-0 p-1 bg-white" style="overflow: visible; position: fixed; width: 14%">
	<div class="d-flex align-items-center justify-content-center link-dark text-decoration-none" style="flex-direction: column;">
	
	

						

						
						
						
						
						
						<fmt:parseDate value="${ ship.limitStart }" var="limitStartDate" pattern="yyyy-MM-dd"/>
						<fmt:parseNumber value="${limitStartDate.time / (1000*60*60*24)}" integerOnly="true" var="startDate"></fmt:parseNumber>
						<fmt:parseDate value="${ ship.limitEnd }" var="limitEndDate" pattern="yyyy-MM-dd"/>
						<fmt:parseNumber value="${limitEndDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>						
						<fmt:parseDate value="${ sessionBirth }" var="limitusrBrith" pattern="yyyy-MM-dd"/>
						<fmt:parseNumber value="${limitusrBrith.time / (1000*60*60*24)}" integerOnly="true" var="usrBrith"></fmt:parseNumber>
						

						
						<input id="joinLimitGender" type="hidden" value="${ ship.limitGender }">
			
						
						
						<c:if test="${ ship.limitStatus == 1 and limitStart > usrBirth and limitEnd < usrBirth }">
							<input id="limitStatus" type="hidden" value="1">
							<input id="limitEnd" type="hidden" value="${ endDate }">
							<input id="limitStart" type="hidden" value="${ startDate }">
							<input id="limitUsrBirth" type="hidden" value="${ usrBrith }">
						</c:if>
						
						<c:if test="${ ship.limitStatus == 0 }">
							<input id="noLimitStatus" type="hidden" value="0">
						</c:if>

		<c:choose>
			<c:when test="${ship.shipSample==1}">
				<img class="img-fluid rounded-circle img-thumbnail my-3" style="width: 170; height: 170; position:;" src="/images/ship/${ ship.shipNum }/${ship.shipPhotoName}" alt="..." />
			</c:when>
			<c:otherwise>
				<img class="img-fluid rounded-circle img-thumbnail my-3" style="width: 170; height: 170; position:;" src="/images/ship/sample/${ ship.shipSampleName }" alt="..." />
			</c:otherwise>
		</c:choose>



		<h4 class="fw-bold mb-2 text-center" style="cursor: pointer;" onclick="location.href='/ship/${ ship.shipNum }';">${ship.shipName}</h4>
		
<!-- 				????????? ?????? -->
<!-- 		<div class=""> -->
		
<!-- 			?????? ??? ??? -->
<!-- 			<div class="py-1 mx-3" -->
<!-- 				style="max-width: 104px; overflow: hidden; white-space: nowrap; cursor: pointer;"> -->
<!-- 				<i class="bi-star" style="font-size: 30px; opacity: .4;"></i> -->
<!-- 			</div>  -->
			
			
<!-- 			???????????? ????????? ???????????? ??? -->
<!-- 			<div class="py-1 mx-3" -->
<!-- 				style="max-width: 104px; overflow: hidden; white-space: nowrap; cursor: pointer;"> -->
<!-- 				<i class="bi-star-fill" style="font-size: 30px; color: #F7DE00;"></i> -->
<!-- 			</div> -->

<!-- 		</div> -->
<!-- 		????????? ??? -->
		
		
		<p class="fw-bold mb-2" style="color: #0000008c">${ship.shipCaptain}</p>


<%-- 		<c:choose> --%>
<%-- 			<c:when test="${ship.usrNum == sessionId}"> --%>
<%-- 				<p class="fw-bold mb-2" style="color: #0000008c">${ship.shipTitle}???????????????</p> --%>
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
				<p class="fw-bold mb-2 text-center" style="color: #0000008c; word-break: keep-all;">${ship.shipTitle}</p>
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
		
		<div class="d-flex">
		<c:if test="${ myCrewInfo ne null }">
		
			<button class="btn btn-sm btn-outline-secondary border-secondary border-2 crew-info" type="button">
				<i class="bi bi-gear-fill me-3" style="word-break: keep-all;"></i>??? ?????? ??????
		</button>
			&nbsp;&nbsp;
			
			
		
		</c:if>


			<c:choose>
				<%-- ship ????????? ?????? --%>
				<c:when test="${ship.usrNum == sessionId }">	

				</c:when>

				<%-- 1.ship ????????? ?????? --%>
				<c:when test="${myCrewInfo.usrNum == sessionId}">
					<button class="btn btn-sm btn-outline-secondary border-secondary border-2" type="button" onclick="leaveShip()">
						<span >????????????</span>
					</button>
				</c:when>
				<%-- ship ?????? ?????? ????????? ??? ?????? --%>
				<c:when test="${not empty myAppOfShip}">
					<button class="btn btn-sm btn-outline-secondary border-secondary border-2" type="button" disabled="disabled">
						<span style="word-break: keep-all;">???????????? ??????</span>
					</button>
				</c:when>
				<%-- ship ????????? ?????? ?????? --%>
				<c:otherwise>
					<button class="btn btn-sm btn-outline-secondary border-secondary border-2" type="button" id="join-answer-modal-open-btn">
						<i class="bi bi-plus" style="font-size: 1.3em"></i>Join
					</button>
				</c:otherwise>
			</c:choose>
		</div>



	</div>
	<hr>

	<!-- ?????? ?????? -->
	<ul class="nav nav-pills flex-column mb-auto">

		<%-- href="/ship/${item.shipNum}" ?????? --%>
		<li><a id="side-board" href="/ship/${ ship.shipNum }" class="btn-outline-secondary nav-link link-dark"><i class="bi bi-house-door me-3"></i>??? </a></li>
		<li><a id="side-album" href="/ship/${ship.shipNum}/album" class="btn-outline-secondary nav-link link-dark"><i class="bi bi-camera me-3"></i>????????? </a></li>
		<li><a id="side-calendar" href="/ship/${ship.shipNum}/calendar" class="btn-outline-secondary nav-link link-dark"><i class="bi bi-calendar2-day me-3"></i>?????? </a></li>
		<li><a id="side-attachmentList" href="/ship/${ship.shipNum}/attachmentList" class="btn-outline-secondary nav-link link-dark"><i class="bi bi-folder2-open me-3"></i>?????? </a></li>
		<li><a id="side-crewList" href="/ship/${ship.shipNum}/crewList" class="btn-outline-secondary nav-link link-dark"><i class="bi bi-people-fill me-3"></i>????????? </a></li>

		<!-- ????????? ?????? -->
		<c:if test="${ship.usrNum == sessionId }">
			<li><a id="side-setting" href="/ship/${ship.shipNum}/setting/app" class="nav-link link-dark"> <i class="bi bi-gear me-3"></i>SHIP ??????
			</a></li>
		</c:if>
	</ul>
</div>

<!-- ship ?????????????????? ??????-->

<div id="join-answer-modal" style="display: none;">
	<div class="join-answer-modal-content">
		<form method="post" action="/ship/${ship.shipNum}/join" class="join-form join-answer-modal-box d-flex-column justify-content-center align-items-between p-3 py-5">


			<input type="hidden" name="usrNum" value="${sessionId}"> <input type="hidden" name="shipNum" value="${ship.shipNum}">

			<div class="row-1 border-line-bottom">
				<h5 class="text-center">${ship.shipName}</h5>
				<p class="text-center">?????? ????????? ???????????????.</p>
			</div>
			<div class="row-8 d-flex-column justify-content-center align-items-center">
				<div class="text-center my-3">${ship.shipSurvey}</div>
				<textarea class="d-flex justify-content-center align-items-center my-3 p-3 join-textarea" placeholder="????????? ??????????????????." name="appAnswer"></textarea>
			</div>
			<div class="row-2 d-flex justify-content-center align-items-center">
				<input type="button" value="????????????" class="join-btn m-1" disabled="disabled" onclick="submitShipApplication('${ship.shipName}')"> <input type="button" class="join-cencel-btn m-1" value="??????"> 
			</div>

		</form>
	</div>
	<div class="write-modal-layer"></div>
</div>
<!-- ship ?????????????????? ???-->

<!-- ??? ?????? ?????? - ?????? ?????? ?????? ????????? ?????? -->
<div class="crew-info-modal" style="display: none;">
	<div class="crew-info-content p-4">

		<div class="d-flex flex-column justify-content-center" style="color: #0000008c; height: 100%;">
			<div class="row-1 p-4 pb-2 border-bottom">
				<h5 class="d-flex justify-content-center">CREW ??????</h5>
				<i class="fas fa-times fa-2x crew-info-modal-close-i"></i>
			</div>
			<div class="col d-flex flex-column justify-content-between align-items-center p-3" style="color: #0000008c; height: 100%;">
				<c:choose>
					<c:when test="${ myCrewInfo.crewPhoto eq 'default' }">
						<a class="crew-info-img-box" onclick="$('#crew-setting-photo').click()"> 
						<img id="crewPhoto" class="img-fluid rounded-circle img-thumbnail my-4" src="/images/defaultPhoto.jpg" style="width: 200; height: 200; position:;" alt="..." /> 
						<i class="fas fa-camera fa-3x"></i>
						</a>
					</c:when>
					<c:when test="${ myCrewInfo.crewPhoto ne 'default' }">
						<a class="crew-info-img-box" onclick="$('#crew-setting-photo').click()"> <img id="crewPhoto" class="img-fluid rounded-circle img-thumbnail my-4" src="/images/ship/${ shipNum }/${ myCrewInfo.crewPhoto }" style="opacity: 1; width: 200; height: 200; position:;" alt="..." /> <i class="fas fa-camera fa-3x"> </i>
						</a>
					</c:when> 
				</c:choose>
				
				<input id="crew-setting-photo" type="file" accept="image/png, image/gif, image/jpeg" style="display: none;" onchange="checkCrewPhoto(this)"/>
				<input id="crewPhotoDumpName" type="hidden"> 
				<input id="crewPhotoStatus" type="hidden">  



				<div class="d-flex justify-content-center">
					<span class="col-3 mx-1">?????????</span> <input id="crew-info-crewNickname" class="col-6" type="text" value="${ myCrewInfo.crewNickname }">
				</div>

				<div class="d-flex justify-content-center">
					<button class="btn border btn-outline-dark border-dark rounded-0 p-2 m-3 btn-modify-crew-info" style="font-size: 13px; width: 90px;">??????</button>
					<button class="btn border btn-outline-dark border-dark rounded-0 p-2 m-3 btn-cancel-crew-info" style="font-size: 13px; width: 90px;">??????</button>
				</div>
			</div>
		</div>
	</div>
	<div class="write-modal-layer"></div>
</div>
<!-- ??? ?????? ?????? - ?????? ?????? ?????? ?????????  ??? -->




<script>

function checkCrewPhoto(inputElement) {
	let extensions = ["jpg","jpeg","png","gif","jfif","pjpeg","pjp"] // ????????? ??????????????? (????????????)
	let file = inputElement.files[0];
	let fileName = file.name; //	????????? ??????
	let slices = fileName.split(".");		
	let lastIndex = slices.length-1;	
	let usrExtension = slices[lastIndex];	// ????????? ??????  "." ?????? ????????? ????????????
	
	
	
	let checkList = [];
	// ????????? ???????????? ???????????? ?????????????????? ???????????? includes ?????? ????????? ?????? ????????????
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
		alert(" # ??????????????? ???????????????. ??????????????? ??????????????????!");
		inputElement.value=""; // hidden????????? ?????? input ?????????
	}
	console.log("ship-setting-photo");
	console.log();
}


function insertCrewPhoto(){
	var inputElement = $("#crew-setting-photo")[0];
	var photoFile = inputElement.files[0];
	var photoFileName = photoFile.name; //	????????? ??????
	
	console.log(photoFile);
	let form = new FormData();		
	form.append( photoFile.name, photoFile );
	
	$.ajax({
		url:"/rest/getShipPhotoInfo/${shipNum}", 
		type:"post" ,
		processData : false,
		contentType : false,
		async: false,
		data : form,
		dataType : "json",
		success: function(data){
			console.log("checkPhoto ?????????");
			console.log(data);
			
			var comeBackPhotoFile = {
					name : data.ofnames[0],
					dumpName : data.savefnames[0],
					fsize : data.fsizes[0]
			};
			
			$("#crewPhotoDumpName").val(comeBackPhotoFile.dumpName);
			
			
			
		},
	});
	
}

let sideBoard = document.querySelector('#side-board');
sideBoard.addEventListener('click', ()=> { 
	sessionStorage.setItem("lastPage","board"); 
});

/* ship ????????????(????????????) ?????? */
function leaveShip(){

	var isBoolean = "${ ship.usrNum == sessionId }";

	/* 1. ???????????? ??????, ship??? ?????? ?????? */
	if(isBoolean === 'true'){
		alert("?????????(??????)??? ??????");
		var con = confirm("????????? ?????????????????????????\nSHIP??? ????????? ?????? ????????? ?????????, ????????? ????????? ??? ????????????.");		
		if (con) {
		    
		    $.ajax({
				url: "/rest/ship/delete",
				type: "post",  
				data: {
					shipNum: "${ship.shipNum}", 
					usrNum:"${ship.usrNum}" 
					},		
				success: function(result){
					alert(result);
					location.href = '/';
				},
				error: function(error){
					alert(error);
				}
		    });
		}
		else {
		    alert('????????? ?????????????????????.');
		    return false;
		}
	
	}else{ 
		/* 2. ??????????????? ??????, ship?????? ????????? ?????? */
		
		alert("?????? ??????(crew)??? ??????");
		var con = confirm("????????? ?????????????????????????");
		
		if (con) {
			$.ajax({
				url: "/rest/ship/leave",
				type: "post",  
				data: {
					crewNum:"${myCrewInfo.crewNum}",		
				},		
				success: function(result){
					alert(result);	
					location.href = '/ship/'+${ship.shipNum};
				},
				error: function(error){
					alert(error);	
				}
		    });		
		 }
		else {
			alert('????????? ?????????????????????.');
			return false;
		}	   
	} 	
}
/* ship ????????????(????????????) ??? */


/* ship ???????????? ?????? ?????? ???  */
function submitShipApplication(shipName){
	$(".join-form").submit();
	alert(shipName+'??? ?????? ????????? ?????????????????????!');
	document.querySelector("#join-answer-modal").style.display = "none";
	
}

$(document).ready(function(){
   /* ship ???????????? ????????? */
   $("#join-answer-modal-open-btn").on("click", function(){
	   if($("#limitStatus").val() == 1 ){
		   document.querySelector("#join-answer-modal").style.display = "block";
	   }else if($("#noLimitStatus").val() == 0 ){
		   document.querySelector("#join-answer-modal").style.display = "block";
	   }else{
		   alert("??????????????? ????????????.")
	   }
		   
	   
	  
           
   });
   
   $(".join-cencel-btn").on("click", function(){
      document.querySelector("#join-answer-modal").style.display = "none";
   });
   

	/* ship ???????????? - ?????? ?????? ?????? ????????? */
	$(".join-textarea").on("keyup", function(){
		$(".join-btn").css("background-color","#132650");
		$(".join-btn").attr("disabled", false);
	});
	
	
	/* ??? ?????? ?????? ?????? ??? ?????????  */
	$(".crew-info").on("click", function(){
		$("#crew-info-crewNickname").val("${myCrewInfo.crewNickname}");
		document.querySelector(".crew-info-modal").style.display = "block";

	}); 
	/* ??? ?????? ?????? ?????????  X ?????? */ 
	$(".crew-info-modal-close-i").on("click", function(){
		document.querySelector(".crew-info-modal").style.display = "none";
		location.reload();
	});
	/* ??? ?????? ?????? ?????? ?????? */ 
	$(".btn-cancel-crew-info").on("click", function(){
		document.querySelector(".crew-info-modal").style.display = "none";
		location.reload();
	});
	/* ??? ?????? ?????? ?????? ?????? */ 
	$(".btn-modify-crew-info").on("click", function(){		
		if($("#crewPhotoStatus").val() ==1 ){
			console.log("11111"); 
			
			insertCrewPhoto();
			$.ajax({
				url:"/rest/updateCrewPhoto",
				type:"post",
				data:{crewNum:"${myCrewInfo.crewNum}",crewNickname:$("#crewPhotoDumpName").val()},
				async:false,
				success:function(data){
					
				},
				
			});
									
		}else if($("#crewPhotoStatus").val() == 2){
			$.ajax({
				url:"/rest/updateCrewPhoto",
				type:"post",
				data:{crewNum:"${myCrewInfo.crewNum}",crewNickname:'default'},
				async:false,
				success:function(data){
					
				},
				
			});
			
		}
		

		$.ajax({
			url:"/rest/updateCrewNickname",
			type:"post",
			data:{crewNum:"${myCrewInfo.crewNum}",crewNickname:$("#crew-info-crewNickname").val(),usrNum:'${sessionId}',shipNum:'${shipNum}',crewRole:"${myCrewInfo.crewRole}"},
			success:function(data){
				location.reload();				
			},				
		});
		
// 		document.querySelector(".crew-info-modal").style.display = "none";
	});
   
});
</script>