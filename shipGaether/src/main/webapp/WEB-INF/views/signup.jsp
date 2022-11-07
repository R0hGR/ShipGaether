<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.net.URLDecoder"%>

<head>
<link rel="stylesheet" href="/css/login.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>


<div class="signup-container">
	<div class="form-container sign-in-container">
		<form id="sign" name="sign" action="/signUp" class="login-form" method="post">
			<h2 class="login-title">Create Account</h2>
			<div class="social-container">
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=4f7b60afb6a5f48d4ab9c342916ecfb2&redirect_uri=http://127.0.0.1:8080/user/kakao/callback&response_type=code" class="social login-a"><img src="/images/kakao.png" width="40" height="40" border="0" /></a>
				<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=PmDK4uSWc9qq8rZ1axUY&redirect_uri=http://127.0.0.1:8080/user/naver/callback&state=oauth_state" class="social login-a"><img src="/images/naver.png" width="40" height="40" border="0" /></a>
			</div>
			<span class="login-span my-2">or create your account</span>
			<!-- <span class="login-span">or use your email for registration</span> -->

			<!-- 아이디 -->
			<div class="row w-100 p-0">
				<div class="col-3 p-0 align-self-center">아이디</div>
				<div class="col-6 p-0">
					<input class="login-input" id="signUsrId" name="usrId" placeholder="ID" onblur="checkId()" />
				</div>
				<div class="col-2 p-0 align-self-center text-center" style="justify-content: center; display: flex; align-items: center; background-color: #EEEEEE; height: 40px">
					<button class="btn-verification-number p-0" style="width: 70px; height: 30px;" type="button" onclick="checkDupId('sign')">중복확인</button>
				</div>
				<div class="col-3" style="height: 20px"></div>
				<div class="signup-validation text-danger text-sm-start col-7">
					<span id="span-usrId"></span>
					<!-- 경고글-->
				</div>
			</div>
			<!-- 비밀번호 -->
			<div class="row w-100 p-0">
				<div class="col-3 p-0 align-self-center">비밀번호</div>
				<div class="col-8 p-0">
					<input class="login-input" id="signUsrPwd" type="password" name="usrPwd" placeholder="Password" onblur="checkPwd('sign')" />
				</div>
				<div class="col-3" style="height: 20px"></div>
				<div class="signup-validation text-danger text-sm-start col-7">
					<span id="span-usrPwd"></span>
				</div>
			</div>
			<!-- 비밀번호확인 -->
			<div class="row w-100 p-0">

				<div class="col-3 p-0 align-self-center">비밀번호 확인</div>
				<div class="col-8 p-0">
					<input class="login-input" type="password" id="signUsrPwd2" name="usrPwd2" placeholder="Password" onblur="comparePwd('sign')" />
				</div>
				<div class="col-3" style="height: 20px"></div>
				<div class="signup-validation text-danger text-sm-start col-7">
					<span id="span-usrPwd2"></span>
				</div>
			</div>
			<!-- 이름 -->
			<div class="row w-100 p-0">
				<div class="col-3 p-0 align-self-center">이름</div>
				<div class="col-8 p-0">
					<input class="login-input" type="text" id="signUsrName" name="usrName" placeholder="Name" onblur="checkName()" />
				</div>
				<div class="col-3" style="height: 20px"></div>
				<div class="signup-validation text-danger text-sm-start col-7">
					<span id="span-usrName"></span>
				</div>
			</div>
			<!-- 닉네임 -->
			<div class="row w-100 p-0">
				<div class="col-3 p-0 align-self-center">닉네임</div>
				<div class="col-8 p-0">
					<input class="login-input" type="text" id="signUsrNickname" name="usrNickname" placeholder="Nickname" onblur="checkNickname()" />
				</div>
				<div class="col-3" style="height: 20px"></div>
				<div class="signup-validation text-danger text-sm-start col-7">
					<span id="span-usrNickname"></span>
				</div>
			</div>
			<!-- 생년월일 -->
			<div class="row w-100 p-0">
				<div class="col-3 p-0 align-self-center">생년월일</div>
				<div class="col-3 p-0">
					<div class="login-birth-div">
						<input class="col-sm-5" size="20" type="text" id="signUsrYear" name="usrYear" placeholder="년(4자) " maxlength="4" onblur="checkBirth()"> <select class="col-sm-4" id="signUsrMonth" name="usrMonth" onchange="checkBirth()">
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
						</select> <input class="col-sm-3" type="text" id="signUsrDay" name="usrDay" placeholder="일" maxlength="4" onblur="checkBirth()"> <input type="hidden" id="signUsrBirth" name="usrBirth">
					</div>
				</div>
				<!-- 도시 -->
				<div class="col-3 p-0 align-self-center">시/도</div>
				<div class="col-2 p-0">
						<select class="login-input" name="usrCity" onchange="getTowns(this)">
							<c:forEach var="item" items="${ cities }" varStatus="status">
								<option value="${ item.cityNum }">${ item.cityName }</option>
							</c:forEach>
						</select>
				</div>

				<div class="col-3" style="height: 20px"></div>
				<div class="signup-validation text-danger text-sm-start col-6">
					<span id="span-usrBirth"></span>
				</div>
			</div>
			<!-- 성별 -->
			<div class="row w-100 p-0">
				<div class="col-3 p-0 align-self-center">성별</div>
				<div class="col-3 p-0">
					<select class="login-input" id="signUsrGender" name="usrGender" onchange="checkGender()">
						<option value="0">성별</option>
						<option value="female">여자</option>
						<option value="male">남자</option>
					</select>
				</div>
				<!-- 군/구 -->
				<div class="col-3 p-0 align-self-center">군/구</div>
				<div class="col-2 p-0">
					<select class="login-input" id="signUsrTown" name="usrTown" onchange="getDongs(this)">
						<option value="0">상관없음</option>
					</select>
				</div>
				<div class="col-3" style="height: 20px"></div>
				<div class="signup-validation text-danger text-sm-start col-6">
					<span id="span-usrGender"></span>
				</div>
			</div>
			<!-- 인증방식 -->
			<div class="row w-100 p-0">
				<div class="col-3 p-0 align-self-center">인증방식</div>
				<div class="col-3 p-0">
					<select class="login-input" id="signUsrRegistType" name="usrRegistType" onchange="checkUsrRegistType()">
						<option value="0">필수선택</option>
						<option value="email">이메일</option>
						<option value="phone">휴대전화</option>
					</select>
				</div>
				<script>

				</script>
				<!-- 읍/면/동 -->
				<div class="col-3 p-0 align-self-center">읍/면/동</div>
				<div class="col-2 p-0">
					<select class="login-input" id= "signUsrDong" name="usrDong">
								<option value="0">읍/면/동</option>
					</select>
				</div>
				<div class="col-3" style="height: 20px"></div>

				<div class="signup-validation text-danger text-sm-start col-6">
					<span id="span-usrRegistType"></span>
				</div>

			</div>

			<!-- 이메일로 인증하기 -->
			<div class="w-100 p-0 m-0" id="registTypeE" style="display: none">
				<div class="row w-100 p-0 m-0">
					<div class="col-3 p-0 align-self-center">이메일</div>
					<div class="col-6 p-0">
						<input class="login-input" id="signUsrEmail" name="usrEmail" placeholder="Email" onblur="checkEmail('sign')" />
					</div>
					<div class="col-2 p-0 align-self-center text-center" style="justify-content: center; display: flex; align-items: center; background-color: #EEEEEE; height: 40px">
						<button class="btn-verification-number p-0" style="width: 70px; height: 30px;" type="button" onclick="checkDupEmail('sign')">인증하기</button>
					</div>
					<div class="col-3" style="height: 20px"></div>
					<div class="signup-validation text-danger text-sm-start col-7">
						<span id="span-usrEmail"></span>
					</div>
				</div>
				<div class="row w-100 p-0 m-0">
					<div class="col-3 p-0 align-self-center">인증번호</div>
					<div class="col-6 p-0">
						<input class="login-input" id="signUsrEmailCode" name="usrEmailCode" placeholder="Code" />
					</div>
					<div class="col-2 p-0 align-self-center text-center" style="justify-content: center; display: flex; align-items: center; background-color: #EEEEEE; height: 40px">
						<button class="btn-verification-number p-0" style="width: 70px; height: 30px;" type="button" onclick="compareUsrEmailCode('sign')">확인</button>
					</div>
					<div class="col-3" style="height: 20px"></div>
					<div class="signup-validation text-danger text-sm-start col-7">
						<span id="span-usrEmailCode"></span> <input type="hidden" id="signEmailCode" name="usrEmailCode">
					</div>
				</div>

				<div class="row w-100 p-0 m-0">
					<div class="col-3 p-0 align-self-center">휴대전화 번호</div>
					<div class="col-8 p-0">
						<input class="login-input" id="signUsrEmailPhone" name="usrEmailPhone" placeholder="Phone" onblur="checkEmailPhone()" />
					</div>

					<div class="col-3" style="height: 20px"></div>
					<div class="signup-validation text-danger text-sm-start col-7">
						<span id="span-usrEmailPhone"></span>
					</div>
				</div>
			</div>

			<!-- 휴대폰번호 인증하기 -->
			<div class="w-100 p-0 m-0" id="registTypeC" style="display: none">
				<div class="row w-100 p-0 m-0">
					<div class="col-3 p-0 align-self-center">휴대전화 번호</div>
					<div class="col-6 p-0">
						<input class="login-input" id="signUsrPhone" name="usrPhone" placeholder="Phone" onblur="checkPhone('sign')" />
					</div>
					<div class="col-2 p-0 align-self-center text-center" style="justify-content: center; display: flex; align-items: center; background-color: #EEEEEE; height: 40px">
						<button class="btn-verification-number p-0" style="width: 70px; height: 30px;" type="button" onclick="checkDupPhone('sign')">인증하기</button>
					</div>
					<div class="col-3" style="height: 20px"></div>
					<div class="signup-validation text-danger text-sm-start col-7">
						<span id="span-usrPhone"></span>
					</div>
				</div>
				<div class="row w-100 p-0 m-0">
					<div class="col-3 p-0 align-self-center">인증번호</div>
					<div class="col-6 p-0">
						<input class="login-input" id="signUsrPhoneCode" name="usrPhoneCode" placeholder="Code" />
					</div>
					<div class="col-2 p-0 align-self-center text-center" style="justify-content: center; display: flex; align-items: center; background-color: #EEEEEE; height: 40px">
						<button class="btn-verification-number p-0" style="width: 70px; height: 30px;" type="button" onclick="compareUsrPhoneCode('sign')">확인</button>
					</div>
					<div class="col-3" style="height: 20px"></div>
					<div class="signup-validation text-danger text-sm-start col-7">
						<span id="span-usrPhoneCode"></span> <input type="hidden" id="signPhoneCode" name="usrPhoneCode">
					</div>
				</div>
				<div class="row w-100 p-0 m-0">
					<div class="col-3 p-0 align-self-center">이메일</div>
					<div class="col-8 p-0">
						<input class="login-input" id="signUsrPhoneEmail" name="usrPhoneEmail" placeholder="Email" onblur="checkPhoneEmail()" />
					</div>

					<div class="col-3" style="height: 20px"></div>
					<div class="signup-validation text-danger text-sm-start col-7">
						<span id="span-usrPhoneEmail"></span>
					</div>
				</div>
			</div>
			
			<div>
				<span class="login-a" >이미 회원이신가요 ?</span> <a href="#" class="login-a" onclick="signUpToLogin()">로그인으로..</a>
			</div>
			<input type="button" class="signup-btn" value="Sign Up" onclick="finalCheck()" />
		</form>
	</div>
</div>
