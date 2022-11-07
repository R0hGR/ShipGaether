<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

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
					<%@include file="myPageSidebar.jsp"%>
				</div>

			<!-- main  -->
			<main class="col-9 p-0" style="overflow: visible">
				<div class="col-10 p-0" style="background-color: white;">
					<div class="col-12 p-0 border border-black"
						style="float: none; margin: 0 auto;">
						<div class="row p-0">
							<div class="col-1 px-0 py-2" style="flex-direction: column;">
							</div>
							<div class="col-8 px-0 py-2" style="flex-direction: column;">공지사항 글쓰기</div>
							<div class="col-3 px-0 py-2" style="flex-direction: column;"> </div>
						</div>

			<div class="row p-2 border border-black" style="float: none; margin: 0 auto;">
				
				<div class="p-3 border border-white d-flex border-black d-flex justify-content-start align-items-center" style="background-color:white; color:black">제목</div>
				<textarea id="noticeWriteTitle" placeholder="제목을 입력해주세요." style="width:100%; height:40px; resize: none; background-color:#e9ecef; font-size:15px;"></textarea>
					
				<div class="p-3 border border-white d-flex justify-content-start align-items-center" style="background-color:white; color:black">내용</div>
					<textarea id="noticeWriteContent" placeholder="내용을 입력해주세요." style="width:100%; height:500px; resize: none; background-color:#e9ecef; font-size:15px; "></textarea>
					</div>
					
					<div class="border-white d-flex justify-content-center align-items-center">
					<button type="submit" id="noticeWrite" style="background:white" >작성하기</button>
					</div>
					
				</div>
			</div>
</body>


<script>
// 	보내기 클릭시 제목 내용 insert 해주기
	$('#noticeWrite').click(function(){
		var jsObject = "";
		var	noticeTitle=$("#noticeWriteTitle").val();
		var noticeContent=$("#noticeWriteContent").val();
		
		jsObject ={noticeTitle:noticeTitle,noticeContent:noticeContent};
		
		$.ajax({
			url : "/rest/insertNotice",
			type :'post',
			data :jsObject, 
			success : function(data){
				if(data!=null){
					alert("공지사항이 등록되었습니다.");
					location.href="/notice";	
						}
					}
				});
	});
</script>


</html>