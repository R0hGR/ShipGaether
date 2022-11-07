<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<script>
function colorChange(){
var bodytag = document.getElementById("div2");
bodytag.style.background=color[red];
}
</script>

<style>
.switch-button {
        position: relative;
        display: inline-block;
        width: 55px;
        height: 30px;
    }

    .switch-button input {
        opacity: 0;
        width: 0;
        height: 0;
    }

    .onoff-switch {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        border-radius:20px;
        background-color: #ccc;
        box-shadow: inset 1px 5px 1px #999;
        -webkit-transition: .4s;
        transition: .4s;
    }

    .onoff-switch:before {
        position: absolute;
        content: "";
        height: 22px;
        width: 22px;
        left: 4px;
        bottom: 4px;
        background-color: #fff;
        -webkit-transition: .5s;
        transition: .4s;
        border-radius:20px;
    }

    .switch-button input:checked + .onoff-switch {
        background-color: #F2D522;
        box-shadow: inset 1px 5px 1px #E3AE56;
    }

    .switch-button input:checked + .onoff-switch:before {
        -webkit-transform: translateX(26px);
        -ms-transform: translateX(26px);
        transform: translateX(26px);
    }
</style>

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
					<%@include file="mySettingSidebar.jsp"%>
				</div>

				<!-- main -->
				<main class="col-9 p-0" style="overflow: visible">
					<div class="col-10 p-0" style="background-color: white;">


						<div class="col-12 p-0 border border-black"
							style="float: none; margin: 0 auto;">
							<div class="row p-0">
								<div class="col-1 px-0 py-2" style="flex-direction: column;">
								</div>
								<div class="col-11 px-0 py-2" style="flex-direction: column;">쿠키설정</div>
							</div>
						</div>

						<div class="row p-3 border border-black"
							style="float: none; margin: 0 auto; font-size: 8pt; background-color: #d9dbdd">
							ship에서는 맞춤 서비스를 원활하게 제공해드리기 위하여, 웹 사이트 내 쿠키를 사용합니다. 여러분은 어떤 쿠키를
							ship에 제공할 지 선택하실 수 있습니다. 쿠키와 관련된 추가 내용은 개인정보처리방침을 확인해주세요.</div>

						<div class="row p-1 border border-white" style="float: none; margin: 0 auto;">
						
						<div class="col-6 p-2 border border-white">필수쿠키</div>
						<div class="col-6 p-2 border border-white d-flex justify-content-end">
						<label class="switch-button b-flex">
						<input type="checkbox"/>
					    <span class="onoff-switch"></span>
						</label>
						</div>
						

						
						
						<div class="col-6 p-2 border border-white">마케팅 쿠키</div>
						<div class="col-6 p-2 border border-white d-flex justify-content-end">
						<label class="switch-button b-flex">
						<input type="checkbox"/>
					    <span class="onoff-switch"></span>
						</label>
						</div>
						
						</div>
					</div>
				</main>
					</div>
			</div>
		</div>


</body>

</html>