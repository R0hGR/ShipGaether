<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<!-- css 추가 -->
<style>
a {
	text-decoration: none;
	!
	important
}

a:hover {
	text-decoration: none;
	!
	important
}

a:visited {
	text-decoration: none;
	!
	important
}
</style>
<script>
$(function(){
$("#search_Name").on("click", function(){
//	alert("입력값 찍어보고 "+ $("#input_Name").val())
	$.ajax({
		url: "/rest/crewNickname/autoData/"+${shipNum}+".json",
		type: "POST",
		data: {crewNickname: $("#input_Name").val()},
		success: function(data){

			var html_Crew="";
			for(crew_Usr of data){
				html_Crew += "<div class='row m-0 p-0 border-bottom'>";
				html_Crew += "<div class='col-2' style='float: none; margin: auto;'>";
				if(crew_Usr.crewPhoto == "default"){
					html_Crew += "<img class='img-fluid rounded-circle img-thumbnail' style='width: 40; height: 40; position:;' src='/images/defaultPhoto.jpg' alt='...' />";
				}else{
					html_Crew += "<img class='img-fluid rounded-circle img-thumbnail' style='width: 40; height: 40; position:;' src='/images/ship/샘플/"+crew_Usr.crewPhoto+"' alt='...' />";	
				}
				
				
				html_Crew += "</div>";
				html_Crew += "<div class='col-8 p-0 py-3'>";
				html_Crew += "<div class='row-2'>"+crew_Usr.crewNickname+"";
				
				if(crew_Usr.crewRole == "captain"){
					html_Crew += "<div class='badge rounded-pill text-bg-info'>방장</div>";					
				}
				
				html_Crew += "</div>";
				html_Crew += "</div>";
				html_Crew += "<div class='col-2 py-3 btn'>";
				html_Crew += "<i class='fas fa-comment-dots'></i>";
				html_Crew += "</div>";
				html_Crew += "</div>";
			}
			$('#ajaxContainer').html(html_Crew);
		},
	});
}); 
});

</script>
<div class="col-8">
	<div>
		<div class="card border-0 rounded-0 mb-3 main-box">
			<div class="card-header border-0 bg-white p-0">
				<div class="row" style="float: none; margin: 0 auto;">

					<!-- 초대하기 버튼 -->
					<div class="col px-0 py-2 border-bottom"
						style="flex-direction: column;">
						<div class="card-body p-3">
							<p class="fw-bolder m-0 " style="float: left;">${ship.shipName}</p>
							<a href="/ship/${shipNum}/crew/crewInvite"><button class="fw-bolder m-0"
									style="float: right; color: #0000008c; border-color: #0000008c;">멤버
									초대하기</button></a>
						</div>
					</div>

					<!-- 멤버 검색창 -->
					<div class="border-bottom px-2 py-2">
						<form class="d-flex border border-1.5 border-light bg-light justify-content-start align-items-center m-0 px-2"
							action="crewList" role="search" method="get">
							<input class="form-control p-0 ps-2" type="text"
								name="input_Name" id="input_Name" aria-label="Search"
								style="border: 0; font-size: 0.9em; color: #0000008c; background-color: transparent;">
							<div class="d-flex align-items-center me-lg-0 mb-2 mb-lg-0 ms-auto  p-0">
								<input type="button" value="이름검색" id="search_Name"
									style="color: #0000008c" />
							</div>
						</form>
					</div>

					<!-- 멤버 추가  본인 -->
					<div id="ajaxContainer">
						<c:forEach var="item" items="${ crews }">
							
							<div class="row m-0 p-0 border-bottom">
								<div class="col-2" style="float: none; margin: auto;">
									<c:if test="${item.crewPhoto!='default'}">
										<img class="img-fluid rounded-circle img-thumbnail"
											style="width: 40; height: 40; position:;"
											src="/images/ship/${shipNum}/${ item.crewPhoto }" alt="..." />
									</c:if>
									
									<!-- 사진이 없으면 기본 샘플값 -->
									<c:if test="${item.crewPhoto=='default'}">
										<img class="img-fluid rounded-circle img-thumbnail"
											style="width: 40; height: 40; position:;"
											src="/images/defaultPhoto.jpg" alt="..." />
									</c:if>
									
								</div>
								
								<div class="col-10 p-0 py-3">
									<div class="row-2">${ item.crewNickname }
										<c:if test="${item.crewRole=='captain'}">
											<div class="badge rounded-pill text-bg-info">방장</div>
										</c:if>
									</div>
								</div>

								
								
							</div>

						</c:forEach>
					</div>
				
				</div>
			</div>
		</div>
	</div>
</div>




