$(document).ready(function(){	
	$('#sample2').click();
});

function checkPhoto(inputElement) {	
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
		let reader = new FileReader();
		reader.readAsDataURL(file)
		reader.onload = function (e) {
			$('#makeShipSample').val("1");
			$('#makeShipBigPhoto').attr('src', e.target.result);
        }		
	}else{		
		alert(" # 사진파일만 가능합니다. 확장자명을 확인해주세요!");
		inputElement.value=""; // hidden되있는 사진 input 초기화
	}
}

function checkMakeShip() {
	// 필수만 확인
	let inputs = $('#makeShip-form').find('input');
	let Essentials = ["shipName","limitGender","shipOpen"]
	let checkList = [];
	for ( input of inputs){
		console.log(input.name)
		if( Essentials.includes(input.name) ){
			if(input.value.length <1 ){
				let name= input.name;
				switch(name){
				case "shipName": alert("모임 이름을 설정해주세요!");break;
				case "limitGender":alert("성별 제한을 설정해주세요!");break;				
				case "shipOpen":alert("공개 여부를 설정해주세요!");break;
				}
				break;
			}else{
				checkList.push("ok");				
			}
		}
	}
	
	if( checkList.length ==3 ){
		if($('#makeShipShipTitle').val().length<1){
			$('#makeShipShipTitle').val("소개글이 없습니다.");			
		}
		
		$('#makeShip-form').submit();
	}else{
		alert("서밋실패ㅠㅠ")
	}
}
	
function changeLimitGender(inputElement) {
	$('#makeShipLimitGender').val(inputElement.name);
}

function changeBigPhoto(imgElement) {
	// 빅피쳐바꿔
	$("#makeShipBigPhoto").attr("src",imgElement.src);
	// 빅피쳐 hidden 바꿔
	$("#makeShipShipPhoto").val(imgElement.name);	
	$("#makeShipSample").val("0");	
}

function changeShipOpen(inputElement) {
	$('#makeShipShipOpen').val(inputElement.name);
}

function unlockAge(selectElement){
	if(selectElement.value==1){
		// 풀어
		$('#makeShipLimitStart').attr("disabled",false);
		$('#makeShipLimitEnd').attr("disabled",false);			
	}else{
		// 잠궈
		$('#makeShipLimitStart').val("0");
		$('#makeShipLimitEnd').val("0");
		$('#makeShipLimitStart').attr("disabled",true);
		$('#makeShipLimitEnd').attr("disabled",true);
	}
}

function getTowns(selectElement) {
	let cityNum = selectElement.value;
	if(cityNum=="0"){
		var html="";
		html += "<option value="+"0"+">상관없음</option>";	
		$("#makeShipTownNum").html(html);		
	}else{
		$.ajax({
			url: "/rest/town.json",
			type:"get",
			data:{cityNum:cityNum},
			success : function(towns){				
				let html="";
				html += "<option value="+"0"+">상관없음</option>";					
				for(let town of towns) {
// alert("# town "+town);
					html += "<option value="+town.townNum+">"+town.townName+"</option>"
				}
				$("#makeShipTownNum").html(html);
			},
		});
	}
}

function getDongs(selectElement) {
	let townNum = selectElement.value;
	if(townNum=="0"){
		var html="";
		html += "<option value="+"0"+">상관없음</option>";	
		$("#makeShipDongNum").html(html);		
	}else{
		$.ajax({
			url: "/rest/dong.json",
			type:"get",
			data:{townNum:townNum},
			success : function(dongs){				
				let html="";
				html += "<option value="+"0"+">상관없음</option>";					
				for(let dong of dongs) {
					html += "<option value="+dong.dongNum+">"+dong.dongName+"</option>"
				}
				$("#makeShipDongNum").html(html);
			},
		});
	}
}