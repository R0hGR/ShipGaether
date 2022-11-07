let fileBoard = function(){
   document.querySelector("#write-modal").style.display = "block";
   
}
function openUpdate(boardNum, shipNum){
   console.log("openUpdate : "+shipNum)
      $('.boardModalTitle').text("글 수정");
   
   $("#update-board-submit-btn").css("display","block");
   $("#write-board-submit-btn").css("display","none");   
   $('#boardNum').val(boardNum); 
   $.ajax({
      url:"/rest/openReadBoard.json",
      type:"post",
      data:{boardNum:boardNum, shipNum:shipNum},
      async: false,
      success:function(data){   
         let board = data.board;
         console.log(board)
         console.log($('#writeBoardSubject').val())
         $('#writeBoardSubject').val(board.boardSubject);
         $('#boardWriteDiv').html(board.boardContent);      
          
      },
   });
   

   document.querySelector("#write-modal").style.display = "block";
}

function openRead(shipNum,boardNum){
   
   $.ajax({
      url:"/rest/updateBoardView",
      type:"post",
      async: false,
      data:{boardNum:boardNum},       
      success:function(data){
//         console.log("#updateBoardView 갓따옴");         
      },      
   });
   
   let view = parseInt($("#board-view-"+boardNum).text())+1;   
   $("#board-view-"+boardNum).text(view);      //임시로 조회수 올려줌 어차피 디비랑 같을꺼니가 상관 x

   
   
   
   $.ajax({
      url:"/rest/openReadBoard.json",
      type:"post",
      data:{boardNum:boardNum, shipNum:shipNum},
      async: false,
      success:function(data){
//         console.log(data)
         
         let board = data.board;
         let surroundingBoardNum = data.surroundingBoardNum;
         console.log(board);
         console.log(surroundingBoardNum);
         $('#readBoardCrewInfo').html("작성자 : "+board.crewNickname); 
         $('#readBoardSubject').val(board.boardSubject);
         $('#readBoardDiv').html(board.boardContent);
         $('#readBoardWDate').html("게시날짜 : "+board.boardWdate);
         console.log("#crewPhoto : ");
         console.log(board.crewPhoto);
         
         
           if(board.crewPhoto !=  'default'){
                $('#readBoardCrewPhoto').attr('src','/images/ship/'+shipNum+'/'+board.crewPhoto);
            }

//         
//         
         
//         console.log($('#left-arrow-div'));
         if(surroundingBoardNum.preBoardNum != 0){
            $('#left-arrow-div').html("<button class='arrow' id='left-arrow-btn' onclick='openRead("+shipNum+","+(surroundingBoardNum.preBoardNum)+")'>"+"<i class='bi bi-chevron-compact-left arrow'></i>"+"</button>");            
         }else{ 
            $('#left-arrow-div').html("");
         }
                        
         
         if(surroundingBoardNum.nextBoardNum != 0){
            $("#right-arrow-div").html("<button class='arrow' id='right-arrow-btn' onclick='openRead("+shipNum+","+(surroundingBoardNum.nextBoardNum)+")'>"+"<i class='bi bi-chevron-compact-right arrow'></i>"+"</button>");
         }else{
            $("#right-arrow-div").html("");
         }
            
//         
         
      },
   });
   
   let deleteBtns = $("#read-modal").find('.delete-btn'); // 자식요소는 children find는 손주까지 전부
   let downloadBtns = $("#read-modal").find('.download-btn'); // 자식요소는 children find는 손주까지 전부
   
   for ( btn of deleteBtns ){         
      btn.style.display = "none";
   }
   
   for ( btn of downloadBtns ){      
      btn.style.display = "block";
   }
   let readModal = document.querySelector("#read-modal");   
   readModal.style.display = "block";
}

window.addEventListener('keyup', function(event) {
   let readModal = document.querySelector("#read-modal");   
   let readModalStatus = readModal.style.display;
//    console.log(event.key);
    if(event.key == "ArrowRight" && readModalStatus == "block") {
//      alert("오른쪽작동")
      $("#right-arrow-btn").click();
   }else if(event.key == "ArrowLeft" && readModalStatus == "block") {
//      alert("왼쪽작동")
      $("#left-arrow-btn").click();
   }

});


$(document).ready(function(){
   
   
   
   $("body").on("click", function(e){
            

      
      let target = e.target;
      
      if(target.className == "btn btn-more" || target.className == "fas fa-ellipsis-v" ){         
         $(".reply-menu-box").css("display","none");
      }else if (target.className =="btn-reply-more" || target.className == "fas fa-ellipsis-v reply-more" ){
         let targetParent = target.closest("div .sub-box");
         let realTarget = targetParent.querySelector(".reply-menu-box");
//         console.log(" # realTarget 타겟");
//         console.log(realTarget);
         if(realTarget.style.display == "none"){
            realTarget.style.display = "block";
         }else{ 
            realTarget.style.display = "none"; 
         }               
      }else{         
         $(".reply-menu-box").css("display","none");
         $(".post-menu-box").css("display","none");
      }
   })   
      
});