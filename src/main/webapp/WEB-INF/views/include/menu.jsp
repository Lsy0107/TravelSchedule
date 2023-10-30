<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.navbar {
	position: fixed;
	width: 100%;
	z-index: 2;
}
.profile {
	width: 20%;
	border-radius: 50px;
}
</style>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container px-5">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/">여행페이지</a>
		<div class="col" style="display: flex; align-items: center;"></div>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
			<c:choose>
					<c:when test="${sessionScope.loginId ==null }">
						<li class="nav-item"><a class="nav-link"
							href="/memberLoginForm">여행계획</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link"
							href="/selectCalendar">여행계획</a></li>
					</c:otherwise>
				</c:choose>
				<li class="nav-item"><a class="nav-link"
					href="/TdestSearchPage">여행지검색</a></li>
				<li class="nav-item"><a class="nav-link" href="/festival">축제</a></li>
				<c:choose>
					<c:when test="${sessionScope.loginId ==null }">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath }/memberLoginForm">로그인</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath }/memberJoinForm">회원가입</a></li>
					</c:when>
					<c:otherwise>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle " id="navbarDropdownPortfolio"
					href="#" role="button" data-bs-toggle="dropdown"
					aria-expanded="false" style="padding:0px; padding-left:7.5px;"><img style="width:38px;"src="/resources/memberProfile/${sessionScope.loginProfile}"
								class="profile"></a>
					<div class="dropdown-menu dropdown-menu-end w3-card-4 p-3"
						style="width: 300px; border: none;"
						aria-labelledby="navbarDropdownPortfolio">
						<h1 style="text-align: justify;">
							<img src="/resources/memberProfile/${sessionScope.loginProfile}"
								class="profile">${sessionScope.loginId }</h1>
						<hr style="border-top:2px solid lightgray">
						<p onclick='location.href="${pageContext.request.contextPath }/myInfo"'>내정보</p>
						<p>몇월 몇일 몇개 일정이 있습니다.</p>
						<hr style="border-top:2px solid lightgray">
						
						<div class="card-body disnone" id="weatherTag"
							style="background-color: rgb(101, 178, 255); margin: 10px;">
							<div class="row">
								<div class="row align-items-start">
									<div class="col">
										<h3
											style="margin-left: 15px; color: #fff; font-family: 'Jua' !important;">오늘의
											날씨</h3>
									</div>
								</div>
								<div class="row align-items-center" style="color: #fff;">
									<div class="col">
										<div style="float: left;">
											<div class="weather_icon"></div>
										</div>
									</div>
									<div class="col">
										<select class="weatherCity" style="width: 75px;"
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
						
						
						<hr style="border-top:2px solid lightgray">
						<p style="cursor: pointer;" onclick="location.href='${pageContext.request.contextPath }/TravelReview'">리뷰</p>
						<hr style="border-top:2px solid lightgray">
						<p onclick="location.href='${pageContext.request.contextPath }/memberLogout'">로그아웃</p>
					</div>
				</li>
					</c:otherwise>
				</c:choose>
				
			</ul>
		</div>
	</div>
</nav>
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

