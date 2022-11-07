<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<%@include file="header.jsp"%>
<script>
	document.addEventListener('scroll', function() {
		const factor = document.getElementById('stickyY');
		const target = document.getElementById('sticky');
		const clientRect = factor.getBoundingClientRect();
		const fixedRect = target.getBoundingClientRect();
		const relativeTop = clientRect.top;
		const relativeLeft = clientRect.left;
		const fixedLeft = fixedRect.left;
		const fixedRight = fixedRect.right;
		if (relativeTop <= 88) {
			target.style.position = "fixed";
			target.style.top = "88px";
			target.style.left = fixedLeft+"px";
			target.style.width = (fixedRight-fixedLeft)+"px";
		} else {
			target.style.position = "static";
			target.removeProperty('top');
			target.removeProperty('left');
			target.removeProperty('width');
		}
	});
</script>
</head>
<body style="background-color: #e9ecef">
	<div class="row h-100 px-5" style="padding-top: 72px;">
		<div class="col-2 mt-3"></div>
		<div class="col-8 mt-3">
			<div class="row">
				<div class="col-3 p-0">
					<%@include file="sidebar.jsp"%>
				</div>
				<main class="col-9 p-0" style="overflow: visible">
					<img class="img-fluid mx-auto w-100 mb-3" style="height: 240px;"
						src="images/sample3.jpg" alt="..." />
					<div id="stickyY" class="row">
						<div class="col-8">
							<form
								class="d-flex border border-1.5 rounded-0 border-white bg-white justify-content-end align-items-center"
								action="../../../search/" role="search" method="get">
								<input class="form-control border-0" name="search" type="search"
									placeholder="Search....." aria-label="Search"
									style="background-color: transparent;">
								<div
									class="d-flex justify-content-end align-items-center me-lg-0 mb-2 mb-lg-0 ms-auto ">
									<button class="btn" type="submit">
										<i class="bi-search" style="color: #0000008c;"></i>
									</button>
								</div>
							</form>
							<div class="card mb-3 border-0 rounded-0 mb-3">
								<div class="card-body p-3">
									<button class="w-100 h-100 border-0 bg-white p-0" type="button"
										style="color: #0000008c; text-align: start">
										Please tell your new story..<br>
										<br>
									</button>
								</div>
								<div class="card-footer border-0 bg-transparent">
									<button class="btn" onclick="picture">
										<i class="bi bi-image" style="color: #0000008c;"></i>
									</button>
									<button class="btn" onclick="video">
										<i class="bi bi-play-circle" style="color: #0000008c;"></i>
									</button>
									<button class="btn" onclick="file">
										<i class="bi bi-paperclip" style="color: #0000008c;"></i>
									</button>
									<button class="btn" onclick="calendar">
										<i class="bi bi-calendar4-week" style="color: #0000008c;"></i>
									</button>
									<button class="btn" onclick="todo">
										<i class="bi bi-ui-checks" style="color: #0000008c;"></i>
									</button>
									<button class="btn" onclick="location">
										<i class="bi bi-geo-alt" style="color: #0000008c;"></i>
									</button>


								</div>

							</div>
							<div class="card border-0 rounded-0 mb-3">
								<div class="card-header border-0 bg-white p-0">
									<div class="row" style="float: none; margin: 0 auto;">
										<div class="col-2" style="float: none; margin: auto;">
											<img class="img-fluid rounded-circle img-thumbnail"
												style="width: 40; height: 40; position:;"
												src="images/logo.png" alt="..." />
										</div>
										<div class="col px-0 py-2" style="flex-direction: column;">
											<p class="fw-bolder m-0" style="font-size: 0.9em;">@Crew</p>
											<p class="text m-0" style="font-size: 0.8em;">n hours ago</p>
										</div>
									</div>
								</div>
								<div class="row p-2" style="float: none; margin: 0 auto;">
									<div class="col-8 p-0 border border-white">
										<img class="img-fluid mx-auto" src="images/sample1.jpg"
											style="object-fit: cover;" alt="..." />
									</div>
									<div class="col-4 p-0">
										<div class="row m-0 border border-white">
											<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
												alt="..." />
										</div>
										<div class="row m-0 border border-white">
											<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
												alt="..." />
										</div>
										<div class="row m-0 border border-white">
											<button type="button" class="btn w-100 h-100 border-0 p-0"
												style="display: flex; align-items: center; justify-content: center;">
												<i class="bi bi-plus"
													style="position: absolute; font-size: 1.4em">더 보기</i> <img
													class="img-fluid mx-auto p-0" src="images/more_gray.png"
													style="width: 32%; position: absolute; opacity: 0.5;"
													alt="..." /> <img class="img-fluid mx-auto p-0"
													src="images/sample1.jpg" style="overflow: hidden;"
													alt="..." />

											</button>
										</div>
									</div>
									<div class="card-body">
										<div class="text">
											Sample text area~~~~~~~<br>~~~~~~~~~~~~~~~<br>~~~~~~~~~~<br>
										</div>
									</div>
									<!-- Product actions-->
									<div class="card-footer bg-transparent">
										<div class="row">
											<div class="col">
												<button class="btn w-100" onclick="location">
													<i class="bi bi-hand-thumbs-up" style="color: #0000008c;">&nbsp;&nbsp;좋아요</i>
												</button>
											</div>
											<div class="col">
												<button class="btn w-100" onclick="location">
													<i class="bi bi-chat-right-dots" style="color: #0000008c;">&nbsp;&nbsp;댓글달기</i>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="card border-0 rounded-0">
								<div class="card-header border-0 bg-white p-0">
									<div class="row" style="float: none; margin: 0 auto;">
										<div class="col-2" style="float: none; margin: auto;">
											<img class="img-fluid rounded-circle img-thumbnail"
												style="width: 40; height: 40; position:;"
												src="images/logo.png" alt="..." />
										</div>
										<div class="col px-0 py-2" style="flex-direction: column;">
											<p class="fw-bolder m-0" style="font-size: 0.9em;">@Crew</p>
											<p class="text m-0" style="font-size: 0.8em;">n hours ago</p>
										</div>
									</div>
								</div>
								<div class="row p-2" style="float: none; margin: 0 auto;">
									<div class="col-8 p-0 border border-white">
										<img class="img-fluid mx-auto" src="images/sample1.jpg"
											style="object-fit: cover;" alt="..." />
									</div>
									<div class="col-4 p-0">
										<div class="row m-0 border border-white">
											<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
												alt="..." />
										</div>
										<div class="row m-0 border border-white">
											<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
												alt="..." />
										</div>
										<div class="row m-0 border border-white">
											<button type="button" class="btn w-100 h-100 border-0 p-0"
												style="display: flex; align-items: center; justify-content: center;">
												<i class="bi bi-plus"
													style="position: absolute; font-size: 1.4em">더 보기</i> <img
													class="img-fluid mx-auto p-0" src="images/more_gray.png"
													style="width: 32%; position: absolute; opacity: 0.5;"
													alt="..." /> <img class="img-fluid mx-auto p-0"
													src="images/sample1.jpg" style="overflow: hidden;"
													alt="..." />

											</button>
										</div>
									</div>
									<div class="card-body">
										<div class="text">
											Sample text area~~~~~~~<br>~~~~~~~~~~~~~~~<br>~~~~~~~~~~<br>
										</div>
									</div>
									<!-- Product actions-->
									<div class="card-footer bg-transparent mb-3">
										<div class="row">
											<div class="col">
												<button class="btn w-100" onclick="location">
													<i class="bi bi-hand-thumbs-up" style="color: #0000008c;">&nbsp;&nbsp;좋아요</i>
												</button>
											</div>
											<div class="col">
												<button class="btn w-100" onclick="location">
													<i class="bi bi-chat-right-dots" style="color: #0000008c;">&nbsp;&nbsp;댓글달기</i>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							
						</div>
						<div class="col-4 py-0 ps-0 pe-3" id="sticky">
							<div class="card border-0 rounded-0">
								<div class="card-header border-0 bg-white p-0">
									<div class="row" style="float: none; margin: 0 auto;">
										<div class="col" style="float: none; margin: auto 0;">
											사진첩
										</div>
										<div class="col" style="text-align:end">
												<button class="btn w-100" onclick="location">
													<p class="text m-0" style="font-size:12px; color: #0000008c;">&nbsp;&nbsp;더 보기</p>
												</button>
										</div>
									</div>
								</div>
								<div class="card-body p-0">
								<div class="row p-2" style="float: none; margin: 0 auto;">
									<div class="col-4 p-0">
										<div class="row m-0 border border-white">
											<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
												alt="..." />
										</div>
										<div class="row m-0 border border-white">
											<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
												alt="..." />
										</div>
									</div>
									<div class="col-4 p-0">
										<div class="row m-0 border border-white">
											<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
												alt="..." />
										</div>
										<div class="row m-0 border border-white">
											<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
												alt="..." />
										</div>
									</div>
									<div class="col-4 p-0">
										<div class="row m-0 border border-white">
											<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
												alt="..." />
										</div>
										<div class="row m-0 border border-white">
											<img class="img-fluid mx-auto p-0" src="images/sample1.jpg"
												alt="..." />
										</div>
									</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</main>
			</div>
		</div>
	</div>
</body>
</html>