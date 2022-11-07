<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<%@include file="../header.jsp"%>


</head>
<body>
	<div class="row h-100" style="padding-top: 72px;">
		<main class="col-12 p-0"
			style="overflow: visible; background-color: #F4F4F4;">
			<div class="row mt-0"
				style="border-top: 0.1mm solid #E2E2E2; background-color: #F4F4F4; padding-left: 25%; padding-right: 20%;">
				<div class="searchresult">
					<h5 class="sectionTitle m-4">검색결과 ${ countShips }</h5>
				</div>
				<!-- searchList -->

				<div id="searchShip" class="row mb-3">

					<c:forEach var="ship" items="${ship}" varStatus="status">
						<div class="col-6">
							<div class="card border-0" style="background-color: #F4F4F4">
								<div class="row">
									<div class="col-3">
										<c:choose>
											<c:when test="${ship.shipSample==1 }">
												<img class="img-fluid rounded-2"
													style="float: left; width: 100; height: 100; position:;"
													src="/images/ship/${ ship.shipNum }/${ ship.shipPhotoName }"
													alt="..." />
											</c:when>
											<c:otherwise>
												<img class="img-fluid rounded-2"
													style="float: left; width: 100; height: 100; position:;" 
													src="/images/ship/sample/${ ship.shipSampleName }"
													class="card-img-top" alt="...">
											</c:otherwise>
										</c:choose>
									</div>
									<div class="col-9">
										<div class="card-body p-0">
											<p class="fw-bold mb-1"
												style="font-size: 1.2em; cursor: pointer"
												onclick="location.href='/ship/${ ship.shipNum }';">${ship.shipName }</p>
											<p class="text mb-2 wordOneline"
												style="color: #0000008c; font-size: 14px">
												${ship.shipTitle}</p>
											<ul class="keyWordList">
												<li class="keyWordItem"><span
													style="border: 1px solid #e6e6e6; padding: 3 10px; border-radius: 100px; background-color: #fff; font-size: 13px";>
														<i class="bi bi-geo-alt-fill"></i>
														${city[status.index].cityName} |
														${town[status.index].townName} |
														${dong[status.index].dongName}
												</span></li>
												<li class="keyWordItem" style="display: inline-block;">
												</li>
												<p class="text ms-2 wordOneline"
													style="color: #0000008c; font-size: 11; line-height: 2.5;">
													멤버 ${ship.shipCount } | 리더 ${ship.shipCaptain }</p>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

					<%--	
					<div class="row mb-3">				
						<div class="card border-0" style="background-color: #F4F4F4">
							<div class="row" >
								<div class="col-auto">
									<img class="img-fluid rounded-2"				
										style="float:left; width: 100; height: 100; position:;"
										src="/images/comic.png" alt="..." />
							</div>
							<div class="col-9">
								<div class="card-body p-0">
										<p class="fw-bold mb-1" style="font-size: 1.2em">Ship Name</p>
										<p class="text mb-2 wordOneline" style="color: #0000008c; font-size: 14px">
										Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
										Phasellus sapien sem, tempus in imperdiet vel, ultricies vitae dolor. </p>
										<a class="btn border rounded-5 btn-outline-white p-0"
											style="background-color: white" href=""> <span
											class="fw-bolder ms-2" style="font-size: 11px;">ShipName</span>
											<span style="font-size: 11px;">Ship 더보기</span> <span
											class="me-2" style="font-size: 11px; color: #CECECE;">
												></span></a>
										<p class="text mb-2 wordOneline" style="color: #0000008c; font-size: 11; line-height: 2.5;"> 멤버 1234 | 리더 ship </p>
									</div>
								</div>
							</div>
						</div>
					</div>		
				 --%>
		</main>
	</div>




</body>
</html>