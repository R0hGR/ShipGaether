<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="d-flex flex-column flex-shrink-0 p-1 bg-white"
	style="overflow: visible; position: fixed; width: 14%">
	<div
		class="d-flex align-items-center justify-content-center link-dark text-decoration-none"
		style="flex-direction: column;">
		<img class="img-fluid rounded-circle img-thumbnail my-3"
			style="width: 170; height: 170; position:;" src="images/logo.png"
			alt="..." />
		<h4 class="fw-bold mb-2">Band Name</h4>
		<p class="fw-bold mb-2" style="color: #0000008c">@Captain</p>
		<p class="fw-bold mb-2" style="color: #0000008c">N Crews in this
			Ship</p>
		<div class="d-flex">
			<button
				class="btn btn-sm btn-outline-secondary border-secondary border-2"
				type="button" id="login_modal_opne_btn">
				<i class="bi bi-envelope"></i> Message
			</button>
			&nbsp;&nbsp;
			<button
				class="btn btn-sm btn-outline-secondary border-secondary border-2"
				type="button" id="login_modal_opne_btn">
				<i class="bi bi-plus" style="font-size: 1.3em"></i> Join
			</button>
		</div>
	</div>
	<hr>
	<ul class="nav nav-pills flex-column mb-auto">
		<li class="nav-item"><a href="#" class="nav-link active" style="">
				<svg class="bi pe-none me-2" width="16" height="16">
						<use xlink:href="#home"></use></svg> Home
		</a></li>
		<li><a href="#" class="nav-link link-dark"> <svg
					class="bi pe-none me-2" width="16" height="16">
						<use xlink:href="#speedometer2"></use></svg> Dashboard
		</a></li>
		<li><a href="#" class="nav-link link-dark"> <svg
					class="bi pe-none me-2" width="16" height="16">
						<use xlink:href="#table"></use></svg> Orders
		</a></li>
		<li><a href="#" class="nav-link link-dark"> <svg
					class="bi pe-none me-2" width="16" height="16">
						<use xlink:href="#grid"></use></svg> Products
		</a></li>
		<li><a href="#" class="nav-link link-dark"> <svg
					class="bi pe-none me-2" width="16" height="16">
						<use xlink:href="#people-circle"></use></svg> Customers
		</a></li>
	</ul>
</div>
