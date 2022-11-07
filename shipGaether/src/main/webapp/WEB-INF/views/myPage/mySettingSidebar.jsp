<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="d-flex flex-column flex-shrink-0 p-0 bg-white"
	style="overflow: visible; position: fixed; width: 14%">
	<div>
		<ul class="nav nav-pills flex-column mb-auto">
			<li class="nav-item">
			<a href="/mySettingIndex" class="nav-link"  style=""page"> 
			 설정
			</a></li>

			<li><a href="/mySettingHelp/1" class="nav-link" onclick="colorChange()">
			도움말
			</a></li>

			<li><a href="/mySettingCookie" class="nav-link"  onclick="colorChange()">
			 쿠키설정
			</a></li>
			
			<li><a href="/mySettingEmail" class="nav-link"  onclick="colorChange()">
			이메일 알림 설정
			</a></li>

		</ul>

	</div>



	<div
		style="background-color: #e9ecef; padding-top: 20px; padding-left: 5px;">
		<a href="myPageIndex" class="MyPageIndex-link"> 
		<img
			src="../images/mypage.png" width="40" height="40" border="0"
			style="background-color: #e9ecef" /></a>
	</div>
	
	
	
	
	<!-- test -->
<!-- 	<style>
	 .active {
                background: orange;
    }
    .menu {
        background-color: yellowgreen;
    }
    
    
	</style>
	
	<div>
	
	
	<nav class="menu">
        <a href="Optionhelp_C1" class="nav-link" data-menu="1">menu 1</a>
        <a href="Optioncookie" class="nav-link" data-menu="2">menu 2</a>
        <a href="Optionemail" class="nav-link" data-menu="3">menu 3</a>
    </nav>
    
   
	</div>
	
	<script>
 var currentMenu; // 현재 활성화된 메뉴를 담아내는 객체
 var menu = document.querySelector('.menu');

 function clickHandler(e){ 
     if (currentMenu){
          currentMenu.classList.remove('active'); 
     }
    e.target.classList.toggle('active');
    currentMenu = e.target;
 }
 

 menu.addEventListener('click', clickHandler);

</script> -->
	<!-- test -->
</div>
