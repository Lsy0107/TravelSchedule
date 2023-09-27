<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Modern Business - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- Navigation-->
		<%@ include file="include/menu.jsp"%>
		<!-- contant 시작 -->
		<div class="row">
			<div class="col col-8">
				<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#myCarousel"
							data-bs-slide-to="0" class="" aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#myCarousel"
							data-bs-slide-to="1" aria-label="Slide 2" class="active"
							aria-current="true"></button>
						<button type="button" data-bs-target="#myCarousel"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner">
						<div class="carousel-item">
							<svg class="bd-placeholder-img" width="100%" height="100%"
								xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
								preserveAspectRatio="xMidYMid slice" focusable="false">
								<rect width="100%" height="100%" fill="#777"></rect></svg>

							<div class="container">
								<div class="carousel-caption text-start">
									<h1>Example headline.</h1>
									<p>Some representative placeholder content for the first
										slide of the carousel.</p>
									<p>
										<a class="btn btn-lg btn-primary" href="#">Sign up today</a>
									</p>
								</div>
							</div>
						</div>
						<div class="carousel-item active">
							<svg class="bd-placeholder-img" width="100%" height="100%"
								xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
								preserveAspectRatio="xMidYMid slice" focusable="false">
								<rect width="100%" height="100%" fill="#777"></rect></svg>

							<div class="container">
								<div class="carousel-caption">
									<h1>Another example headline.</h1>
									<p>Some representative placeholder content for the second
										slide of the carousel.</p>
									<p>
										<a class="btn btn-lg btn-primary" href="#">Learn more</a>
									</p>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<svg class="bd-placeholder-img" width="100%" height="100%"
								xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
								preserveAspectRatio="xMidYMid slice" focusable="false">
								<rect width="100%" height="100%" fill="#777"></rect></svg>

							<div class="container">
								<div class="carousel-caption text-end">
									<h1>One more for good measure.</h1>
									<p>Some representative placeholder content for the third
										slide of this carousel.</p>
									<p>
										<a class="btn btn-lg btn-primary" href="#">Browse gallery</a>
									</p>
								</div>
							</div>
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#myCarousel" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#myCarousel" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
			<div class="col col-4 text-center" style="background: aliceblue;">2 of 2</div>
		</div>
		<div class="row">
			<div class="col p-5">
				<div class="card" style="width: 18rem;">
					<a><img src="..." class="card-img-top" alt="..."></a>
					<div class="card-body">
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col p-5">
				<div class="card" style="width: 18rem;">
					<a><img src="..." class="card-img-top" alt="..."></a>
					<div class="card-body">
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
					</div>
				</div>
			</div>
		</div>
		<!-- contant 종료 -->
	</main>
	<!-- Footer-->
	<footer class="bg-dark py-4 mt-auto">
		<div class="container px-5">
			<div
				class="row align-items-center justify-content-between flex-column flex-sm-row">
				<div class="col-auto">
					<div class="small m-0 text-white">Copyright &copy; Your
						Website 2023</div>
				</div>
				<div class="col-auto">
					<a class="link-light small" href="#!">Privacy</a> <span
						class="text-white mx-1">&middot;</span> <a
						class="link-light small" href="#!">Terms</a> <span
						class="text-white mx-1">&middot;</span> <a
						class="link-light small" href="#!">Contact</a>
				</div>
			</div>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
</body>
</html>
