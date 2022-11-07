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
					<%@include file="myPageSidebar.jsp"%>
				</div>


				<main class="col-9 p-0" style="overflow: visible">
					<div class="col-10 p-3 mb-3" style="background-color: white;">


						<div class="card-body p-4 pb-2 border-bottom"
							style="float: none; margin: 0 auto;">
							<h5 style="font-weight: 800;">가입 신청 중인 SHIP</h5>
						</div>

						<!-- 가입 신청 중인 SHIP 리스트 시작 -->
						
						<ul class="m-0">
						<!-- 첫번째 리스트 시작 -->
							<li class="ps-3 px-1 py-2 d-flex flex-row justify-content-between align-items-center border-bottom">
								<div class="row d-flex flex-row col-9">

									<div class="col-2 ">대표사진</div>
									<span class="col-3 mx-3">이름</span>
									<span class="col-5 mx-3">소개</span> 
								</div>
								
							</li>
						<!-- 첫번째 리스트 끝 -->
						
						<c:forEach var="app" items="${ apps }">						
							<!-- 첫번째 리스트 시작 -->
							<li class="m-0 ps-3 px-1 py-3 d-flex flex-row justify-content-between align-items-center border-bottom">
								<div class="row d-flex flex-row col-9">
									<c:if test="${ app.shipSample == 0 }"> 
									<div class="col-2"> 
										<img class="img-fluid" style="width: 40; height: 40; position:;" src="/images/ship/sample/${ app.shipSampleName }" alt="...">
									</div>
									</c:if>
									<c:if test="${ app.shipSample == 1 }">
									<div class="col-2"> 
										<img class="img-fluid" style="width: 40; height: 40; position:;" src="/images/ship/${ app.shipNum }/${ app.shipPhotoName }" alt="...">
									</div>
									</c:if>
									<span class="col-3 mx-3">${ app.shipName }</span>
									<span class="col mx-3">${ app.shipTitle }</span>   
								</div>
								
								
									<button onclick="confirmApp(${app.usrNum},${ app.shipNum })" class="col-3 btn border rounded-0 btn-outline-white p-2 m-1" style="font-size: 13px; width: 80px;">신청 취소</button>
							</li>
							<!-- 첫번째 리스트 끝 -->

						</c:forEach>
						</ul>
						<!-- 가입 신청 중인 SHIP 리스트 끝 -->

					</div>
				</main>
			</div>
		</div>
	</div>
	
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
	
	<script>
	
	function deleteApp(usrNum , shipNum){
		
// 		alert("#usrNum : "+usrNum)
// 		alert("#shipNum : "+shipNum)
		
		$.ajax({
			url:"/rest/deleteMyApp",
			type:"post",
			data:{usrNum:usrNum,shipNum:shipNum},
			success:function(data){
				alert("가입신청을 취소했습니다.")
				location.reload();
			},
						
		});
		
	}
	
	function confirmApp(usrNum , shipNum){
		MsgBox.Confirm("신청을 취소하겠습니까?","delete", function() {deleteApp(usrNum,shipNum)});
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

</body>
</html>