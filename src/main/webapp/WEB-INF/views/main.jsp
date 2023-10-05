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

<!-- Data AOS-->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">


<style type="text/css">
.signIn {
	border: 1px solid black;
	border-radius: 25px;
	display: block;
	margin-top: 20px;
	width: 85%;
	margin-left: auto;
	margin-right: auto;
}

.signUp {
	border: 1px solid black;
	border-radius: 25px;
	display: block;
	margin-top: 20px;
	width: 85%;
	margin-left: auto;
	margin-right: auto;
}

.search {
	position: relative;
	top: 120px;
	width: 50%;
	margin-left: auto;
	margin-right: auto;
}

#TripRecommend {
	background-color: #ffd045;
background-image: linear-gradient(315deg, #ffd045 0%, #d14545 74%);
	width: 70%;
	height: 500px;
	margin-left: auto;
	margin-right: auto;
}
#WeatherInfo{
	background-color: #ffffff;
background-image: linear-gradient(315deg, #ffffff 0%, #5899e2 74%);
	width: 70%;
	height: 500px;
	margin-left: auto;
	margin-right: auto;
}
#FestivalRecommend{
	background-color: #ffffff;
background-image: linear-gradient(315deg, #ffffff 0%, #ff7878 74%);
	width: 70%;
	height: 500px;
	margin-left: auto;
	margin-right: auto;
}

#TitleBar {
	position: relative;
	top: 64px;
}
#MainContents{
	position: relative;
    top: 700px;
}
footer{
	position: absolute;
	bottom: 0;
	width: 100%;
}
main{
	position: relative;
	min-height: 100%;
	padding-bottom: 2000px;
}

</style>


</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- Navigation-->
		<%@ include file="include/menu.jsp"%>
		<!-- content 시작 -->


		<div class="" id="TitleBar">
			<div class="IMGBAR">
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
							<svg class="bd-placeholder-img" width="100%" height="800px"
								xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
								preserveAspectRatio="xMidYMid slice" focusable="false">
								<rect width="100%" height="800px" fill="#777"></rect></svg>
								<div class="carousel-caption text-start">
									<img style="max-width: 100%; height: auto;" src="${pageContext.request.contextPath }/resources/tdest/남산타워.jpg" alt="">
								</div>
						</div>
						<div class="carousel-item active">
							<svg class="bd-placeholder-img" width="100%" height="800px"
								xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
								preserveAspectRatio="xMidYMid slice" focusable="false">
								<rect width="100%" height="800px" fill="#777"></rect></svg>

							<div class="carousel-caption text-start">
								<img style="width: 100%; height: 100%;" src="${pageContext.request.contextPath }/resources/tdest/경복궁.jpg" alt="">
							</div>
						</div>
						<div class="carousel-item">
							<svg class="bd-placeholder-img" width="100%" height="800px"
								xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
								preserveAspectRatio="xMidYMid slice" focusable="false">
								<rect width="100%" height="800px" fill="#777"></rect></svg>

							<div class="carousel-caption text-start">
								<img src="${pageContext.request.contextPath }/resources/tdest/제주 성산일출봉.jpg" alt="">
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
			
		</div>


		<div id="MainContents">
			<div class="row" data-aos="zoom-in-down" data-aos-duration="600" data-aos-anchor-placement="top-center">
				<div class="col p-5">
					<div class="card" id="WeatherInfo">
						<a><img src="..." class="card-img-top" alt="..."></a>
						<div class="card-body">
							<p class="card-text">날씨 정보</p>
						</div>
					</div>
				</div>
			</div>


			<div class="row" data-aos="fade-down-right" data-aos-duration="600"
			data-aos-anchor-placement="top-center">
				<div class="col p-5">
					<div class="card" id="TripRecommend">
						<a><img src="..." class="card-img-top" alt="..."></a>
						<div class="card-body">
							<p class="card-text">여행지 추천</p>
						</div>
					</div>
				</div>
			</div>


			<div class="row" data-aos="fade-down-right" data-aos-duration="600"
			data-aos-anchor-placement="top-center">
				<div class="col p-5">
					<div class="card" id="FestivalRecommend">
						<a><img src="..." class="card-img-top" alt="..."></a>
						<div class="card-body">
							<p class="card-text">축제 추천</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- content 종료 -->
		<!-- Footer-->
		<%@ include file="include/footer.jsp"%>
	</main>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>

	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<script>
		AOS.init();
	</script>
</body>
</html>
