<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<%@include file="../header.jsp"%>
<style>
.basic-photo {
	display: grid;
	grid-template-columns: 33% 33% 33%;
	grid-template-rows: 50% 50% ;
}

.basic-gender {
	display: grid;
	grid-template-columns: 33% 33% 33%;
	grid-template-rows: 100% ;
}
.basic-open {
	display: grid;
	grid-template-columns: 50% 50%;
	grid-template-rows: 100% ;
}


</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body >
	<div class="row h-100" style="padding-top: 72px; ">
	<form id="makeShip-form" action="/ship/makeShip.do" method="post" enctype="multipart/form-data">  
		<div class="d-flex flex-column justify-content-between py-5" style=" border-top: 0.1mm solid #E2E2E2; height: 120%;background-color: #F4F4F4; padding-left: 30%; padding-right: 30%;">
		<!-- form-makeShip -->
			
			
				<!-- 모임 이름 -->
				<div style="width:100%;">
					<label class="m-2">	SHIP(모임) 이름</label> 
					<input id="makeShipShipName" name="shipName" class="form-control" style="width: 50%;" placeholder="ex) 모임은 쉽게더" /> 
				</div>
				<!-- 모임 소개 -->
				<div style="width: 100%;">
					<label class="m-2">SHIP 소개</label> 
					<input id="makeShipShipTitle" name="shipTitle" class="form-control" style="width: 100%;" placeholder="ex) 주니어 개발자들의 모임입니다" value=""/>
				</div>			
				<!-- 모임 대표사진 -->
				<div style="width: 100%; " >
					<label class="m-2">SHIP 포토</label>
					<div class="d-flex flex-row ">
						<div class="col-5 pe-3">
							<p class="signup-validation text-sm-start mb-0 ps-2" >미리보기</p>
						</div>
						<div class="col-7">
							<p class="signup-validation text-sm-start mb-0 ps-1" >기본제공사진</p> 
						</div>
						
					</div> 
					
					<div class="d-flex flex-row justify-content-between" >
						<!-- 모임 대표사진 큰사진 -->
						<div class="align-self-stretch col-5 pe-3 ps-2 " > 
							<img id="makeShipBigPhoto" class="rounded-3" src="" width="100%" height="100%" alt="큰사진">
							
							<input type="hidden" id="makeShipSample" name="shipSample" value="0" />
							<input id="uploadShipPhoto"  name="shipPhotoFile" type="file" accept="image/png, image/gif, image/jpeg" style="display: none;" onchange="checkPhoto(this)" />
							<input id="makeShipShipPhoto" type="hidden" name="shipSampleName" value="0">
							
						</div>
						<!-- 모임 대표사진 6개 그리드 -->
						<div class="col-7 basic-photo" style=" float: left;" >
							<button class="btn btn-outline-dark m-1 p-0" type="button" >
								<img id="sample1" name="ship_photo_sample1.jpg" class="rounded-1" src="/images/ship/sample/upload2.png" width="100%" height="100%" alt="" onclick="$('#uploadShipPhoto').click();">								
							</button>
							<button class="btn btn-outline-dark m-1 p-0" type="button" >
								<img id="sample2" name="ship_photo_sample2.jpg" class="rounded-1" src="/images/ship/sample/ship_photo_sample2.jpg" width="100%" height="100%" alt="" onclick="changeBigPhoto(this)" >
							</button>
							<button class="btn btn-outline-dark m-1 p-0" type="button" >
								<img id="sample3" name="ship_photo_sample3.jpg" class="rounded-1" src="/images/ship/sample/ship_photo_sample3.jpg" width="100%" height="100%" alt="" onclick="changeBigPhoto(this)">
							</button>
							<button class="btn btn-outline-dark m-1 p-0" type="button" >
								<img id="sample4" name="ship_photo_sample4.jpg" class="rounded-1" src="/images/ship/sample/ship_photo_sample4.jpg" width="100%" height="100%" alt="" onclick="changeBigPhoto(this)">
							</button>
							<button class="btn btn-outline-dark m-1 p-0" type="button" >
								<img id="sample5" name="ship_photo_sample5.png" class="rounded-1" src="/images/ship/sample/ship_photo_sample5.png" width="100%" height="100%" alt="" onclick="changeBigPhoto(this)">
							</button>
							<button class="btn btn-outline-dark m-1 p-0" type="button" >
								<img id="sample6" name="ship_photo_sample6.jpg" class="rounded-1" src="/images/ship/sample/ship_photo_sample6.jpg" width="100%" height="100%" alt="" onclick="changeBigPhoto(this)">
							</button>
						</div>
					</div>
					<p class="signup-validation text-sm-start ps-2">밴드 프로필에 등록될 사진입니다.</p>
					<!--    -->
							
				</div>
				
				<!-- 모임 지역 -->
				<div style="width: 100%;">
					<label class="m-2">SHIP 주 활동 지역</label>
		
					<div class="d-flex flex-row justify-content-between w-100 p-0 m-0 ">
					
						<!-- 시/도 -->						
						<div class="col-3 p-0">
							<select class="login-input" id="makeShipCityNum" name="cityNum" onchange="getTowns(this)">
								<option value="0">시/도</option>
								<c:forEach var="item" items="${ cities }">
								 <option value="${ item.cityNum }">${ item.cityName }</option>
								</c:forEach>								 
							</select>
						</div>
						
						<!-- 군/구 -->						
						<div class="col-3 p-0">
							<select class="login-input" id="makeShipTownNum" name="townNum" onchange="getDongs(this)">
								<option value="0">군/구</option>
							</select>
						</div>
						
						<!-- 동 -->						
						<div class="col-3 p-0" >
							<select class="login-input" id= "makeShipDongNum" name="dongNum">
								<option value="0">읍/면/동</option>
							</select>
						</div>
					</div>
				</div>			
				
				
				<!-- 성별 제한-->
				<div style="width: 100%;">
					<label class="m-2">성별 제한</label>				
					<div class="col-12 basic-gender" style=" float: left;" >
						<input class="btn btn-outline-dark m-1 p-3" type="button" name="0" value="성별상관없음" onclick="changeLimitGender(this)"/>
						<input class="btn btn-outline-dark m-1 p-3" type="button" name="1" value="남자만" onclick="changeLimitGender(this)"/>
						<input class="btn btn-outline-dark m-1 p-3" type="button" name="2" value="여자만" onclick="changeLimitGender(this)"/>
						<input type="hidden" id="makeShipLimitGender" name="limitGender" value="" />
					</div>
				</div>
				
				<!-- 연령 제한-->
				<div style="width: 100%;">
					<label class="m-2">연령 제한</label> 
					<div class="d-flex flex-row justify-content-between w-100 p-0 m-0 " style=" float: left;" >
						<div class="col-4">
							<select class="login-input" id="makeShipLimitStatus" name="limitStatus" onchange="unlockAge(this)">
								<option value="0">연령제한없음</option>
								<option value="1">연령제한있음</option>
							</select>
						</div>
						<div class="col-3">
							<select class="login-input" id="makeShipLimitEnd" name="limitEnd" disabled="disabled">
								<option value="0">최대나이</option>
								<option value="1980-01-01" >1980</option>
								<option value="1981-01-01" >1981</option>
								<option value="1982-01-01" >1982</option>
								<option value="1983-01-01" >1983</option>
								<option value="1984-01-01" >1984</option>
								<option value="1985-01-01" >1985</option>
								<option value="1986-01-01" >1986</option>
								<option value="1987-01-01" >1987</option>
								<option value="1988-01-01" >1988</option>
								<option value="1989-01-01" >1989</option>
								<option value="1990-01-01" >1990</option>																
								<option value="1991-01-01" >1991</option>
								<option value="1992-01-01" >1992</option>
								<option value="1993-01-01" >1993</option>
								<option value="1994-01-01" >1994</option>
								<option value="1995-01-01" >1995</option>
								<option value="1996-01-01" >1996</option>
								<option value="1997-01-01" >1997</option>
								<option value="1998-01-01" >1998</option>
								<option value="1999-01-01" >1999</option>
								<option value="2000-01-01" >2000</option>
								<option value="2001-01-01" >2001</option>
								<option value="2002-01-01" >2002</option>
								<option value="2003-01-01" >2003</option>
								<option value="2004-01-01" >2004</option>
								<option value="2005-01-01" >2005</option>
								<option value="2006-01-01" >2006</option>
								<option value="2007-01-01" >2007</option>
								<option value="2008-01-01" >2008</option>
								<option value="2009-01-01" >2009</option>
								<option value="2010-01-01" >2010</option>
							</select>
						</div>						
						<div class="col-3">
							<select id="makeShipLimitStart" name="limitStart" class="login-input" disabled="disabled">
								<option value="0">최소나이</option>
								<option value="1980-01-01" >1980</option>
								<option value="1981-01-01" >1981</option>
								<option value="1982-01-01" >1982</option>
								<option value="1983-01-01" >1983</option>
								<option value="1984-01-01" >1984</option>
								<option value="1985-01-01" >1985</option>
								<option value="1986-01-01" >1986</option>
								<option value="1987-01-01" >1987</option>
								<option value="1988-01-01" >1988</option>
								<option value="1989-01-01" >1989</option>
								<option value="1990-01-01" >1990</option>																
								<option value="1991-01-01" >1991</option>
								<option value="1992-01-01" >1992</option>
								<option value="1993-01-01" >1993</option>
								<option value="1994-01-01" >1994</option>
								<option value="1995-01-01" >1995</option>
								<option value="1996-01-01" >1996</option>
								<option value="1997-01-01" >1997</option>
								<option value="1998-01-01" >1998</option>
								<option value="1999-01-01" >1999</option>
								<option value="2000-01-01" >2000</option>
								<option value="2001-01-01" >2001</option>
								<option value="2002-01-01" >2002</option>
								<option value="2003-01-01" >2003</option>
								<option value="2004-01-01" >2004</option>
								<option value="2005-01-01" >2005</option>
								<option value="2006-01-01" >2006</option>
								<option value="2007-01-01" >2007</option>
								<option value="2008-01-01" >2008</option>
								<option value="2009-01-01" >2009</option>
								<option value="2010-01-01" >2010</option>
							</select>
						</div>

					</div>				
				</div>
				
				<!-- 공개 여부-->
				<div style="width: 100%;">
					<label class="m-2">공개 여부</label>				
					<div class="col-12 basic-open" style=" float: left;" >					
						<input class="btn btn-outline-dark m-1 p-3 " type="button" name="1" value="공개" onclick="changeShipOpen(this)" />
						<input class="btn btn-outline-dark m-1 p-3" type="button" name="0" value="비공개" onclick="changeShipOpen(this)" />
						<input type="hidden" id="makeShipShipOpen" name="shipOpen" value=""/>
					</div>
				</div>
				
				
				
				<div style="width: 100%; text-align: center;">				
					<input type="button" class="signup-btn self-align-center" value="SHIP 만들기" onclick="checkMakeShip()">
				</div>
				
							
		</div>
		<input type="hidden" name="shipCaptain" value="${ sessionNickname }"/> 
		<input type="hidden" name="usrNum" value="${ sessionId }"/>
		</form>	
	</div>
	<script src="/js/makeShip.js"></script> 
</body>
</html>