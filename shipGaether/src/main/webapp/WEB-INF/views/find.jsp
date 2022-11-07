<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.net.URLDecoder"%>

<head>
<link rel="stylesheet" href="/css/login.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>


<div class="signup-container" style="height: 500px;">
	<div class="form-container sign-in-container">
		<form id="find-form" name="find" action="/find" class="login-form" method="post">
			<h2 class="login-title">회원정보 찾기</h2>
			
<!-- 			첫번째줄 -->
			<!-- 아이디찾기 / 비번찾기 -->
			<div class="row w-100 p-0">
				<div class="col-2 p-0 align-self-center">찾을 정보</div>
				<div class="col-3 p-0">
					<select class="login-input" id="findInfo" name="findInfo" onchange="selectFindInfo()">
						<option value="0">필수선택</option> 
						<option value="findId">아이디찾기</option>
						<option value="findPwd">비밀번호찾기</option>
					</select>
				</div> 
				<script>
					
				</script>
				<!-- 찾을 방식 -->
				<div class="col-3 p-0 align-self-center">인증 방식</div>
				<div class="col-3 p-0">
					<select class="login-input" id="findType" name="findType" onchange="selectFindType()">
						<option value="0">필수 선택</option>
						<option value="ByUsrEmail">등록이메일로 찾기</option>
						<option value="ByUsrPhone">등록핸드폰으로 찾기</option>
					</select>
				</div>
				<div class="col-2" style="height: 20px"></div>

				<div class="signup-validation text-danger float-sm-start text-sm-start col-6">
					<span id="span-findInfo"></span>
				</div>
				
				<div class="signup-validation text-danger float-sm-end text-sm-start  col-4" > 
					<span id="span-findType"></span>
				</div>
			</div>
<!-- 첫번째줄끝 -->

<!-- 아이디를 이메일로 찾기 -->
			<div class="w-100 p-0 m-0" id="findIdByUsrEmail" style="display: none">			
				<div class="row w-100 p-0 m-0">
					<div class="col-2 p-0 align-self-center">이메일</div>
					<div class="col-7 p-0">
						<input class="login-input" id="findIdUsrEmail" name="findIdUsrEmail" placeholder="Email" onblur="checkEmail('findId')" />
					</div>
					<div class="col-2 p-0 align-self-center text-center" style="justify-content: center; display: flex; align-items: center; background-color: #EEEEEE; height: 40px">
						<button class="btn-verification-number p-0" style="width: 70px; height: 30px;" type="button" onclick="checkDupEmail('findId')">인증하기</button>
					</div>
					<div class="col-2" style="height: 20px"></div>
					<div class="signup-validation text-danger text-sm-start col-8">
						<span id="span-findIdUsrEmail"></span>
					</div>
				</div>
				<div class="row w-100 p-0 m-0">
					<div class="col-2 p-0 align-self-center">인증번호</div>
					<div class="col-7 p-0">
						<input class="login-input" id="findIdUsrEmailCode" name="findIdUsrEmailCode" placeholder="Code" />
						<input type="hidden" id="findIdEmailCode" name="usrEmailCode">
					</div>
					<div class="col-2 p-0 align-self-center text-center" style="justify-content: center; display: flex; align-items: center; background-color: #EEEEEE; height: 40px">
						<button class="btn-verification-number p-0" style="width: 70px; height: 30px;" type="button" onclick="compareUsrEmailCode('findId')">확인</button>
					</div>
					<div class="col-2" style="height: 20px"></div>
					<div class="signup-validation text-danger text-sm-start col-8">
						<span id="span-findIdUsrEmailCode"></span> 
					</div>
				</div>		

			</div>
<!-- 아이디를 이메일로 찾기 끝 -->

<!-- 아이디를 휴대폰으로 찾기 -->
			<div class="w-100 p-0 m-0" id="findIdByUsrPhone" style="display: none">			
				<div class="row w-100 p-0 m-0">
					<div class="col-2 p-0 align-self-center">핸드폰번호</div>
					<div class="col-7 p-0">
						<input class="login-input" id="findIdUsrPhone" name="findIdUsrPhone" placeholder="Phone" />
					</div>
					<div class="col-2 p-0 align-self-center text-center" style="justify-content: center; display: flex; align-items: center; background-color: #EEEEEE; height: 40px">
						<button class="btn-verification-number p-0" style="width: 70px; height: 30px;" type="button" onclick="checkDupPhone('findId')">인증하기</button>
					</div>
					<div class="col-2" style="height: 20px"></div>
					<div class="signup-validation text-danger text-sm-start col-8">
						<span id="span-findIdUsrPhone"></span>
					</div>
				</div>
				<div class="row w-100 p-0 m-0">
					<div class="col-2 p-0 align-self-center">인증번호</div>
					<div class="col-7 p-0">
						<input class="login-input" id="findIdUsrPhoneCode" name="findIdUsrPhoneCode" placeholder="Code" />
						<input type="hidden" id="findIdPhoneCode" name="usrPhoneCode">
					</div>
					<div class="col-2 p-0 align-self-center text-center" style="justify-content: center; display: flex; align-items: center; background-color: #EEEEEE; height: 40px">
						<button class="btn-verification-number p-0" style="width: 70px; height: 30px;" type="button" onclick="compareUsrPhoneCode('findId')">확인</button>
					</div>
					<div class="col-3" style="height: 20px"></div>
					<div class="signup-validation text-danger text-sm-start col-7">
						<span id="span-findIdUsrPhoneCode"></span> 
					</div>
				</div>				

			</div>
<!-- 아이디를 휴대폰으로 찾기 끝 -->

<!-- 찾은아이디 -->
				<div class="row w-100 p-0 m-0"  id="foundIdDiv" style="display: none">
					<div class="col-2 p-0 align-self-center">찾은 아이디</div>
					<div class="col-7 p-0">
						<input class="login-input text-primary" id="foundId" name="foundId" placeholder="찾은아이디" />
					</div>
					<div class="col-2 p-0 align-self-center text-center" style="justify-content: center; display: flex; align-items: center; background-color: #EEEEEE; height: 40px">
						<button onclick="findToLogin($('#foundId').val())" class="btn-verification-number p-0" style="width: 70px; height: 30px;" type="button" >로그인하기</button>
					</div>

					<div class="col-3" style="height: 20px"></div>
					<div class="signup-validation text-danger text-sm-start col-7">
						<span id="span-foundIdByEmail"></span>
					</div>
				</div>
<!-- 찾은아이디 끝 -->

<!-- 비밀번호 찾기 -->
			<div class="w-100 p-0 m-0" id="findPwd" style="display: none"> 
			
				<!--아이디 -->
				<div class="row w-100 p-0 m-0">
					<div class="col-2 p-0 align-self-center">아이디</div>
					<div class="col-7 p-0">
						<input class="login-input" id="findPwdUsrId" name="findPwdUsrId" placeholder="ID"  />
					</div>
					<div class="col-2 p-0 align-self-center text-center" style="justify-content: center; display: flex; align-items: center; background-color: #EEEEEE; height: 40px">
						<button class="btn-verification-number p-0" style="width: 70px; height: 30px;" type="button" onclick="checkDupId('findPwd')">중복확인</button>
					</div>
					<div class="col-3" style="height: 20px"></div>
					<div class="signup-validation text-danger text-sm-start col-7">
						<span id="span-findPwdusrId"></span>
						<!-- 경고글-->
					</div>
				</div>
				
				<!-- 1)이메일로 비번찾기 -->
				<div id="findPwdByUsrEmail">
					<!-- 이메일  -->
					<div class="row w-100 p-0 m-0">
						<div class="col-2 p-0 align-self-center">이메일</div>
						<div class="col-7 p-0">
							<input class="login-input" id="findPwdUsrEmail" name="findPwdUsrEmail" placeholder="Email" onblur="checkEmail('findId')" />
						</div>
						<div class="col-2 p-0 align-self-center text-center" style="justify-content: center; display: flex; align-items: center; background-color: #EEEEEE; height: 40px">
							<button class="btn-verification-number p-0" style="width: 70px; height: 30px;" type="button" onclick="checkDupEmail('findPwd')">인증하기</button>
						</div>
						<div class="col-3" style="height: 20px"></div>
						<div class="signup-validation text-danger text-sm-start col-7">
							<span id="span-findPwdUsrEmail"></span>
						</div>
					</div>
					<!-- 이메일 인증번호  -->
					<div class="row w-100 p-0 m-0">
						<div class="col-2 p-0 align-self-center">인증번호</div>
						<div class="col-7 p-0">
							<input class="login-input" id="findPwdUsrEmailCode" name="findPwdUsrEmailCode" placeholder="Code" /> <input type="hidden" id="findPwdEmailCode" name="usrEmailCode">
						</div>
						<div class="col-2 p-0 align-self-center text-center" style="justify-content: center; display: flex; align-items: center; background-color: #EEEEEE; height: 40px">
							<button class="btn-verification-number p-0" style="width: 70px; height: 30px;" type="button" onclick="compareUsrEmailCode('findPwd')">확인</button>
						</div>
						<div class="col-3" style="height: 20px"></div>
						<div class="signup-validation text-danger text-sm-start col-7">
							<span id="span-findPwdUsrEmailCode"></span>
						</div>
					</div>
				</div>
				
				<!-- 2)휴대폰번호로 비번찾기 -->
				<div id="findPwdByUsrPhone">
					<!-- 휴대폰번호 -->
					<div class="row w-100 p-0 m-0">
						<div class="col-2 p-0 align-self-center">휴대전화</div>
						<div class="col-7 p-0">
							<input class="login-input" id="findPwdUsrPhone" name="findPwdUsrPhone" placeholder="Phone" onblur="checkPhone('findPwd')" />
						</div>
						<div class="col-2 p-0 align-self-center text-center" style="justify-content: center; display: flex; align-items: center; background-color: #EEEEEE; height: 40px">
							<button class="btn-verification-number p-0" style="width: 70px; height: 30px;" type="button" onclick="checkDupPhone('findPwd')">인증하기</button>
						</div>
						<div class="col-7" style="height: 20px"></div>
						<div class="signup-validation text-danger text-sm-start col-7">
							<span id="span-usrPhone"></span>
						</div>
					</div>
					<!-- 휴대폰 인증번호 -->
					<div class="row w-100 p-0 m-0">
						<div class="col-2 p-0 align-self-center">인증번호</div>
						<div class="col-7 p-0">
							<input class="login-input" id="findPwdUsrPhoneCode" name="usrPhoneCode" placeholder="Code" />
							<input type="hidden" class="login-input" id="findPwdPhoneCode" name="usrPhoneCode" placeholder="Code" />
						</div>
						<div class="col-2 p-0 align-self-center text-center" style="justify-content: center; display: flex; align-items: center; background-color: #EEEEEE; height: 40px">
							<button class="btn-verification-number p-0" style="width: 70px; height: 30px;" type="button" onclick="compareUsrPhoneCode('findPwd')">확인</button>
						</div>
						<div class="col-3" style="height: 20px"></div>
						<div class="signup-validation text-danger text-sm-start col-7">
							<span id="span-usrPhoneCode"></span> <input type="hidden" id="signPhoneCode" name="usrPhoneCode">
						</div>
					</div>
						
				</div>

				<!-- 비밀번호 -->
				
				<div class="row w-100 p-0 m-0">
					<div class="col-2 p-0 align-self-center">비밀번호</div>
					<div class="col-9 p-0">
						<input class="login-input" id="findPwdUsrPwd" type="password" name="usrPwd" placeholder="Password" onblur="checkPwd('findPwd')" />
					</div>
					
					<div class="col-3" style="height: 20px"></div>
					<div class="signup-validation text-danger text-sm-start col-7">
						<span id="span-findPwdUsrPwd"></span>
					</div>
				</div>
				<!-- 비밀번호확인 -->
				<div class="row w-100 p-0 m-0">
					<div class="col-2 p-0 align-self-center">비밀번호 확인</div>
					<div class="col-7 p-0">
						<input class="login-input" type="password" id="findPwdUsrPwd2" name="usrPwd2" placeholder="Password"  />
					</div>
					<div class="col-2 p-0 align-self-center text-center" style="justify-content: center; display: flex; align-items: center; background-color: #EEEEEE; height: 40px">
						<button class="btn-verification-number p-0" style="width: 70px; height: 30px;" type="button" onclick="comparePwd('findPwd')">변경하기</button>
					</div>
					<div class="col-3" style="height: 20px"></div>
					<div class="signup-validation text-danger text-sm-start col-7">
						<span id="span-findPwdUsrPwd2"></span>
					</div>
				</div>				


			</div>

<!-- 비밀번호를 이메일로 찾기 끝 -->


			<input type="button" class="signup-btn" value="닫기" onclick="closeFindModal()"/>
		</form>
	</div>
</div>
