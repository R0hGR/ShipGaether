<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<div class="col-8">

	<!-- ship 관리 상단 메뉴탭 -->
	<div class="card border-0 rounded-0 mb-3 d-flex">
		<div
			class="row p-3 pb-1 d-flex justify-content-center align-items-between">
			<a href="/ship/${ship.shipNum}/setting/app"
				class="p-0 m-3 text-center"
				style="width: 17%; color: black; font-weight: 700;">가입신청서</a> <a
				href="/ship/${ship.shipNum}/setting/info"
				class="p-0 m-3 text-center"
				style="width: 17%; color: black; font-weight: 800; border-bottom: 2px solid #000;">정보수정</a>
			<a href="/ship/${ship.shipNum}/setting/photo"
				class="p-0 m-3 text-center"
				style="width: 17%; color: black; font-weight: 700;">대표사진</a> <a
				href="/ship/${ship.shipNum}/setting/remove"
				class="p-0 m-3 text-center"
				style="width: 17%; color: black; font-weight: 700;">삭제하기</a>
		</div>

	</div>


	<!-- SHIP 정보 수정 리스트 시작 -->
	<div class="card border-0 rounded-0 mb-3 p-2">
		<div class="card-header border-0 bg-white p-0">
			<div class="row" style="float: none; margin: 0 auto;">

				<div class="col px-0 py-2 mb-3 border-bottom"
					style="flex-direction: column;">

					<div class="card-body p-3">
						<h5 class="fw-bold m-0 " style="float: left;">SHIP 정보 수정</h5>
					</div>
				</div>

			</div>
		</div>


		<div
			class="row p-3 pt-0 d-flex flex-row justify-content-between align-items-center text-secondary"
			style="float: none; margin: 0 auto; width: 100%; color: #333;">
			<div class="row-12 my-3">
				<!-- 이름 -->
				<div class="row border-bottom">
					<div
						class="pb-3 pe-0 d-flex flex-row justify-content-between align-items-center">
						<span class="col-3">이름</span> <input id="inputShipName"
							class="col-6" value="${ ship.shipName }">

						<button
							class="col-3 btn border rounded-0 btn-outline-white p-2 m-1"
							style="font-size: 13px; width: 80px;" onclick="updateShipName()">수정하기</button>
					</div>
				</div>


				<script>
               function updateShipName(){
                  MsgBox.Confirm("Ship 이름을 변경하시겠습니까?","update", function(){updateShipNameDo()} ,function(){location.reload()});
               }
               function updateShipNameDo(){                  
                  $.ajax({
                     url:"/rest/updateShipName/${shipNum}",
                     type:"post",
                     data:{shipName:$("#inputShipName").val()},
                     async:false,
                     success:function(data){
//                         console.log(data)
                        
                        alert("성공적으로 변경되었습니다.");
                         
                        location.reload();
                     },                     
                  });
               }
            </script>


				<!-- 소개말 -->
				<div class="row my-3 border-bottom">
					<div
						class="pb-3 pe-0 d-flex flex-row justify-content-between align-items-center">
						<span class="col-3">소개말</span>
						<textarea id="textShipTitle" class="col-6 ship-app-usr-nickname"
							style="overflow: hidden; height: 160px; resize: none;">${ ship.shipTitle }</textarea>
						<button
							class="col-3 btn border rounded-0 btn-outline-white p-2 m-1"
							style="font-size: 13px; width: 80px;" onclick="updateShipTitle()">수정하기</button>
					</div>
				</div>

				<script>
               function updateShipTitle(){
                  MsgBox.Confirm("Ship 소개말을 변경하시겠습니까?","update", function(){updateShipTitleDo()} ,function(){location.reload()});
               }
               function updateShipTitleDo(){                  
                  $.ajax({
                     url:"/rest/updateShipTitle/${shipNum}",
                     type:"post",
                     data:{shipTitle:$("#textShipTitle").val()},
                     async:false,
                     success:function(data){
//                         console.log(data)
                        
                        alert("성공적으로 변경되었습니다.");
                         
                        location.reload();
                     },                     
                  });
               }
            </script>
				<!-- 가입질문 -->
				<div class="row my-3 border-bottom">
					<div
						class="pb-3 pe-0 d-flex flex-row justify-content-between align-items-center">
						<span class="col-3">가입질문</span>
						<textarea id="textShipSurvey" class="col-6 ship-app-usr-nickname"
							style="overflow: hidden; height: 80px; resize: none;">${ ship.shipSurvey }</textarea>
						<button
							class="col-3 btn border rounded-0 btn-outline-white p-2 m-1"
							style="font-size: 13px; width: 80px;"
							onclick="updateShipSurvey()">수정하기</button>
					</div>
				</div>

				<script>
               function updateShipSurvey(){
                  MsgBox.Confirm("가입질문을 변경하시겠습니까?","update", function(){updateShipSurveyDo()} ,function(){location.reload()});
               }
               function updateShipSurveyDo(){                  
                  $.ajax({
                     url:"/rest/updateShipSurvey/${shipNum}",
                     type:"post",
                     data:{shipSurvey:$("#textShipSurvey").val()},
                     async:false,
                     success:function(data){
//                         console.log(data)
                        
                        alert("성공적으로 변경되었습니다.");
                         
                        location.reload();
                     },                     
                  });
               }
            </script>

				<!-- 주 활동 지역 -->
				<div class="row my-3 border-bottom">
					<div
						class="pb-3 pe-0 d-flex flex-row justify-content-between align-items-center">
						<span class="col-3">주 활동 지역</span>
						<div
							class="col-6 small-text-div d-flex justify-content-between p-0 m-0 ">

							<!-- 시/도 -->
							<div class="col-3 p-0">
								<select class="login-input" id="signUsrCity2" name="cityNum"
									onchange="getTowns(this)">
									<c:forEach var="item" items="${ cities }">
										<option value="${ item.cityNum }">${ item.cityName }</option>
									</c:forEach>
								</select>
							</div>

							<!-- 군/구 -->
							<div class="col-3 p-0">
								<select class="login-input" id="signUsrTown2" name="usrTown"
									onchange="getDongs(this)">
									<option value="0">상관없음</option>
								</select>
							</div>

							<!-- 동 -->
							<div class="col-3 p-0">
								<select class="login-input" id="signUsrDong2" name="usrDong">
									<option value="0">상관없음</option>
								</select>
							</div>
						</div>
						<button
							class="col-3 btn border rounded-0 btn-outline-white p-2 m-1"
							style="font-size: 13px; width: 80px;" onclick="updateShipCity()">수정하기</button>
				
					</div>
				</div>
				<script>
							function updateShipCity(){

				                   MsgBox.Confirm("지역을 변경하시겠습니까?","update", function(){updateShipCityDo()} ,function(){location.reload()});
				                }
				               function updateShipCityDo(){   
				            	   let cityNum = $("#signUsrCity2").val();
				            	   let townNum = $("#signUsrTown2").val();
				            	   let dongNum = $("#signUsrDong2").val();
				                   $.ajax({
				                      url:"/rest/updateShipCity/${shipNum}",
				                      type:"post",
				                      data:{cityNum:cityNum, townNum:townNum, dongNum:dongNum},
				                      async:false,
				                      success:function(data){
//				                          console.log(data)
				                         
				                         alert("성공적으로 변경되었습니다.");
				                          
				                         location.reload();
				                      },                     
				                   });
				                }
							</script>
				<!-- 성별 제한 -->
				<div class="row my-3 border-bottom">
					<div
						class="pb-3 pe-0 d-flex flex-row justify-content-between align-items-center">
						<span class="col-3">성별 제한</span>
						<div
							class="col-6 btn-small-text-div d-flex flex-row justify-content-between p-0 m-0 ">
							<input id="limitGender0" class="col-3 btn p-1 select-gender"
								type="button" value="상관없음" name="0" onclick="changeColor(this)" />
							<input id="limitGender1" class="col-3 btn p-1 select-gender"
								type="button" value="남자만" name="1" onclick="changeColor(this)" />
							<input id="limitGender2" class="col-3 btn p-1 select-gender"
								type="button" value="여자만" name="2" onclick="changeColor(this)" />
						</div>
						<button
							class="col-3 btn border rounded-0 btn-outline-white p-2 m-1"
							style="font-size: 13px; width: 80px;"
							onclick="updateShipLimitGender()">수정하기</button>
					</div>
				</div>

				<script>
               function updateShipLimitGender(){
                  MsgBox.Confirm("성별 제한을 변경하시겠습니까?","update", function(){updateShipLimitGenderDo()} ,function(){location.reload()});
               }
               function updateShipLimitGenderDo(){                  
                  $.ajax({
                     url:"/rest/updateShipLimitGender/${shipNum}",
                     type:"post",
                     data:{limitGender:updateGenderParam},
                     async:false,
                     success:function(data){
//                         console.log(data)
                        
                        alert("성공적으로 변경되었습니다.");
                         
                        location.reload();
                     },                     
                  });
               }
            </script>

				<!-- 연령 제한 -->
				<div class="row my-3 border-bottom">
					<div
						class="pb-3 pe-0 d-flex flex-row justify-content-between align-items-center">
						<span class="col-3">연령 제한</span>
						<div
							class="col-6 small-text-div d-flex flex-row justify-content-between p-0 m-0 ">
							<div class="col-3">
								<select id="setting-limitStatus" class="login-input"
									onchange="unlockAge(this)">
									<option value="0">없음</option>
									<option value="1">있음</option>
								</select>
							</div>
							<div class="col-4">
								<select id="settingShipLimitEnd" class="login-input">
									<option value="0">최대나이</option>
									<option value="1980-01-01">1980</option>
									<option value="1981-01-01">1981</option>
									<option value="1982-01-01">1982</option>
									<option value="1983-01-01">1983</option>
									<option value="1984-01-01">1984</option>
									<option value="1985-01-01">1985</option>
									<option value="1986-01-01">1986</option>
									<option value="1987-01-01">1987</option>
									<option value="1988-01-01">1988</option>
									<option value="1989-01-01">1989</option>
									<option value="1990-01-01">1990</option>
									<option value="1991-01-01">1991</option>
									<option value="1992-01-01">1992</option>
									<option value="1993-01-01">1993</option>
									<option value="1994-01-01">1994</option>
									<option value="1995-01-01">1995</option>
									<option value="1996-01-01">1996</option>
									<option value="1997-01-01">1997</option>
									<option value="1998-01-01">1998</option>
									<option value="1999-01-01">1999</option>
									<option value="2000-01-01">2000</option>
									<option value="2001-01-01">2001</option>
									<option value="2002-01-01">2002</option>
									<option value="2003-01-01">2003</option>
									<option value="2004-01-01">2004</option>
									<option value="2005-01-01">2005</option>
									<option value="2006-01-01">2006</option>
									<option value="2007-01-01">2007</option>
									<option value="2008-01-01">2008</option>
									<option value="2009-01-01">2009</option>
									<option value="2010-01-01">2010</option>
								</select>
							</div>
							<div class="col-4">
								<select id="settingShipLimitStart" class="login-input">
									<option value="0">최소나이</option>
									<option value="1980-01-01">1980</option>
									<option value="1981-01-01">1981</option>
									<option value="1982-01-01">1982</option>
									<option value="1983-01-01">1983</option>
									<option value="1984-01-01">1984</option>
									<option value="1985-01-01">1985</option>
									<option value="1986-01-01">1986</option>
									<option value="1987-01-01">1987</option>
									<option value="1988-01-01">1988</option>
									<option value="1989-01-01">1989</option>
									<option value="1990-01-01">1990</option>
									<option value="1991-01-01">1991</option>
									<option value="1992-01-01">1992</option>
									<option value="1993-01-01">1993</option>
									<option value="1994-01-01">1994</option>
									<option value="1995-01-01">1995</option>
									<option value="1996-01-01">1996</option>
									<option value="1997-01-01">1997</option>
									<option value="1998-01-01">1998</option>
									<option value="1999-01-01">1999</option>
									<option value="2000-01-01">2000</option>
									<option value="2001-01-01">2001</option>
									<option value="2002-01-01">2002</option>
									<option value="2003-01-01">2003</option>
									<option value="2004-01-01">2004</option>
									<option value="2005-01-01">2005</option>
									<option value="2006-01-01">2006</option>
									<option value="2007-01-01">2007</option>
									<option value="2008-01-01">2008</option>
									<option value="2009-01-01">2009</option>
									<option value="2010-01-01">2010</option>
								</select>
							</div>
						</div>
						<button
							class="col-3 btn border rounded-0 btn-outline-white p-2 m-1"
							style="font-size: 13px; width: 80px;"
							onclick="updateShipLimitStatus()">수정하기</button>
					</div>
				</div>

				<!-- SHIP 공개 여부 -->
				<div class="row my-3 border-bottom">
					<div
						class="pb-3 pe-0 d-flex flex-row justify-content-between align-items-center">
						<span class="col-3">공개 여부</span>
						<div
							class="col-6 btn-small-text-div d-flex flex-row justify-content-around">
							<input id="shipOpen0" class="select-open col-3 btn p-2 px-3"
								type="button" name="0" value="비공개" style=""
								onclick="changeColor(this)" /> <input id="shipOpen1"
								class="select-open col-3 btn p-2 px-3" type="button" name="1"
								value="공개" onclick="changeColor(this)" />
						</div>
						<button
							class="col-3 btn border rounded-0 btn-outline-white p-2 m-1"
							style="font-size: 13px; width: 80px;" onclick="updateShipOpen()">수정하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
            
            function updateShipLimitStatus(){
               if($("#setting-limitStatus").val() == 0){
                  $.ajax({
                     url:"/rest/updateNoShipLimit/${shipNum}",
                     type:"post",
                     data:{limitEnd:"1",limitStart:"2"},
                     async:false,
                     success:function(data){
                        alert("연령제한이 변경되었습니다.")
                        location.reload();
                     },                        
                     
                  });
                  
                  
               }else if ($("#setting-limitStatus").val() == 1){
                  if($("#settingShipLimitEnd").val()==0 || $("#settingShipLimitStart").val() ==0){
                     alert("연령제한을 모두 선택해주세요");                     
                  }else{
                     let limitEnd = $("#settingShipLimitEnd").val();
                     let limitStart = $("#settingShipLimitStart").val();
                     
                     $.ajax({
                        url:"/rest/updateShipLimit/${shipNum}",
                        type:"post",
                        data:{limitEnd:limitEnd,limitStart:limitStart},
                        async:false,
                        success:function(data){
                           alert("연령제한이 변경되었습니다.")                           
                           location.reload();
                           
                        },                        
                        
                     });
                  }
                  
               }
               
               
               
            }
            
            function unlockAge(selectElement){
               if(selectElement.value==1){
                  // 풀어
                  $('#settingShipLimitStart').attr("disabled",false);
                  $('#settingShipLimitEnd').attr("disabled",false);         
               }else{
                  // 잠궈
                  $('#settingShipLimitStart').val("0");
                  $('#settingShipLimitEnd').val("0");
                  $('#settingShipLimitStart').attr("disabled",true);
                  $('#settingShipLimitEnd').attr("disabled",true);
               }
            }
            
            
               function updateShipOpen(){

                  MsgBox.Confirm("공개여부를 변경하시겠습니까?","update", function(){updateShipOpenDo()} ,function(){location.reload()});
               }
               function updateShipOpenDo(){                  
                  $.ajax({
                     url:"/rest/updateShipOpen/${shipNum}",
                     type:"post",
                     data:{shipOpen:updateShipOpenParam},
                     async:false,
                     success:function(data){
//                         console.log(data)
                        
                        alert("성공적으로 변경되었습니다.");
                         
                        location.reload();
                     },                     
                  });
               }
               
            </script>

<!-- confirm 창 -->
<div class="modal" id="msg_popup" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-body text-center">
				<!-- MSG Space-->
			</div>
			<div class="d-flex flex-row justify-content-center modal-footer"
				id="btn_confirm">
				<button type="button" id="confirm_yes" class="btn btn-dark"
					data-dismiss="modal">삭제</button>
				<button type="button" id="confirm_no" class="btn btn-secondary"
					data-dismiss="modal">취소</button>
			</div>
			<div class="modal-footer" id="btn_alert">
				<button type="button" id="alert_ok" class="btn btn-primary"
					data-dismiss="modal">OK</button>
			</div>
		</div>
	</div>
</div>
<!-- confirm 창 -->

<script>

$(document).ready(function() {
   
   
   
   if("${ ship.limitGender }"==0){      
      $("#limitGender0").click();
   }else if("${ ship.limitGender }"==1){
      $("#limitGender1").click();
   }else if("${ ship.limitGender }"==2){
      $("#limitGender2").click();
   }
   
   if("${ ship.limitStatus }"==0){
      $("#limitStatus").val=0;      
   }else if("${ ship.limitStatus }"==1){
      $("#limitStatus").val=1;
   }
   
   if("${ ship.shipOpen }"==0){      
      $("#shipOpen0").click();
   }else if("${ ship.shipOpen }"==1){
      $("#shipOpen1").click();
   }
   
   
   
   
   
   
   
});

var updateShipOpenParam=""
var updateGenderParam="";
function changeColor(el){

   if(el.className.includes("select-gender")){
      //성별에 대한 클릭시   
      let els = document.querySelectorAll(".select-gender");
      
      for( item of els ){
         item.style.backgroundColor = "#f8f9fa";
         item.style.color = "black";
      }      
      el.style.backgroundColor = "#333";
      el.style.color = "#f8f9fa";   
      updateGenderParam=el.name;

   }else{
      //공개에 대한 클릭시
      let els = document.querySelectorAll(".select-open");
      
      for( item of els ){
         item.style.backgroundColor = "#f8f9fa";
         item.style.color = "black";
      }
      el.style.backgroundColor = "#333";
      el.style.color = "#f8f9fa";   
      updateShipOpenParam=el.name;
   }
}


var MsgBox = {
       
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
   
function getTowns(el) {
	var cityNum = el.value;
	if(cityNum=="0"){
		var html="";
		html += "<option value="+"0"+">상관없음</option>";
		$("#signUsrTown2").html(html);		
	}else{
		$.ajax({
			url: "/rest/town.json",
			type:"get",
			data:{cityNum:cityNum},
			success : function(data){				
				var html="";
				html += "<option value="+"0"+">상관없음</option>";					
				for(let townList of data) {
//					alert("# townList "+townList); 
					html += "<option value="+townList.townNum+">"+townList.townName+"</option>"
				}
				$("#signUsrTown2").html(html);
			},
		});
	}
}

function getDongs(el) {
	var townNum = el.value;
	if(townNum=="0"){
		var html="";
		html += "<option value="+"0"+">상관없음</option>";
		$("#signUsrDong2").html(html);		
	}else{
		$.ajax({
			url: "/rest/dong.json",
			type:"get",
			data:{townNum:townNum},
			success : function(data){				
				var html="";
				html += "<option value="+"0"+">상관없음</option>";					
				for(let dongList of data) {
//					alert("# townList "+townList); 
					html += "<option value="+dongList.dongNum+">"+dongList.dongName+"</option>"
				}
				$("#signUsrDong2").html(html);
			},
		});
	}
}
</script>
