<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<link href="/css/lightbox.css" rel="stylesheet" />
<script src="/js/lightbox.js"></script>

<!-- css 추가 -->
<style>
.box {
  width: 30%;
  height: 0;
  padding-bottom: 30%;
}

.box img {
  position: absolute;
  top: 50%; left: 50%;
  transform: translate(-50%, -50%);
}

.flex_container{

  flex-direction: row;
  /* 기본값, 아이템을 왼쪽에서 오른쪽으로 수평 정렬함 */
  
  flex-direction: row-reverse;
  /* 아이템을 오른쪽에서 왼쪽으로 수평 정렬함 */
  
  flex-direction: column;
  /* 아이템을 위에서 아래로 수직 정렬함 */
  
  flex-direction: column-reverse;
  /* 아이템을 아래에서 위로 수직 정렬함 */
  
}

.image-container{
    position: relative;
}
.photo-container{
    float: left;
    position: relative;
    overflow: hidden;
}
.image-thumb{
    position: relative;
    background-color: #eee;
}

album, photo {
    font-family: helvetica, arial, sans-serif;
    height: 100%;
    padding: 0;
    margin: 0;
}


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

.album-modal-content {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	width: 360px;
	z-index: 5;
}

.album-modal-layer {
	position: fixed;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 4;
}

.album-modal-close {
	position: absolute;
	right: 30px;
	top: 15px;
	cursor: pointer;
}
</style>





<div class="col-8">
	
	
	<!-- 최상단 사진첩 -->
	<div class="card border-0 rounded-0 mb-3 d-flex align-items-start">
		<div class="row d-flex ps-4 py-2 ">사진첩</div>
	</div>


	
 
	
		<!-- 2 파일내용부분 -->
<div id="album-box" class="flex_container">

	



</div>





	<!-- 날짜별 반복 끝 -->
	
	<script>
	

	
	$(document).ready(function(){
		$.ajax({
			url : "/rest/getAlbum/${shipNum}.json",
			type : "post",
			data : {a:"1"},
			async : false,
			success : function(data){		
// 				alert("다녀옴")
				
//	 			let fileDateSet = new Set();
//	 			let fileYearSet = new Set();
				
				
				console.log("#data");
				console.log(data);				
				for (photo of data){
					photoPath = "/images/ship/${shipNum}/"+photo.boardFileSaveName;
					
					let html="";
					html+="<a class='col-3 m-0 p-0' href='"+photoPath+"' data-lightbox='roadtrip' >";
					html+="<img class='col-3 m-0 p-0' src='"+photoPath+"' alt='...' style='width:145'>";
					html+="</a>";
					
					$("#album-box").append(html);					
					
					
				}
				
//	 			for( file of data ){
//	 				let fileDate = file.boardFileUdate.substr(0, 10);
//	 				let fileYear = file.boardFileUdate.substr(0, 4);
//	 				fileDateSet.add(fileDate);
//	 				fileYearSet.add(fileYear);
//	 			}
//	 			console.log("# fileDateSet : "+ fileDateSet)
//	 			console.log(fileDateSet)
//	 			console.log("# fileYearSet : "+ fileYearSet)
//	 			console.log(fileYearSet)
				
				
//	 			let fileDateBox = $("#file-date-box");
				
//	 			for (fileYear of fileYearSet){
//	 				let html = "";
//	 				html +="<div id='date-div-"+fileYear+"' class='col-2 p-0 d-flex justify-content-start'><button name='"+fileYear+"' onclick='filterDate(this)'>"+fileYear+"년</button></div>";				
//	 				$("#file-date-box").append(html);
					
//	 			}

				
				
//	 			let fileDateDivs = fileDateBox.children();
				
//	 			for( fileDate of fileDateSet ){
//	 				let year=fileDate.substr(0,4);
//	 				let month=fileDate.substr(5,2);
//	 				console.log("# year : "+year+ " # month : "+month)
//	 				let html="";
//	 				html+="<div class='year-"+year+"'>";
//	 				html+="<div class='card border-0 rounded-0 m-0 mt-3 d-flex justify-content-between border-bottom'>";
//	 				html+="<div class='row d-flex justify-content-between'>";
//	 				html+="<div class='col ps-4 py-0 '>"+year+"년 "+ month+"월</div>";
//	 				html+="<div class='col me-2 d-flex justify-content-end'>";
//	 				html+="<a id='unfoldFile-"+fileDate+"' name='"+year+"-"+month+"' onclick='unfoldFile(this)' style='display: block;'>전체보기<i class='bi bi-caret-down-fill fs-5'></i></a> <a id='foldFile-"+fileDate+"' name='"+year+"-"+month+"' onclick='foldFile(this)' style='display: none;'>접어두기<i class='bi bi-caret-up-fill fs-5'></i></a>";
//	 				html+="</div>";
//	 				html+="</div>";
//	 				html+="</div>";
//	 				html+="<div id='attach-date-"+year+"-"+month+"' style='display: none;'></div>";				
//	 				html+="</div>";
//	 				$("#file-date-content").append(html);
//	 			}
				

//	 			for(file of data){
//	 				let udate = file.boardFileUdate.substr(0,7);
							
//	 					let html="";
//	 					html += "<div class='row card border-0 rounded-0 m-0 d-flex align-items-start'>";
//	 					html += "<div>";
//	 					html +="<a href='#' contenteditable='false' class='aclass row p-3 my-3 m-0 border-around bg-light' style='cursor: pointer;'><div class='col-12 d-flex justify-content-between' style='color: black;'>";	
//	 					html +="<span class='col-8'>"+file.boardFileName+"</span> <span class='col-3 file-size' style='opacity: .6;'>"+file.boardFileSize+"</span>";
//	 					html +="<button id='"+file.boardFileSaveName+"' type='button' class='col-1 download-btn' style='opacity: 0.6; display: block;' name='"+file.boardFileSaveName+"' onclick='downloadFile(this)'>";
//	 					html +="<i class='bi bi-arrow-down'></i>";
//	 					html +="</button>";
//	 					html +="</div></a>";
//	 					html +="</div>";
//	 					html +="</div>";
//	 					$("#attach-date-"+udate).append(html);
					
//	 			}
				
			},
		});
	},
	function(){
	    lightbox.option({
	      'resizeDuration': 200,
	      'wrapAround': true
	    })
	},
)

	function unfoldFile(el){
		let fileBundleNum = el.name;
		
		el.style.display="none"
		el.nextElementSibling.style.display="block";
		
		$("#fileBundle-"+fileBundleNum).attr('class','row card border-0 rounded-0 m-0 d-flex align-items-start');
		
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
		
		$("#fileBundle-"+fileBundleNum).attr('class','row card border-0 rounded-0 m-0 d-none align-items-start');

		
// 		let mainBox = el.closest("div .main-box");
// 		let replyDivs = mainBox.querySelectorAll('div .sub-box');
		
// 		el.style.display="none";
// 		el.nextElementSibling.style.display="block";
		
// 		for ( replyDiv of replyDivs){
// 			replyDiv.style.display="none";							
// 		}
	}
	
	
	!function(t,i,h,e){"use strict";function o(i,h){this.element=i,this.$el=t(i),this._name=s,this.init(h)}var s="justifiedImages";o.prototype={defaults:{template:function(t){return'<div class="photo-container" style="height:'+t.displayHeight+"px;margin-right:"+t.marginRight+'px;"><img class="image-thumb" src="'+t.src+'" style="width:'+t.displayWidth+"px;height:"+t.displayHeight+'px;" ></div>'},appendBlocks:function(){return[]},rowHeight:150,maxRowHeight:350,handleResize:!1,margin:1,imageSelector:"image-thumb",imageContainer:"photo-container"},init:function(i){this.options=t.extend({},this.defaults,i),this.displayImages(),this.options.handleResize&&this.handleResize()},getBlockInRow:function(t){for(var i=this.options.appendBlocks(),h=0;h<i.length;h++){var e=i[h];if(e.rowNum===t)return e}},displayImages:function(){var i=this,h=[],e=0,o=0,s=this.options.images.length,n=this.options.images,a=[],r=0,p=this.options.appendBlocks(),l=this.$el.width(),d=parseInt(this.options.margin,10),g=this.$el,c=parseInt(this.options.rowHeight,10);t.each(this.options.images,function(t,e){var o=i.options.getSize(e),s=parseInt(o.width,10),n=parseInt(o.height,10);n!==c&&(s=Math.floor(s*(c/n))),r+=s,h.push(s)}),t.each(p,function(t,i){r+=i.width});var m=r/Math.ceil(r/l);console.log("rows",Math.ceil(r/l));for(var f=0;s>o;){var w={width:0,photos:[]},u=0,v=this.getBlockInRow(a.length+1);for(v&&(w.width+=v.width,f+=v.width);f+h[o+u]/2<=m*(a.length+1)&&s>o+u;)f+=h[o+u],w.width+=h[o+u],w.photos.push({width:h[o+u],photo:n[o+u]}),u++;o+=u,a.push(w)}console.log(a.length,a);for(var y=0;y<a.length;y++){var w=a[y],R=!1;if(e=y+1,this.options.maxRows&&e>this.options.maxRows)break;y===a.length-1&&(R=!0),f=-1*d;var I=this.getBlockInRow(R?-1:e),x=l;I&&(x-=I.width,f=0);var b=x/w.width,u=w.photos.length,k=Math.min(Math.floor(c*b),parseInt(this.options.maxRowHeight,10));b=k/this.options.rowHeight;var H=t("<div/>",{"class":"picrow"});H.height(k+d),g.append(H);for(var M="",B=0;B<w.photos.length;B++){var j=w.photos[B].photo,z=Math.floor(w.photos[B].width*b);f+=z+d,M+=this.renderPhoto(j,{src:this.options.thumbnailPath(j,z,k),width:z,height:k},I?!1:B===w.photos.length-1)}if(""!==M){if(H.html(M),Math.abs(f-x)<.05*x){for(var C=0;x>f;){var S=H.find("."+this.options.imageContainer+":nth-child("+(C+1)+")"),$=S.find("."+this.options.imageSelector);$.width($.width()+1),C=(C+1)%u,f++}for(C=0;f>x;){var P=H.find("."+this.options.imageContainer+":nth-child("+(C+1)+")"),_=P.find("."+this.options.imageSelector);_.width(_.width()-1),C=(C+1)%u,f--}}else if(x-f>.05*x)for(var O=x-f,W=0,q=H.find("."+this.options.imageContainer),A=0,N=0;N<q.length;N++){var Q=O/q.length,T=q.eq(N),D=T.find("."+this.options.imageSelector),E=D.width(),F=D.height();y===q.length-1&&(Q=O-W),D.width(E+Q),D.height(F/E*(E+Q)),A=(F-D.height())/2,D.css("margin-top",A),W+=Q}I&&t("<div />",{"class":this.options.imageContainer+" added-block",css:{width:I.width,height:k},html:I.html}).appendTo(H)}else H.remove()}},renderPhoto:function(i,h,e){var o={},s;return s=t.extend({},i,{src:h.src,displayWidth:h.width,displayHeight:h.height,marginRight:e?0:this.options.margin}),this.options.dataObject?o[this.options.dataObject]=s:o=s,this.options.template(o)},handleResize:function(){},refresh:function(i){this.options=t.extend({},this.defaults,i),this.$el.empty(),this.displayImages()}},t.fn[s]=function(i){var h=arguments,e;return this.each(function(){var n=t(this),a=t.data(this,"plugin_"+s),r="object"==typeof i&&i;a?"string"==typeof i?e=a[i].apply(a,Array.prototype.slice.call(h,1)):a.refresh.call(a,r):n.data("plugin_"+s,a=new o(this,r))}),e||this}}(jQuery,window,document);
	
	</script>
	
	

	


</div>

