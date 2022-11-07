<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<!-- css 추가 -->
<style>
a {
	text-decoration: none;
	!
	important
}

a:hover {
	text-decoration: none;
	!
	important
}

a:visited {
	text-decoration: none;
	!
	important
}

.attachment-modal-content {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	width: 360px;
	z-index: 5;
}

.attachment-modal-layer {
	position: fixed;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 4;
}

.attachment-modal-timesicon {
	position: absolute;
	right: 30px;
	top: 15px;
	cursor: pointer;
}

.menu a {
cursor:pointer;
}
.menu .hide {display:none;}
</style>


<div class="col-8">

	
	<!-- 최상단 사진첩 -->
	<div class="card border-0 rounded-0 mb-3 d-flex align-items-start">
		<div class="row d-flex ps-4 py-2 ">파일 모아보기</div>
	</div>
	
	
	<div id="file-date-box" class="row border-0 col rounded-0 ms-0 me-0 mb-3 justify-content-start bg-white file-date-box">
	<div id="date-div-all" class="col-2 p-0 d-flex justify-content-start"><button class="btn btn-sm btn-outline-secondary border-secondary border-2" name="all" onclick="filterDate(this)">전체보기</button></div>

	</div>




	<div id="file-date-content">	
	<!-- ajax로 요청한 file들 채워짐 -->
	
	</div>


<script>


$(document).ready(function(){
	$.ajax({
		url : "/rest/getAttachFiles/${shipNum}.json",
		type : "post",
		data : {a:"1"},
		async : false,
		success : function(data){
			
			
			let fileDateSet = new Set();
			let fileYearSet = new Set();
			
			
			console.log("#data");
			console.log(data);
			for( file of data ){
				let fileDate = file.boardFileUdate.substr(0, 10);
				let fileYear = file.boardFileUdate.substr(0, 4);
				fileDateSet.add(fileDate);
				fileYearSet.add(fileYear);
			}
			console.log("# fileDateSet : "+ fileDateSet)
			console.log(fileDateSet)
			console.log("# fileYearSet : "+ fileYearSet)
			console.log(fileYearSet)
			
			
			let fileDateBox = $("#file-date-box");
			
			for (fileYear of fileYearSet){
				let html = "";
				html +="<div id='date-div-"+fileYear+"' class='col-2 p-0 d-flex justify-content-start'><button class='btn btn-sm btn-outline-secondary border-secondary border-2'  name='"+fileYear+"' onclick='filterDate(this)'>"+fileYear+"년</button></div>";				
				$("#file-date-box").append(html);
				
			}

			
			
			let fileDateDivs = fileDateBox.children();
			
			for( fileDate of fileDateSet ){
				let year=fileDate.substr(0,4);
				let month=fileDate.substr(5,2);
				console.log("# year : "+year+ " # month : "+month)
				let html="";
// 				html+="<div class='year-"+year+"'>";
// 				html+="<div class='card border-0 rounded-0 m-0 mt-3 d-flex justify-content-between border-bottom'>";
// 				html+="<div class='row d-flex justify-content-between'>";
// 				html+="<div class='col ps-4 py-0 '>"+year+"년 "+ month+"월</div>";
// 				html+="<div class='col me-2 d-flex justify-content-end'>";
// 				html+="<a id='unfoldFile-"+fileDate+"' name='"+year+"-"+month+"' onclick='unfoldFile(this)' style='display: block;'>전체보기<i class='bi bi-caret-down-fill fs-5'></i></a> <a id='foldFile-"+fileDate+"' name='"+year+"-"+month+"' onclick='foldFile(this)' style='display: none;'>접어두기<i class='bi bi-caret-up-fill fs-5'></i></a>";
// 				html+="</div>";
// 				html+="</div>";
// 				html+="</div>";
// 				html+="<div id='attach-date-"+year+"-"+month+"' style='display: none;'></div>";				
// 				html+="</div>";
				
				
				html+="<ul class='year-"+year+"'>";
				
				html +="<li class='menu card border-0 rounded-0 m-0 mt-3 d-flex justify-content-between border-bottom'>";
				html +="<a>";
				html+="<span class='row d-flex justify-content-between my-2'>";
				html+="<span class='col ps-4 py-0 '>"+year+"년 "+ month+"월</span>";	
				html+="<span class='col me-2 d-flex justify-content-end'>";		
				html+="<button id='unfoldFile-"+fileDate+"' class='btn btn-sm btn-outline-secondary border-0' name='"+year+"-"+month+"' style='display: block;'>";
				html+="<i class='bi bi-caret-down-fill fs-5'></i>";			
				html+="</button>";									
				html+="</span>";				
				html+="</span>";				
				html+="</a>";
				html +="<ul class='hide' id='attach-date-"+year+"-"+month+"'>";
				html+="</ul>";
				html+="</li>";
				
				html+="</ul>";
				
				$("#file-date-content").append(html);
			}
			

			for(file of data){
				let udate = file.boardFileUdate.substr(0,7);
						
					let html="";
// 					html += "<div class='row card border-0 rounded-0 m-0 d-flex align-items-start'>";
// 					html += "<div>";
// 					html +="<a href='#' contenteditable='false' class='aclass row p-3 my-3 m-0 border-around bg-light' style='cursor: pointer;'><div class='col-12 d-flex justify-content-between' style='color: black;'>";	
// 					html +="<span class='col-8'>"+file.boardFileName+"</span> <span class='col-3 file-size' style='opacity: .6;'>"+file.boardFileSize+"</span>";
// 					html +="<button id='"+file.boardFileSaveName+"' type='button' class='col-1 download-btn' style='opacity: 0.6; display: block;' name='"+file.boardFileSaveName+"' onclick='downloadFile(this)'>";
// 					html +="<i class='bi bi-arrow-down'></i>";
// 					html +="</button>";
// 					html +="</div></a>";
// 					html +="</div>";
// 					html +="</div>";
					
					//////////
					
					html +="<li>";
					html+="<div class='row card border-0 rounded-0 m-0 d-flex align-items-start'>";
					html+="<div>";
					html+="<a contenteditable='false' class='aclass row p-3 my-3 m-0 border-around bg-light' style='cursor: pointer;'>";
					html+="<span class='col-12 d-flex justify-content-between' style='color: black;'>";
					html+="<span class='col-8'>"+file.boardFileName+"</span> <span class='col-3 file-size' style='opacity: .6;'>"+file.boardFileSize+"</span>";
					html+="<button id='"+file.boardFileSaveName+"' type='button' class='col-1 download-btn btn btn-sm btn-outline-secondary border-secondary border-2' style='opacity: 0.6; display: block;'  name='"+file.boardFileSaveName+"' onclick='downloadFile(this)'>";
					
					html+="<i class='bi bi-arrow-down'></i>";								
					html+="</button>";								
					html+="</span>";								
					html+="</a>";								
					html+="</div>";								
					html+="</div>";								
					html+="</li>";								
													
									
					
					
					console.log(file.boardFileName)
					$("#attach-date-"+udate).append(html);
				
			}
			
		},
	});
})

    $(document).ready(function(){
	// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때       
	$(".menu>a").click(function(){      
		var submenu = $(this).next("ul");   
		// submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기   
		if( submenu.is(":visible") ){         
			submenu.slideUp();       
		}else{         
			submenu.slideDown(); 
		}
	});
	});

	
	function filterDate(el){
		let year = el.name;
		let targetName = "year-"+year;
		let yearDivs = $(".year-"+year);
// 		console.log(" # yearDivs");
// 		console.log(yearDivs);
		
		let contentDiv = $("#file-date-content");
		console.log(contentDiv)
		let allYearDivs = contentDiv.children();		
		console.log(allYearDivs)
		
		if(el.name=='all'){
			for(div of allYearDivs){
				div.style.display="block";			
			}
			
		}else{
			for(div of allYearDivs){
				if(div.className == targetName ){
					div.style.display="block";				
				}else{
					div.style.display="none";
				}
			}			
		}
		

	}

	function unfoldFile(el){
		let fileBundleNum = el.name;		

		el.style.display="none"
		el.nextElementSibling.style.display="block";
		
		$("#attach-date-"+fileBundleNum).attr('style','display:block;');
// 		El.className="row card border-0 rounded-0 m-0 d-flex align-items-start";
		
		
// 		let mainBox = el.closest("div .main-box");
// 		let replyDivs = mainBox.querySelectorAll('div .sub-box');

		
// 		for ( replyDiv of replyDivs){
// 			replyDiv.style.display="block";							
// 		}						
	}
	
	
	
	function foldFile(el){
		let fileBundleNum = el.name;		
		
		el.style.display="none"
		el.previousElementSibling.style.display="block";
		
		$("#attach-date-"+fileBundleNum).attr('style','display:none;');

		
// 		let mainBox = el.closest("div .main-box");
// 		let replyDivs = mainBox.querySelectorAll('div .sub-box');
		
// 		el.style.display="none";
// 		el.nextElementSibling.style.display="block";
		
// 		for ( replyDiv of replyDivs){
// 			replyDiv.style.display="none";							
// 		}
	}

	function downloadFile(el){
// 		alert("# downloadFile");
		console.log(el.name);
		url="/download.do/${shipNum}/?fname="+el.name;
		location.href=url;
	}
	
	function getPrettyFsize(){		
		var fileSizes = $(".file-size");
		console.log(fileSizes)
// 		var prettyFsize = "";
// 		var sizeKB = file.fsize / 1024;
// 		if (parseInt(sizeKB) > 1024) {
// 			var sizeMB = sizeKB / 1024;
// 			prettyFsize = sizeMB.toFixed(2) + " MB";
// 		} else {
// 			prettyFsize = sizeKB.toFixed(2) + " KB";
// 		}
// 		return prettyFsize;
	}

</script>





</div>

