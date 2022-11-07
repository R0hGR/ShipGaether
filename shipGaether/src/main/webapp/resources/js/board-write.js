

var shipNum = $('#shipNum').val();




var allPhotoFiles = [];
var insertPhotoFile = [];
var deletePhotoFile = [];
var beforeFiles = [];
function checkPhoto(inputElement) {
   let photoExtensions = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf|jfif|pjpeg|pjp)$/;   // 확장자명 제약조건
   
   var photoFile = inputElement.files[0];
   let photoFileName = photoFile.name; //   파일의 이름
      
   if (photoExtensions.test(photoFileName)){
      let form = new FormData();      
      form.append( photoFile.name, photoFile );
      
      $.ajax({
         url:"/rest/attachBoardPhoto/"+shipNum, 
         type:"post" ,
         processData : false,
         contentType : false,
         async: false,
         data : form,
         dataType : "json",
         success: function(data){
            console.log("checkPhoto 갔다옴");
            console.log(data);
            
            var comeBackPhotoFile = {
                  name : data.ofnames[0],
                  dumpName : data.savefnames[0],
                  fsize : data.fsizes[0]
            };            
            
            allPhotoFiles.push(comeBackPhotoFile);            
            let html = $('#boardWriteDiv').html();
            html += "<img id='"+comeBackPhotoFile.dumpName+"' src='/images/ship/"+shipNum+"/"+comeBackPhotoFile.dumpName+"' width='100%' alt='"+comeBackPhotoFile.fsize+"'>";
            $('#boardWriteDiv').html(html);
         },                    
      });      
   }else{
      alert(" # 사진파일만 가능합니다. 확장자명을 확인해주세요!");
   }
}


function checkBeforeSubmit(from){   
   if( from == 'write'){
      insertBoard(); // 다짜고짜 일단 내용부터 인서트      
      var els = $("#boardWriteDiv").children('img');   
      console.log(" wirte 모달에 남아있는 img 태그 요소 : " );
      console.log(els);
      for (var el of els){
         filterPhotoBox(el.id);
      }
      

      
      console.log("제거한뒤 올포토파일");
      console.log(allPhotoFiles);
      
      for( file of allPhotoFiles ){
         deletePhotoFile.push(file.dumpName) // 삭제해야할 포토파일 리스트
      }

      console.log("제거한뒤 deletePhotoFile");
      console.log(deletePhotoFile);
      

      if(insertPhotoFile.length>0){
         for( insertPhoto of insertPhotoFile){      
            doInsertPhotoFile(insertPhoto);
         }      
      }
       
      if(deletePhotoFile.length>0){
         for( file of deletePhotoFile){
            removePhotoFilePath(file);      
         }      
      } 
      
      
      console.log(" # insert 할 FILE 파일");
      console.log(allFiles);
      
      if(allFiles.length>0){
         for( insertfile of allFiles){         
            doInsertFile(insertfile);      
         }      
      }
      
      
      console.log(" # 그중에서 delete 할 FILE 파일");
      console.log(deleteFiles);
      
      if( deleteFiles.length >0 ){
         for( deleteFile of deleteFiles){      
            removePhotoFilePath(deleteFile);   
            deleteFileS(deleteFile);
         }      
      } 
      
      
      
      console.log("#   최종 insert할 PHOTO파일");
      console.log(insertPhotoFile);      
      console.log("# 최종 delete할 PHOTO파일");
      console.log(deletePhotoFile);   
      
      location.reload(); 
   }else if ( from == 'update'){
      updateBoard();
      
      var els = $("#boardWriteDiv").children('img');   
      console.log(" wirte 모달에 남아있는 img 태그 요소 : " );
      console.log(els);
      for (var el of els){
         filterPhotoBox(el.id);
      }
      
      var docEls = $("#boardWriteDiv").find('.download-btn');
      console.log("# console.log(docEl123s)");
      console.log(docEls);
      
      console.log("제거한뒤 올포토파일");
      
      for( file of allPhotoFiles ){
         deletePhotoFile.push(file.dumpName)
      }

      console.log("제거한뒤 deletePhotoFile");
      console.log(deletePhotoFile);
      

      if(insertPhotoFile.length>0){
         for( insertPhoto of insertPhotoFile){      
            doInsertPhotoFile(insertPhoto);
         }      
      }
       
      if(deletePhotoFile.length>0){
         for( file of deletePhotoFile){
            removePhotoFilePath(file);      
         }      
      } 
      
      
      console.log(" # insert 할 FILE 파일");
      console.log(allFiles);
      
      if(allFiles.length>0){
         for( insertfile of allFiles){         
            doInsertFile(insertfile);      
         }      
      }
      
      
      console.log(" # 그중에서 delete 할 FILE 파일");
      console.log(deleteFiles);
      
      if( deleteFiles.length >0 ){
         for( deleteFile of deleteFiles){      
            removePhotoFilePath(deleteFile);   
            deleteFileS(deleteFile);
         }      
      } 
      for(docEl of docEls){
         for(let i = 0; i < beforeFiles.length; i++) {
              if(beforeFiles[i].dumpName == docEl.name)  {
                 beforeFiles.splice(i, 1);
                i--;
              }
         }
      }
      
      
      if(beforeFiles.length>0){ // 필요없는 썸네일 사진의 db 삭제 
         for ( file of beforeFiles ){
            removePhotoFilePath(file.dumpName); // 불필요 사진 물리적인 위치 삭제
            deleteFileS(file.dumpName); // 불필요 사진 db삭제    
         }
      }

      
            
      

      
      location.reload(); 
   }
   
   
//   alert("insert 하고 나서 board넘버 가져온 : "+ boardNum);
   
   
   
   

}

function filterPhotoBox(fileName){
   console.log(" # if문 들어옴 111 : " + fileName);
   
   if(from="write"){
      
   }
   
   for(let i = 0; i < allPhotoFiles.length; i++) {
        if(allPhotoFiles[i].dumpName == fileName)  {
           insertPhotoFile.push(allPhotoFiles[i]);           
           allPhotoFiles.splice(i, 1);
          i--;
        }
   }
   
   for(let i = 0; i < beforeFiles.length; i++) {
        if(beforeFiles[i].dumpName == fileName)  {
           beforeFiles.splice(i, 1);
          i--;
        }
   }
   console.log(" # 불필요한 놈들 .");
   console.log(beforeFiles); 
}
 
function deleteFileS(file){
   
   $.ajax({
      url : "/rest/deleteFile",
      type : "post",
      async: false,
      data : { boardFileSaveName : file },      
      success : function(data){         
      },      
   });
      
}

function doInsertFile(file){   
   console.log("# boardNum : "+$('#boardNum').val());
   console.log(" # doInsertFile 들어옴!!!!!");
   var jsObject = {
         boardFileName : file.name,
         boardFileSaveName : file.dumpName,
         boardFileSize : file.fsize,
         //   boardFileStatus = 사진인지 파일의사진인지 구분 0이면 본문에보이는거 1이면 밑에 첨부
         boardFileStatus : 1,
         boardNum : $('#boardNum').val()
   };
   $.ajax({
      url : "/rest/insertBoardFile",
      type : "post",
      async: false,
      data : jsObject,      
      success : function(data){          
      },      
   });      
}

function doInsertPhotoFile(file){   
   console.log("# boardNum : "+$('#boardNum').val());
   var jsObject = {
         boardFileName : file.name,
         boardFileSaveName : file.dumpName,
         boardFileSize : file.fsize,
         //   boardFileStatus = 사진인지 파일의사진인지 구분 0이면 본문에보이는거 1이면 밑에 첨부
         boardFileStatus : 0,
         boardNum : $('#boardNum').val()
   };    
   $.ajax({
      url : "/rest/insertBoardFile",
      type : "post",
      async: false,
      data : jsObject,      
      success : function(data){         
      },      
   });
}

function removePhotoFilePath(file){
   $.ajax({
      url : "/rest/removePhotoFilePath/"+shipNum,
      type : "post",
      async: false,
      data : {boardFileSaveName : file},      
      success : function(data){
         console.log("photoFile 삭제 다녀왔슴다");
      }
   });
}



function updateBoard(){   
   let html = $('#boardWriteDiv').html();
   $('#boardContent').val(html);   
   if($('#writeBoardSubject').val().length <1 ){
      $('#writeBoardSubject').val("제목 없음...");
   }
   var jsObj = {
         boardNum : $('#boardNum').val(),
         boardSubject : $('#writeBoardSubject').val(),
         boardContent : $('#boardContent').val(),
         crewNum : $('#crewNum').val()
   };
   
   $.ajax({
      url : "/rest/updateBoard",
      type : "post" ,
      data : jsObj,
      async: false,
      success:function(data){
         console.log("업데이트 다녀왓슴다 : ");   
      },
   });   
   
   $.ajax({
      url : "/rest/selectBeforPhotoFiles.json",
      type : "post" ,
      data : {boardNum:$('#boardNum').val()},
      async: false,
      success:function(data){
         console.log("원래 존재하던 파일 다녀왓슴다 : ");
         for ( file of data){
            let comeBackFile = {
                  name : file.boardFileName,
                  dumpName : file.boardFileSaveName,
                  fsize : file.boardFileSize
            };                        
            beforeFiles.push(comeBackFile);            
         }
         console.log(beforeFiles);          
      },
   });
}

function insertBoard(){
   let html = $('#boardWriteDiv').html();
   $('#boardContent').val(html);   
   if($('#writeBoardSubject').val().length <1 ){
      $('#writeBoardSubject').val(" ");
   }
   if($('#boardContent').val().length <1 ){
      $('#boardContent').val(" ");
   }
   var jsObj = {
         boardSubject : $('#writeBoardSubject').val(),
         boardContent : $('#boardContent').val(),
         crewNum : $('#crewNum').val()
   };
   
   $.ajax({
      url : "/rest/insertBoard",
      type : "post" ,
      data : jsObj,
      async: false,
      success:function(data){
         console.log("다녀왓슴다 boardNum : "+data);
         $('#boardNum').val(data);         
      },
   });      
}







function setOpen(el){
   let icon = el.children;   
   if (el.name == "0"){
      el.name="1";
      $(icon[0]).attr('class','bi bi-lock-fill');
      
   }else{
      el.name="0";
      $(icon[0]).attr('class','bi bi-unlock-fill');
   }
   
}
 



 

















