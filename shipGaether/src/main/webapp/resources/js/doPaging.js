               <script>
                  function doRecPaging(p){                     
                     jsObject={total:${countRecShips}, nowPage:p, cntPerPage:6}
                     $.ajax({
                        url:"/rest/doRecPaging.json",
                        type:"post",
                        data:jsObject,
                        success:function(data){                           
                           let recShips= data.recShips;
                           console.log(" # recShips length : "+recShips.length);                           
                           let divHtml="";
                           for(let recShip of recShips) { 
                              divHtml += "<div class='col-6 mb-4'>";
                              divHtml += "<div class='card border-0' style='background-color: #EEF0F3'>";
                              divHtml += "<div class='row'>";                              
                              divHtml += "<div class='col-3'>";
                              if(recShip.shipSample == 1 ){
                                 divHtml += "<img class='img-fluid rounded-2' style='width: 100; height: 100; position:;' src='/images/ship/"+recShip.shipNum+"/ship_photo/"+recShip.shipPhotoName+"' alt='...' />";                                 
                              }else{
                                 divHtml += "<img class='img-fluid rounded-2' style='width: 100; height: 100; position:;' src='/images/ship/sample/"+recShip.shipPhotoName+"' alt='...' />";
                              }
                              divHtml += "</div>";
                              divHtml += "<div class='col-9'>";
                              divHtml += "<div class='card-body p-0'>";
                              divHtml += "<p class='fw-bold mb-1' style='font-size: 1.2em'>"+recShip.shipName+"</p>";
                              divHtml += "<p class='text mb-2 wordOneline' style='color: #0000008c; font-size: 14px'> "+recShip.shipTitle+"</p>";
                              divHtml += "<a class='btn border rounded-5 btn-outline-white p-0' style='background-color: white' href=''> <span class='fw-bolder ms-2' style='font-size: 11px;'>ShipName</span> <span style='font-size: 11px;'>Ship 더보기</span> <span class='me-2' style='font-size: 11px; color: #CECECE;'> ></span></a>";
                              divHtml += "</div>";
                              divHtml += "</div>";
                              divHtml += "</div>";
                              divHtml += "</div>";
                              divHtml += "</div>";
                           }
                           divHtml += "<div class='d-flex justify-content-center'>";
                           divHtml += "<nav aria-label='Page navigation example '>";
                           divHtml += "<ul id='recPagingUl' class='pagination'>";
                           divHtml += "</ul>";
                           divHtml += "</nav>";
                           divHtml += "</div>";
                           
                           $('#recPagingDiv').html(divHtml);
                                                      
                           let recPVO= data.recPVO;
                           let startPage = recPVO.startPage;
                           let endPage = recPVO.endPage;
                           let nowPage = recPVO.nowPage;
                           let lastPage = recPVO.lastPage;
                           console.log(" # startPage : "+startPage);
                           console.log(" # endPage : "+endPage);
                           console.log(" # nowPage : "+nowPage);                           
                           //페이징 하는 번호들 실시간 변화
                           let html = "<li class='page-item'><a class='page-link' aria-label='Previous' onclick='doRecPaging(1)' style='cursor: pointer;'> <span aria-hidden='true'>&laquo;</span></a></li>";
                           if(startPage != 1){                              
                              html += "<li class='page-item'><a class='page-link ' onclick='doRecPaging("+(parseInt(startPage)-1)+")' style='cursor: pointer;'>&lt;</a></li>";
                           }
                           for ( let i = startPage ; i <= endPage ; i++ ){
                              if( i == nowPage ){
                                 html += "<li class='page-item'><a class='page-link active' onclick='doRecPaging("+i+")' style='cursor: pointer;'>"+i+"</a></li>";                                 
                              }else{
                                 html += "<li class='page-item'><a class='page-link' onclick='doRecPaging("+i+")' style='cursor: pointer;'>"+i+"</a></li>";
                              }                              
                           }
                           if(endPage != lastPage){
                              html += "<li class='page-item'><a class='page-link ' onclick='doRecPaging("+(parseInt(endPage)+1)+")' style='cursor: pointer;'>&gt;</a></li>";
                           }
                           html += "<li class='page-item'><a class='page-link' aria-label='Next' onclick='doRecPaging("+parseInt(lastPage)+")' style='cursor: pointer;'> <span aria-hidden='true'>&raquo;</span></a></li>";                           
                           $('#recPagingUl').html(html);
                        },                        
                     }); 
                  }
               </script>