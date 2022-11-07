<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<%@include file="source.jsp"%>
<!-- fullcalender -->

<link href='/css/calendar/main.css' rel='stylesheet' />
<script src='/js/calendar/main.js'></script>
<script>
	var usrNum = "${sessionId}";
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			googleCalendarApiKey : "AIzaSyDVV-aigMLPXYPWl2tTICAHcia-glO3A1I",
			timeZone : 'Asia/Seoul',
			themeSystem : 'bootstrap5',
			customButtons: {
			    myCustomButton: {
			      text: 'changeDate',
			      click: function() {
			    	  var form = $("#dateChange");
			    	  var date = calendar.getDate();
			    	  form.find("#dating").val(date.toISOString().slice(0, 7));
			    	  openChangeDateModal();
			    	  const datingButton = document.getElementById("datingButton");
			    	  datingButton.addEventListener('click', () => {
			    		  calendar.gotoDate(form.find("#dating").val());
			    		  closeChangeDateModal();
			    	  });
			      }
			    },
		
				 returnButton: {
				      text: '뒤로가기',
				      click: function() {
				    	  history.back();
				      }
				 }
			  },
			headerToolbar : {
				left : 'prev,next today myCustomButton returnButton',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
			},
			editable: true,
			droppable: true,
			drop: function(info) {
				console.log("drop");
				console.log(info);
			},
			eventDrop: function(info) {
				var eventObj = info.event;
				if(eventObj.borderColor == 'blue'){
					var form = $("#editEvent");
					form.find("#title").val(eventObj.title);
					form.find("#content").val(eventObj.extendedProps.description);
					form.find("#start").val(eventObj.start.toISOString().slice(0, 16));
					form.find("#end").val(eventObj.end.toISOString().slice(0, 16));
					$.ajax({
						type : "post",
						url : "/fullcalendar/myCalendar/update",
						data : {
							"CalendarId" : eventObj.id,
							"CalendarTitle" : form.find("#title").val(),
							"CalendarContent" : form.find("#content").val(),
							"CalendarStart" : form.find("#start").val(),
							"CalendarEnd" : form.find("#end").val(),
						}
					});
				}else{
					alert("ship일정은 해당 ship에서만 수정가능합니다!!");
					location.reload();
				}
			},
			eventResize: function(info) {
				var eventObj = info.event;
				if(eventObj.borderColor == 'blue'){
					var form = $("#editEvent");
					form.find("#title").val(eventObj.title);
					form.find("#content").val(eventObj.extendedProps.description);
					form.find("#start").val(eventObj.start.toISOString().slice(0, 16));
					form.find("#end").val(eventObj.end.toISOString().slice(0, 16));
					$.ajax({
						type : "post",
						url : "/fullcalendar/myCalendar/update",
						data : {
							"CalendarId" : eventObj.id,
							"CalendarTitle" : form.find("#title").val(),
							"CalendarContent" : form.find("#content").val(),
							"CalendarStart" : form.find("#start").val(),
							"CalendarEnd" : form.find("#end").val(),
						}
					});
				}else{
					alert("ship일정은 해당 ship에서만 수정가능합니다!!");
					location.reload();
				}
			},
			selectable : true,
			selectMirror : true,
			navLinks : true,
			select : function(arg) {
				var title ="";
				var content ="";
				var start ="";
				var end ="";
				$('input#start').val(arg.start.toISOString().slice(0, 16));
				$('input#end').val(arg.end.toISOString().slice(0, 16));
				var uid = "${sessionId}";
				openCalendarModal();
				const submitButton = document.getElementById("submit");
				var form = $("#newEvent");
				submitButton.addEventListener('click', () => {
					var startDate = new Date(form.find("#start").val());
					var endDate = new Date(form.find("#end").val());
					if(form.find("#title").val().length == 0){
						alert("title is Empty!!!");
					}else if(startDate-endDate > 0){
						alert("start is bigger than end!!!");
					}else{
						calendar.addEvent({
							title : form.find("#title").val(),
							start :form.find("#start").val(),
							end : form.find("#end").val(),
							extendedProps: {
								description : form.find("#content").val(),
								writer : uid
						    },
							allDay : arg.allDay,
							backgroundColor : "blue",
							textColor : "white"
						})
						$.ajax({
							type : "post",
							url : "/fullcalendar/myCalendar/insert",
							data : {
								"usrNum" : uid,
								"CalendarTitle" : form.find("#title").val(),
								"CalendarWriter" : uid,
								"CalendarContent" : form.find("#content").val(),
								"CalendarStart" : form.find("#start").val(),
								"CalendarEnd" : form.find("#end").val(),
								"CalendarAllDay" : arg.allDay,
								"CalendarTextColor" : "white",
								"CalendarBackgroundColor" : "blue",
								"CalendarBorderColor" : "blue"
							}
						});
					}
			    });
				calendar.unselect();
			},
			eventClick : function(info) {
				var eventObj = info.event;
				const editButton = document.getElementById("edit");
				const deleteButton = document.getElementById("delete");
				const editCompliteButton = document.getElementById("editComplite");
				const cancelButton = document.getElementById("cancel");
				if(eventObj.borderColor == 'blue'){
					editButton.style.display = "block";
					deleteButton.style.display = "block";
				}else{
					editButton.style.display = "none";
					deleteButton.style.display = "none";
				}
				openCalendarEditModal();
				var form = $("#editEvent");
				form.find("#title").val(eventObj.title);
				form.find("#content").val(eventObj.extendedProps.description);
				form.find("#start").val(eventObj.start.toISOString().slice(0, 16));
				form.find("#end").val(eventObj.end.toISOString().slice(0, 16));
				editButton.addEventListener('click', () => {
					form.find("#title").removeAttr("readOnly");
					form.find("#content").removeAttr("readOnly");
					form.find("#start").removeAttr("readOnly");
					form.find("#end").removeAttr("readOnly");
					editButton.style.display = "none";
					deleteButton.style.display = "none";
					editCompliteButton.style.display = "block";
					cancelButton.style.display = "block";
				});
				deleteButton.addEventListener('click', () => {
					$.ajax({
						type : "post",
						url : "/fullcalendar/myCalendar/delete",
						data : {
							"calendarId" : eventObj.id
						}
					});
				});
				editCompliteButton.addEventListener('click', () => {
					var startDate = new Date(form.find("#start").val());
					var endDate = new Date(form.find("#end").val());
					if(form.find("#title").val().length == 0){
						alert("title is Empty!!!");
					}else if(startDate-endDate > 0){
						alert("start is bigger than end!!!");
					}else{
					$.ajax({
						type : "post",
						url : "/fullcalendar/myCalendar/update",
						data : {
							"CalendarId" : eventObj.id,
							"CalendarTitle" : form.find("#title").val(),
							"CalendarContent" : form.find("#content").val(),
							"CalendarStart" : form.find("#start").val(),
							"CalendarEnd" : form.find("#end").val(),
						}
					});
					}
				});
				cancelButton.addEventListener('click', () => {
					form.find("#title").attr("readOnly");
					form.find("#content").attr("readOnly");
					form.find("#start").attr("readOnly");
					form.find("#end").attr("readOnly");
					editButton.style.display = "block";
					deleteButton.style.display = "block";
					editCompliteButton.style.display = "none";
					cancelButton.style.display = "none";
				});
			},
			nowIndicator : true,
			height : '70%',
			editable : true,
			dayMaxEvents : true, // allow "more" link when too many events
			eventDidMount : function(info) {
				var tooltip = new bootstrap.Tooltip(info.el, {
					title : info.event.extendedProps.description || '',
					placement : 'top',
					trigger : 'hover',
					container : 'body'
				});
			},
			eventSources :[ 
		        {
		            googleCalendarId : 'ko.south_korea#holiday@group.v.calendar.google.com'
		            , backgroundColor: "transparent"
		          	, borderColor: "transparent"
		          	, className: "kr-holiday"
		          	, textColor: "red"
		        } 
		    ],
			events : function(info, successCallback, failureCallback) {
				$.ajax({
					type : "get",
					url : "/fullcalendar/myCalendar/data",
					data : {
						"usrNum" : usrNum
					},
					dataType : "json",
					success : function(param) {
						var events = [];
						$.each(param, function(index, data) {
							events.push({
								id: data.calendarId,
								groupId : data.calendarGroupId,
								title : data.calendarTitle,
								extendedProps: {
									writer : data.calendarWriter,
									description : data.calendarContent
							    },
								start : data.calendarStart,
								end : data.calendarEnd,
								allday : data.calendarAllDay, 
								textColor : data.calendarTextColor,
								backgroundColor : data.calendarBackgroundColor,
								borderColor : data.calendarBorderColor
							});
						})	
						successCallback(events);		
					},
					error : function(error) {
						console.log("#error");
						console.log(error);
					}
				});
			}
		});
		calendar.render();
	});
</script>
<style>
html, body {
	margin: 0;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 40px auto;
}

.fc-bg-event {
	color: red !important;
}

.fc-bg-event a {
	color: red !important;
}

.fc-day-sun a {
	color: red !important;
}

.fc-day-sat a {
	color: blue !important;
}

.fc .fc-popover {
	z-index: 1500;
}

#calendar_modal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	z-index: 3001;
}

#calendar_modal h2 {
	margin: 0;
}

#calendar_modal button {
	display: inline-block;
	width: 100px;
	margin-left: calc(100% - 100px - 10px);
}

#calendar_modal .modal_content {
	width: 300px;
	height: 200px;
	position: fixed;
	transform: translate(-50%, 0);
	background: white;
	border-radius: 25px;
	position: fixed;
}

#calendar_modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}

#calendar_edit_modal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	z-index: 3001;
}

#calendar_edit_modal h2 {
	margin: 0;
}

#calendar_edit_modal button {
	display: inline-block;
	width: 100px;
	margin-left: calc(100% - 100px - 10px);
}

#calendar_edit_modal .modal_content {
	width: 300px;
	height: 200px;
	position: fixed;
	transform: translate(-50%, 0);
	background: white;
	border-radius: 25px;
	position: fixed;
}

#calendar_edit_modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}

#change_date_modal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	z-index: 3001;
}

#change_date_modal h2 {
	margin: 0;
}

#change_date_modal button {
	display: inline-block;
	width: 100px;
	margin-left: calc(100% - 100px - 10px);
}

#change_date_modal .modal_content {
	width: 200px;
	height: 60px;
	position: fixed;
	transform: translate(-50%, 0);
	background: white;
	border-radius: 10px;
	position: fixed;
}

#change_date_modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0);
	z-index: -1;
}
</style>
</head>

<body>
	<div id='calendar'></div>
	<div id="calendar_modal">
		<div class="modal_content">
			<form id="newEvent" class="m-4">
				<div class="row mb-2">
					<div class="col-3">Title</div>
					<div class="col-9">
						<input class="w-100" id="title" type="text" />
					</div>
				</div>
				<div class="row mb-2">
					<div class="col-3">Content</div>
					<div class="col-9">
						<input class="w-100" id="content" type="text" />
					</div>
				</div>
				<div class="row mb-2">
					<div class="col-3">Start</div>
					<div class="col-9">
						<input class="w-100" id="start" type="datetime-local" value="" />
					</div>
				</div>
				<div class="row mb-2">
					<div class="col-3">End</div>
					<div class="col-9">
						<input class="w-100" id="end" type="datetime-local" value="" />
					</div>
				</div>
				<input class="w-100" id="submit" type="submit" value="입력" />
			</form>
		</div>
		<div class="modal_layer"></div>
		<button class="btn" type="button" id="calendar_modal_close_btn"
			onclick="closeCalendarModal()">
			<i class="bi-x-lg me-1"
				style="color: white; font-size: 1.5em; position: fixed; top: 60px;"></i>
		</button>
	</div>
	<div id="calendar_edit_modal">
		<div class="modal_content">
			<form id="editEvent" class="m-4">
				<div class="row mb-2">
					<div class="col-3">Title</div>
					<div class="col-9">
						<input class="w-100" id="title" type="text" readOnly />
					</div>
				</div>
				<div class="row mb-2">
					<div class="col-3">Content</div>
					<div class="col-9">
						<input class="w-100" id="content" type="text" readOnly />
					</div>
				</div>
				<div class="row mb-2">
					<div class="col-3">Start</div>
					<div class="col-9">
						<input class="w-100" id="start" type="datetime-local" value=""
							readOnly />
					</div>
				</div>
				<div class="row mb-2">
					<div class="col-3">End</div>
					<div class="col-9">
						<input class="w-100" id="end" type="datetime-local" value=""
							readOnly />
					</div>
				</div>
				<div class="row mb-2">
					<div class="col-6">
						<input class="w-100" id="edit" type="button" value="수정" />
					</div>
					<div class="col-6">
						<input class="w-100" id="delete" type="submit" value="삭제" />
					</div>
					<div class="col-6">
						<input class="w-100" id="editComplite" type="submit" value="수정완료"
							style="display: none" />
					</div>
					<div class="col-6">
						<input class="w-100" id="cancel" type="button" value="취소"
							style="display: none" />
					</div>
				</div>
			</form>
		</div>
		<div class="modal_layer"></div>
		<button class="btn" type="button" id="calendar_edit_modal_close_btn"
			onclick="closeCalendarEditModal()">
			<i class="bi-x-lg me-1"
				style="color: white; font-size: 1.5em; position: fixed; top: 60px;"></i>
		</button>
	</div>
	<div id="change_date_modal">
		<div class="modal_content">
			<form id="dateChange" class="m-4">
				<div class="row mb-2">
					<div class="col-9 ps-0">
						<input class="w-100" id="dating" type="month" value="" />
					</div>
					<div class="col-3 p-0">
						<input class="w-100" id="datingButton" type="button" value="Go" />
					</div>
				</div>
			</form>
		</div>
		<div class="modal_layer"></div>
		<button class="btn" type="button" id="change_date_modal_close_btn"
			onclick="closeChangeDateModal()"></button>
	</div>
	<script>
		document.getElementById('calendar').addEventListener('mouseup',
				 (event) => {
					$('.modal_content').css('top', event.pageY);
					$('.modal_content').css('left', event.pageX);
				 });
		function openCalendarModal() {		
			document.getElementById("calendar_modal").style.display = "block";
		}
		
		function openCalendarEditModal() {		
			document.getElementById("calendar_edit_modal").style.display = "block";
		}
		
		function openChangeDateModal() {		
			document.getElementById("change_date_modal").style.display = "block";
		}

		function closeCalendarModal() {
			document.getElementById("calendar_modal").style.display = "none";
		}
		
		function closeCalendarEditModal() {		
			document.getElementById("calendar_edit_modal").style.display = "none";
		}
		
		function closeChangeDateModal() {		
			document.getElementById("change_date_modal").style.display = "none";
		}

	</script>
</body>