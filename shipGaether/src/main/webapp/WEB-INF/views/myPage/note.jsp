<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                              <div class="col m-0 p-0 show-latest-div " style="background-color: #adb5bd;">
                                 <button class="btn w-100 show-latest-btn" onclick="location.href='/note';">받은쪽지함</button>
                              </div>
                              <div class="col m-0 p-0 show-early-div">
                                 <button class="btn w-100 show-early-btn" onclick="location.href='/note/send';">보낸쪽지함</button>
                              </div>
                           </div>
                        </div>
                     </div>


                     <div class="row d-flex justify-content-around border mx-0 mb-3">
                        <div class="card-footer bg-transparent">
                           <div class="row bg-white  mx-0 p-0">
                              <div class="col m-0 p-0 show-latest-div allNote border">
                                 <button class="btn w-100 show-latest-btn" name="allNote" onclick="showNote(this)">전체보기( ${ receiveAllNotePVO.total } )</button>
                              </div>
                              <div class="col m-0 p-0 show-early-div unReadNote border">
                                 <button class="btn w-100 show-early-btn" name="unReadNote" onclick="showNote(this)">안읽은쪽지( ${ receiveUnReadNotePVO.total } )</button>
                              </div>
                              <div class="col m-0 p-0 show-latest-div readNote border">
                                 <button class="btn w-100 show-latest-btn" name="readNote" onclick="showNote(this)">읽은쪽지( ${ receiveReadNotePVO.total } )</button>
                              </div>
                           </div>
                        </div>   
                     </div>
                     
                     

                     
                     
                     <!--검색창 -->
                     <div class="row w-100 ms-0 mb-3 border border-1.5 rounded-0 border-white bg-grey">
                        <div class="col-3 p-0">
                           <select id="note-category" class="login-input border border-1.5 rounded-0 border-white bg-white">
                              <option value="all">통합검색</option>
                              <option value="CREW_NICKNAME">닉네임</option>
                              <option value="NOTE_CONTENT">내용</option>
                           </select>
                        </div>
                        <div class="col-8 p-0" style="background-color: white;">
                           <input id="note-search-box" class="form-control border-0" name="search" type="search" placeholder="Search....." aria-label="Search" style="background-color: transparent;" onkeypress="if( event.keyCode == 13 ){doReceiveNotePaging(1);}">
                        </div>

                        <div class="col-1 d-flex justify-content-end align-items-center m-0 p-0" style="background-color: white;">
                           <button class="btn" type="button" onclick="doReceiveNotePaging(1)">
                              <i class="bi-search" style="color: #0000008c;"></i>
                           </button>
                        </div>                        
                     </div>


                  </div>


                  <script>
                     
                  </script>


                  <!-- 받은 -->
                  <div class="note-main mx-2 my-3 recieve" style="display: block;">
                     <div class="my-2 d-flex justify-content-start">
                        <div style="width: 87%;"></div>
                        <!--                         <button type="button" class="mx-2 btn btn-light removeRecieveBtn">삭제</button> -->
                     </div>

                  
                  
                  
                     <!-- 모든쪽지 테이블 시작 -->
                     <table class="table table-hover note-table allNote-table d-none"> 
                        <colgroup>
                           <col style="width: 6%;">
                           <col style="width: 16%;">
                           <col style="width: 47%;">
                           <col style="width: 18%;">
                           <col style="width: 13%;">
                        </colgroup>

                        <thead class="table-dark">
                           <tr>
                              <th><input class="" id="checkAllRecieve" type="checkbox" value=""></th>
                              <th>보낸이</th>
                              <th>내용</th>
                              <th>받은 시간</th>
                              <th></th>
                           </tr>
                        </thead>

                        <tbody id="receiveAllNote">
                        <c:forEach var="allNote" items="${ allNotes }">
                           <!-- 첫번째 행 시작-->
                           <tr>
                              <!-- 체크박스 -->
                              <th><input name="checkOneRecieve" type="checkbox" value="${ allNote.noteNum }"></th>

                              <!-- 보낸이 -->
                              <td>${ allNote.crewNickname }
                                    <div id="flush-collapseOne-${ allNote.noteNum }" class="accordion-collapse collapse">
                                       <div class="accordion-body" style="white-space: pre-line;">
                                          <c:if test="${ allNote.crewPhoto eq 'default' }">
                                             <img class="img-fluid rounded-circle" style="opacity: 0.5; width: 80; height: 80; position:;" src="/images/defaultPhoto.jpg" alt="...">
                                          </c:if>
                                          <c:if test="${ allNote.crewPhoto ne 'default' }">
                                             <img class="img-fluid rounded-circle" style="width: 80; height: 80; position:;" src="/images/ship/${ allNote.shipNum }/${ allNote.crewPhoto }" alt="...">
                                          </c:if>

                                       </div>
                                    </div>

                                 </td>

                              <!-- 내용 부분 시작 -->
                              <td>
                                 <!-- 간단히 보여질 내용 -->                                 
                                 <button onclick="updateNote(this,${ allNote.noteNum })" class="row accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne-${ allNote.noteNum }" aria-expanded="false" aria-controls="flush-collapseOne-${ allNote.noteNum }">
                                                                     
                                    <div class="col text-truncate">
                                    <c:if test="${ allNote.noteStatus eq 0}">
                                    <i id="star-${ allNote.noteNum }" class="bi bi-stars" style="color:coral;"></i>
                                    </c:if>
                                    ${ allNote.noteContent }
                                    
                                    
                                     
                                    </div>
                                 </button> <!-- 전체 내용 -->
                                 <div id="flush-collapseOne-${ allNote.noteNum }" class="accordion-collapse collapse">
                                    <div class="accordion-body mt-3" style="white-space: pre-line;">
                                    <div class="border-top border-bottom py-3"><p style="font-size:smaller;">전체내용</p><br>&nbsp&nbsp${ allNote.noteContent }<br><br></div>
                                    <p style="font-size:smaller;">( <a href="/ship/${ allNote.shipNum }">${ allNote.shipName }</a> ) 의 CREW</p> 
                                    </div>
                                 </div>
                              </td>
                              <!-- 내용 부분 끝 -->

                              <!-- 받은 시간 -->
                              <td>${allNote.noteWdate}
                                    <div id="flush-collapseOne-${ allNote.noteNum }" class="accordion-collapse collapse">
                                       <div class="accordion-body mt-3" style="white-space: pre-line;">
                                          <fmt:formatDate value="${allNote.noteWdate}" pattern="hh:mm:ss" />
                                       </div>
                                 </div></td>
                              <td class="return-box">
                              <input type="hidden" class="returnReceiver" name="returnReceiver" value="${ allNote.crewNum }">
                              <input type="hidden" class="returnCrewNickname" name="returnCrewNickname" value="${ allNote.crewNickname }">
                              <input type="hidden" class="returnSender" name="returnSender" value="${ allNote.noteReceiver }">
                                 <button type="button" class="btn btn-light sendBackBtn noteBox" onclick="sendNote(this)">답장</button>
                              </td>
                              
                              

                           </tr>
                           <!-- 첫번째 행 끝-->
                           </c:forEach>
                           <tr><td onclick="deleteNote('all')" class="align-items-center" colspan='5' style="text-align:center;cursor:pointer;background-color:rgba(0, 0, 0, 0.075);">삭제</td></tr> 
                           
                        </tbody>
                     </table>
                     <!-- 모든쪽지 테이블 끝 --> 
                     
                     <!-- 여기다가 페이징 receive-all-Note -->
                     <div id="allNote-paging-div" class="d-none justify-content-center">
                        <nav aria-label="Page navigation example ">
                           <ul id="allNotePagingUl" class="pagination">
                              <li class='page-item'><a class='page-link' aria-label='Previous' onclick='doReceiveNotePaging(1)' style='cursor: pointer;'> <span aria-hidden='true'>&laquo;</span>
                              </a></li>


                              <c:if test="${receiveAllNotePVO.startPage ne 1 }">
                                 <li class="page-item"><a class="page-link " onclick="doReceiveNotePaging(${receiveAllNotePVO.startPage-1})" style='cursor: pointer;'>&lt;</a></li>
                              </c:if>

                              <c:forEach begin="${receiveAllNotePVO.startPage }" end="${receiveAllNotePVO.endPage }" var="p">

                                 <c:choose>
                                    <c:when test="${p == receiveAllNotePVO.nowPage }">
                                       <li class="page-item"><a class="page-link active" onclick="doReceiveNotePaging(${p})" style='cursor: pointer;'>${ p }</a></li>
                                    </c:when>
                                    <c:otherwise>
                                       <li class="page-item"><a class="page-link" onclick="doReceiveNotePaging(${p})" style='cursor: pointer;'>${ p }</a></li>
                                    </c:otherwise>
                                 </c:choose>

                              </c:forEach>

                              <c:if test="${receiveAllNotePVO.endPage ne receiveAllNotePVO.lastPage}">
                                 <li class="page-item"><a class="page-link " onclick="doReceiveNotePaging(${receiveAllNotePVO.endPage+1})" style='cursor: pointer;'>&gt;</a></li>
                              </c:if>

                              <li class="page-item"><a class="page-link" aria-label="Next" onclick="doReceiveNotePaging(${receiveAllNotePVO.lastPage})" style='cursor: pointer;'> <span aria-hidden="true">&raquo;</span>
                              </a></li>
                           </ul>
                        </nav>
                     </div>
                     

                     
                     
                  





                     <!-- 읽지않은 쪽지 테이블 시작 -->
                     <table class="table table-hover note-table unReadNote-table d-none" >
                        <colgroup>
                           <col style="width: 6%;">
                           <col style="width: 16%;">
                           <col style="width: 47%;">
                           <col style="width: 18%;">
                           <col style="width: 13%;">
                        </colgroup>

                        <thead class="table-dark">
                           <tr>
                              <th><input class="" id="checkAllUnRead" type="checkbox" value=""></th>
                              <th>보낸이</th>
                              <th>내용</th>
                              <th>받은 시간</th>
                              <th></th>
                           </tr>
                        </thead>

                        <tbody id="receiveUnReadNote">
                           <c:forEach var="unReadNote" items="${ unReadNotes }">
                           <!-- 첫번째 행 시작-->
                           <tr>
                              <!-- 체크박스 -->
                              <th><input class="" name="checkOneUnRead" type="checkbox" value="${ unReadNote.noteNum }"></th>

                              <!-- 보낸이 -->
                              <td>${ unReadNote.crewNickname }

                                    <div id="flush-collapseOne-${ unReadNote.noteNum }" class="accordion-collapse collapse">
                                       <div class="accordion-body" style="white-space: pre-line;">
                                          <c:if test="${ unReadNote.crewPhoto eq 'default' }">
                                             <img class="img-fluid rounded-circle" style="opacity: 0.5; width: 80; height: 80; position:;" src="/images/defaultPhoto.jpg" alt="...">
                                          </c:if>
                                          <c:if test="${ unReadNote.crewPhoto ne 'default' }">
                                             <img class="img-fluid rounded-circle" style="width: 80; height: 80; position:;" src="/images/ship/${ unReadNote.shipNum }/${ unReadNote.crewPhoto }" alt="...">
                                          </c:if>

                                       </div>
                                    </div>

                                 </td>

                              <!-- 내용 부분 시작 -->
                              <td>
                                 <!-- 간단히 보여질 내용 -->
                                 <button onclick="updateNote(this,${ unReadNote.noteNum })" class="row accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne-${ unReadNote.noteNum }" aria-expanded="false" aria-controls="flush-collapseOne-${ unReadNote.noteNum }">
                                                                     
                                    <div class="col text-truncate">
                                    <c:if test="${ unReadNote.noteStatus eq 0}">
                                    <i id="star-${ unReadNote.noteNum }" class="bi bi-stars" style="color:coral;"></i>
                                    </c:if>
                                    ${ unReadNote.noteContent }
                                    
                                    
                                     
                                    </div>
                                 </button> <!-- 전체 내용 -->
                                 <div id="flush-collapseOne-${ unReadNote.noteNum }" class="accordion-collapse collapse">
                                    <div class="accordion-body mt-3" style="white-space: pre-line;">
                                    <div class="border-top border-bottom py-3"><p style="font-size:smaller;">전체내용</p><br>&nbsp&nbsp${ unReadNote.noteContent }<br><br></div>
                                    <p style="font-size:smaller;">( <a href="/ship/${ unReadNote.shipNum }">${ unReadNote.shipName }</a> ) 의 CREW</p>
                                    </div>
                                 </div>
                              </td>
                              <!-- 내용 부분 끝 -->

                              
                              <!-- 받은 시간 -->
                              <td>${unReadNote.noteWdate}
                                    <div id="flush-collapseOne-${ unReadNote.noteNum }" class="accordion-collapse collapse">
                                       <div class="accordion-body mt-3" style="white-space: pre-line;">
                                          <fmt:formatDate value="${unReadNote.noteWdate}" pattern="hh:mm:ss" />
                                       </div>
                                 </div></td>
                              <td class="return-box">
                              <input type="hidden" class="returnReceiver" name="returnReceiver" value="${ unReadNote.crewNum }">
                              <input type="hidden" class="returnCrewNickname" name="returnCrewNickname" value="${ unReadNote.crewNickname }">
                              <input type="hidden" class="returnSender" name="returnSender" value="${ unReadNote.noteReceiver }">
                                 <button type="button" class="btn btn-light sendBackBtn noteBox" onclick="sendNote(this)">답장</button>
                              </td>

                           </tr>
                           <!-- 첫번째 행 끝-->
                           </c:forEach>
                           <tr><td onclick="deleteNote('unRead')" class="align-items-center" colspan='5' style="text-align:center;cursor:pointer;background-color:rgba(0, 0, 0, 0.075);">삭제</td></tr>
                        </tbody>
                     </table>
                     <!-- 읽지않은 쪽지 테이블 끝 -->
                     <!-- 여기다가 페이징 receive-unRead-Note -->
                     <div id="unReadNote-paging-div" class="d-none justify-content-center">
                        <nav aria-label="Page navigation example ">
                           <ul id="unReadNotePagingUl" class="pagination">
                              <li class='page-item'><a class='page-link' aria-label='Previous' onclick='doReceiveNotePaging(1)' style='cursor: pointer;'> <span aria-hidden='true'>&laquo;</span>
                              </a></li>


                              <c:if test="${receiveUnReadNotePVO.startPage ne 1 }">
                                 <li class="page-item"><a class="page-link " onclick="doReceiveNotePaging(${receiveUnReadNotePVO.startPage-1})" style='cursor: pointer;'>&lt;</a></li>
                              </c:if>

                              <c:forEach begin="${receiveUnReadNotePVO.startPage }" end="${receiveUnReadNotePVO.endPage }" var="p">

                                 <c:choose>
                                    <c:when test="${p == receiveUnReadNotePVO.nowPage }">
                                       <li class="page-item"><a class="page-link active" onclick="doReceiveNotePaging(${p})" style='cursor: pointer;'>${ p }</a></li>
                                    </c:when>
                                    <c:otherwise>
                                       <li class="page-item"><a class="page-link" onclick="doReceiveNotePaging(${p})" style='cursor: pointer;'>${ p }</a></li>
                                    </c:otherwise>
                                 </c:choose>

                              </c:forEach>

                              <c:if test="${receiveUnReadNotePVO.endPage ne receiveUnReadNotePVO.lastPage}">
                                 <li class="page-item"><a class="page-link " onclick="doReceiveNotePaging(${receiveUnReadNotePVO.endPage+1})" style='cursor: pointer;'>&gt;</a></li>
                              </c:if>

                              <li class="page-item"><a class="page-link" aria-label="Next" onclick="doReceiveNotePaging(${receiveUnReadNotePVO.lastPage})" style='cursor: pointer;'> <span aria-hidden="true">&raquo;</span>
                              </a></li>
                           </ul>
                        </nav>
                     </div>


 



                     <!-- 읽은 쪽지 테이블 시작 -->
                     <table class="table table-hover note-table readNote-table d-none">
                        <colgroup>
                           <col style="width: 6%;">
                           <col style="width: 16%;">
                           <col style="width: 47%;">
                           <col style="width: 18%;">
                           <col style="width: 13%;">
                        </colgroup>

                        <thead class="table-dark">
                           <tr>
                              <th><input class="" id="checkAllRead" type="checkbox" value=""></th>
                              <th>보낸이</th>
                              <th>내용</th>
                              <th>받은 시간</th>
                              <th></th>
                           </tr>
                        </thead>

                        <tbody id="receiveReadNote">
                           <c:forEach var="readNote" items="${ readNotes }">
                           <!-- 첫번째 행 시작-->
                           <tr>
                              <!-- 체크박스 -->
                              <th><input class="" name="checkOneRead" type="checkbox" value="${ readNote.noteNum }"></th>

                              <!-- 보낸이 -->
                              <td>${ readNote.crewNickname }

                                    <div id="flush-collapseOne-${ readNote.noteNum }" class="accordion-collapse collapse">
                                       <div class="accordion-body" style="white-space: pre-line;">
                                          <c:if test="${ readNote.crewPhoto eq 'default' }">
                                             <img class="img-fluid rounded-circle" style="opacity: 0.5; width: 80; height: 80; position:;" src="/images/defaultPhoto.jpg" alt="...">
                                          </c:if>
                                          <c:if test="${ readNote.crewPhoto ne 'default' }">
                                             <img class="img-fluid rounded-circle" style="width: 80; height: 80; position:;" src="/images/ship/${ readNote.shipNum }/${ readNote.crewPhoto }" alt="...">
                                          </c:if>

                                       </div>
                                    </div>

                                 </td>

                              <!-- 내용 부분 시작 -->
                              <td>
                                 <!-- 간단히 보여질 내용 -->
                                 <button onclick="updateNote(this,${ readNote.noteNum })" class="row accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne-${ readNote.noteNum }" aria-expanded="false" aria-controls="flush-collapseOne-${ readNote.noteNum }">
                                                                     
                                    <div class="col text-truncate">
                                    <c:if test="${ readNote.noteStatus eq 0}">
                                    <i id="star-${ readNote.noteNum }" class="bi bi-stars" style="color:coral;"></i>
                                    </c:if>
                                    ${ readNote.noteContent }
                                    
                                    
                                     
                                    </div>
                                 </button> <!-- 전체 내용 -->
                                 <div id="flush-collapseOne-${ readNote.noteNum }" class="accordion-collapse collapse">
                                    <div class="accordion-body mt-3" style="white-space: pre-line;">
                                    <div class="border-top border-bottom py-3"><p style="font-size:smaller;">전체내용</p><br>&nbsp&nbsp${ readNote.noteContent }<br><br></div>
                                    <p style="font-size:smaller;">( <a href="/ship/${ readNote.shipNum }">${ readNote.shipName }</a> ) 의 CREW</p> 
                                    </div>
                                 </div>
                              </td>
                              <!-- 내용 부분 끝 -->

                              <!-- 받은 시간 -->
                              <td>${readNote.noteWdate}
                                    <div id="flush-collapseOne-${ readNote.noteNum }" class="accordion-collapse collapse">
                                       <div class="accordion-body mt-3" style="white-space: pre-line;">
                                          <fmt:formatDate value="${readNote.noteWdate}" pattern="hh:mm:ss" />
                                       </div>
                                 </div></td>
                              <td class="return-box">
                              <input type="hidden" class="returnReceiver" name="returnReceiver" value="${ readNote.crewNum }">
                              <input type="hidden" class="returnCrewNickname" name="returnCrewNickname" value="${ readNote.crewNickname }">
                              <input type="hidden" class="returnSender" name="returnSender" value="${ readNote.noteReceiver }">
                                 <button type="button" class="btn btn-light sendBackBtn noteBox" onclick="sendNote(this)">답장</button>
                              </td>

                           </tr>
                           <!-- 첫번째 행 끝-->
                           </c:forEach>
                           <tr><td onclick="deleteNote('read')" class="align-items-center" colspan='5' style="text-align:center;cursor:pointer;background-color:rgba(0, 0, 0, 0.075);">삭제</td></tr>
                        </tbody>
                     </table>
                     <!-- 읽은 쪽지 테이블 끝 -->
                     <!-- 여기다가 페이징 -->
                     <div id="readNote-paging-div" class="d-none justify-content-center">
                        <nav aria-label="Page navigation example ">
                           <ul id="readNotePagingUl" class="pagination">
                              <li class='page-item'><a class='page-link' aria-label='Previous' onclick='doReceiveNotePaging(1)' style='cursor: pointer;'> <span aria-hidden='true'>&laquo;</span>
                              </a></li>


                              <c:if test="${receiveReadNotePVO.startPage ne 1 }">
                                 <li class="page-item"><a class="page-link " onclick="doReceiveNotePaging(${receiveReadNotePVO.startPage-1})" style='cursor: pointer;'>&lt;</a></li>
                              </c:if>

                              <c:forEach begin="${receiveReadNotePVO.startPage }" end="${receiveReadNotePVO.endPage }" var="p">

                                 <c:choose>
                                    <c:when test="${p == receiveReadNotePVO.nowPage }">
                                       <li class="page-item"><a class="page-link active" onclick="doReceiveNotePaging(${p})" style='cursor: pointer;'>${ p }</a></li>
                                    </c:when>
                                    <c:otherwise>
                                       <li class="page-item"><a class="page-link" onclick="doReceiveNotePaging(${p})" style='cursor: pointer;'>${ p }</a></li>
                                    </c:otherwise>
                                 </c:choose>

                              </c:forEach>

                              <c:if test="${receiveReadNotePVO.endPage ne receiveReadNotePVO.lastPage}">
                                 <li class="page-item"><a class="page-link " onclick="doReceiveNotePaging(${receiveReadNotePVO.endPage+1})" style='cursor: pointer;'>&gt;</a></li>
                              </c:if>

                              <li class="page-item"><a class="page-link" aria-label="Next" onclick="doReceiveNotePaging(${receiveReadNotePVO.lastPage})" style='cursor: pointer;'> <span aria-hidden="true">&raquo;</span>
                              </a></li>
                           </ul>
                        </nav>
                     </div>                     
                     
                  </div>

               </div>
            </main>
         </div>

      </div>
   </div>

<!-- 쪽지 모달창 시작 -->
<div class="note-modal" style="display: none;">
   <div class="note-modal-content p-4">

      <div class="d-flex flex-column justify-content-center align-items-between" style="color: #0000008c;" >
         <div class="row-1 p-4 pb-2 border-bottom">
            <h5 class="d-flex justify-content-center">쪽지</h5>
            <i class="fas fa-times fa-2x note-modal-close-i"></i>
         </div>
         <div class="col d-flex flex-column justify-content-between align-items-center p-3" style="color: #0000008c;" >

            <div class="w-100 my-2 d-flex justify-content-start">
               
               <span class="me-3 mb-2" style="font-weight:800;">받는 사람 </span>
               <span id="noteReceiverCrewNickname" class=""></span>
               <input id="noteReceiver" type="hidden">
               <input id="noteSender" type="hidden">
               
            </div>
            <div class="row-9  border w-100" style="height:auto;">
               <textarea id="noteContent" class="w-100 note-modal-textarea"></textarea>
            </div>

            <div class="my-4 d-flex justify-content-center">
               <button class="btn border btn-outline-dark border-dark rounded-0 p-2 m-3 btn-send-note" style="font-size: 13px; width: 90px;">보내기</button>
               <button class="btn border btn-outline-dark border-dark rounded-0 p-2 m-3 btn-cancel-note" style="font-size: 13px; width: 90px;">취소</button>
            </div>
         </div>
      </div>
   </div>
   <div class="write-modal-layer"></div>
</div>
<!-- 쪽지 모달창  끝 -->

</body>


<script>

function doReceiveNotePaging(p){
   
   $("#checkAllRead").prop('checked',false);
   $("#checkAllUnRead").prop('checked',false);
   $("#checkAllRecieve").prop('checked',false);
   
   let theme = "";
   
   let checkName = "";
   let tableID = "";
   let pagingUI = "";
   
   if(sessionStorage.getItem("sessionReadNote")=="allNote"){
      theme="all";
      checkName="checkOneRecieve";
      tableID = "receiveAllNote";
      pagingUI="allNotePagingUl";
      
   }else if (sessionStorage.getItem("sessionReadNote")=="unReadNote"){
      theme="unRead";
      checkName="checkOneUnRead";
      tableID = "receiveUnReadNote";
      pagingUI="unReadNotePagingUl";
      
   }else if (sessionStorage.getItem("sessionReadNote")=="readNote"){
      theme="read";
      checkName="checkOneRead";
      tableID = "receiveReadNote";
      pagingUI="readNotePagingUl";
      
   }else{
      theme="all";
      checkName="checkOneRecieve";
      tableID = "receiveAllNote";
      pagingUI="allNotePagingUl";
   }
   
   let category = $("#note-category").val();
   let keyword = $("#note-search-box").val();
   
   if(keyword.length < 1) keyword="";

   
   let jsObject={ nowPage:p, cntPerPage:10, category:category, keyword:keyword, theme:theme };   
   
   $.ajax({
      url:"/rest/doReceiveNotePaging.json",
      type:"post",
      data:jsObject,
      success:function(data){                           
         let notes= data.receiveNotes;
         console.log(" # notes : ");
         console.log(notes);
         console.log(" # notes length : "+notes.length);                           
         let tHtml="";
         for(let note of notes) {   
            
            //내용물
            tHtml+="<tr>";
            
            tHtml+="<th><input name='"+checkName+"' type='checkbox' value='"+note.noteNum+"'></th>";         
            
            tHtml+="<td>"+note.crewNickname+"";
            tHtml+="<div id='flush-collapseOne-"+note.noteNum+"' class='accordion-collapse collapse'>";                              
            tHtml+="<div class='accordion-body' style='white-space: pre-line;'>";
            if(note.crewPhoto == 'default'){
               tHtml+= "<img class='img-fluid rounded-circle' style='opacity: 0.5; width: 80; height: 80; position:;' src='/images/defaultPhoto.jpg' alt='...'>";
            }else{
               tHtml+="<img class='img-fluid rounded-circle' style='width: 80; height: 80; position:;' src='/images/ship/"+note.shipNum+"/"+note.crewPhoto+"' alt='...'>";
            }
            tHtml+="</div>";
            tHtml+="</div>";
            tHtml+="</td>";
            tHtml+="<td>";
            tHtml+="<button onclick='updateNote(this,"+note.noteNum+")' class='row accordion-button collapsed' type='button' data-bs-toggle='collapse' data-bs-target='#flush-collapseOne-"+note.noteNum+"' aria-expanded='false' aria-controls='flush-collapseOne-"+note.noteNum+"'>";                  
            tHtml+="<div class='col text-truncate'>";
            if(note.noteStatus == 0){
               tHtml += "<i id='star-"+note.noteNum+"' class='bi bi-stars' style='color:coral;'></i>";               
            }
            tHtml+=" "+note.noteContent;
            tHtml+="</div>";
            tHtml+="</button>";

            tHtml+="<div id='flush-collapseOne-"+note.noteNum+"' class='accordion-collapse collapse'>";
            tHtml+="<div class='accordion-body mt-3' style='white-space: pre-line;'>";   
            tHtml+="<div class='border-top border-bottom py-3'><p style='font-size:smaller;'>보낸 내용</p><br>&nbsp&nbsp"+note.noteContent+"<br><br></div>";   
            
            tHtml+="<p style='font-size:smaller;'>( <a href='/ship/"+note.shipNum+"'>"+note.shipName+"</a> ) 의 CREW</p>";
            
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
                                          
            tHtml+= "<div id='flush-collapseOne-"+note.noteNum+"' class='accordion-collapse collapse'>"; 
            tHtml+= "<div class='accordion-body mt-3' style='white-space: pre-line;'>"; 
            tHtml+= timeString;
            tHtml+= "</div>";
            tHtml+= "</div>";
            tHtml+= "</td>";
            tHtml+="<td class='return-box'>";
            tHtml+="<input type='hidden' class='returnReceiver' name='returnReceiver' value='"+note.crewNum+"'>";
            tHtml+="<input type='hidden' class='returnCrewNickname' name='returnCrewNickname' value='"+note.crewNickname+"'>";
            tHtml+="<input type='hidden' class='returnSender' name='returnSender' value='"+note.noteReceiver+"'>";
            tHtml+="<button type='button' class='btn btn-light sendBackBtn noteBox' onclick='sendNote(this)'>답장</button>";
            tHtml+="</td>";
            tHtml+="</tr>";
         }
         //삭제버튼
         tHtml+="<tr><td onclick=\"deleteNote('"+theme+"')\" class=\"align-items-center\" colspan='5' style=\"text-align:center;cursor:pointer;background-color:rgba(0, 0, 0, 0.075);\">삭제</td></tr>";
            $('#'+tableID).html(tHtml);
            
         let notePVO= data.notePVO;
         let startPage = notePVO.startPage;
         let endPage = notePVO.endPage;
         let nowPage = notePVO.nowPage;
         let lastPage = notePVO.lastPage;
         console.log(notePVO);
         
         //페이징 하는 번호들 실시간 변화
         let html = "<li class='page-item'><a class='page-link' aria-label='Previous' onclick='doReceiveNotePaging(1)' style='cursor: pointer;'> <span aria-hidden='true'>&laquo;</span></a></li>";
         if(startPage != 1){                              
            html += "<li class='page-item'><a class='page-link ' onclick='doReceiveNotePaging("+(parseInt(startPage)-1)+")' style='cursor: pointer;'>&lt;</a></li>";
         }
         for ( let i = startPage ; i <= endPage ; i++ ){
            if( i == nowPage ){
               html += "<li class='page-item'><a class='page-link active' onclick='doReceiveNotePaging("+i+")' style='cursor: pointer;'>"+i+"</a></li>";                                 
            }else{
               html += "<li class='page-item'><a class='page-link' onclick='doReceiveNotePaging("+i+")' style='cursor: pointer;'>"+i+"</a></li>";
            }                              
         }
         if(endPage != lastPage){
            html += "<li class='page-item'><a class='page-link ' onclick='doReceiveNotePaging("+(parseInt(endPage)+1)+")' style='cursor: pointer;'>&gt;</a></li>";
         }
         html += "<li class='page-item'><a class='page-link' aria-label='Next' onclick='doReceiveNotePaging("+parseInt(lastPage)+")' style='cursor: pointer;'> <span aria-hidden='true'>&raquo;</span></a></li>";
         
         //pagingUI could be 3 types
         $("#"+pagingUI).html(html);
         
      },                        
   }); 
}

function showNote(el){                              
   if(el.name == 'allNote'){
      sessionStorage.setItem("sessionReadNote",el.name);
   }else if(el.name == 'unReadNote'){
      sessionStorage.setItem("sessionReadNote",el.name);
   }else if(el.name == 'readNote'){
      sessionStorage.setItem("sessionReadNote",el.name);                        
   }
   location.reload();
}

function updateNote(el,noteNum){
   console.log(el)
   el.querySelector(".bi-stars").style.display="none";
   console.log(noteNum)
   
   $.ajax({
      url:"/rest/updateNote",
      type:"post",
      data:{noteNum:noteNum}, 
      success:function(data){
         console.log(noteNum+" 번 쪽지 읽음처리완료")         
      },
      
   });
}

function sendNote(el){
   
   let returnBox = el.closest(".return-box");
   
   let returnReceiver = returnBox.querySelector(".returnReceiver").value;
   let returnCrewNickname = returnBox.querySelector(".returnCrewNickname").value;
   let returnSender = returnBox.querySelector(".returnSender").value;
   
   let crewNicknameSpan = $("#noteReceiverCrewNickname")[0];
   crewNicknameSpan.innerText=returnCrewNickname;   
   
   $("#noteReceiver").val(returnReceiver);
   $("#noteSender").val(returnSender); 

   $("#noteContent").val("");
   document.querySelector(".note-modal").style.display = "block";
}

$(document).ready(function(){
   
   let allNoteBtn = document.querySelector(".allNote");
   let unReadNoteBtn = document.querySelector(".unReadNote");
   let readNoteBtn = document.querySelector(".readNote");
   
   let allNoteTable = $(".allNote-table")[0];
   let unReadNoteTable = $(".unReadNote-table")[0];
   let readNoteTable = $(".readNote-table")[0];
   
   let allNotePagingDiv = $("#allNote-paging-div")[0];
   let unReadNotePagingDiv = $("#unReadNote-paging-div")[0];
   let readNotePagingDiv = $("#readNote-paging-div")[0];
   
   
   if(sessionStorage.getItem("sessionReadNote")=="allNote"){
      allNoteTable.className="table table-hover note-table allNote-table";
      allNotePagingDiv.className='d-flex justify-content-center';
      allNoteBtn.style.backgroundColor='rgb(173, 181, 189)';
   }else if (sessionStorage.getItem("sessionReadNote")=="unReadNote"){
      unReadNoteTable.className="table table-hover note-table unReadNote-table";
      unReadNotePagingDiv.className='d-flex justify-content-center';
      unReadNoteBtn.style.backgroundColor='rgb(173, 181, 189)';
      
   }else if (sessionStorage.getItem("sessionReadNote")=="readNote"){
      readNoteTable.className="table table-hover note-table readNote-table";
      readNotePagingDiv.className='d-flex justify-content-center';
      readNoteBtn.style.backgroundColor='rgb(173, 181, 189)'; 
   }else{
      allNoteTable.className="table table-hover note-table allNote-table";
      allNotePagingDiv.className='d-flex justify-content-center';
      allNoteBtn.style.backgroundColor='rgb(173, 181, 189)';
   }
   
   


//    쪽지 모달창

   /*쪽지 보내기 클릭시 모달창  */   

   /* 쪽지 모달창  X 버튼 */ 
   $(".note-modal-close-i").on("click", function(){
      document.querySelector(".note-modal").style.display = "none";
   });
   /* 쪽지 취소 버튼 */ 
   $(".btn-cancel-note").on("click", function(){
      document.querySelector(".note-modal").style.display = "none";
   });
   /*쪽지 보내기 버튼 */ 
   $(".btn-send-note").on("click", function(){      
      
      let noteContent = $("#noteContent").val();
      
      if( noteContent.length < 1 ){
         alert("쪽지 내용을 입력해주세요!");         
      }else{         
         
         let noteSender = $("#noteSender").val();
         let noteReceiver = $("#noteReceiver").val();
          
         $.ajax({
            url:"/rest/sendNote",
            type:"post",
            data:{noteSender:noteSender,noteReceiver:noteReceiver,noteContent:noteContent},            
            success:function(data){
               alert("쪽지를 보냈습니다!");
               document.querySelector(".note-modal").style.display = "none";
            },
         });
      }
   });
   
   
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
   $("#checkAllUnRead").on("click",function(){

      let isCheckedAll = $('#checkAllUnRead').is(':checked');
         
      if(isCheckedAll){
         $("input:checkbox[name='checkOneUnRead']").prop('checked',true);
      }else{   
         $("input:checkbox[name='checkOneUnRead']").prop('checked',false);
      }
         
   })   
   
   
//   상단 체크박스가 체크되면, 하위 체크박스 모두 체크 or 모두 해제   
   $("#checkAllRead").on("click",function(){

      let isCheckedAll = $('#checkAllRead').is(':checked');
         
      if(isCheckedAll){
         $("input:checkbox[name='checkOneRead']").prop('checked',true);
      }else{   
         $("input:checkbox[name='checkOneRead']").prop('checked',false);         
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
   $("input:checkbox[name='checkOneUnRead']").on("click",function(){

      let totalCnt = $("input:checkbox[name='checkOneUnRead']").length;
      let checkedCnt = $("input:checkbox[name='checkOneUnRead']:checked").length;

      if(totalCnt==checkedCnt ){
         $("#checkAllUnRead").prop('checked',true);
      }else{
         $("#checkAllUnRead").prop('checked',false);
      }
      
   })   
   
//   전부 다 체크되면 상단체크 or 아니면 상단 해제
   $("input:checkbox[name='checkOneRead']").on("click",function(){

      let totalCnt = $("input:checkbox[name='checkOneRead']").length;
      let checkedCnt = $("input:checkbox[name='checkOneRead']:checked").length;

      if(totalCnt==checkedCnt ){
         $("#checkAllRead").prop('checked',true);
      }else{
         $("#checkAllRead").prop('checked',false);
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
              $("#checkAllUnRead").prop('checked',false); 
           }
       });
      alert("삭제되었습니다.");
      
   })   
       
   
   
})

                     
                     
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
                     


</script>


</html>