<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">



<div class="col-8">
	<!-- div추가 main-box 추가 -->
	<div>
		<div class="card border-0 rounded-0 main-box">
			<div class="card-header border-0 bg-white p-0">
				<form name="shipNumForm">
					<input type="hidden" id="shipNumtoCalendar" name="shipNumtoCalendar" value="${shipNum}" />
					<input type="hidden" id="shipAdminNum" name="shipAdminNum" value="${ship.usrNum}" />
				</form>

				<!-- 달력 자리 -->

				<iframe id="calendarInner" src="../../fullcalendar"
					style="border: 0" width="100%" height="520px" frameborder="0"
					scrolling="no"></iframe>
			</div>
		</div>
	</div>
</div>


