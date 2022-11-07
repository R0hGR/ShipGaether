<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.net.URLDecoder"%>

<head>
<link rel="stylesheet" href=<c:url value="/css/login.css" />>
</head>

<!-- <div class="login-div"> -->
<div class="login-container" id="container">
   <div class="form-container sign-in-container">
      <form action="#" class="login-form" id="login-form">
         <h1 class="login-h1">SHIP GAETHER</h1>
         <div class="social-container">
            <a href="https://kauth.kakao.com/oauth/authorize?client_id=4f7b60afb6a5f48d4ab9c342916ecfb2&redirect_uri=http://127.0.0.1:8080/user/kakao/callback&response_type=code" class="social login-a"><img src="/images/kakao.png" width="40" height="40" border="0" /></a>
            <a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=PmDK4uSWc9qq8rZ1axUY&redirect_uri=http://127.0.0.1:8080/user/naver/callback&state=oauth_state" class="social login-a"><img src="/images/naver.png" width="40" height="40" border="0" /></a>
         </div>
         <!--          <span class="login-span mb-2">or use your account</span> -->
         <div class="row w-100 p-0 mt-3">
            <div class="col-12 p-0">
               <input id="loginUsrId" name="loginUsrId" class="login-input" type="email" placeholder="ID" />
            </div>
            <div class="signup-validation text-danger text-sm-start col-12" style="height: 20px">
               <span id="span-loginUsrId"></span>
            </div>
         </div>
         <div class="row w-100 p-0">
            <div class="col-12 p-0"> 
               <input id="loginUsrPwd" name="loginUsrPwd" class="login-input" type="password" placeholder="Password"  onkeydown="if( event.keyCode == 13 ){login();}" />
            </div>
            <div class="signup-validation text-danger text-sm-start col-12" style="height: 20px">
               <span id="span-loginUsrPwd"></span>
            </div>
         </div>
         <div>
            <a class="login-a" onclick="loginTofind()">아이디</a> <span class="login-a" id="findPwd_modal_open_btn">/</span> <a class="login-a" onclick="loginTofind()">비밀번호찾기</a> <a class="login-a" onclick="loginToSignUp()">회원가입</a>
         </div>
         <input type="button" class="login-btn" value="로그인" onclick="login()" /> 
      </form>
   </div>
</div>
