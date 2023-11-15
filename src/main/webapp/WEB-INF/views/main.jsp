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
<title>TravelSchedule - main</title>

<script src="https://kit.fontawesome.com/c8056a816e.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- Favicon-->
<link href="https://fonts.googleapis.com/css?family=Jua:400"
	rel="stylesheet">

<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />

<!-- Data AOS-->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<!-- ajax -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style type="text/css">
.bg-wh{

}
.zoom:hover {
	transform: scale(1.02222222222);
	transition: .5s; /* 부드럽게 */
}

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
	padding-bottom: 1680px;
}



.disnone {
	display: none;
}

.weatherCity {
	background-color: white;
	border-radius: 10px;
	width: 20%;
	font-size: 12pt;
	text-align: center;
}

.marquee {
	height:408px;
	overflow-x: hidden;
	position: relative;
}

.marquee_div {
	display: inline-flex;
	position: absolute;
	overflow: hidden;
}
.marquee_anifast{
	animation: marquee 50s linear infinite;
}

@keyframes marquee { 
0% {left: 0;}
100%{left:-2860px;}
}
.navbg{
background-color: black;
}
.navbg-white{
	background-color: white;
	box-shadow: 0px 0px 10px #A2A2A2;
}
.change{
	animation-name:color;
	animation-duration: 1s;
}
@keyframes color { 
from {background:none;}
to{background-color:white;}
}
@import url('https://fonts.googleapis.com/css?family=Questrial&display=swap');
.navbar-brand, .nav-link{
color:black;}
.navbar-brand:hover, .nav-link:hover{
color:black;}

.bg {
        height: 100vh;
        width: 100vw;
        background-image: url('https://post-phinf.pstatic.net/MjAxODAzMTdfNzYg/MDAxNTIxMjIxNjQxNDQ3.Z4UwpknVj4agsPoHEg4Mk8HLscjzd_dMO5l7Z20MS3Ag.32_e21NxEl-bxbQjWcEXIXxVPRL3nFwmeoLZKhPUw-Mg.JPEG/1.jpg');
        background-repeat : no-repeat;
        background-size : cover;
        image-rendering: -moz-crisp-edges; /* firefox */
		image-rendering: -o-crisp-edges; /* opera */
		image-rendering: -webkit-optimize-contrast; /* chrome */
		image-rendering: crisp-edges;
		transform: translateZ(0);
		backface-visibility: hidden;
      }

</style>


</head>
<body>
	
		<!-- Navigation-->
		<%@ include file="include/menu.jsp"%>
		<!-- content 시작 -->
			<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="/resources/img/seoul1.jpg"style="height: 100vh;width: 100vw;" class="d-block w-100" alt="...">
              </div>
              <div class="carousel-item">
                <img src="/resources/img/gyeongbokgung.png"style="height: 100vh;width: 100vw;"  class="d-block w-100" alt="...">
              </div>
              <div class="carousel-item">
                <img src="/resources/img/seoul3.png"style="height: 100vh;width: 100vw;"  class="d-block w-100" alt="...">
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
			
		<div class="p-4" style="background-color: #E8F5FF;">
			<div class="container">
				<div class="row marquee">
					<div class="" style="overflow-x: hidden; margin:0px;padding: 0px;">
						<div class="marquee_div marquee_anifast">
							<c:forEach items="${ tdList}" var="td">
								<div class="card p-2 zoom marquee_item" tabindex="0"
									style="width: 18rem; margin: 17px 9px 20px 7px; height: 370px; border: none;"
									onmouseenter="addW3(this)" onmouseleave="removeW3(this)">
									<a href="/detailTdest?tdcode=${td.tdcode }"><img
										src="${td.tdphoto }" onerror="this.src='${pageContext.request.contextPath}/resources/tdest/3509.jpg'" class="card-img-top" alt="..."
										width="286px" height="191px" loading="lazy"></a>
									<div class="card-body">
										<h5 class="card-title"style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${td.tdname }</h5>
										<p class="card-text">${td.tdaddress }</p>
										<p class="card-text position-absolute bottom-0"style="right:20px;">추천수:${td.lknum }</p>
										<button
											class="btn btn-outline-success position-absolute bottom-0 start-0"
											style="margin: 10px"
											onclick="selectCdcode('${td.tdcode}','tdest')"
											data-bs-toggle="modal" data-bs-target="#exampleModal">계획에
											추가하기</button>
									</div>
								</div>
							</c:forEach>
							<c:forEach items="${ tdList}" var="td">
								<div class="card p-2 zoom marquee_item" tabindex="0"
									style="width: 18rem; margin: 17px 9px 20px 7px; height: 370px; border: none;"
									onmouseenter="addW3(this)" onmouseleave="removeW3(this)">
									<a href="/detailTdest?tdcode=${td.tdcode }"><img
										src="${td.tdphoto }" class="card-img-top" onerror="this.src='${pageContext.request.contextPath}/resources/tdest/3509.jpg'"alt="..."
										width="286px" height="191px" loading="lazy"></a>
									<div class="card-body">
										<h5 class="card-title"style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${td.tdname }</h5>
										<p class="card-text">${td.tdaddress }</p>
										<p class="card-text position-absolute bottom-0"style="right:20px;">추천수:${td.lknum }</p>
										<button
											class="btn btn-outline-success position-absolute bottom-0 start-0"
											style="margin: 10px"
											onclick="selectCdcode('${td.tdcode}','tdest')"
											data-bs-toggle="modal" data-bs-target="#exampleModal">계획에
											추가하기</button>
									</div>
								</div>
							</c:forEach>
						</div>
						
						
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">캘린더 선택</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body" id="selectCalendar"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-success"
							data-bs-dismiss="modal" id="selectClear">선택</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row d-flex justify-content-center">
					<div id="TitleBar" style="width: 74%;">
						<div class="IMGBAR">
							<div id="myCarousel" class="carousel carousel-dark slide"
								data-bs-ride="carousel" style="z-index: 0;">
								<!-- 슬라이스 갯수 -->
								<div class="carousel-indicators">
									<button type="button" data-bs-target="#myCarousel"
										data-bs-slide-to="0" class="active" aria-label="Slide 1"></button>
									<button type="button" data-bs-target="#myCarousel"
										data-bs-slide-to="1" aria-label="Slide 2" class=""
										aria-current="true"></button>
									<button type="button" data-bs-target="#myCarousel"
										data-bs-slide-to="2" aria-label="Slide 3"></button>
									<button type="button" data-bs-target="#myCarousel"
										data-bs-slide-to="3" aria-label="Slide 4"></button>
								</div>
								<!-- 이미지 텍스트 영역 -->
								<div class="carousel-inner">
									<div class="carousel-item active">
										<svg class="bd-placeholder-img" width="100%" height="550px"
											xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
											preserveAspectRatio="xMidYMid slice" focusable="false">
								<rect width="100%" height="800px" fill="#fff"></rect></svg>
										<div class="carousel-caption text-start">
											<a class="d-flex justify-content-center" href="${newList[0].url}"><img
												src="${newList[0].photo }" width="676px" height="400px"
												loading="lazy"></a>
											<div class="">
												<p style="margin: 0px; text-align: center;">${newList[0].newtitle }</p>
												<p style="margin: 0px; text-align: center;">중앙일보 : ${newList[0].newsdate }</p>
											</div>
										</div>
									</div>
									<div class="carousel-item ">
										<svg class="bd-placeholder-img" width="100%" height="550px"
											xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
											preserveAspectRatio="xMidYMid slice" focusable="false">
								<rect width="100%" height="800px" fill="#fff"></rect></svg>
										<div class="carousel-caption text-start">
											<a class="d-flex justify-content-center" href="${newList[1].url}"><img
												src="${newList[1].photo }" width="676px" height="400px"
												loading="lazy"></a>
											<div>
												<p style="margin: 0px; text-align: center;">${newList[1].newtitle }</p>
												<p style="margin: 0px; text-align: center;">중앙일보 : ${newList[1].newsdate }</p>
											</div>
										</div>
									</div>
									<div class="carousel-item">
										<svg class="bd-placeholder-img" width="100%" height="550px"
											xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
											preserveAspectRatio="xMidYMid slice" focusable="false">
								<rect width="100%" height="800px" fill="#fff"></rect></svg>

										<div class="carousel-caption text-start">
											<a class="d-flex justify-content-center" href="${newList[2].url}"><img
												src="${newList[2].photo }" width="676px" height="400px"
												loading="lazy"></a>
											<div>
												<p style="margin: 0px; text-align: center;">${newList[2].newtitle }</p>
												<p style="margin: 0px; text-align: center;">중앙일보 : ${newList[2].newsdate }</p>
											</div>
										</div>
									</div>
									<div class="carousel-item">
										<svg class="bd-placeholder-img" width="100%" height="550px"
											xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
											preserveAspectRatio="xMidYMid slice" focusable="false">
										<rect width="100%" height="800px" fill="#fff"></rect></svg>
										<div class="carousel-caption" style="position: absolutel top: 50%; transform: translate(0, -50%);">
											<div class="row position-relative" style="margin-bottom: 25px; margin-top: 15px;">
											<h2 class="text-center" style="font-family: 'Jua' !important;">오늘의 날씨</h2>
												<select class="weatherCity position-absolute top-0 end-0" style="width: 80px;" onchange="selectWeather(this.value)">
													<option value="Seoul">서울</option>
													<option value="Incheon">인천</option>
													<option value="Busan">부산</option>
													<option value="Daejeon">대전</option>
													<option value="Daegu">대구</option>
													<option value="Uisan">울산</option>
													<option value="Gwangju">광주</option>
													<option value="Jeju">제주</option>
												</select>
												<hr>
												<div class="col" style="display: flex; justify-content: center;">
													<div style="width: 125px; margin-top: 15px;">
														<div class="weather_icon"></div>
													</div>

													<div class="text-start" style="width: 150px;">
														<div class="current_temp" style="font-size: 30pt"></div>
														<div class="weather_description" style="font-size: 20pt"></div>
														<div class="city" style="font-size: 13pt"></div>
													</div>


													<div style="margin-top: 10px;">
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
								<!-- 기다란 넘기기 버튼 -->
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
					

				</div>
		
		<div class="p-4" style="background-color: #DCEBFF;">
			<div class="container">
				<div class="row marquee" style="height:457px;">
					<div class="" style="overflow-x: hidden; margin:0px;padding: 0px;">
						<div class="marquee_div marquee_anifast">
							<c:forEach items="${ feList}" var="fe">
								<div class="card position-relative p-2 zoom"
									style="width: 18rem; margin: 17px 9px 20px 7px; height: 420px; border: none;"
									onmouseenter="addW3(this)" onmouseleave="removeW3(this)">
									<a href="/detailFestival?code=${fe.fecode }"><img
										src="${fe.feposter }"onerror="this.src='${pageContext.request.contextPath}/resources/tdest/3509.jpg'" class="card-img-top" alt="..."
										width="286px" height="191px" loading="lazy"></a>
									<div class="card-body">
										<h5 class="card-title"style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${fe.fename }</h5>
										<p class="card-text">${fe.feaddress }</p>
										<p class="card-text">${fe.opendate.split(' ')[0] }~
											${fe.enddate.split(' ')[0] }</p>
										<p class="card-text position-absolute bottom-0"style="right:20px;">추천수:${fe.lknum }</p>
										<button
											class="btn btn-outline-success position-absolute bottom-0 start-0"
											style="margin: 10px"
											onclick="selectCdcode('${fe.fecode}','festival')"
											data-bs-toggle="modal" data-bs-target="#exampleModal">계획에
											추가하기</button>
									</div>
								</div>
							</c:forEach>
							<c:forEach items="${ feList}" var="fe">
								<div class="card position-relative p-2 zoom"
									style="width: 18rem; margin: 17px 9px 20px 7px; height: 420px; border: none;"
									onmouseenter="addW3(this)" onmouseleave="removeW3(this)">
									<a href="/detailFestival?code=${fe.fecode }"><img
										src="${fe.feposter }"onerror="this.src='${pageContext.request.contextPath}/resources/tdest/3509.jpg'" class="card-img-top" alt="..."
										width="286px" height="191px" loading="lazy"></a>
									<div class="card-body">
										<h5 class="card-title"style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${fe.fename }</h5>
										<p class="card-text">${fe.feaddress }</p>
										<p class="card-text">${fe.opendate.split(' ')[0] }~
											${fe.enddate.split(' ')[0] }</p>
											<p class="card-text position-absolute bottom-0" style="right:20px;">추천수:${fe.lknum }</p>
										<button
											class="btn btn-outline-success position-absolute bottom-0 start-0"
											style="margin: 10px"
											onclick="selectCdcode('${fe.fecode}','festival')"
											data-bs-toggle="modal" data-bs-target="#exampleModal">계획에
											추가하기</button>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- container 종료 -->
		<!-- content 종료 -->
		<!-- Footer-->
		<%@ include file="include/footer.jsp"%>
		
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
					'01': 'fas fa-sun',
					'02': 'fas fa-cloud-sun',
					'03': 'fas fa-cloud',
					'04': 'fas fa-cloud-meatball',
					'09': 'fas fa-cloud-sun-rain',
					'10': 'fas fa-cloud-showers-heavy',
					'11': 'fas fa-poo-storm',
					'13': 'far fa-snowflake',
					'50': 'fas fa-smog'
				};

				// 날씨 api - 서울
				let apiURI = "http://api.openweathermap.org/data/2.5/weather?q="
					+ "seoul" + "&appid=" + "c33fdd907b64fe0b48ffcfa1513f7eb5";
				$(document)
					.ready(
						$
							.ajax({
								url: apiURI,
								dataType: "json",
								type: "GET",
								async: "false",
								success: function (resp) {

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
											'<i class="' + weatherIcon[$Icon] + ' fa-5x" style="height : 90px; width : 130px;"></i>');
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
					var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="
						+ val + "&appid=" + "c33fdd907b64fe0b48ffcfa1513f7eb5";
					$
						.ajax({
							url: apiURI,
							dataType: "json",
							type: "GET",
							async: "false",
							success: function (resp) {

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
										'<i class="' + weatherIcon[$Icon] + ' fa-5x" style="height : 90px; width : 130px;"></i>');
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
	<script type="text/javascript">
		function selectCdcode(code, seloption) {
			if ("${sessionScope.loginId}" == "") {
				location.href = "${pageContext.request.contextPath}/memberLoginForm"
			} else {
				$.ajax({
					url:"/getCdcode",
					type:"post",
					data:{mid:"${sessionScope.loginId}"},
					async:false,
					success(rs){
						let modalBodyTag = document.querySelector("#selectCalendar")
						modalBodyTag.innerHTML = "";
						if(rs.length > 0){
							let checkinfo = false;
							let selTag = document.createElement("select")
							for(let cd of rs){
								if(cd.cdstate == 'Y'){
								let optionTag = document.createElement("option")
								optionTag.innerText = cd.cdname;
								optionTag.setAttribute("value", cd.cdcode)
								selTag.appendChild(optionTag);
								checkinfo = true;
								}
							}
							if(checkinfo){
							modalBodyTag.appendChild(selTag);
							let btnTag = document.querySelector("#selectClear");
							btnTag.addEventListener("click", function(){
								selectDest(code, selTag.value, seloption)
							})
							}else{
								modalBodyTag.innerText="계획 가능한 달력이 없습니다.";
							}
						}
						else{
							modalBodyTag.innerText="달력을 추가 해주세요";
						}
					}				
					})
			}
		}
		function selectDest(code, cdcode, seloption){
			let selcode = "";
			if(seloption == 'tdest'){
				selcode = {mid:"${sessionScope.loginId}", 'tdcode':code, cdcode:cdcode, "seloption":seloption};
			}
			if(seloption == 'festival'){
				selcode = {mid:"${sessionScope.loginId}", 'fecode':code, cdcode:cdcode, "seloption":seloption};
			}
			$.ajax({
				url:"/registSelectDest",
				type:"post",
				data:selcode,
				async:false,
				success(rs){
					if(rs == 'Y'){
					alert('행선지 선택 완료');						
					}else{
					alert('이미 선택된 행선지 입니다.');	
					}
					location.href="/";
				}				
				})
		}
	</script>
	<script type="text/javascript">
	 function addW3(obj){
		 obj.classList.add("w3-card-4");
		//let marqueeDiv = obj.parentNode
		//marqueeDiv.classList.add("marquee_anislow")
		//marqueeDiv.classList.remove("marquee_ani")
	 }
	 function removeW3(obj){
		 obj.classList.remove("w3-card-4");
		 //let marqueeDiv = obj.parentNode
		 //marqueeDiv.classList.remove("marquee_anislow")
		 //marqueeDiv.classList.add("marquee_anifast")
	 }
	</script>
	<script type="text/javascript">
	$(window).scroll(function(){
		  let navbarTag = document.querySelector(".navbar");
		  var height = $(window).scrollTop();
		  if(height != 0){
			  console.log(navbarTag.classList);
			  //navbarTag.classList.remove('navbg');
			  navbarTag.classList.add('change');
			  navbarTag.classList.add('navbg-white');
		  }else{
			  
			  navbarTag.classList.remove('change');
			  navbarTag.classList.remove('navbg-white');
			  //navbarTag.classList.add('navbg')
		  }
		});
	$(document).ready(function(){
		let navbarTag = document.querySelector(".navbar");
		navbarTag.classList.remove("bg-wh");
		//navbarTag.classList.add("navbg")
	})
	</script>
	

</body>
</html>