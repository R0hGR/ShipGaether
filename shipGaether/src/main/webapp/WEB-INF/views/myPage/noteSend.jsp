<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 오토컴플릿 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<html>

<head>
<%@include file="../header.jsp"%>

<style>
/* .note-table >thead >tr >th,
.note-table >tbody >tr >td {
   text-align: center;
} */
table {
   table-layout: fixed;
   word-wrap: break-word;
}

.page-link {
   color: #000;
   background-color: #fff;
   border: 1px solid #ccc;
}

.page-item.active .page-link {
   z-index: 1;
   color: #555;
   font-weight: bold;
   background-color: #f1f1f1;
   border-color: #ccc;
}

.page-link:focus, .page-link:hover {
   color: #000;
   background-color: #fafafa;
   border-color: #ccc;
}

.active>.page-link, .page-link.active {
   z-index: 3;
   color: var(- -bs-pagination-active-color);
   background-color: #6c757d;
   border-color: #6c757d;
}
</style>

</head>

<body style="background-color: #e9ecef">
   <div class="row h-100 px-5" style="padding-top: 72px;">

      <div class="col-2 mt-3"></div>
      <div class="col-8 mt-3">

         <!-- MypageSidebar -->
         <div class="row">
            <div class="col-3 p-0">
               <%@include file="myPageSidebar.jsp"%>
            </div>

            <main class="col-9 p-0" style="overflow: visible">
               <div class="col-10 p-3 mb-3" style="background-color: white;">



                  <div class="card-body p-4 pb-2 border-bottom" style="float: none; margin: 0 auto; background-color: rgba(0, 0, 0, 0.075);">
                     <h5 style="font-weight: 800;">쪽지함</h5>


                     <div class="row d-flex justify-content-around border mx-0 mb-3">
                        <div class="card-footer bg-transparent">
                           <div class="row bg-white  mx-0 p-0">
                              <div class="col m-0 p-0 show-latest-div ">
                                 <button class="btn w-100 show-latest-btn" onclick="location.href='/note';">받은쪽지함</button>
                              </div>
                              <div class="col m-0 p-0 show-early-div" style="background-color: #adb5bd;">
                                 <button class="btn w-100 show-early-btn" onclick="location.href='/note/send';">보낸쪽지함</button>
                              </div>
                           </div>
                        </div>
                     </div>

                     <!--검색창 -->
                     <div class="row w-100 ms-0 mb-3 border border-1.5 rounded-0 border-white bg-grey">
                        <div class="col-3 p-0">
                           <select id="sendNoteSearchCategory" class="login-input border border-1.5 rounded-0 border-white bg-white">
                              <option value="all">통합검색</option>
                              <option value="crewNickname">닉네임</option>                              
                              <option value="content">내용</option>
                           </select>
                        </div>
                        <div class="col-8 p-0" style="background-color: white;">
                           <input id="sendNoteSearchBox" class="form-control border-0" name="search" type="search" placeholder="Search....." aria-label="Search" style="background-color: transparent;" onkeypress="if( event.keyCode == 13 ){searchSendNote();}">
                        </div>

                        <div class="col-1 d-flex justify-content-end align-items-center m-0 p-0" style="background-color: white;">
                           <button class="btn" type="button" onclick="searchSendNote()">
                              <i class="bi-search" style="color: #0000008c;"></i>
                           </button>
                        </div>
                        <input id="sendNoteSearchBoxCount" type="hidden">
                     </div>


                  </div>
         <script src="http://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>
         <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script> 
         <script type="text/javascript">
          $jQ = jQuery.noConflict();
         function searchSendNote(){
            let category = $jQ("#sendNoteSearchCategory").val();
            let keyword = $jQ("#sendNoteSearchBox").val();
            
            
            if(category=="crewNickname"){
               category="CREW_NICKNAME";
            }else if(category == "content"){
               category="NOTE_CONTENT";
            }else if(category == "all"){
               category="all";
            }
               
//             alert("닉네임으로 "+keyword+" 을 검색");
              $jQ.ajax({
                    type: 'post',
                    url: "/rest/sendNote/getSendNoteBySearch.json",
                    dataType: "json",                       
                    data: { category:category, keyword : keyword },                       
                    success: function(data) {
                        console.log(data);
                        let sendNotes= data.sendNotesP;
                  console.log(" # sendNotes : "+sendNotes);
                  console.log(" # sendNotes length : "+sendNotes.length);                           
                  let tHtml="";
                  for(let sendNote of sendNotes) {   
                     //내용물
                     tHtml+="<tr>";
                     tHtml+="<th><input name='checkOneRecieve' type='checkbox' value='"+sendNote.noteNum+"'></th>";
                     tHtml+="<td>"+sendNote.crewNickname+"";
                     tHtml+="<div id='flush-collapseOne-"+sendNote.noteNum+"' class='accordion-collapse collapse'>";                              
                     tHtml+="<div class='accordion-body mt-3' style='white-space: pre-line;'>";
                     if(sendNote.crewPhoto == 'default'){
                        tHtml+= "<img class='img-fluid rounded-circle' style='opacity: 0.5; width: 80; height: 80; position:;' src='/images/defaultPhoto.jpg' alt='...'>";
                     }else{
                        tHtml+="<img class='img-fluid rounded-circle' style='width: 80; height: 80; position:;' src='/images/ship/"+sendNote.shipNum+"/"+sendNote.crewPhoto+"' alt='...'>";
                     }
                     tHtml+="</div>";
                     tHtml+="</div>";
                     tHtml+="</td>";
                     tHtml+="<td>";
                     tHtml+="<button onclick='updateNote(this,"+sendNote.noteNum+")' class='row accordion-button collapsed' type='button' data-bs-toggle='collapse' data-bs-target='#flush-collapseOne-"+sendNote.noteNum+"' aria-expanded='false' aria-controls='flush-collapseOne-"+sendNote.noteNum+"'>";                  
                     tHtml+="<div class='col text-truncate'>";
                     tHtml+=sendNote.noteContent;
                     tHtml+="</div>";
                     tHtml+="</button>";
                     tHtml+="<div id='flush-collapseOne-"+sendNote.noteNum+"' class='accordion-collapse collapse'>";
                     tHtml+="<div class='accordion-body mt-3' style='white-space: pre-line;'>";   
                     tHtml+="<div class='border-top border-bottom py-3'><p style='font-size:smaller;'>보낸 내용</p><br>&nbsp&nbsp"+sendNote.noteContent+"<br><br></div>";   
                     tHtml+="<p style='font-size:smaller;'>( "+sendNote.shipName+") 의 CREW</p>";
                     tHtml+="</div>";
                     tHtml+="</div>";
                     tHtml+="</td>";
                     
                     //날짜 변환
                     let wDate = new Date('2022-10-18 09:41:02');
                     let year = wDate.getFullYear();
                     let month = ('0' + (wDate.getMonth() + 1)).slice(-2);
                     let day = ('0' + wDate.getDate()).slice(-2);                              
                     let dateString = year + '-' + month  + '-' + day;         
                     
                     let hours = ('0' + wDate.getHours()).slice(-2); 
                     let minutes = ('0' + wDate.getMinutes()).slice(-2);
                     let seconds = ('0' + wDate.getSeconds()).slice(-2); 
                     let timeString = hours + ':' + minutes  + ':' + seconds;
                     
                     console.log(dateString)
                     console.log(timeString)
                     
                     tHtml+="<td>"+dateString;
                                                   
                     tHtml+= "<div id='flush-collapseOne-"+sendNote.noteNum+"' class='accordion-collapse collapse'>"; 
                     tHtml+= "<div class='accordion-body mt-3' style='white-space: pre-line;'>"; 
                     tHtml+= timeString;
                     tHtml+= "</div>";
                     tHtml+= "</div>";
                     tHtml+= "</td>";
                     
                     
                     
                     tHtml+="<td class='return-box'>";   
                     if(sendNote.noteStatus == 0){
                        tHtml+="<i class='far fa-envelope fs-5'></i>";
                     }else{
                        tHtml+="<i class='far fa-envelope-open fs-5'></i>";
                     }
                     
                     tHtml+="</td>";
                     tHtml+="</tr>";
                  }
                  //삭제버튼
                  tHtml+="<tr><td onclick=\"deleteNote('all')\" class=\"align-items-center\" colspan='5' style=\"text-align:center;cursor:pointer;background-color:rgba(0, 0, 0, 0.075);\">삭제</td></tr>";
                                                
                  $('#sendNoteList').html(tHtml);
                  

                  
                  
                  
                  
                                             
                  let sendNotePVO= data.sendNotePVO;
                  
                  
                  let searchCount = sendNotePVO.total;
                  $jQ("#sendNoteSearchBoxCount").val(searchCount);
                  console.log("searchCount")
                  console.log(searchCount)
                  console.log("searchCount")
                  
                  let startPage = sendNotePVO.startPage;
                  let endPage = sendNotePVO.endPage;
                  let nowPage = sendNotePVO.nowPage;
                  let lastPage = sendNotePVO.lastPage;
                  
                  //페이징 하는 번호들 실시간 변화
                  let html = "<li class='page-item'><a class='page-link' aria-label='Previous' onclick='doSendNotePaging(1)' style='cursor: pointer;'> <span aria-hidden='true'>&laquo;</span></a></li>";
                  if(startPage != 1){                              
                     html += "<li class='page-item'><a class='page-link ' onclick='doSendNotePaging("+(parseInt(startPage)-1)+")' style='cursor: pointer;'>&lt;</a></li>";
                  }
                  for ( let i = startPage ; i <= endPage ; i++ ){
                     if( i == nowPage ){
                        html += "<li class='page-item'><a class='page-link active' onclick='doSendNotePaging("+i+")' style='cursor: pointer;'>"+i+"</a></li>";                                 
                     }else{
                        html += "<li class='page-item'><a class='page-link' onclick='doSendNotePaging("+i+")' style='cursor: pointer;'>"+i+"</a></li>";
                     }                              
                  }
                  if(endPage != lastPage){
                     html += "<li class='page-item'><a class='page-link ' onclick='doSendNotePaging("+(parseInt(endPage)+1)+")' style='cursor: pointer;'>&gt;</a></li>";
                  }
                  html += "<li class='page-item'><a class='page-link' aria-label='Next' onclick='doSendNotePaging("+parseInt(lastPage)+")' style='cursor: pointer;'> <span aria-hidden='true'>&raquo;</span></a></li>";
                                             
                  $('#noteSendPagingUl').html(html);
                    }
               });                 
            
            

         }
      //검색할 때 입력한 글자만 진하게 나오는 부분
      
      $jQ(function(){         
         $jQ.ui.autocomplete.prototype._renderItem = function (ul, item) {
             item.label = item.label.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)(" + $jQ.ui.autocomplete.escapeRegex(this.term) + ")(?![^<>]*>)(?![^&;]+;)", "gi"), "<strong>$1</strong>");
             return $jQ("<li></li>")
                     .data("item.autocomplete", item)                     
                     .append("<a>"+item.photo+ item.label + "</a>")
                     .appendTo(ul); 
         };
               
         //input 태그 id가 name
          $jQ( "#sendNoteSearchBox" ).autocomplete({
              source : function( request, response ) {
                 console.log($jQ("#sendNoteSearchCategory").val()=="crewNickname");
                 if($("#sendNoteSearchCategory").val()=="crewNickname"){
                    
                    $jQ.ajax({
                          type: 'post',
                          url: "/rest/sendNote/crewNickname/autoData.json",
                          dataType: "json",
                          term : $jQ("#autocomplete").val(),
                          data: { category: "CREW_NICKNAME",crewNickname : $("#sendNoteSearchBox").val()},
                          //select * from BOARD where writer like %?%;
                          success: function(data) {
                              //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
                              response(
                                    $jQ.map(data, function(item) {
                                     console.log(item);
                                     
                                     if(item.crewPhoto=='default'){
                                        item.crewPhoto="<img class='img-fluid rounded-circle' style='opacity: 0.5; width: 80; height: 80; position:;' src='/images/defaultPhoto.jpg' alt='...'>";
                                     }else{
                                        item.crewPhoto="<img class='img-fluid rounded-circle' style='width: 80; height: 80; position:;' src='/images/ship/"+item.shipNum+"/"+item.crewPhoto+"' alt='...'>";
                                     }
                                     
                               return {
                                    label: item.crewNickname,
                                    value: item.crewNickname,
                                    photo: item.crewPhoto
                               }                                     
                                  })
                              );
                          }
                     });
                 }
                   
                   
                   
                   
                  },
              //조회를 위한 최소글자수
              minLength: 1,
              select: function( event, ui ) {
                  // 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생   
//                    alert("선택된 아이템: " + ui.item.value);   
              }
          });
      })



</script>


                  <script>
                     function showReceiveNote(el){                                    
                        let parent = el.closest("div .card-footer");      
                        let ReceiveDiv = parent.querySelector(".show-latest-div");
                        let SendDiv= parent.querySelector(".show-early-div");
                        ReceiveDiv.style.backgroundColor='rgb(173, 181, 189)';
                        SendDiv.style.backgroundColor='';
                        
                        
                        let ReceiveNoteDiv = document.querySelector(".recieve");
                        let SendNoteDiv = document.querySelector(".send");
                        
                        console.log(ReceiveNoteDiv);
                        ReceiveNoteDiv.style.display="block";
                        SendNoteDiv.style.display="none";
                        
                     }
                     function showSendNote(el){
                        let parent = el.closest("div .card-footer");   
                        
                        let ReceiveDiv  = parent.querySelector(".show-latest-div");
                        let SendDiv= parent.querySelector(".show-early-div");
                        
                        ReceiveDiv.style.backgroundColor='';
                        SendDiv.style.backgroundColor='rgb(173, 181, 189)';
                        
                        let ReceiveNoteDiv = document.querySelector(".recieve");
                        let SendNoteDiv = document.querySelector(".send");
                        ReceiveNoteDiv.style.display="none";
                        SendNoteDiv.style.display="block"; 
                     }      
                  </script>



                  <!-- 보낸쪽지 -->
                  <div class="note-main mx-2 my-3 send" style="display: block;">
                     <div class="my-2 d-flex justify-content-start">
                        <div style="width: 87%;"></div>
                        <!--                         <button type="button" class="mx-2 btn btn-light removeSendBtn">삭제</button> -->
                     </div>


                     <!-- 모든쪽지 테이블 시작 -->
                     <table class="table table-hover note-table sendNote-table">
                        <colgroup>
                           <col style="width: 6%;">
                           <col style="width: 16%;">
                           <col style="width: 47%;">
                           <col style="width: 21%;">
                           <col style="width: 10%;">
                        </colgroup>

                        <thead class="table-dark">
                           <tr>
                              <th><input class="" id="checkAllRecieve" type="checkbox" value=""></th>
                              <th>받는이</th>
                              <th>내용</th>
                              <th>보낸 시간</th>
                              <th>확인</th>
                           </tr>
                        </thead>

                        <tbody id="sendNoteList">
                           <c:forEach var="sendNote" items="${ sendNotes }">

                              <!-- 첫번째 행 시작-->
                              <tr>
                                 <!-- 체크박스 -->
                                 <th><input name="checkOneRecieve" type="checkbox" value="${ sendNote.noteNum }"></th>

                                 <!-- 보낸이 -->
                                 <td>${ sendNote.crewNickname }
                                    <div id="flush-collapseOne-${ sendNote.noteNum }" class="accordion-collapse collapse">
                                       <div class="accordion-body mt-3" style="white-space: pre-line;">
                                          <c:if test="${ sendNote.crewPhoto eq 'default' }">
                                             <img class="img-fluid rounded-circle" style="opacity: 0.5; width: 80; height: 80; position:;" src="/images/defaultPhoto.jpg" alt="...">
                                          </c:if>
                                          <c:if test="${ sendNote.crewPhoto ne 'default' }">
                                             <img class="img-fluid rounded-circle" style="width: 80; height: 80; position:;" src="/images/ship/${ sendNote.shipNum }/${ sendNote.crewPhoto }" alt="...">
                                          </c:if>

                                       </div>
                                    </div>

                                 </td>

                                 <!-- 내용 부분 시작 -->
                                 <td>
                                    <!-- 간단히 보여질 내용 -->
                                    <button onclick="updateNote(this,${ sendNote.noteNum })" class="row accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne-${ sendNote.noteNum }" aria-expanded="false" aria-controls="flush-collapseOne-${ sendNote.noteNum }">

                                       <div class="col text-truncate">${ sendNote.noteContent }</div>
                                    </button> <!-- 전체 내용 -->
                                    <div id="flush-collapseOne-${ sendNote.noteNum }" class="accordion-collapse collapse">
                                       <div class="accordion-body mt-3" style="white-space: pre-line;">
                                          <div class="border-top border-bottom py-3">
                                             <p style="font-size: smaller;">보낸 내용</p>
                                             <br>&nbsp&nbsp${ sendNote.noteContent }<br> <br>
                                          </div>
                                          <p style="font-size: smaller;">( ${ sendNote.shipName } ) 의 CREW</p>
                                       </div>
                                    </div>
                                 </td>
                                 <!-- 내용 부분 끝 -->

                                 <!-- 보낸 시간 -->
                                 <td>${sendNote.noteWdate}
                                    <div id="flush-collapseOne-${ sendNote.noteNum }" class="accordion-collapse collapse">
                                       <div class="accordion-body mt-3" style="white-space: pre-line;">
                                          <fmt:formatDate value="${sendNote.noteWdate}" pattern="hh:mm:ss" />
                                       </div>
                                    </div>
                                 </td>
                                 <td class="return-box"><c:if test="${ sendNote.noteStatus eq 0}">
                                       <i class="far fa-envelope fs-5"></i>
                                    </c:if> <c:if test="${ sendNote.noteStatus eq 1}">
                                       <i class="far fa-envelope-open fs-5"></i>
                                    </c:if></td>



                              </tr>
                              <!-- 첫번째 행 끝-->
                           </c:forEach>
                           <tr>
                              <td onclick="deleteNote('all')" class="align-items-center" colspan='5' style="text-align: center; cursor: pointer; background-color: rgba(0, 0, 0, 0.075);">삭제</td>
                           </tr>
                        </tbody>
                     </table>
                     <!-- 모든쪽지 테이블 끝 -->
                     <!-- 여기다가 페이징 -->
                     <div class="d-flex justify-content-center">
                        <nav aria-label="Page navigation example ">
                           <ul id="noteSendPagingUl" class="pagination">
                              <li class='page-item'><a class='page-link' aria-label='Previous' onclick='doSendNotePaging(1)' style='cursor: pointer;'> <span aria-hidden='true'>&laquo;</span>
                              </a></li>


                              <c:if test="${sendNotePVO.startPage ne 1 }">
                                 <li class="page-item"><a class="page-link " onclick="doSendNotePaging(${sendNotePVO.startPage-1})" style='cursor: pointer;'>&lt;</a></li>
                              </c:if>

                              <c:forEach begin="${sendNotePVO.startPage }" end="${sendNotePVO.endPage }" var="p">

                                 <c:choose>
                                    <c:when test="${p == sendNotePVO.nowPage }">
                                       <li class="page-item"><a class="page-link active" onclick="doSendNotePaging(${p})" style='cursor: pointer;'>${ p }</a></li>
                                    </c:when>
                                    <c:otherwise>
                                       <li class="page-item"><a class="page-link" onclick="doSendNotePaging(${p})" style='cursor: pointer;'>${ p }</a></li>
                                    </c:otherwise>
                                 </c:choose>

                              </c:forEach>

                              <c:if test="${sendNotePVO.endPage ne sendNotePVO.lastPage}">
                                 <li class="page-item"><a class="page-link " onclick="doSendNotePaging(${sendNotePVO.endPage+1})" style='cursor: pointer;'>&gt;</a></li>
                              </c:if>

                              <li class="page-item"><a class="page-link" aria-label="Next" onclick="doSendNotePaging(${sendNotePVO.lastPage})" style='cursor: pointer;'> <span aria-hidden="true">&raquo;</span>
                              </a></li>
                           </ul>
                        </nav>
                     </div>
                  </div>
                  <script>
                  function doSendNotePaging(p){            
                     let category = $jQ("#sendNoteSearchCategory").val();
                     let keyword = $jQ("#sendNoteSearchBox").val();
                     if(keyword.length < 1){
                        jsObject={total:'${countMySendNotes}', nowPage:p, cntPerPage:10,category:category,keyword:keyword }         
                     }else if(category=='crewNickname'){
                        jsObject={total:$jQ("#sendNoteSearchBoxCount").val(), nowPage:p, cntPerPage:10,category:"CREW_NICKNAME",keyword:keyword }                        
                     }else if(category=='content'){
                        jsObject={total:$jQ("#sendNoteSearchBoxCount").val(), nowPage:p, cntPerPage:10,category:"NOTE_CONTENT",keyword:keyword }
                     }else if(category=='all'){
                        jsObject={total:$jQ("#sendNoteSearchBoxCount").val(), nowPage:p, cntPerPage:10,category:"all",keyword:keyword }
                     }
                     
                     
                     $.ajax({
                        url:"/rest/doSendNotePaging.json",
                        type:"post",
                        data:jsObject,
                        success:function(data){                           
                           let sendNotes= data.sendNotesP;
                           console.log(" # sendNotes : "+sendNotes);
                           console.log(" # sendNotes length : "+sendNotes.length);                           
                           let tHtml="";
                           for(let sendNote of sendNotes) {   
                              //내용물
                              tHtml+="<tr>";
                              tHtml+="<th><input name='checkOneRecieve' type='checkbox' value='"+sendNote.noteNum+"'></th>";
                              tHtml+="<td>"+sendNote.crewNickname+"";
                              tHtml+="<div id='flush-collapseOne-"+sendNote.noteNum+"' class='accordion-collapse collapse'>";                              
                              tHtml+="<div class='accordion-body mt-3' style='white-space: pre-line;'>";
                              if(sendNote.crewPhoto == 'default'){
                                 tHtml+= "<img class='img-fluid rounded-circle' style='opacity: 0.5; width: 80; height: 80; position:;' src='/images/defaultPhoto.jpg' alt='...'>";
                              }else{
                                 tHtml+="<img class='img-fluid rounded-circle' style='width: 80; height: 80; position:;' src='/images/ship/"+sendNote.shipNum+"/"+sendNote.crewPhoto+"' alt='...'>";
                              } 
                              tHtml+="</div>";
                              tHtml+="</div>";
                              tHtml+="</td>";
                              tHtml+="<td>";
                              tHtml+="<button onclick='updateNote(this,"+sendNote.noteNum+")' class='row accordion-button collapsed' type='button' data-bs-toggle='collapse' data-bs-target='#flush-collapseOne-"+sendNote.noteNum+"' aria-expanded='false' aria-controls='flush-collapseOne-"+sendNote.noteNum+"'>";                  
                              tHtml+="<div class='col text-truncate'>";
                              tHtml+=sendNote.noteContent;
                              tHtml+="</div>";
                              tHtml+="</button>";
                              tHtml+="<div id='flush-collapseOne-"+sendNote.noteNum+"' class='accordion-collapse collapse'>";
                              tHtml+="<div class='accordion-body mt-3' style='white-space: pre-line;'>";   
                              tHtml+="<div class='border-top border-bottom py-3'><p style='font-size:smaller;'>보낸 내용</p><br>&nbsp&nbsp"+sendNote.noteContent+"<br><br></div>";   
                              tHtml+="<p style='font-size:smaller;'>( "+sendNote.shipName+") 의 CREW</p>";
                              tHtml+="</div>";
                              tHtml+="</div>";
                              tHtml+="</td>";
                              
                              //날짜 변환
                              let wDate = new Date('2022-10-18 09:41:02');
                              let year = wDate.getFullYear();
                              let month = ('0' + (wDate.getMonth() + 1)).slice(-2);
                              let day = ('0' + wDate.getDate()).slice(-2);                              
                              let dateString = year + '-' + month  + '-' + day;         
                              
                              let hours = ('0' + wDate.getHours()).slice(-2); 
                              let minutes = ('0' + wDate.getMinutes()).slice(-2);
                              let seconds = ('0' + wDate.getSeconds()).slice(-2); 
                              let timeString = hours + ':' + minutes  + ':' + seconds;
                              
                              console.log(dateString)
                              console.log(timeString)
                              
                              tHtml+="<td>"+dateString;
                                                            
                              tHtml+= "<div id='flush-collapseOne-"+sendNote.noteNum+"' class='accordion-collapse collapse'>"; 
                              tHtml+= "<div class='accordion-body mt-3' style='white-space: pre-line;'>"; 
                              tHtml+= timeString;
                              tHtml+= "</div>";
                              tHtml+= "</div>";
                              tHtml+= "</td>";
                              
                              
                              
                              tHtml+="<td class='return-box'>";   
                              if(sendNote.noteStatus == 0){
                                 tHtml+="<i class='far fa-envelope fs-5'></i>";
                              }else{
                                 tHtml+="<i class='far fa-envelope-open fs-5'></i>";
                              }
                              
                              tHtml+="</td>";
                              tHtml+="</tr>";
                           }
                           //삭제버튼
                           tHtml+="<tr><td onclick=\"deleteNote('all')\" class=\"align-items-center\" colspan='5' style=\"text-align:center;cursor:pointer;background-color:rgba(0, 0, 0, 0.075);\">삭제</td></tr>";
                                                         
                           $('#sendNoteList').html(tHtml);
                           

                           
                           let sendNotePVO= data.sendNotePVO;
                           let startPage = sendNotePVO.startPage;
                           let endPage = sendNotePVO.endPage;
                           let nowPage = sendNotePVO.nowPage;
                           let lastPage = sendNotePVO.lastPage;
                           
                           //페이징 하는 번호들 실시간 변화
                           let html = "<li class='page-item'><a class='page-link' aria-label='Previous' onclick='doSendNotePaging(1)' style='cursor: pointer;'> <span aria-hidden='true'>&laquo;</span></a></li>";
                           if(startPage != 1){                              
                              html += "<li class='page-item'><a class='page-link ' onclick='doSendNotePaging("+(parseInt(startPage)-1)+")' style='cursor: pointer;'>&lt;</a></li>";
                           }
                           for ( let i = startPage ; i <= endPage ; i++ ){
                              if( i == nowPage ){
                                 html += "<li class='page-item'><a class='page-link active' onclick='doSendNotePaging("+i+")' style='cursor: pointer;'>"+i+"</a></li>";                                 
                              }else{
                                 html += "<li class='page-item'><a class='page-link' onclick='doSendNotePaging("+i+")' style='cursor: pointer;'>"+i+"</a></li>";
                              }                              
                           }
                           if(endPage != lastPage){
                              html += "<li class='page-item'><a class='page-link ' onclick='doSendNotePaging("+(parseInt(endPage)+1)+")' style='cursor: pointer;'>&gt;</a></li>";
                           }
                           html += "<li class='page-item'><a class='page-link' aria-label='Next' onclick='doSendNotePaging("+parseInt(lastPage)+")' style='cursor: pointer;'> <span aria-hidden='true'>&raquo;</span></a></li>";
                                                      
                           $('#noteSendPagingUl').html(html);
                        },                        
                     }); 
                  }
               </script>







               </div>
            </main>
         </div>

      </div>
   </div>



</body>


<script>

function deleteNote(param){
   let checkedNotes ="";
   if(param == 'all'){
      checkedNotes = $("input:checkbox[name='checkOneRecieve']:checked");                           
   }else if(param == 'read'){                           
      checkedNotes = $("input:checkbox[name='checkOneRead']:checked");
   }else if(param == 'unRead'){                           
      checkedNotes = $("input:checkbox[name='checkOneUnRead']:checked");
   }   
   if(checkedNotes.length < 1 ){
      alert("쪽지를 선택해주세요!")
      return false;
   }   
   
   for( checkedNote of checkedNotes){                           
      $.ajax({
         url:"/rest/deleteNote",
         type:"post",
         data:{noteNum:checkedNote.value},
         success:function(data){
            console.log("deleteNote다녀옴")
            
         },                        
      });
   }
   alert("쪽지가 삭제 되었습니다.")
   location.reload();

}

$(document).ready(function(){
   
//   상단 체크박스가 체크되면, 하위 체크박스 모두 체크 or 모두 해제   
   $("#checkAllRecieve").on("click",function(){

      let isCheckedAll = $('#checkAllRecieve').is(':checked');
         
      if(isCheckedAll){
         $("input:checkbox[name='checkOneRecieve']").prop('checked',true);
      }else{   
         $("input:checkbox[name='checkOneRecieve']").prop('checked',false);
      }
         
   })
   
//   상단 체크박스가 체크되면, 하위 체크박스 모두 체크 or 모두 해제   
   $("#checkAllSend").on("click",function(){

      let isCheckedAll = $('#checkAllSend').is(':checked');
         
      if(isCheckedAll){
         $("input:checkbox[name='checkOneSend']").prop('checked',true);
      }else{   
         $("input:checkbox[name='checkOneSend']").prop('checked',false);
      }
         
   })   
   
   
      

//   전부 다 체크되면 상단체크 or 아니면 상단 해제
   $("input:checkbox[name='checkOneRecieve']").on("click",function(){

      let totalCnt = $("input:checkbox[name='checkOneRecieve']").length;
      let checkedCnt = $("input:checkbox[name='checkOneRecieve']:checked").length;

      if(totalCnt==checkedCnt ){
         $("#checkAllRecieve").prop('checked',true);
      }else{
         $("#checkAllRecieve").prop('checked',false);
      }
      
   })

//   전부 다 체크되면 상단체크 or 아니면 상단 해제
   $("input:checkbox[name='checkOneSend']").on("click",function(){

      let totalCnt = $("input:checkbox[name='checkOneSend']").length;
      let checkedCnt = $("input:checkbox[name='checkOneSend']:checked").length;

      if(totalCnt==checkedCnt ){
         $("#checkAllSend").prop('checked',true);
      }else{
         $("#checkAllSend").prop('checked',false);
      }
      
   })   

   
//   삭제버튼 누를 때, 1.체크가 안되있으면 알려주고  2.체크되있는 쪽지만 삭제
    $(".removeRecieveBtn").on("click",function(){
       
       let isChecked = $('input:checkbox[name=checkOneRecieve]').is(':checked');
      if(!isChecked){
         alert("삭제할 쪽지를 선택해주세요.");
         return;
      } 
   
      $("input:checkbox[name='checkOneRecieve']:checked").each(function(index, checkedEachEl){

//         console.log("index",index);
//           console.log("checkedEachEl",checkedEachEl);
         
           let rowToRemove = checkedEachEl.parentElement.parentElement;
           console.log(rowToRemove);
           $(rowToRemove).remove();        
           
           let totalCnt = $("input:checkbox[name='checkOneRecieve']").length;
           if(totalCnt==0){
              $("#checkAllRecieve").prop('checked',false);
           }
       });
      alert("삭제되었습니다.");
      
   })
   
//   삭제버튼 누를 때, 1.체크가 안되있으면 알려주고  2.체크되있는 쪽지만 삭제
    $(".removeSendBtn").on("click",function(){
       
       let isChecked = $('input:checkbox[name=checkOneSend]').is(':checked');
      if(!isChecked){
         alert("삭제할 쪽지를 선택해주세요.");
         return;
      } 
   
      $("input:checkbox[name='checkOneSend']:checked").each(function(index, checkedEachEl){

//         console.log("index",index);
//           console.log("checkedEachEl",checkedEachEl);
         
           let rowToRemove = checkedEachEl.parentElement.parentElement;
           console.log(rowToRemove);
           $(rowToRemove).remove();        
           
           let totalCnt = $("input:checkbox[name='checkOneSend']").length;
           if(totalCnt==0){
              $("#checkAllSend").prop('checked',false); 
           }
       });
      alert("삭제되었습니다.");
      
   })   
       
   
   
})

</script>

<!-- 아이콘 추가 임포트 -->
<script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>


</html>