<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="col-8">

	<!-- ship 관리 상단 메뉴탭 -->
	<div class="card border-0 rounded-0 mb-3 d-flex">
		<div class="row p-3 pb-1 d-flex justify-content-center align-items-between">
			<a href="/ship/${ship.shipNum}/setting/app" class="p-0 m-3 text-center" style="width: 17%; color: black; font-weight: 700;">가입신청서</a> <a href="/ship/${ship.shipNum}/setting/info" class="p-0 m-3 text-center" style="width: 17%; color: black; font-weight: 700;">정보수정</a> <a href="/ship/${ship.shipNum}/setting/photo" class="p-0 m-3 text-center" style="width: 17%; color: black; font-weight: 800; border-bottom: 2px solid #000;">대표사진</a> <a href="/ship/${ship.shipNum}/setting/remove" class="p-0 m-3 text-center" style="width: 17%; color: black; font-weight: 700;">삭제하기</a>
		</div>

	</div>


	<!-- SHIP 포토 수정 리스트 시작 -->
	<div class="card border-0 rounded-0 mb-3 p-2">
		<div class="card-header border-0 bg-white p-0">
			<div class="row" style="float: none; margin: 0 auto;">

				<div class="col px-0 py-2 mb-3 border-bottom" style="flex-direction: column;">

					<div class="card-body p-3">
						<h5 class="fw-bold m-0 " style="float: left;">SHIP 정보 수정</h5>
					</div>
				</div>

			</div>
		</div>


		<div class="row p-3 pt-0 d-flex flex-row justify-content-between align-items-center text-secondary" style="float: none; margin: 0 auto; width: 100%; color: #333;">
			<div class="row-12 my-3 p-0 m-0">

				<div class="ship-setting-photo-box row border-bottom">

					<span class="m-2 fs-5" style="font-weight: 800;">SHIP PHOTO</span>


					<div class="row-8 my-3 d-flex justify-content-center align-items-center" style="height: 400px;">

						<!-- SHIP PHOTO 큰 사진 -->
						<div class="mySlides bigPhoto" class="h-100 w-100">
							<img id="ship-setting-big-photo" name="asd" src="/images/ship/sample/upload.png" style="width: 100%; height: 100%;">
						</div>

					</div>

					<div class="row-4">
						<!-- SHIP PHOTO 위  사진 4장 -->
						<div class="row-6 w-100 ship-small-photo-container d-flex justify-content-around align-items-center">
							<button class="bottom-photo-btn w-25 d-flex justify-content-center align-items-center">
								<input id="ship-setting-photo" type="file" accept="image/png, image/gif, image/jpeg" style="display: none;" onchange="checkPhoto(this);"/> <img class="demo cursor w-90 h-100" src="/images/ship/sample/upload.png" onclick="$('#ship-setting-photo').click();" alt="">

							</button>

							<button class="bottom-photo-btn w-25">
								<img class="demo cursor w-100 h-100" name="ship_photo_sample1.jpg" src="/images/ship/sample/ship_photo_sample1.jpg" onclick="showBigPhoto(this)" alt="">
							</button>
							<button class="bottom-photo-btn w-25">
								<img class="demo cursor w-100 h-100" name="ship_photo_sample2.jpg" src="/images/ship/sample/ship_photo_sample2.jpg" onclick="showBigPhoto(this)" alt="">
							</button>
							<button class="bottom-photo-btn w-25">
								<img class="demo cursor w-100 h-100" name="ship_photo_sample3.jpg" src="/images/ship/sample/ship_photo_sample3.jpg" onclick="showBigPhoto(this)" alt="">
							</button>
						</div>

						<!-- SHIP PHOTO 아래  사진 4장 -->
						<div class="row-6 w-100 ship-small-photo-container d-flex justify-content-around align-items-center" style="display: block;">
							<button class="bottom-photo-btn w-25">
								<img class="demo cursor w-100 h-100" name="ship_photo_sample4.jpg" src="/images/ship/sample/ship_photo_sample4.jpg" onclick="showBigPhoto(this)" alt="">
							</button>
							<button class="bottom-photo-btn w-25">
								<img class="demo cursor w-100 h-100" name="ship_photo_sample5.png" src="/images/ship/sample/ship_photo_sample5.png" onclick="showBigPhoto(this)" alt="">
							</button>
							<button class="bottom-photo-btn w-25">
								<img class="demo cursor w-100 h-100" name="ship_photo_sample6.jpg" src="/images/ship/sample/ship_photo_sample6.jpg" onclick="showBigPhoto(this)" alt="">
							</button>
							<button class="bottom-photo-btn w-25">
								<img class="demo cursor w-100 h-100" name="ship_photo_sample7.jpg" src="/images/ship/sample/ship_photo_sample7.jpg" onclick="showBigPhoto(this)" alt="">
							</button>
						</div>
					</div>

					<!-- 수정하기 버튼 -->
					<div class="d-flex justify-content-end">
						<button class="btn float-right border rounded-0 btn-outline-white p-2 my-3 mt-5" style="font-size: 13px; width: 80px;" onclick="getShipPhotoInfo()">수정하기</button>
					</div>

				</div>



				<!-- SHIP COVER 사진 수정 시작-->
				<div class="ship-setting-photo-box row my-3 border-bottom">
					<div class="d-flex flex-column justify-content-between align-items-between">

						<span class="row-3 fs-5" style="font-weight: 800;">SHIP COVER</span>

						<div class="row-8 d-flex justify-content-center align-items-center" style="height: 300px;">

							<!-- SHIP COVER 큰 사진 -->
							<div class="mySlides bigPhoto h-50 w-100 border">
								<img id="ship-setting-big-cover" src="/images/ship/sample/upload.png" style="width: 100%; height: 100%; object-fit: scale-down;">
							</div>

						</div>

						<div class="row-4">
							<!-- SHIP COVER 작은사진 4장 -->
							<div class="row-6 w-100 ship-small-photo-container d-flex justify-content-around align-items-center">
								<button class="bottom-photo-btn w-25 d-flex justify-content-center align-items-center">
									<input id="ship-setting-cover" type="file" accept="image/png, image/gif, image/jpeg" style="display: none;" onchange="checkBanner(this)"/> <img class="demo cursor w-90 h-100" src="/images/ship/sample/upload.png" onclick="$('#ship-setting-cover').click();" alt="">

								</button>

								<button class="bottom-photo-btn w-25">
									<img class="demo cursor w-100 h-100" name="banner1.jpg" src="/images/ship/sample/banner1.jpg" onclick="showBigPhoto(this)" alt="">
								</button>
								<button class="bottom-photo-btn w-25">
									<img class="demo cursor w-100 h-100" name="banner2.jpg" src="/images/ship/sample/banner2.jpg" onclick="showBigPhoto(this)" alt="">
								</button>
								<button class="bottom-photo-btn w-25">
									<img class="demo cursor w-100 h-100" name="banner3.jpg" src="/images/ship/sample/banner3.jpg" onclick="showBigPhoto(this)" alt="">
								</button> 
							</div>

						</div>



						<!-- 수정하기 버튼 -->
						<div class="row-2 d-flex justify-content-end">
							<button class="btn float-right border rounded-0 btn-outline-white p-2 my-3 mt-5" style="font-size: 13px; width: 80px;" onclick="getShipBannerInfo()">수정하기</button>
						</div>


					</div>






			<input id="shipSample" type="hidden" value="">
			<input id="shipBannerSample" type="hidden" value="">
				</div>
			</div>
		</div>
	</div>
	<!-- SHIP 포토 수정 리스트 끝 -->

</div>

<script>

function updateShipBanner(file){
	let fname = file.name;
	let ShipPhotoSaveName = file.dumpName;
	let fileSize = file.fsize;
	console.log(fname);
	console.log(ShipPhotoSaveName);
	console.log(fileSize);
	
	
	$.ajax({
		url:"/rest/updateShipBanner/${shipNum}",
		type:"post",
		data:{shipBannerName:ShipPhotoSaveName},
		success:function(data){
			alert("대표 배너사진이 변경되었습니다.");
			location.reload();		
		},
		
	});
	
	
}

function getShipBannerInfo(){
	let shipBannerSample=$("#shipBannerSample").val();
	
	
	
	if(shipBannerSample==1){
		
		var inputElement = $("#ship-setting-cover")[0];
		var photoFile = inputElement.files[0];
		var photoFileName = photoFile.name; //	파일의 이름
		
		console.log(photoFile);
		
		let form = new FormData();		
		form.append( photoFile.name, photoFile );
		
		$.ajax({
			url:"/rest/getShipPhotoInfo/${shipNum}", 
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
				
				updateShipBanner(comeBackPhotoFile);
			},
		});
	}else{
		let shipBannerName = $("#ship-setting-big-cover")[0].name;
		console.log("asdasd"+shipBannerName)
		$.ajax({
			url:"/rest/updateShipBanner/${shipNum}",
			type:"post",
			data:{shipBannerName:shipBannerName},
			async:false,
			success:function(data){
				alert("대표사진이 변경되었습니다.");				
				location.reload();
				
			},
			
		});
		
	}

}


function getShipPhotoInfo(){
	let shipSample=$("#shipSample").val();
	
	
	
	if(shipSample==1){
		
		var inputElement = $("#ship-setting-photo")[0];
		var photoFile = inputElement.files[0];
		var photoFileName = photoFile.name; //	파일의 이름
		
		console.log(photoFile);
		
		let form = new FormData();		
		form.append( photoFile.name, photoFile );	
		
		$.ajax({
			url:"/rest/getShipPhotoInfo/${shipNum}", 
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
				
				updateShipPhoto(comeBackPhotoFile);
			},
		});
	}else{
		let samplePhotoName = $("#ship-setting-big-photo")[0].name;
		console.log("asdasd"+samplePhotoName)
		$.ajax({
			url:"/rest/updateShipPhotoSample/${shipNum}",
			type:"post",
			data:{shipPhotoName:samplePhotoName},
			async:false,
			success:function(data){
				alert("대표사진이 변경되었습니다.");				
				location.reload();
				
			},
			
		});
		
	}

}

function updateShipPhoto(file){
	let fname = file.name;
	let ShipPhotoSaveName = file.dumpName;
	let fileSize = file.fsize;
	console.log(fname);
	console.log(ShipPhotoSaveName);
	console.log(fileSize);
	
	
	$.ajax({
		url:"/rest/updateShipPhoto/${shipNum}",
		type:"post",
		data:{shipPhotoName:ShipPhotoSaveName},
		success:function(data){
			alert("대표사진이 변경되었습니다.");
			location.reload();		
		},
		
	});
	
	
}


function checkBanner(inputElement) {
	let extensions = ["jpg","jpeg","png","gif","jfif","pjpeg","pjp"] // 허용할 확장자명들 (제약조건)
	let file = inputElement.files[0];
	let fileName = file.name; //	파일의 이름
	let slices = fileName.split(".");		
	let lastIndex = slices.length-1;	
	let usrExtension = slices[lastIndex];	// 유저의 파일  "." 으로 잘라서 마지막값
	let checkList = [];
	
	
	// 유저가 확장자를 대문자로 저장했을수도 있으니까 includes 말고 하나씩 비교 해야할듯
	for( extension of extensions ){
		if( usrExtension.toUpperCase() == extension.toUpperCase()){
			checkList.push("ok");
		}		
	}  
	if (checkList.length>0){
		$("#shipBannerSample").val("1");
		let reader = new FileReader();
		reader.readAsDataURL(file)
		reader.onload = function (e) {
			$('#ship-setting-big-cover').attr('src', e.target.result);
        }
	}else{
		alert(" # 사진파일만 가능합니다. 확장자명을 확인해주세요!");
		inputElement.value=""; // hidden되있는 사진 input 초기화
	}
	console.log("ship-setting-big-cover");
	console.log();
}





function checkPhoto(inputElement) {
	let extensions = ["jpg","jpeg","png","gif","jfif","pjpeg","pjp"] // 허용할 확장자명들 (제약조건)
	let file = inputElement.files[0];
	let fileName = file.name; //	파일의 이름
	let slices = fileName.split(".");		
	let lastIndex = slices.length-1;	
	let usrExtension = slices[lastIndex];	// 유저의 파일  "." 으로 잘라서 마지막값
	$("#shipSample").val("1");
	
	let checkList = [];
	// 유저가 확장자를 대문자로 저장했을수도 있으니까 includes 말고 하나씩 비교 해야할듯
	for( extension of extensions ){
		if( usrExtension.toUpperCase() == extension.toUpperCase()){
			checkList.push("ok");
		}		
	}  
	
	if (checkList.length>0){
		let reader = new FileReader();
		reader.readAsDataURL(file)
		reader.onload = function (e) {
			$('#ship-setting-big-photo').attr('src', e.target.result);
        }
	}else{
		alert(" # 사진파일만 가능합니다. 확장자명을 확인해주세요!");
		inputElement.value=""; // hidden되있는 사진 input 초기화
	}
	console.log("ship-setting-photo");
	console.log();
}




	// 아래 사진 클릭 시, 큰 사진 바꿔줌
	function showBigPhoto(el) {
		
		let photosParent = el.closest(".ship-setting-photo-box");
		const bigPhoto = photosParent.querySelector("#ship-setting-big-photo");
		

		if (bigPhoto != null) {
			$("#shipSample").val("0");
			bigPhoto.src = el.src;
			bigPhoto.name = el.name;
			

		} else {
			const bigCover = photosParent.querySelector("#ship-setting-big-cover");
			console.log(bigCover);
			$("#shipBannerSample").val("0");
			bigCover.src = el.src;
			bigCover.name = el.name;
		}
	}
</script>
