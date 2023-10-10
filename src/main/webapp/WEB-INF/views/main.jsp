<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

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

#WeatherInfo {
	background-color: #ffffff;
	background-image: linear-gradient(315deg, #ffffff 0%, #5899e2 74%);
	width: 70%;
	height: 500px;
	margin-left: auto;
	margin-right: auto;
}

#FestivalRecommend {
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

#MainContents {
	position: relative;
	top: 700px;
}

footer {
	position: absolute;
	bottom: 0;
	width: 100%;
}

main {
	position: relative;
	min-height: 100%;
	padding-bottom: 2000px;
}
.profile{
    width: 20%;
    border-radius: 50px;
}
.disnone{
	display:none;
}
</style>


</head>
<body class="d-flex flex-column h-100">
	<main class="">
		<!-- Navigation-->
		<%@ include file="include/menu.jsp"%>
		<!-- content 시작 -->


		<div class="row">
		<div id="TitleBar" style="width: 70%;">
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
							<svg class="bd-placeholder-img" width="100%" height="550px"
								xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
								preserveAspectRatio="xMidYMid slice" focusable="false">
								<rect width="100%" height="800px" fill="#777"></rect></svg>
							<div class="carousel-caption text-start">
								<a href="${newList[0].url}"><img src="${newList[0].photo }"
									height="400px"></a>
								<div>
									<p>${newList[0].newtitle }</p>
									<p>${newList[0].newsdate }</p>
								</div>
							</div>
						</div>
						<div class="carousel-item active">
							<svg class="bd-placeholder-img" width="100%" height="550px"
								xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
								preserveAspectRatio="xMidYMid slice" focusable="false">
								<rect width="100%" height="800px" fill="#777"></rect></svg>
							<div class="carousel-caption text-start">
								<a href="${newList[1].url}"><img src="${newList[1].photo }"
									height="400px"></a>
								<div>
									<p>${newList[1].newtitle }</p>
									<p>${newList[1].newsdate }</p>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<svg class="bd-placeholder-img" width="100%" height="550px"
								xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
								preserveAspectRatio="xMidYMid slice" focusable="false">
								<rect width="100%" height="800px" fill="#777"></rect></svg>

							<div class="carousel-caption text-start">
								<a href="${newList[2].url}"><img src="${newList[2].photo }"
									height="400px"></a>
								<div>
									<p>${newList[2].newtitle }</p>
									<p>${newList[2].newsdate }</p>
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
		</div>
		<div class="card text-center" style="width:28%;     margin-top: 70px;">
			<div class="card-header">
				<ul class="nav nav-tabs card-header-tabs">
					<li class="nav-item"><a id="meminfoA" class="nav-link active"
						aria-current="true" href="javascript:chageDisplay('meminfo')">내정보</a></li>
					<li class="nav-item"><a id="weatherA" class="nav-link" href="javascript:chageDisplay('weather')">날씨</a></li>
				</ul>
			</div>
			<div class="card-body" id="meminfoTag">
				<c:choose>
				<c:when test="${sessionScope.loginId ==null }">
					<button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath }/memberLoginForm'">로그인</button>
				</c:when>
				<c:otherwise>
				<h1 class="card-title" style="text-align: justify;"><img src="/resources/memberProfile/${sessionScope.loginProfile}" class="profile">${sessionScope.loginId }</h1>
				<p class="card-text">오늘의 일정</p>
				<a href="#" class="btn btn-primary">일정보러가기</a>
				</c:otherwise>
				</c:choose>
			</div>
			<div class="card-body disnone" id="weatherTag">
				<h5 class="card-title" style="text-align: justify;">날씨</h5>
				<p class="card-text">오늘의 날씨</p>
			</div>
		</div>
		
		</div>
		<div class="row"
			style="margin-top: 80px; overflow-x: scroll; height: 410px;">
			<nav style="display: -webkit-inline-box;">
				<c:forEach items="${ tdList}" var="td">
					<div class="card" style="width: 18rem; margin: 4px;">
						<img src="${td.tdphoto }" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">${td.tdname }</h5>
							<p class="card-text">${td.tdaddress }</p>
							<a href="#" class="btn btn-primary">계획에 추가하기</a>
						</div>
					</div>
				</c:forEach>
			</nav>
		</div>
		<h2>축제</h2>
		<div class="row"
			style="margin-top: 30px; overflow-x: scroll; height: 410px;">
			<nav style="display: -webkit-inline-box;">
				<c:forEach items="${ tdList}" var="td">
					<div class="card" style="width: 18rem; margin: 4px;">
						<img src="${td.tdphoto }" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">${td.tdname }</h5>
							<p class="card-text">${td.tdaddress }</p>
							<a href="#" class="btn btn-primary">Go somewhere</a>
						</div>
					</div>
				</c:forEach>
			</nav>
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
	<script type="text/javascript">
		function chageDisplay(seloption){
				let meminfoTag = document.querySelector('#meminfoTag');
				let weatherinfoTag = document.querySelector('#weatherTag');
				let meminfoA = document.querySelector('#meminfoA');
				let weatherA = document.querySelector('#weatherA');
				console.log(meminfoA)
				console.log(weatherA)
			switch(seloption){
			case 'meminfo':
				if(meminfoTag.classList.contains('disnone')){
					weatherinfoTag.classList.add('disnone');
					meminfoTag.classList.remove('disnone');
					meminfoA.classList.add('active');
					weatherA.classList.remove('active');
				}
				break;
			case 'weather':
				if(weatherTag.classList.contains('disnone')){
					weatherinfoTag.classList.remove('disnone');
					meminfoTag.classList.add('disnone');
					meminfoA.classList.remove('active');
					weatherA.classList.add('active');
				}
				break;
			}
		}
	</script>
</body>
</html>
