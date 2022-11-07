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
         
                  
                  <input id="sessionGender" type="hidden" value="${ sessionGender }">
                  
                  <c:if test="${ ship.limitStatus == 1 }">
                     <input id="limitStatus" type="hidden" value="1">
                     <input id="limitEnd"  type="hidden" value="${ endDate }">
                     <input id="limitUsrBirth"  type="hidden" value="${ usrBrith }">
                     <input id="limitStart"  type="hidden" value="${ startDate }">
                  </c:if>
                  
                  <c:if test="${ ship.limitStatus == 0 }">
                     <input id="LimitStatus"  type="hidden" value="0">
                  </c:if>

      <c:choose>
         <c:when test="${ship.shipSample==1}">
            <img class="img-fluid rounded-circle img-thumbnail my-3" style="width: 170; height: 170; position:;" src="/images/ship/${ ship.shipNum }/${ship.shipPhotoName}" alt="..." />
         </c:when>
         <c:otherwise>
            <img class="img-fluid rounded-circle img-thumbnail my-3" style="width: 170; height: 170; position:;" src="/images/ship/sample/${ ship.shipSampleName }" alt="..." />
         </c:otherwise>
      </c:choose>



      <h4 class="fw-bold mb-2" style="cursor: pointer;" onclick="location.href='/ship/${ ship.shipNum }';">${ship.shipName}</h4>
      
            
      <p class="fw-bold mb-2" style="color: #0000008c">${ship.shipCaptain}</p>


      <c:choose>
         <c:when test="${ship.usrNum == sessionId}">
            <p class="fw-bold mb-2" style="color: #0000008c">${ship.shipTitle}</p>
         </c:when>
         <c:otherwise>
            <p class="fw-bold mb-2" style="color: #0000008c">${ship.shipTitle}</p>
         </c:otherwise>
      </c:choose>
      
      <div class="d-flex">
      <c:if test="${ myCrewInfo ne null }">
      
         <button class="btn btn-sm btn-outline-secondary border-secondary border-2 crew-info" type="button">
            <i class="bi bi-gear-fill me-3" style="word-break: keep-all;"></i>내 정보 관리
      </button>
         &nbsp;&nbsp;
         
         
      
      </c:if>

         <c:choose>
            <%-- ship 회원 가입 신청만 한 경우 --%>
            <c:when test="${not empty myAppOfShip and myAppOfShip.appStatus == 0 }">
               <button class="btn btn-sm btn-outline-secondary border-secondary border-2" type="button" disabled="disabled">
                  <span style="word-break: keep-all;">가입신청 완료</span>
               </button>
            </c:when>            
            <%-- ship 회원이 아닐 경우 --%>
            <c:otherwise>
               <button class="btn btn-sm btn-outline-secondary border-secondary border-2" type="button" id="join-answer-modal-open-btn">
                  <i class="bi bi-plus" style="font-size: 1.3em"></i>Join
               </button>
            </c:otherwise>
         </c:choose>
         
 
          
         
      </div>



   </div>
   <hr>

   <!-- 의찬 변경 -->
   <ul class="nav nav-pills flex-column mb-auto">

      <%-- href="/ship/${item.shipNum}" 수정 --%>
      <li><a id="side-board" href="/ship/${ ship.shipNum }" class="btn-outline-secondary nav-link link-dark"><i class="bi bi-house-door me-3"></i>홈 </a></li>
      

      <!-- 관리자 설정 -->
      <c:if test="${ship.usrNum == sessionId }">
         <li><a id="side-setting" href="/ship/${ship.shipNum}/setting/app" class="nav-link link-dark"> <i class="bi bi-gear me-3"></i>SHIP 관리
         </a></li>
      </c:if>
   </ul>
</div>

<!-- ship 가입신청하기 시작-->

<div id="join-answer-modal" style="display: none;">
   <div class="join-answer-modal-content">
      <form method="post" action="/ship/${ship.shipNum}/join" class="join-form join-answer-modal-box d-flex-column justify-content-center align-items-between p-3 py-5">


         <input type="hidden" name="usrNum" value="${sessionId}"> <input type="hidden" name="shipNum" value="${ship.shipNum}">

         <div class="row-1 border-line-bottom">
            <h5 class="text-center">${ship.shipName}</h5>
            <p class="text-center">가입 질문에 답해주세요.</p>
         </div>
         <div class="row-8 d-flex-column justify-content-center align-items-center">
            <div class="text-center my-3">${ship.shipSurvey}</div>
            <textarea class="d-flex justify-content-center align-items-center my-3 p-3 join-textarea" placeholder="답변을 작성해주세요." name="appAnswer"></textarea>
         </div>
         <div class="row-2 d-flex justify-content-center align-items-center">
            <input type="button" value="가입하기" class="join-btn m-1" disabled="disabled" onclick="submitShipApplication('${ship.shipName}')"> <input type="button" class="join-cencel-btn m-1" value="취소"> 
         </div>

      </form>
   </div>
   <div class="write-modal-layer"></div>
</div>
<!-- ship 가입신청하기 끝-->

<!-- 내 정보 관리 - 크루 정보 수정 모달창 시작 -->
<div class="crew-info-modal" style="display: none;">
   <div class="crew-info-content p-4">

      <div class="d-flex flex-column justify-content-center" style="color: #0000008c; height: 100%;">
         <div class="row-1 p-4 pb-2 border-bottom">
            <h5 class="d-flex justify-content-center">CREW 정보</h5>
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
               <span class="col-3 mx-1">닉네임</span> <input id="crew-info-crewNickname" class="col-6" type="text" value="${ myCrewInfo.crewNickname }">
            </div>

            <div class="d-flex justify-content-center">
               <button class="btn border btn-outline-dark border-dark rounded-0 p-2 m-3 btn-modify-crew-info" style="font-size: 13px; width: 90px;">수정</button>
               <button class="btn border btn-outline-dark border-dark rounded-0 p-2 m-3 btn-cancel-crew-info" style="font-size: 13px; width: 90px;">취소</button>
            </div>
         </div>
      </div>
   </div>
   <div class="write-modal-layer"></div>
</div>
<!-- 내 정보 관리 - 크루 정보 수정 모달창  끝 -->




<script>

function checkCrewPhoto(inputElement) {
   let extensions = ["jpg","jpeg","png","gif","jfif","pjpeg","pjp"] // 허용할 확장자명들 (제약조건)
   let file = inputElement.files[0];
   let fileName = file.name; //   파일의 이름
   let slices = fileName.split(".");      
   let lastIndex = slices.length-1;   
   let usrExtension = slices[lastIndex];   // 유저의 파일  "." 으로 잘라서 마지막값
   
   
   
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
   console.log("ship-setting-photo");
   console.log();
}


function insertCrewPhoto(){
   var inputElement = $("#crew-setting-photo")[0];
   var photoFile = inputElement.files[0];
   var photoFileName = photoFile.name; //   파일의 이름
   
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
         console.log("checkPhoto 갔다옴");
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

/* ship 탈퇴하기(삭제하기) 시작 */
function leaveShip(){

   var isBoolean = "${ ship.usrNum == sessionId }";

   /* 1. 관리자인 경우, ship이 삭제 된다 */
   if(isBoolean === 'true'){
      alert("관리자(캡틴)일 경우");
      var con = confirm("밴드를 삭제하시겠습니까?\nSHIP에 가입된 모든 회원과 게시물, 파일을 복구할 수 없습니다.");      
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
          alert('삭제가 취소되었습니다.');
          return false;
      }
   
   }else{ 
      /* 2. 일반회원일 경우, ship에서 탈퇴가 된다 */
      
      alert("일반 회원(crew)일 경우");
      var con = confirm("정말로 탈퇴하시겠습니까?");
      
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
         alert('탈퇴가 취소되었습니다.');
         return false;
      }      
   }    
}
/* ship 탈퇴하기(삭제하기) 끝 */


/* ship 가입하기 버튼 누를 때  */
function submitShipApplication(shipName){
   $(".join-form").submit();
   alert(shipName+'에 가입 신청이 완료되었습니다!');
   document.querySelector("#join-answer-modal").style.display = "none";
   
}

$(document).ready(function(){
   /* ship 가입하기 모달창 */
   $("#join-answer-modal-open-btn").on("click", function(){
      
       
            if("${sessionId}"==""){
               alert("로그인하세요")
               return false;
            }else{ // 공개 + 로그인 인 상태면
//                alert("# 연령제한 상태 : "+"${ship.limitStatus}")
               let usrGender = "";      
                  if($("#sessionGender").val()== "male"){
                     usrGender=1;
                  }else{
                     usrGender=2;
                  }
                  
                  if("${ship.limitGender}" != 0 ){
                     let limitGender = parseInt("${ship.limitGender}");
                        if(limitGender<usrGender){
                           alert("남자만 가입가능합니다 !")
                           return false;
                        }else if(limitGender>usrGender){
                           alert("여자만 가입가능합니다 !")
                           return false;
                        }else{                           
                        if("${ship.limitStatus}" == 1 && parseInt($("#limitEnd").val()) <= parseInt($("#limitUsrBirth").val()) && parseInt($("#limitUsrBirth").val()) <= parseInt($("#limitStart").val()) ){                           
                           
                        }else if("${ship.limitStatus}" == 0){
                           
                        }else{
                           alert("생년월일이 ${ship.limitEnd} 부터 ${ship.limitStart} 까지 가입가능합니다");
                           return false;
                        }
                        }
                     
                  }else{                     
                     if("${ship.limitStatus}" == 1 && parseInt($("#limitEnd").val()) <= parseInt($("#limitUsrBirth").val()) && parseInt($("#limitUsrBirth").val()) <= parseInt($("#limitStart").val()) ){                        
                        
                     }else if("${ship.limitStatus}" == 0){
                        
                     }else{
                        alert("생년월일이 ${ship.limitEnd} 부터 ${ship.limitStart} 까지 가입가능합니다");
                        return false;
                     }
                  }
            }     
      

      
      document.querySelector("#join-answer-modal").style.display = "block";
         
      
     
           
   });
   
   $(".join-cencel-btn").on("click", function(){
      document.querySelector("#join-answer-modal").style.display = "none";
   });
   

   /* ship 가입하기 - 내용 쓰면 버튼 활성화 */
   $(".join-textarea").on("keyup", function(){
      $(".join-btn").css("background-color","#132650");
      $(".join-btn").attr("disabled", false);
   });
   
   
   /* 내 정보 관리 클릭 시 모달창  */
   $(".crew-info").on("click", function(){
      $("#crew-info-crewNickname").val("${myCrewInfo.crewNickname}");
      document.querySelector(".crew-info-modal").style.display = "block";

   }); 
   /* 내 정보 관리 모달창  X 버튼 */ 
   $(".crew-info-modal-close-i").on("click", function(){
      document.querySelector(".crew-info-modal").style.display = "none";
      location.reload();
   });
   /* 내 정보 관리 취소 버튼 */ 
   $(".btn-cancel-crew-info").on("click", function(){
      document.querySelector(".crew-info-modal").style.display = "none";
      location.reload();
   });
   /* 내 정보 관리 수정 버튼 */ 
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
      
//       document.querySelector(".crew-info-modal").style.display = "none";
   });
   
});
</script>