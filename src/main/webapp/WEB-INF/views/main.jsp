<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
=======
>>>>>>> 7f1a2fc6b2f20e59b860d55cd6123a14f857915d
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Modern Business - Start Bootstrap Template</title>
<<<<<<< HEAD

<script src="https://kit.fontawesome.com/c8056a816e.js"
	crossorigin="anonymous"></script>

<!-- Favicon-->
<link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">

=======
<!-- Favicon-->
>>>>>>> 7f1a2fc6b2f20e59b860d55cd6123a14f857915d
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />

<!-- Data AOS-->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<<<<<<< HEAD
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
=======

>>>>>>> 7f1a2fc6b2f20e59b860d55cd6123a14f857915d

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
<<<<<<< HEAD
	background-image: linear-gradient(315deg, #ffd045 0%, #d14545 74%);
=======
background-image: linear-gradient(315deg, #ffd045 0%, #d14545 74%);
>>>>>>> 7f1a2fc6b2f20e59b860d55cd6123a14f857915d
	width: 70%;
	height: 500px;
	margin-left: auto;
	margin-right: auto;
}
<<<<<<< HEAD

#WeatherInfo {
	background-color: #ffffff;
	background-image: linear-gradient(315deg, #ffffff 0%, #5899e2 74%);
=======
#WeatherInfo{
	background-color: #ffffff;
background-image: linear-gradient(315deg, #ffffff 0%, #5899e2 74%);
>>>>>>> 7f1a2fc6b2f20e59b860d55cd6123a14f857915d
	width: 70%;
	height: 500px;
	margin-left: auto;
	margin-right: auto;
}
<<<<<<< HEAD

#FestivalRecommend {
	background-color: #ffffff;
	background-image: linear-gradient(315deg, #ffffff 0%, #ff7878 74%);
=======
#FestivalRecommend{
	background-color: #ffffff;
background-image: linear-gradient(315deg, #ffffff 0%, #ff7878 74%);
>>>>>>> 7f1a2fc6b2f20e59b860d55cd6123a14f857915d
	width: 70%;
	height: 500px;
	margin-left: auto;
	margin-right: auto;
}

#TitleBar {
	position: relative;
	top: 64px;
}
<<<<<<< HEAD

#MainContents {
	position: relative;
	top: 700px;
}

footer {
=======
#MainContents{
	position: relative;
    top: 700px;
}
footer{
>>>>>>> 7f1a2fc6b2f20e59b860d55cd6123a14f857915d
	position: absolute;
	bottom: 0;
	width: 100%;
}
<<<<<<< HEAD

main {
=======
main{
>>>>>>> 7f1a2fc6b2f20e59b860d55cd6123a14f857915d
	position: relative;
	min-height: 100%;
	padding-bottom: 2000px;
}

<<<<<<< HEAD
.profile {
	width: 20%;
	border-radius: 50px;
}

.disnone {
	display: none;
}

.weatherCity {
	ackground-color: white;
	border-radius: 10px;
	width: 20%;
	font-size: 12pt;
	text-align: center;
}
=======
>>>>>>> 7f1a2fc6b2f20e59b860d55cd6123a14f857915d
</style>


</head>
<body class="d-flex flex-column h-100">
<<<<<<< HEAD
	<main class="">
=======
	<main class="flex-shrink-0">
>>>>>>> 7f1a2fc6b2f20e59b860d55cd6123a14f857915d
		<!-- Navigation-->
		<%@ include file="include/menu.jsp"%>
		<!-- content 시작 -->


<<<<<<< HEAD
		<div class="row"
			style="padding: 200px; padding-top: 23px; padding-bottom: 0px;">
			<div id="TitleBar" style="width: 74%;">
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
			<div class="card text-center" style="width: 25%; margin-top: 70px;">
				<div class="card-header">
					<ul class="nav nav-tabs card-header-tabs">
						<li class="nav-item"><a id="meminfoA" class="nav-link active"
							aria-current="true" href="javascript:chageDisplay('meminfo')">내정보</a></li>
						<li class="nav-item"><a id="weatherA" class="nav-link"
							href="javascript:chageDisplay('weather')">날씨</a></li>
					</ul>
				</div>
				<div class="card-body" id="meminfoTag">
					<c:choose>
						<c:when test="${sessionScope.loginId ==null }">
							<button class="btn btn-primary"
								onclick="location.href='${pageContext.request.contextPath }/memberLoginForm'">로그인</button>
						</c:when>
						<c:otherwise>
							<h1 class="card-title" style="text-align: justify;">
								<img src="/resources/memberProfile/${sessionScope.loginProfile}"
									class="profile">${sessionScope.loginId }</h1>
							<p class="card-text">오늘의 일정</p>
							<a href="#" class="btn btn-primary">일정보러가기</a>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="card-body disnone" id="weatherTag"
					style="background-color: rgb(101, 178, 255); margin: 10px;">
					<div class="row">
						<div class="row align-items-start">
							<div class="col">
								<h3 style="margin-left: 15px; color: #fff; font-family: 'Jua' !important;">오늘의 날씨</h3>
							</div>
						</div>
						<div class="row align-items-center" style="color: #fff;">
							<div class="col">
								<div style="float: left;">
									<div class="weather_icon"></div>
								</div>
							</div>
							<div class="col">
								<select class="weatherCity"
									style="width: 75px;"
									onchange="selectWeather(this.value)">
									<option value="Seoul">서울</option>
									<option value="Incheon">인천</option>
									<option value="Busan">부산</option>
									<option value="Daejeon">대전</option>
									<option value="Daegu">대구</option>
									<option value="Uisan">울산</option>
									<option value="Gwangju">광주</option>
									<option value="Jeju">제주</option>
								</select>
							</div>
						</div>
						<div class="row align-items-end" style="color: #fff;">
							<div class="col">
								<div>
									<div class="current_temp" style="font-size: 30pt"></div>
									<div class="weather_description" style="font-size: 20pt"></div>
									<div class="city" style="font-size: 13pt"></div>
								</div>
							</div>
							<div class="col">
								<div
									style="float: right; margin: -5px 0px 0px 0px; font-size: 11pt">
									<div class="temp_min"></div>
									<div class="temp_max"></div>
									<div class="humidity"></div>
									<div class="wind"></div>
									<div class="cloud"></div>
								</div>
							</div>
						</div>
					</div>


				</div>
			</div>

		</div>
		<div class="row"
			style="margin-top: 80px; padding-left: 210px; padding-right: 210px;">
			<div style="overflow-x: scroll;">
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
		</div>

		<div class="row" style="margin-top: 20px; padding-left: 210px; padding-right: 210px;">
		<h2>축제</h2>
			<div style="overflow-x: scroll;">
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
		</div>

=======
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
>>>>>>> 7f1a2fc6b2f20e59b860d55cd6123a14f857915d
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
<<<<<<< HEAD
	<script type="text/javascript">
		function chageDisplay(seloption) {
			let meminfoTag = document.querySelector('#meminfoTag');
			let weatherinfoTag = document.querySelector('#weatherTag');
			let meminfoA = document.querySelector('#meminfoA');
			let weatherA = document.querySelector('#weatherA');
			switch (seloption) {
			case 'meminfo':
				if (meminfoTag.classList.contains('disnone')) {
					weatherinfoTag.classList.add('disnone');
					meminfoTag.classList.remove('disnone');
					meminfoA.classList.add('active');
					weatherA.classList.remove('active');
				}
				break;
			case 'weather':
				if (weatherTag.classList.contains('disnone')) {
					weatherinfoTag.classList.remove('disnone');
					meminfoTag.classList.add('disnone');
					meminfoA.classList.remove('active');
					weatherA.classList.add('active');
				}
				break;
			}
		}
	</script>


	<script type="text/javascript">
		//날씨 api - fontawesome 아이콘
		var weatherIcon = {
			'01' : 'fas fa-sun',
			'02' : 'fas fa-cloud-sun',
			'03' : 'fas fa-cloud',
			'04' : 'fas fa-cloud-meatball',
			'09' : 'fas fa-cloud-sun-rain',
			'10' : 'fas fa-cloud-showers-heavy',
			'11' : 'fas fa-poo-storm',
			'13' : 'far fa-snowflake',
			'50' : 'fas fa-smog'
		};

		// 날씨 api - 서울
		let apiURI = "http://api.openweathermap.org/data/2.5/weather?q="
				+ "seoul" + "&appid=" + "c33fdd907b64fe0b48ffcfa1513f7eb5";
		$(document)
				.ready(
						$
								.ajax({
									url : apiURI,
									dataType : "json",
									type : "GET",
									async : "false",
									success : function(resp) {

										var $Icon = (resp.weather[0].icon)
												.substr(0, 2);
										var $weather_description = resp.weather[0].main;
										var $Temp = Math
												.floor(resp.main.temp - 273.15)
												+ 'º';
										var $humidity = '습도&nbsp;&nbsp;&nbsp;&nbsp;'
												+ resp.main.humidity + ' %';
										var $wind = '바람&nbsp;&nbsp;&nbsp;&nbsp;'
												+ resp.wind.speed + ' m/s';
										var $city = 'seoul';
										var $cloud = '구름&nbsp;&nbsp;&nbsp;&nbsp;'
												+ resp.clouds.all + "%";
										var $temp_min = '최저 온도&nbsp;&nbsp;&nbsp;&nbsp;'
												+ Math
														.floor(resp.main.temp_min - 273.15)
												+ 'º';
										var $temp_max = '최고 온도&nbsp;&nbsp;&nbsp;&nbsp;'
												+ Math
														.floor(resp.main.temp_max - 273.15)
												+ 'º';

										console.log("$Icon" + $Icon);

										$('.weather_icon').html("");
										$('.weather_description').html("");
										$('.current_temp').html("");
										$('.humidity').html("");
										$('.wind').html("");
										$('.city').html("");
										$('.cloud').html("");
										$('.temp_min').html("");
										$('.temp_max').html("");

										$('.weather_icon')
												.append(
														'<i class="' + weatherIcon[$Icon] +' fa-5x" style="height : 90px; width : 130px;"></i>');
										$('.weather_description').prepend(
												$weather_description);
										$('.current_temp').prepend($Temp);
										$('.humidity').prepend($humidity);
										$('.wind').prepend($wind);
										$('.city').append($city);
										$('.cloud').append($cloud);
										$('.temp_min').append($temp_min);
										$('.temp_max').append($temp_max);
									}
								}))
		function selectWeather(val) {
			console.log(typeof (val));
			var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="
					+ val + "&appid=" + "c33fdd907b64fe0b48ffcfa1513f7eb5";
			$
					.ajax({
						url : apiURI,
						dataType : "json",
						type : "GET",
						async : "false",
						success : function(resp) {

							var $Icon = (resp.weather[0].icon).substr(0, 2);
							var $weather_description = resp.weather[0].main;
							var $Temp = Math.floor(resp.main.temp - 273.15)
									+ 'º';
							var $humidity = '습도&nbsp;&nbsp;&nbsp;&nbsp;'
									+ resp.main.humidity + ' %';
							var $wind = '바람&nbsp;&nbsp;&nbsp;&nbsp;'
									+ resp.wind.speed + ' m/s';
							var $city = val;
							var $cloud = '구름&nbsp;&nbsp;&nbsp;&nbsp;'
									+ resp.clouds.all + "%";
							var $temp_min = '최저 온도&nbsp;&nbsp;&nbsp;&nbsp;'
									+ Math.floor(resp.main.temp_min - 273.15)
									+ 'º';
							var $temp_max = '최고 온도&nbsp;&nbsp;&nbsp;&nbsp;'
									+ Math.floor(resp.main.temp_max - 273.15)
									+ 'º';

							console.log("$Icon" + $Icon);

							$('.weather_icon').html("");
							$('.weather_description').html("");
							$('.current_temp').html("");
							$('.humidity').html("");
							$('.wind').html("");
							$('.city').html("");
							$('.cloud').html("");
							$('.temp_min').html("");
							$('.temp_max').html("");

							$('.weather_icon')
									.append(
											'<i class="' + weatherIcon[$Icon] +' fa-5x" style="height : 90px; width : 130px;"></i>');
							$('.weather_description').prepend(
									$weather_description);
							$('.current_temp').prepend($Temp);
							$('.humidity').prepend($humidity);
							$('.wind').prepend($wind);
							$('.city').append($city);
							$('.cloud').append($cloud);
							$('.temp_min').append($temp_min);
							$('.temp_max').append($temp_max);
						}
					})
		}
	</script>

=======
>>>>>>> 7f1a2fc6b2f20e59b860d55cd6123a14f857915d
</body>
</html>
