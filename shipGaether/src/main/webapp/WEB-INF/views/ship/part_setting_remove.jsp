<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<div class="col-8">

	<!-- ship 관리 상단 메뉴탭 -->
	<div class="card border-0 rounded-0 mb-3 d-flex">
		<div class="row p-3 pb-1 d-flex justify-content-center align-items-between">
			<a href="/ship/${ship.shipNum}/setting/app" class="p-0 m-3 text-center" style="width: 17%; color: black; font-weight: 700;">가입신청서</a> <a href="/ship/${ship.shipNum}/setting/info" class="p-0 m-3 text-center" style="width: 17%; color: black; font-weight: 700;">정보수정</a> <a href="/ship/${ship.shipNum}/setting/photo" class="p-0 m-3 text-center" style="width: 17%; color: black; font-weight: 700;">대표사진</a> <a href="/ship/${ship.shipNum}/setting/remove" class="p-0 m-3 text-center" style="width: 17%; color: black; font-weight: 800; border-bottom: 2px solid #000;">삭제하기</a>
		</div>
	</div>

	<!-- 밴드 삭제 시작 -->
	<div class="card border-0 rounded-0 mb-3 p-2 py-4">
		<div class="card-header border-0 bg-white p-0">

			<div class="card-body p-3 px-0 py-2 d-flex justify-content-center align-items-center">
				<h5 class="col-9 fw-bold m-0 " style="float: left;">SHIP 삭제</h5>
				<button class="col-3 btn border rounded-0 btn-outline-white p-2" style="font-size: 13px; width: 90px;" onclick="leaveShip()">삭제하기</button>
			</div>

		</div>
	</div>
</div>

