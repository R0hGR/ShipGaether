<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.side-album::after {
	display: block;
	content: "";
	padding-bottom: 75%;
	
.side-album-content::after {
	display: block;
	content: "";
	padding-bottom: 75%;	
}
</style>
<div class="col-4 py-0 ps-0 pe-3" id="sticky">

	<div class="card border-0 rounded-0 ">
		<div class="card-header border-0 bg-white p-0">
			<div class="row" style="float: none; margin: 0 auto;">
				<div class="col" style="float: none; margin: auto 0;">사진첩</div>
				<div class="col" style="text-align: end">
					<button class="btn w-100" onclick="location.href='/ship/${shipNum}/album'">
						<p class="text m-0" style="font-size: 12px; color: #0000008c;">&nbsp;&nbsp;더 보기</p>
					</button>
				</div>
			</div>
		</div>

<c:if test="${ not empty recentlyBoardFileS[2].boardFileSaveName}">

	<div class="row-6 d-flex justify-content-around">
			<div class="col-4">
				<img class="img-fluid mx-auto p-0" src="/images/ship/${shipNum}/${recentlyBoardFileS[0].boardFileSaveName}" alt="..." style="height: 10vh; width: 100%; object-fit: cover;"/>
			</div>
			<div class="col-4">
				<img class="img-fluid mx-auto p-0" src="/images/ship/${shipNum}/${recentlyBoardFileS[1].boardFileSaveName}" alt="..." style="height: 10vh; width: 100%; object-fit: cover;"/>
			</div>
			<div class="col-4">
				<img class="img-fluid mx-auto p-0" src="/images/ship/${shipNum}/${recentlyBoardFileS[2].boardFileSaveName}" alt="..." style="height: 10vh; width: 100%; object-fit: cover;"/>
			</div>
	</div>
	
</c:if>	
<c:if test="${ not empty recentlyBoardFileS[5].boardFileSaveName}">	
	<div class="row-6 d-flex justify-content-around">
			<div class="col-4">
				<img class="img-fluid mx-auto p-0" src="/images/ship/${shipNum}/${recentlyBoardFileS[3].boardFileSaveName}" alt="..." style="height: 10vh; width: 100%; object-fit: cover;"/>
			</div>
			<div class="col-4">
				<img class="img-fluid mx-auto p-0" src="/images/ship/${shipNum}/${recentlyBoardFileS[4].boardFileSaveName}" alt="..." style="height: 10vh; width: 100%; object-fit: cover;"/>
			</div>
			<div class="col-4">
				<img class="img-fluid mx-auto p-0" src="/images/ship/${shipNum}/${recentlyBoardFileS[5].boardFileSaveName}" alt="..." style="height: 10vh; width: 100%; object-fit: cover;"/>
			</div>
	</div>
</c:if>
<c:if test="${ not empty recentlyBoardFileS[8].boardFileSaveName}">
	<div class="row-6 d-flex justify-content-around">
			<div class="col-4">
				<img class="img-fluid mx-auto p-0" src="/images/ship/${shipNum}/${recentlyBoardFileS[6].boardFileSaveName}" alt="..." style="height: 10vh; width: 100%; object-fit: cover;"/>
			</div>
			<div class="col-4">
				<img class="img-fluid mx-auto p-0" src="/images/ship/${shipNum}/${recentlyBoardFileS[7].boardFileSaveName}" alt="..." style="height: 10vh; width: 100%; object-fit: cover;"/>
			</div>
			<div class="col-4">
				<img class="img-fluid mx-auto p-0" src="/images/ship/${shipNum}/${recentlyBoardFileS[8].boardFileSaveName}" alt="..." style="height: 10vh; width: 100%; object-fit: cover;"/>
			</div>
	</div>	
</c:if>
	
		




	</div>

	<br />
	
<!-- 	<div class="card border-0 rounded-0 side-album"> -->
<!-- 		<div class="card-header border-0 bg-white p-0"> -->
<!-- 			<div class="row" style="float: none; margin: 0 auto;"> -->
<!-- 				<div class="col" style="float: none; margin: auto 0;">사진첩</div> -->
<!-- 				<div class="col" style="text-align: end"> -->
<!-- 					<button class="btn w-100" onclick="location"> -->
<!-- 						<p class="text m-0" style="font-size: 12px; color: #0000008c;">&nbsp;&nbsp;더 보기</p> -->
<!-- 					</button> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
		
<!-- 			<div class="row p-2" style="float: none; margin: 0 auto;" > -->

<!-- 				<div class="row p-0 " > -->
<!-- 					<div class="col-4 m-0 border border-white "> -->
<%-- 						<img class="img-fluid mx-auto p-0" src="/images/ship/${shipNum}/${recentlyBoardFileS[1].boardFileSaveName}" alt="..." /> --%>
<!-- 					</div> -->
<!-- 					<div class="col-4 m-0 border border-white"> -->
<%-- 						<img class="img-fluid mx-auto p-0" src="/images/ship/${shipNum}/${recentlyBoardFileS[4].boardFileSaveName}" alt="..." /> --%>
<!-- 					</div> -->
<!-- 					<div class="col-4 m-0 border border-white"> -->
<%-- 						<img class="img-fluid mx-auto p-0" src="/images/ship/${shipNum}/${recentlyBoardFileS[2].boardFileSaveName}" alt="..." /> --%>
<!-- 					</div> -->
<!-- 				</div> -->


<!-- 			</div>				 -->
<!-- 	</div> -->

	<div class="card border-0 rounded-0">
		<div class="card-header border-0 bg-white border-bottom mx-0 my-1 px-0 py-1">

			<div class="row ms-0 ps-0" style="float: none; margin: 0 auto;">
				<div class="col pb-1" style="float: none; margin: auto 0;">현재 접속중</div>
			</div>

		</div>

		<div class="card-body p-0">
			<div class="row m-0 p-0" style="float: none; margin: 0 auto;">
				<div class="col-12 m-0 p-0">
					<div class="row m-0 p-0 border border-white">

						<c:forEach var="oCrew" items="${ oCrews }">
							<c:if test="${ oCrew ne null }">
								<div class="row m-0 px-0 py-2 border-bottom">
									<div class="row m-0 p-0 ">
	
										<div class="col-2 ms-1 p-0 justify-content-center">
										<c:if test="${ oCrew.crewPhoto == 'default' }">
											<img class="img-fluid rounded-circle" style="width: 40; height: 40; position:;" src="/images/defaultPhoto.jpg" alt="...">										
										</c:if>
										
										<c:if test="${ oCrew.crewPhoto != 'default' }">
											<img class="img-fluid rounded-circle" style="width: 40; height: 40; position:;" src="/images/ship/${shipNum }/${oCrew.crewPhoto}" alt="...">										
										</c:if>
											
										</div>
	
										<div class="row col-5 ms-1 p-0 d-flex align-items-center">
											<div class="col-12 m-0 p-0">${oCrew.crewNickname}</div>
										</div>
	
										<div class="row col-3 ms-1 p-0 d-flex align-items-center">
											<div class="col-12 m-0 p-0">${oCrew.crewRole}</div>
										</div>
										<div class="row col-1 ms-1 p-0"></div>
	
										<div class="row col-1 ms-1 p-0 d-flex align-items-center">
											<div class="col-12 m-0 p-0">
												<i class="bi bi-circle-fill" style="color: #67c99b;"></i>
											</div>
										</div>
	
									</div>
								</div>	
							</c:if>
						</c:forEach>


<!-- 						<div class="row m-0 px-0 py-2 border-bottom">
							<div class="row m-0 p-0 ">

								<div class="col-2 ms-1 p-0 justify-content-center">
									<img class="img-fluid rounded-circle" style="width: 40; height: 40; position:;" src="/images/ship/2/김태리.jpg" alt="...">
								</div>

								<div class="row col-5 ms-1 p-0 d-flex align-items-center">
									<div class="col-12 m-0 p-0">테스트</div>
								</div>

								<div class="row col-3 ms-1 p-0 d-flex align-items-center">
									<div class="col-12 m-0 p-0">테스트</div>
								</div>
								<div class="row col-1 ms-1 p-0"></div>

								<div class="row col-1 ms-1 p-0 d-flex align-items-center">
									<div class="col-12 m-0 p-0">
										<i class="bi bi-circle-fill" style="color: #67c99b;"></i>
									</div>
								</div>

							</div>
						</div> -->


					</div>
				</div>
			</div>
		</div>

	</div>

</div>