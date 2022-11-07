<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

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
</style>

<div class="col-8">

	<!-- div추가 main-box 추가 -->
	
	<div class="card border-0 rounded-0 mb-3 main-box">

		<div class="card-header border-0 bg-white p-0">
			<div class="col px-0 py-2 border-bottom"
				style="flex-direction: column;">
				<div class="card-body p-3"">
					<p class="fw-bolder m-0 ">${ship.shipName}초대</p>
				</div>
			</div>
		</div>

  		<!--form 시작점 -->
  		
		<form method="POST" name="usrNumberAdd" action="/ship/${shipNum}/crew/crewInvite" id="next_form">

			<!-- 없으면 항목이 존재하지 않다고 알려줌 -->
			<c:if test="${usrs[0].usrNum eq null}">
				<div class="row m-0 p-4 border-bottom">초대할 사람이 존재하지 않습니다!</div>
			</c:if>

			<!-- 반복문 구간 -->
			<c:forEach var="items" items="${ usrs }">
				<div class="row m-0 p-0 border-bottom">
					<div class="col-2" style="float: none; margin: auto;">
						<img class="img-fluid rounded-circle img-thumbnail"
							style="width: 40; height: 40; position:;" src="/images/logo.png"
							alt="..." />
					</div>
					<div class="col-8 p-0 py-3">
						<div class="row-2">${ items.usrNickname }</div>
					</div>
					<div class="action col-2 py-3">
						<div class="col-1 p-0">
							<input class="checkSelect" type="checkbox" id="usrNumber"
								name="usrNumber[]" value="${items.usrNum}">
						</div>
						<input type="hidden" name="shipNum" value="${ship.shipNum}" />
						<%-- 												<input type="hidden" name="usrNickname[]" value="${items.usrNickname}" /> --%>
					</div>
				</div>
			</c:forEach>


			<!-- submit 버튼 -->
			<div class="px-2 py-2">
				<input type="submit" value="Submit" id="Submit">
			</div>
		</form>
	</div>
</div>