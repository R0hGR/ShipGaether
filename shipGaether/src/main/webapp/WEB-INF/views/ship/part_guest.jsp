<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<div class="col-12 pb-5 bg-white">



   <!-- 밴드 삭제 시작 -->
   <div class="card border-0 rounded-0 mb-3 p-2 py-4" style="height: 75vh;">
<div class="modal_content">
      


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


   <div class="form-container sign-in-container">
      <div class="row w-100 p-0 mb-5 align-self-center" style=" height:10%;">
         <div class="col-3"></div>
         <div class="col-6 p-0 align-self-center "><h1 class="login-title" style="text-align: center;">${ ship.shipName }</h1></div>
         <div class="col-3"></div>
            <div class="col-3"></div>
         <div class="col-6 p-0 mt-3 align-self-center "><h6 class="login-title" style="text-align: center;">${ship.shipTitle}</h6></div>
      <div class="col-3"></div>
   </div>

         <!-- 아이디 -->
         <div class="row w-100 m-0 p-0 border-line-bottom border-line-top" style="height:25%">
               <div class="col-1"></div>
               <div class="col-10 p-0 align-self-center">               
                  <p><i class="bi bi-people-fill" style="font-size:25;"> 회원 수 : ${fn:length(crews)} 명</i></p>
                  <p><i class="bi bi-hammer" style="font-size:25;"> 개설날짜 : ${ ship.shipCdate }</i></p>
                  <p><i class="bi bi-receipt" style="font-size:25;"> 게시글 수 : ${fn:length(boards)} 개</i></p>               
               </div>
               <div class="col-1"></div>
         </div>
         <div class="row w-100 mx-0 my-3 p-0 border-line-bottom" style="height:50%"> 
            <div id="columnchart_material" class="col-12 h-100 p-0 align-self-center">
            </div>
         </div>
         <div class="row w-100 m-0 p-0" style="height:10%">
      <div class="row w-100 p-0 align-self-center" style=" height:10%;">
         <div class="col-3"></div>
         <div class="col-6 p-0 align-self-center ">
         <h6 class="login-title" style="text-align: center;">
                  
         </h6>
         </div>
         <div class="col-3"></div>
      </div>

   </div>
   
   <script>
   google.charts.load('current', {'packages':['bar']});
   google.charts.setOnLoadCallback(drawChart);    
   function drawChart() {
      
      $.ajax({
         url:"/rest/getShipInfo.json",
         type:"get",
         data:{shipNum:"${shipNum}"},
         async:false,
         success:function(map){
            
            let today = new Date();      
            let year = today.getFullYear(); 
            // 월 getMonth() (0~11로 1월이 0으로 표현되기 때문에 + 1을 해주어야 원하는 월을 구할 수 있다.)

            let monthf = today.getMonth() + 1
            let months = today.getMonth() + 1 - 1
            let montht = today.getMonth() + 1 - 2

            // 일 getDate()             
            let thisMonth = year + '-' + monthf;
            let lastMonth = year + '-' + months;
            let beforeLastMonth = year + '-' + montht;   

            let crews = map.crews;
            let boards = map.boards;
            let replys = map.replys;
            
            var crewMap = {};
            var baordMap = {};
            var replyMap = {};
            
            for(crew of crews){
               crewMap[crew.month]=crew.monthCount;               
            }
            for(board of boards){
               baordMap[board.month]=board.monthCount;               
            }
            for(reply of replys){
               replyMap[reply.month]=reply.monthCount;               
            }
            
            console.log(crewMap)
            console.log(baordMap)
            console.log(replyMap)
            
            console.log("--------------------------")
            console.log(crewMap[thisMonth])
            console.log("--------------------------")
            console.log(crewMap[lastMonth])
            console.log("--------------------------")
            console.log(crewMap[beforeLastMonth])
            console.log("--------------------------")
            console.log(baordMap[thisMonth])
            console.log("--------------------------")
            console.log(baordMap[lastMonth])
            console.log("--------------------------")
            console.log(baordMap[beforeLastMonth])
            console.log("--------------------------")
            console.log(replyMap[thisMonth])
            console.log("--------------------------")
            console.log(replyMap[lastMonth])
            console.log("--------------------------")
            console.log(replyMap[beforeLastMonth])            
            
            
            
             var data = google.visualization.arrayToDataTable([
                 ['월', '가입자 수', '게시글수', '댓글 수'],
                 [beforeLastMonth, crewMap[beforeLastMonth], baordMap[beforeLastMonth], replyMap[beforeLastMonth]],
                 [lastMonth, crewMap[lastMonth], baordMap[lastMonth], replyMap[lastMonth]],
                 [thisMonth, crewMap[thisMonth], baordMap[thisMonth], replyMap[thisMonth]],

             ]);
          
             var options = {
                 chart: {
                 title: 'Ship 활동량',
                 subtitle: '최근 회원 수, 게시글 수, 댓글 수',
                 }
             };
          
             var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
          
             chart.draw(data, google.charts.Bar.convertOptions(options));
            
         },
         
         
      });
      

   }   
   </script>
         
                  

      </div>
   </div>
</div>
