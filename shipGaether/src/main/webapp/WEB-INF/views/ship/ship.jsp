<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>

<%@include file="../header.jsp"%>
<script>
   document.addEventListener('scroll', function() {
      const factor = document.getElementById('stickyY');
      const target = document.getElementById('sticky');
      const clientRect = factor.getBoundingClientRect();
      const fixedRect = target.getBoundingClientRect();
      const relativeTop = clientRect.top;
      const relativeLeft = clientRect.left;
      const fixedLeft = fixedRect.left;
      const fixedRight = fixedRect.right;
      if (relativeTop <= 88) {
         target.style.position = "fixed";
         target.style.top = "88px";
         target.style.left = fixedLeft + "px";
         target.style.width = (fixedRight - fixedLeft) + "px";
      } else {
         target.style.position = "static";
         target.removeProperty("top");
         target.removeProperty("left");
         target.removeProperty("width");
      }
   });
</script>

</head>
<body style="background-color: #e9ecef">
   <div class="row h-100 px-5" style="padding-top: 72px;">
      <div class="col-2 mt-3"></div>
      <div class="col-8 mt-3">
         <div class="row">
         
         
         



         
         
          
            <!-- 페이지 기준 왼쪽 사이드바 -->
            <div class="col-3 p-0">
            <!-- 로그인상태 -->

            <c:choose>
               <c:when test="${ loginStatus != 0 and not empty myCrewInfo.crewNum }">
                  <%@include file="sidebar.jsp"%>                     
               </c:when>
               <c:when test="${ empty myCrewInfo.crewNum or loginStatus == 0 }">
                  <%@include file="sidebarEmpty.jsp"%>
               </c:when>
            </c:choose>
            </div>

            <!-- 전체페이지 세로로 2/3 부분 -->
            <main class="col-9 p-0" style="overflow: visible"> 
            
<!--배너 -->


               <c:choose>
                  <c:when test="${ship.shipBannerName == 'default'}">                  
                     <img class="img-fluid mx-auto w-100 mb-3" style="height: 240px;" src="/images/ship/sample/banner1.jpg" alt="..." />                     
                  </c:when>
                  <c:when test="${ship.shipBannerName == 'banner1.jpg'}">                  
                     <img class="img-fluid mx-auto w-100 mb-3" style="height: 240px;" src="/images/ship/sample/banner1.jpg" alt="..." />                     
                  </c:when>
                  <c:when test="${ship.shipBannerName == 'banner2.jpg'}">                  
                     <img class="img-fluid mx-auto w-100 mb-3" style="height: 240px;" src="/images/ship/sample/banner2.jpg" alt="..." />                     
                  </c:when>
                  <c:when test="${ship.shipBannerName == 'banner3.jpg'}">                  
                     <img class="img-fluid mx-auto w-100 mb-3" style="height: 240px;" src="/images/ship/sample/banner3.jpg" alt="..." />                     
                  </c:when>
                  <c:otherwise>
                     <img class="img-fluid mx-auto w-100 mb-3" style="height: 240px;" src="/images/ship/${ shipNum }/${ship.shipBannerName}" alt="..." />
                  </c:otherwise>
               </c:choose>


               <div id="stickyY" class="row">
                  <!--col-8 -->
                  
                  <!-- 로그인상태 -->
               <c:choose>
                  <c:when test="${ loginStatus != 0 and not empty myCrewInfo.crewNum }">
                     <%@include file="part_board.jsp"%>                     
                  </c:when>
                  
                  <c:when test="${ ship.shipOpen eq 1 }">
                     <%@include file="part_board.jsp"%>                     
                  </c:when>
                  
                  <c:when test="${ loginStatus != 0 and ship.shipOpen eq 0 }">
                     <%@include file="part_guest.jsp"%>
                  </c:when>
                  <c:when test="${ loginStatus == 0 }">
                     <%@include file="part_guest.jsp"%>
                  </c:when>                  
               </c:choose>
                  
                  <script>
                  $(document).ready(function() {
                     $("#side-board").attr('class','nav-link active');
                  });
                                    
//                   if(sessionStorage.getItem("lastPage")=="album"){
//                      location.href="/ship/${shipNum}/album"
//                   }else if(sessionStorage.getItem("lastPage")=="attachmentList"){
//                      location.href="/ship/${shipNum}/attachmentList"
//                   }else if(sessionStorage.getItem("lastPage")=="calendar"){
//                      location.href="/ship/${shipNum}/calendar"
//                   }else if(sessionStorage.getItem("lastPage")=="crewList"){
//                      location.href="/ship/${shipNum}/crewList"
//                   }
                  
                  
                  
                  </script>

                  <!-- 로그인상태 -->
               <c:choose>
                  <c:when test="${ loginStatus != 0 and not empty myCrewInfo.crewNum }">   
                  <%@include file="right_side_attachment.jsp"%>                     
                  </c:when>
                  
                  <c:when test="${ ship.shipOpen eq 1 }">
                     <%@include file="right_side_attachment.jsp"%>                     
                  </c:when>
               </c:choose>


               </div>
            </main>
         </div>
      </div>
   </div>
    


   <script src="/js/main.js"></script> 


   <!-- 아이콘 추가 임포트 -->
   <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>



</body>
</html>