// 아래 function 들에서 공통으로 사용할 멤버변수 회원가입  >> form태그 name = sign
var signForm = document.forms.sign.elements; // sign이란 이름의 form양식 안의 요소 list
var inputs = [ signForm.usrRegistType , signForm.usrId , signForm.usrEmail , signForm.usrPwd , signForm.usrPwd2 , signForm.usrName, signForm.usrNickname , signForm.usrYear , signForm.usrMonth , signForm.usrDay , signForm.usrGender , signForm.usrCity , signForm.usrTown];
var checkList = new Set(); // 성공된것 하나씩 add 쉽게말해서 해당 조건 패스하면 add 빨간줄 뜨면 delete
var checkListFindIdByEmail = new Set();
var checkListFindIdByPhone = new Set();
var checkListFindPwdByEmail = new Set();
var checkListFindPwdByPhone = new Set();


function checkDupPhone(from) {	
	var answer = checkPhone(from);
	var url = "/rest/checkDupPhone.json";
	
	if ( answer == "good"){
//		alert("# 이게 이메일 유효성에는 문제 없는것.");	
		
		var usrPhone = "";
		if ( from == "sign"){
			usrPhone = $("#signUsrPhone").val();			
		}else if ( from == "findId"){
			usrPhone = $("#findIdUsrPhone").val();
		}else if ( from == "findPwd"){
			usrPhone = $("#findPwdUsrPhone").val();
			var usrId = $("#findPwdUsrId").val();
			url = "/rest/checkIdWithPhone.json";
		}
//		alert("# usrPPPHONE"+usrPhone);
		var jsObject = {usrPhone:usrPhone};
		var json = JSON.stringify(jsObject);
		
		if( from == "findPwd" ){
			jsObject = {usrPhone:usrPhone,usrId:usrId};
			json = JSON.stringify(jsObject);
		}
		
		$.ajax({
			url : url,
			type : "get",
			data : jsObject,
//				contentType : "application/json;charset=utf-8" , // >> 이거 안해주면 spring 에서 %8A%E3%85%8A%22% 이런식으로나옴
			success : function(data) {
//				alert("갔다옴"+data);    
				var param = "";
				var cause = "dup";
				
				if ( from == "sign" && data == false ){					
					param = "usrPhone";
					$('#signUsrPhone').attr("readonly", true);
					alert(" # 가입가능 인증문자를 보냈습니다.")					
					checkList.add("checkDupPhone");
					eraseWarning(param);					
					sendUsrPhoneCode(usrPhone,from);
				}else if ( from =="sign" && data == true){
					//중복아이디 존재		
					param = "usrPhone";
					alert("# 중복핸드폰번호 존재 !")
					checkList.delete("checkDupPhone");
					warning(param,cause);
				}else if ( from =="findId" && data == true ){
					checkListFindIdByPhone.add("checkDupPhone");
					alert( " # 아이디찾기 인증번호 발송 !")
					param = "findIdUsrPhone";
					eraseWarning(param);
					sendUsrPhoneCode(usrPhone,from);					
				}else if ( from == "findId" && data == false){
					checkListFindIdByPhone.delete("checkDupPhone");
					alert(" # 등록된 핸드폰번호가 없습니다!")
					param = "findIdUsrPhone";
					warning(param,cause);
				}else if (from =="findPwd" && data == true){
					checkListFindPwdByPhone.add("checkDupPhone");
					alert (" # 비밀번호찾기 인증번호 발송")
					param = "findPwdUsrPhone";
					eraseWarning(param);
					sendUsrPhoneCode(usrPhone,from);
				}else if ( from == "findPwd" && data == false ){
					checkListFindPwdByPhone.delete("checkDupPhone");
					alert(" # 아이디 ㅡ 핸드폰번호 매칭 실패!");
					param = "findPwdUsrPhone";
					warning(param,cause);
				}
			},			
		});
	}else{
//		alert("# 이메일 유효성 문제 있음!!");		
	}		
}

function sendUsrPhoneCode(usrPhone,from){

	
	
	var jsObject = {usrPhone:usrPhone};
	var json = JSON.stringify(jsObject);
	
	$.ajax({
		url:"/rest/sendUsrPhoneCode.json", 
		type:"post",
		data:jsObject,
		success:function(data){
			if(from=="sign"){
//				alert("# 갔다옴 : "+data)
				$("#signPhoneCode").val(data);				
			}else if( from == "findId"){
//				alert("# 갔다옴 : "+data)
				$("#findIdPhoneCode").val(data);				
			}else if( from == "findPwd"){
//				alert("# 갔다옴 : "+data)
				$("#findPwdPhoneCode").val(data);
			}
		},
	});
}


// 핸드폰-핸드폰 유효성
function checkPhone(from){
	var param = "";
	var cause = "type";
	var usrPhone = "";
	if (from == "sign"){
		param = "usrPhone";
		usrPhone = $("#signUsrPhone").val();
	}else if (from == "findId"){
		param = "findIdUsrPhone";
		usrPhone = $("#findIdUsrPhone").val();
	}else if ( from == "findPwd"){
		param = "findPwdUsrPhone";
		usrPhone = $("#findPwdUsrPhone").val();
	}
	
		
	var constraint = /^\d{3}\d{3,4}\d{4}$/;	
	if(constraint.test(usrPhone) == true ) {
		checkList.add("checkPhone");
		eraseWarning(param);
		return "good";
	}else {
		checkList.delete("checkPhone");
		warning(param,cause);
		return "bad";
	}
}

// 이메일-핸드폰 유효성
function checkEmailPhone(){	
	var param = "usrEmailPhone";
	var cause = "type";
	
	var usrEmailPhone = $("#signUsrEmailPhone").val();
	var constraint = /^\d{3}\d{3,4}\d{4}$/;	
	if(constraint.test(usrEmailPhone) == true ) {
		checkList.add("checkEmailPhone");
		$("#signUsrPhone").val(usrEmailPhone);
		eraseWarning(param);		
	}else {
		checkList.delete("checkEmailPhone");
		warning(param,cause);		
	}
}

// 핸드폰-이메일 유효성
function checkPhoneEmail(){	
	var param = "usrPhoneEmail";
	var cause = "type";
	
	var usrPhoneEmail = $("#signUsrPhoneEmail").val();
	var constraint = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;	
	if(constraint.test(usrPhoneEmail) == true ) {
		checkList.add("checkPhoneEmail");
		$("#signUsrEmail").val(usrPhoneEmail);
		eraseWarning(param);		
	}else {
		checkList.delete("checkPhoneEmail");
		warning(param,cause);		
	}
}

//6 이름 유효성 체크
function checkId(from){	
	var param = "usrId";
	var cause = "type";
	
	var usrId = $("#signUsrId").val();	
	var constraint = /^[A-za-z0-9]{5,15}/g;
	
	if(constraint.test(usrId) == true ) {		
		eraseWarning(param);
		checkDupId(from)		
	}else {		
		warning(param,cause);
	}	
}

function checkDupId(from) {		
		var usrId = "";
		if ( from == "sign"){
			usrId = $("#signUsrId").val();			
		}else if ( from == "findPwd"){
			usrId = $("#findPwdUsrId").val();
//			alert("찾을 아이디 : "+$("#findPwdUsrId").val());
		}
		
		
		var jsObject = {usrId:usrId};
		var json = JSON.stringify(jsObject);
		$.ajax({
			url : "/rest/checkDupId.json",
			type : "get",
			data : jsObject,
//				contentType : "application/json;charset=utf-8" , // >> 이거 안해주면 spring 에서 %8A%E3%85%8A%22% 이런식으로나옴
			success : function(data) {
//				alert("갔다옴"+data);   
				var param = "usrId";
				var cause = "dup";
				
				if ( from == "sign" && data == false ){
					//중복아이디 없음 가입가능한 경우				
//					$('#signUsrId').attr("readonly", true);		 			
					alert(" # 가입가능한 아이디 입니다.")					
					checkList.add("checkDupId");
					eraseWarning(param);
				}else if ( from == "sign" && data == true ){
					//중복아이디 존재		
					checkList.delete("checkDupId");
					warning(param,cause);
				}else if ( from == "findPwd" && data == true ){
					checkListFindPwdByEmail.add("checkDupId");
					checkListFindPwdByPhone.add("checkDupId");					
					//찾을 비번의 아이디 존재
					alert(" 찾을 아이디가 존재합니다");
				}else if ( from == "findPwd" && data == false ){
					//찾을 비번의 아이디 없음		
					checkListFindPwdByEmail.delete("checkDupId");
					checkListFindPwdByPhone.delete("checkDupId");
					alert( " 찾을  아이디가 없습니다")
				}	
			},			
		});
}




// 1 이메일 유효성 체크
function checkEmail(from){
	var param = "";
	var cause = "type";
	var usrEmail = "";
	if( from == "sign" ){
		param = "usrEmail";			
		usrEmail = $("#signUsrEmail").val();
	}else if( from == "findId" ){
		param = "findIdUsrEmail";
		usrEmail = $("#findIdUsrEmail").val();
	}else if ( from == "findPwd"){
		param = "findPwdUsrEmail";
		usrEmail = $("#findPwdUsrEmail").val();
	}
	var constraint = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
//	alert("# usrEmail : "+usrEmail);
	
//	alert("# constraint.test(usrEmail)"+constraint.test(usrEmail));
	if(constraint.test(usrEmail)==true) {
		warning(param,"emailOk");
		checkList.add("checkEmail");checkListFindIdByEmail.add("checkEmail");checkListFindPwdByEmail.add("checkEmail");
		if(from != 'findId'){
			checkDupEmail(from);			
		}
		
		return "good";
	}else {
		warning(param,cause);
		checkList.delete("checkEmail");checkListFindIdByEmail.delete("checkEmail");checkListFindPwdByEmail.delete("checkEmail");
		return "bad";
	}
}

// 2 이메일 중복체크
function checkDupEmail(from) {	
	var usrEmail = "";
	var usrName ="";
	var param = "";
	var cause = "dup";
	if (from == "sign"){
		usrEmail = $("#signUsrEmail").val();
		usrName = $("#signUsrName").val();
		param = "usrEmail";		
	}else if( from == "findId"){
		usrEmail = $("#findIdUsrEmail").val();
		usrName = "회원";
		param = "findIdUsrEmail";
	}else if ( from == "findPwd"){
		usrEmail = $("#findPwdUsrEmail").val();
		usrName = "회원";
		param = "findPwdUsrEmail";
	}
	
//		alert("# 이게 이메일 유효성에는 문제 없는것.");		
		var jsObject = {usrEmail:usrEmail};
		var json = JSON.stringify(jsObject);
		$.ajax({
			url : "/rest/checkDupEmail.json",
			type : "get",
			data : jsObject,
//				contentType : "application/json;charset=utf-8" , // >> 이거 안해주면 spring 에서 %8A%E3%85%8A%22% 이런식으로나옴
			success : function(data) {
//				alert("갔다옴"+data);    

				if( from=="sign"  && data == false ){
					//중복아이디 없음 가입가능한 경우				
					$('#signUsrEmail').attr("readonly", true);					
					alert(" # 가입가능 인증메일을 보냈습니다.")
					
					checkList.add("checkDupEmail");
					eraseWarning(param);
//					alert("#체크1"+usrEmail+usrName)
					sendUsrEmailCode(usrEmail,usrName,from);
					
				}else if( from=="sign" && data == true ){
					checkList.delete("checkDupEmail");
					warning(param,cause);					
				}else if( from == "findId" && data == true ){
					//찾으려는 이메일이 있어
					alert(" # 아이디 찾기 인증메일을 보냈습니다.")
					$('#findIdUsrEmail').attr("readonly", true);					
					eraseWarning(param);
					sendUsrEmailCode(usrEmail,usrName,from);
				}else if( from == "findId" && data == false ){
					alert(" # 등록된 이메일이 없습니다.")
					warning(param,cause);
				}else if ( from == "findPwd" && data == true){
					alert(" # 임시 비밀번호를 발송 했습니다.")
					sendUsrEmailCode(usrEmail,usrName,from);					
				}else if( from == "findPwd" && data == false ){
					alert(" # 아이디 ㅡ 이메일 매칭되지 않습니다.")
				}
			},			
		});	
}

function sendUsrEmailCode(usrEmail,usrName,from){
	

	var	jsObject = {usrEmail:usrEmail,usrName:usrName};
	var json = JSON.stringify(jsObject);		
	
	$.ajax({
		url:"/rest/sendUsrEmailcode", 
		type:"post",
		data:jsObject,
		success:function(data){
			switch (from) {
			  case "sign" : $("#signEmailCode").val(data);break;			  
			  case "findId" : $("#findIdEmailCode").val(data);break;
			  case "findPwd" : $("#findPwdEmailCode").val(data);break;
			}	
		},
	});
	
}

// 3 이메일 인증코드 비교 체크
function compareUsrEmailCode(from){	
	var param="";
	var cause="different";
	var usrEmailCode = "";
	var emailCode = "";
	if( from == "sign"){
		param="usrEmailCode";
		usrEmailCode = $("#signUsrEmailCode").val(); //유저가 입력하는코드
		emailCode = $("#signEmailCode").val();		 //발송된 코드
	}else if ( from == "findId"){
		param="findIdUsrEmailCode";
		usrEmailCode = $("#findIdUsrEmailCode").val(); //유저가 입력하는코드
		emailCode = $("#findIdEmailCode").val();		 //발송된 코드
	}else if ( from == "findPwd"){
		param="findPwdUsrEmailCode";
		usrEmailCode = $("#findPwdUsrEmailCode").val(); //유저가 입력하는코드
		emailCode = $("#findPwdEmailCode").val();		 //발송된 코드		
	}
	
	if(usrEmailCode == emailCode){
		alert(" # 인증번호가 일치합니다. 비밀번호를 변경해주세요 ! ");
		switch (from) {
		  case "sign":
			  $('#signUsrEmailCode').attr("readonly", true);
			  checkList.add("compareUsrEmailCode");break;
		  case "findId":
			  if(checkListFindIdByEmail.size>0){
				  $('#findIdUsrEmailCode').attr("readonly", true);
				  showFoundIdDiv("byEmail");				  
			  }else{
				  alert(" # 이메일 인증을 먼저 해주세요");
			  }			  
			  break;
			  
		  case "findPwd":
			  checkListFindPwdByEmail.add("compareUsrEmailCode");
			  checkListFindPwdByPhone.add("compareUsrEmailCode");
			  $('#findPwdUsrEmailCode').attr("readonly", true);
			  break;			  		  		  
		}
		
		eraseWarning(param)
	}else{		
		checkList.delete("compareUsrEmailCode");
		checkListFindPwdByEmail.delete("compareUsrEmailCode");
		checkListFindPwdByPhone.delete("compareUsrEmailCode");
		alert(" # 인증번호가 다릅니다! 다시확인해주세요. ");
		warning(param,cause);		
	}	
}

function showFoundIdDiv(by){
	var jsObject="";
	var json="";
	if ( by == "byEmail" ){
		jsObject={by:"byEmail",usrEmail:$('#findIdUsrEmail').val()};
		json=JSON.stringify(jsObject);
	}else if ( by == "byPhone"){
		jsObject={by:"byEmail",usrPhone:$('#findIdUsrPhone').val()};
		json=JSON.stringify(jsObject);
	}
	
	$.ajax({
		url:"/rest/findId",		
		type:"get",
		data:jsObject,
		success:function(data){
			$('#foundId').val(data);
		},
	});
	
	$('#foundIdDiv').show();	
}

//3 핸드폰 인증코드 비교 체크
function compareUsrPhoneCode(from){	
	var param = "";
	var cause = "different";
	var usrPhoneCode = "";
	var phoneCode = "";
	
	if(from == "sign"){
		param="usrPhoneCode";
		usrPhoneCode = $("#signUsrPhoneCode").val(); //유저가 입력하는코드
		phoneCode = $("#signPhoneCode").val();		 //발송된 코드
	}else if( from == "findId"){
		param="findIdUsrPhoneCode";
		usrPhoneCode = $("#findIdUsrPhoneCode").val(); //유저가 입력하는코드
		phoneCode = $("#findIdPhoneCode").val();		 //발송된 코드		
	}else if ( from == "findPwd"){		
		param="findPwdUsrPhoneCode";
		usrPhoneCode = $("#findPwdUsrPhoneCode").val(); //유저가 입력하는코드
		phoneCode = $("#findPwdPhoneCode").val();		 //발송된 코드
	}
	
	
	if(usrPhoneCode == phoneCode){		
		switch (from) {
		  case "sign":
			  $('#signUsrPhoneCode').attr("readonly", true);
			  checkList.add("compareUsrPhoneCode");
			  alert(" # 인증번호 일치!");
			  break;
		  case "findId":
			  if(checkListFindIdByPhone.size>0){
				  $('#findIdUsrPhoneCode').attr("readonly", true);
				  showFoundIdDiv("byPhone");				  
			  }else{
				  alert(" # 핸드폰 인증을 먼저 진행해주세요.")	
			  }			  
			  break;
		  case "findPwd":
			  checkListFindPwdByPhone.add("compareUsrPhoneCode");
			  $('#findPwdUsrPhoneCode').attr("readonly", true);
			  alert(" # 인증번호 일치!");
		}		
		eraseWarning(param)
	}else{
		alert(" # 인증실패 ㅠㅠ");
		checkList.delete("compareUsrPhoneCode");
		checkListFindPwdByPhone.delete("compareUsrPhoneCode");
		warning(param,cause);
	}	
}


// 4 비밀번호 유효성 체크
function checkPwd(from){	
	var cause = "type";	
	var param = "";
	var usrPwd = "";
	if (from == "sign"){
		param = "usrPwd";
		usrPwd = $("#signUsrPwd").val();		
	}else if ( from == "findPwd"){
		param = "findPwdUsrPwd";
		usrPwd = $("#findPwdUsrPwd").val();
	}
	
		
	var constraint = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;	
	if(constraint.test(usrPwd) == true ) {		
		checkList.add("checkPwd");		
		checkListFindPwdByEmail.add("checkPwd");
		checkListFindPwdByPhone.add("checkPwd");
		eraseWarning(param);
	}else {		
		checkList.delete("checkPwd");
		checkListFindPwdByEmail.delete("checkPwd");
		checkListFindPwdByPhone.delete("checkPwd");
		warning(param,cause);
	}
}

// 5 비밀번호 재입력 체크
function comparePwd(from) {	
	var cause = "different";
	var param = "";
	var usrPwd = "";
	var usrPwd2 = "";
	if (from == "sign"){ 
		param = "usrPwd2";
		usrPwd = $("#signUsrPwd").val();
		usrPwd2 = $("#signUsrPwd2").val();		
	}else if( from == "findPwd"){
		param = "findPwdUsrPwd2";
		usrPwd = $("#findPwdUsrPwd").val();
		usrPwd2 = $("#findPwdUsrPwd2").val();
	}	
	if(usrPwd == usrPwd2){
//		alert(" # 인증성공 ㅎㅎ");
		if( from == "sign"){
			checkList.add("comparePwd");						
		}else if ( from == "findPwd" && usrPwd.length>0){
			checkListFindPwdByEmail.add("comparePwd");
			checkListFindPwdByPhone.add("comparePwd");
			if(checkListFindPwdByEmail.size>3 || checkListFindPwdByPhone.size>3){
				updateUsrPwd();				
			}else{
				alert(" #모든정보를 올바르게 입력해주세요")
			}
			
		}	
		eraseWarning(param);
	}else{
//		alert(" # 인증실패 ㅠㅠ");	
		checkList.delete("comparePwd");
		checkListFindPwdByEmail.delete("comparePwd");
		checkListFindPwdByPhone.delete("comparePwd");
		warning(param,cause);
	}
}

function updateUsrPwd(){
	var jsObject = "";
	var json = "";
	var usrId = $("#findPwdUsrId").val();
	var usrPwd = $("#findPwdUsrPwd2").val();
//	alert("# usrId : "+usrId)
//	alert("# usrPwd : "+usrPwd)
	jsObject = {usrId:usrId,usrPwd:usrPwd};
	json = JSON.stringify(jsObject);
	
	$.ajax({
		url : "/rest/updatePwd",
		type : 'post',	   
		data : jsObject, 
//		contentType : "application/json;charset=UTF-8" , // >> 이거 안해주면 spring 에서 %8A%E3%85%8A%22% 이런식으로나옴
		success : function(data){
//			alert("갔다옴 data :"+data)
			if(data!=null){
				alert("비밀번호가 성공적으로 변경되었습니다.")
				location.href="/";								
			}
		},
	});
}

// 6 이름 유효성 체크
function checkName(){
	var param = "usrName";
	var cause = "type";
	
	var usrName = $("#signUsrName").val();	
	var constraint = /^[가-힣]{2,4}$/;	
	if(constraint.test(usrName) == true ) {
		checkList.add("checkName");		
		eraseWarning(param);
	}else {
		checkList.delete("checkName");
		warning(param,cause);
	}	
}

// 7 닉네임 유효성 체크
function checkNickname(){
	var param = "usrNickname";
	var cause = "type";
	
	var usrNickname = $("#signUsrNickname").val();	
	var constraint = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;		
	if(constraint.test(usrNickname) == true ) {
		checkList.add("checkNickname");
		eraseWarning(param);
	}else {
		checkList.delete("checkNickname");
		warning(param,cause);
	}
}

// 8 생년월일 유효성 체크
function checkBirth() {
	var param = "usrBirth";
	var cause = "type";
	
	var usrYear = $('#signUsrYear').val();	
	var usrMonth = $('#signUsrMonth').val();
	var usrDay = $('#signUsrDay').val();
	if( usrDay.length <2 )usrDay="0"+usrDay;
	
	var usrBirth = usrYear+"-"+usrMonth+"-"+usrDay;	
	var constraint = /^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$/;
					 
	if (usrYear.length<4 || usrMonth==0 || usrDay.length <1){
		cause = "empty";
		checkList.delete("checkBirth");
		warning(param,cause);
	}else{
		cause= "type";
		if(constraint.test(usrBirth) == true ) {
			checkList.add("checkBirth");
			eraseWarning(param);
//			alert(usrBirth);
//			Date myDate = new Date(); 
			$("#signUsrBirth").val(usrBirth);
		}else {
			checkList.delete("checkBirth");
			warning(param,cause);
		}
	}
}

// 9 성별 입력상태 체크
function checkGender(){
	var param = "usrGender";
	var cause = "empty";
	
	var usrGender = $('#signUsrGender').val(); //name=usrGender를 가진 select 요소의 value	
	if (usrGender != "0"){		
		checkList.add("checkGender");
		eraseWarning(param);				
	}else{		
		checkList.delete("checkGender");
		warning(param,cause);
	}	
}

function checkUsrRegistType(){
	var param = "usrRegistType";
	var cause = "empty";
	
	var usrRegistType = $('#signUsrRegistType').val(); //name=usrGender를 가진 select 요소의 value
	
	if (usrRegistType != "0"){		
		checkList.add("checkUsrRegistType");
		
		checkList.delete("checkEmailPhone");
		checkList.delete("checkEmail");
		checkList.delete("checkDupEmail");
		checkList.delete("compareUsrEmailCode");
		
		checkList.delete("checkPhoneEmail");
		checkList.delete("checkPhone");
		checkList.delete("checkDupPhone");
		checkList.delete("compareUsrPhoneCode");
		
		eraseWarning(param);
	}else{
		checkList.delete("checkUsrRegistType");
		
		checkList.delete("checkEmailPhone");
		checkList.delete("checkEmail");
		checkList.delete("checkDupEmail");
		checkList.delete("compareUsrEmailCode");	
		
		checkList.delete("checkPhoneEmail");
		checkList.delete("checkPhone");
		checkList.delete("checkDupPhone");
		checkList.delete("compareUsrPhoneCode");
		
		warning(param,cause);
	}
}

// 10 빈칸 체크
function checkEmpty(){
	var cause = "empty";
	for (let i=0 ; i<inputs.length ; i++){
		var inputEl = inputs[i];
// 		alert(" # inputEl : "+i+" 번째 요소"+inputEl.name);
		if(inputEl.value.length <1 || inputEl.value=="0"){
			// signForm 의 모든 input요소 빈 값인지 단순확인
			warning(inputEl.name,cause);
		}else{
//			alert(" # 지워야할 요소 : " + inputEl.name )
			eraseWarning(inputEl.name); 
		}
	}
}

// 11 모든 항목 성공했으면 빈칸체크 한번 더 하고 submit
function finalCheck() {
	
	if(checkList.size == 12 ){
//		alert(" # sign.submit 실행하면됨  "+checkList.size + " / 12");
		sign.submit();
	}else{		
//		alert(" # checkList.size : " + checkList.size + " / 12");
		
		checkEmpty();
	}
}

// util 특정 경고글 생성
function warning(param,cause){
	$('#span-'+param).attr("class", "text-danger"); // 빨간색으로 글씨 쓸거야
	
	var html = "";
	if(param == "usrId"){
		switch (cause) {
		  case "empty":
			  html="아이디를 입력해주세요";break;
		  case "type": 
			  html="아이디 형식을 다시 확인해주세요.";break;
		  case "dup":
			  html="이미 사용중인 아이디 입니다.";break;		  		  
		}	
	}else if(param == "usrEmail"){
		switch (cause) {
		  case "empty":
			  html="이메일을 입력해주세요.";break;
		  case "type": 
			  html="이메일 형식을 다시 확인해주세요.";break;
		  case "dup":
			  html="이미 사용중인 이메일 입니다.";break;
		  case "emailOk":
			  $('#span-'+param).attr("class","text-primary");	// 이때만 예외적으로 파란색글씨
			  html="이메일 유효성 통과!";break;		  
		}		
	}else if(param =="usrEmailCode"){
		switch (cause) {
		  case "empty":
			  html="이메일 인증코드를 입력해주세요.";break;
		  case "different":
			  html="이메일 인증코드를 확인해주세요.";break;
		}
	}else if(param == "usrPwd"){		
		switch (cause) {
		  case "empty":
			  html="비밀번호를 입력해주세요.";			  
			  break;			  
		  case "type": 
			  html="최소 8 자 , 특수 문자를 포함해주세요";			  
			  break;		  
		}		
	}else if(param == "usrPwd2"){
		switch (cause) {
		  case "empty":
			  html="비밀번호 재확인을 입력해주세요.";break;
		  case "different":
			  html="비밀번호가 일치하지 않습니다.";break;		  
		}
	}else if(param == "usrName"){
		switch (cause) {
		  case "empty":
			  html="이름을 입력해주세요.";break;
		  case "type": 
			  html="올바른 형태의 이름을 사용하세요. (특수기호, 공백 사용 불가)";break;		  
		}
	}else if(param == "usrNickname"){
		switch (cause) {
		  case "empty":
			  html="닉네임을 입력해주세요.";break;
		  case "type": 
			  html="2~16 길이의 닉네임 사용하세요. (특수기호, 공백 , 자음 , 모음 사용 불가)";break;		  
		}
	}else if(param =="usrBirth" || param == "usrYear" || param == "usrMonth" || param == "usrDay" ){
		switch (cause) {
		  case "empty":
			  html="생년월일을 올바르게 입력해주세요.";break;
		  case "type": 
			  html="생년월일을 다시 확인해주세요. (1900이후 출생 , DAY 확인)";break;		  
		}
		param="usrBirth";
		$('#span-'+param).attr("class", "text-danger");
	}else if(param == "usrGender"){
		switch (cause) {
		  case "empty":
			  html="성별을 선택해주세요.";break;
		} 
	}else if (param == "usrRegistType"){
		switch(cause){
		case "empty":
			html = "필수 인증을 진행하세요";break;		
		}
	}else if (param == "usrEmailPhone"){
		switch(cause){
		case "empty":
			html = "핸드폰번호를 입력해주세요";break;
		case "type":
			html = "폰 형식을 확인해주세요";break;		
		}		
	}else if (param == "usrPhone"){
		switch(cause){
		case "empty":
			html = "핸드폰번호를 입력해주세요";break;
		case "type":
			html = "폰 형식을 확인해주세요";break;		
		}
	}else if (param == "usrPhoneCode"){
		switch(cause){
		  case "empty":
			  html="휴대폰 인증코드를 입력해주세요.";break;
		  case "different":
			  html="인증코드가 틀립니다!";break;	
		}		
	}else if ( param == "usrPhoneEmail"){
		switch(cause){
		case "empty":
			html = "이메일을 입력해주세요";break;
		case "type":
			html = "이메일 형식을 확인해주세요";break;		
		}
	}else if ( param == "findInfo" ){
		switch(cause){
		case "noSelect":			
			html = "찾을 정보를 선택해주세요.";break;
		}		
	}else if ( param == "findType" ){
		switch(cause){
		case "noSelect":			
			html = "찾을 방법을 선택해주세요.";break;
		}		
	}else if ( param == "findIdUsrEmail"){
		switch(cause){
		case "type":
			html="이메일 형식을 다시 확인해주세요.";break;
		}
	}else if ( param == "findIdUsrPhone"){
		switch(cause){
		case "type":
			html="휴대폰 형식을 다시 확인해주세요.";break;
		}				
	}else if ( param == "findPwdUsrPwd"){
		switch(cause){
		case "type":
			html="최소 8 자 , 특수 문자를 포함해주세요";break;
		}						
	}else if ( param == "loginUsrId"){
		switch(cause){
		case "noId":
			html="존재하지 않는 아이디입니다.";break;
		}		
	}else if ( param == "loginUsrPwd"){
		switch(cause){
		case "noPwd":
			html="비밀번호가 틀립니다.";break;
		}		
	}
	
	
	$('#span-'+param).html(html); // 만들어진 String html 을 insert
}


function login(){
	var loginUsrId = $('#loginUsrId').val();
	var loginUsrPwd = $('#loginUsrPwd').val();
//	alert(" # loginUsrId : "+loginUsrId); 
//	alert(" # loginUsrPwd : "+loginUsrPwd);
	
	var jsObject = {usrId:loginUsrId,usrPwd:loginUsrPwd};
	var json = JSON.stringify(jsObject);
	
	$.ajax({
		url: "/rest/login",
		type:"get",
		data:jsObject,
		success : function(data){ 
//			alert("#data : "+data)
			switch (data) {			
			  case "1": warning("loginUsrId","noId");eraseWarning("loginUsrPwd");$('#loginUsrId').focus();break;
			  case "2": eraseWarning("loginUsrId");warning("loginUsrPwd","noPwd");break;
			  case "3": location.reload(); break;			  		  
			}	
		},
	});
}


// util 특정 경고글 없앨때
function eraseWarning(param){
	if(param=="usrYear" || param=="usrMonth" || param=="usrDay"){
		param="usrBirth";
	}
	$('#span-'+param).html("");
}
 
// util 모든 경고글 없애기 ( Header의 Sign Up 버튼 누를때)
function eraseAllWarnings(){
	var signSpans = $('#sign-form').find('span');	
	for (let i=0 ; i<signSpans.length ; i++){		
		signSpans[i].innerHTML="";		
	}

	var findSpans = $('#find-form').find('span');
	for (let i=0 ; i<findSpans.length ; i++){
		findSpans[i].innerHTML="";		
	}
	var loginSpans = $('#login-form').find('span');
	for (let i=0 ; i<loginSpans.length ; i++){
		loginSpans[i].innerHTML="";		
	}
}
function eraseAllInputs(){	
	$("#login-form")[0].reset(); //login-form태그 input값 리셋
	$("#sign")[0].reset(); //login-form태그 input값 리셋
	$("#find-form")[0].reset(); //login-form태그 input값 리셋	
}

function selectFindInfo(){
	checkListFindIdByEmail.clear();
	checkListFindIdByPhone.clear();
	checkListFindPwdByEmail.clear();
	checkListFindPwdByPhone.clear();
	
	if ($('#findInfo').val() == "0"){
		let param = "findInfo";
		let cause = "noSelect";
		warning(param,cause);
		eraseWarning("findType");
		showfindDiv("","");
	}else{
		let param = "findType";
		let cause = "noSelect";
		warning(param,cause);
		eraseWarning("findInfo");
	}
	$('#findType').val("0").prop("selected", true);
}

function selectFindType(){
	if ($('#findType').val() == "0"){
		let param = "findType";
		let cause = "noSelect";
		warning(param,cause);
		eraseWarning("findInfo");	
		showfindDiv("","")
	}else{
		eraseWarning("findType");
		var selectedFindInfo = $('#findInfo').val();		
		var selectedFindType = $('#findType').val();
		showfindDiv(selectedFindInfo,selectedFindType);
	}
}

function showfindDiv(info,by){
	$('#foundIdDiv').hide();
	$('#foundIdDiv').val("");
	
	$('#findIdByUsrPhone').hide();clear("findIdByUsrPhone");
	$('#findIdByUsrEmail').hide();clear("findIdByUsrEmail");
	$('#findPwd').hide();clear("findPwd");
//	clear("findPwdByUsrEmail");
	
	if (info == "findId"){
		switch(by){
		case "ByUsrEmail": $('#findIdByUsrEmail').show();break;
		case "ByUsrPhone": $('#findIdByUsrPhone').show();break; 			
		}		
	}else if (info == "findPwd"){
		switch(by){
		case "ByUsrEmail": $('#findPwd').show();$('#findPwdByUsrEmail').show();$('#findPwdByUsrPhone').hide();break;
		case "ByUsrPhone": $('#findPwd').show();$('#findPwdByUsrPhone').show();$('#findPwdByUsrEmail').hide();break;
		}		
	}else if ( info == "no"){		
		
	}
}
function clear(param){
	switch(param){
	case "findIdByUsrEmail":
		$('#findIdUsrEmail').val("");$('#findIdUsrEmailCode').val("");$('#findIdEmailCode').val("");
		eraseWarning("findIdUsrEmail");eraseWarning("findIdUsrEmailCode");break;
	case "findIdByUsrPhone":
		$('#findIdUsrPhone').val("");$('#findIdUsrPhoneCode').val("");$('#findIdPhoneCode').val("");
		eraseWarning("findIdUsrPhone");eraseWarning("findIdUsrPhoneCode");break;
	case "findPwd":
		$('#findPwdUsrId').val("");
		$('#findPwdUsrEmail').val("");$('#findPwdUsrEmailCode').val("");
		$('#findPwdUsrPhone').val("");$('#findPwdUsrPhoneCode').val("");		
		$('#findPwdUsrPwd').val("");$('#findPwdUsrPwd2').val("");
		break;
	}	
}





/////////////////////// Login / Sign Up 버튼//////////////////////////////////////////////////

function openLoginModal(){
	document.getElementById("login_modal").style.display="block";
	eraseAllWarnings();
	eraseAllInputs();	
	$('#loginUsrId').focus();
}
function openSignUpModal(){	
	document.getElementById("signup_modal").style.display="block";
	eraseAllWarnings();
	eraseAllInputs();
	$('#signUsrId').focus();
}
function openFindModal(){	
	document.getElementById("find_modal").style.display="block";
	eraseAllWarnings();
	eraseAllInputs();
} 
function openChattingModal(){	
	document.getElementById("chatting_modal").style.display="block";
}
function openCreateModal(){	
	document.getElementById("create_modal").style.display="block";
}


function closeLoginModal(){
	document.getElementById("login_modal").style.display="none";
	eraseAllWarnings();
	eraseAllInputs();		
}
function closeSignUpModal(){	
	document.getElementById("signup_modal").style.display="none";
	eraseAllWarnings();
	eraseAllInputs();
}
function closeFindModal(){	
	document.getElementById("find_modal").style.display="none";
	eraseAllWarnings();
	eraseAllInputs();
}

function closeChattingModal(){	
	document.getElementById("chatting_modal").style.display="none";
}

function closeCreateModal(){	
	document.getElementById("create_modal").style.display="none";
}

function loginToSignUp(){
	$('#login_modal_close_btn').click();
	$('#signup_modal_open_btn').click();
}

function signUpToLogin(){
	$('#signup_modal_close_btn').click();
	$('#login_modal_open_btn').click();
}

function findToLogin(id){
	$('#find_close_btn').click();
	$('#login_modal_open_btn').click();
	$("#loginUsrId").val(id);
	 
}

function loginTofind(){	
	$('#login_modal_close_btn').click();
	openFindModal();
	eraseAllWarnings();
	eraseAllInputs();	
	showfindDiv("","");    	
}

function findToSigunUp(){
	
}



//document.getElementById("login_modal_open_btn").onclick = function() {
//    document.getElementById("login_modal").style.display="block"; 
//}

//document.getElementById("login_modal_close_btn").onclick = function() {
//	$('form').each(function(){
//		this.reset();
//	});
//    document.getElementById("login_modal").style.display="none";
//}  
//document.getElementById("signup_modal_open_btn").onclick = function() {
//    document.getElementById("signup_modal").style.display="block";
//    $("#sign")[0].reset(); //sign form태그 인풋값 리셋
//    eraseAllWarning();		// 경고들 리셋
//}
//document.getElementById("signup_modal_close_btn").onclick = function() {
//    document.getElementById("signup_modal").style.display="none";
//}

$("#signUsrRegistType").change(function() {
	$('#signUsrEmail').val("");
	$('#signUsrEmailCode').val("");
	$('#signUsrEmailPhone').val("");

	$('#signUsrPhone').val("");
	$('#signUsrPhoneCode').val("");
	$('#signUsrPhoneEmail').val("");
	
	if($(this).val() === "email"){
		eraseWarning("usrEmail");
		eraseWarning("usrEmailCode");
		eraseWarning("usrEmailPhone");
		$('#registTypeE').show();
		$('#registTypeC').hide();
	}else if($(this).val() === "phone"){
		eraseWarning("usrPhone");
		eraseWarning("usrPhoneCode");
		eraseWarning("usrPhoneEmail");
		$('#registTypeC').show();
		$('#registTypeE').hide();
	}else{
		$('#registTypeC').hide();
		$('#registTypeE').hide();
	}
});

/////////////////////////////////////////////////////////////////////////


// select 창에 도시 군구 정보 쏴줄때
function getTowns(el) {
	var cityNum = el.value;
	if(cityNum=="0"){
		var html="";
		html += "<option value="+"0"+">상관없음</option>";
		$("#signUsrTown").html(html);		
	}else{
		$.ajax({
			url: "/rest/town.json",
			type:"get",
			data:{cityNum:cityNum},
			success : function(data){				
				var html="";
				html += "<option value="+"0"+">상관없음</option>";					
				for(let townList of data) {
//					alert("# townList "+townList); 
					html += "<option value="+townList.townNum+">"+townList.townName+"</option>"
				}
				$("#signUsrTown").html(html);
			},
		});
	}
}

function getDongs(el) {
	var townNum = el.value;
	if(townNum=="0"){
		var html="";
		html += "<option value="+"0"+">상관없음</option>";
		$("#signUsrDong").html(html);		
	}else{
		$.ajax({
			url: "/rest/dong.json",
			type:"get",
			data:{townNum:townNum},
			success : function(data){				
				var html="";
				html += "<option value="+"0"+">상관없음</option>";					
				for(let dongList of data) {
//					alert("# townList "+townList); 
					html += "<option value="+dongList.dongNum+">"+dongList.dongName+"</option>"
				}
				$("#signUsrDong").html(html);
			},
		});
	}
}

