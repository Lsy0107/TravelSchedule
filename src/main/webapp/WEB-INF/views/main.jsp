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

.profile {
	width: 20%;
	border-radius: 50px;
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

.btn_position {
	
}


@import url('https://fonts.googleapis.com/css?family=Questrial&display=swap');

        .date {
            background-color : white;
            height: auto;
            width: 291px;
            margin: 0px;
            margin: 0 auto;
            border-radius:5px;
        }

        td {
            width: 10px;
            height: 10px;
        }

        .Calendar {
            text-align: center;
        }

        .Calendar>thead>tr:first-child>td {
            font-family: 'Questrial', sans-serif;
            font-size: 1.1em;
            font-weight: bold;
        }

        .Calendar>thead>tr:last-child>td {
            font-family: 'Questrial', sans-serif;
            font-weight: 600;     
        }

        .Calendar>tbody>tr>td>p {
            font-family: 'Montserrat', sans-serif;
            height: 37px;
            width: 35px;
            border-radius: 50px;
            transition-duration: .2s;
            line-height: 36px;
            margin: 2px;
            display: block;
            text-align: center;
        }        

        .pastDay {
            color: lightgray;
        }

        .today {
            background-color: #F5D042;            
            color: #fff;
            font-weight: 600;
            cursor: pointer;
        }

        .futureDay {
            background-color: #FFFFFF;
            cursor: pointer;
        }
        .futureDay:hover{
            background:#eee;
        }

        .futureDay.choiceDay,
        .today.choiceDay {
            background: #0A174E;
            color: #fff;
            font-weight: 600;
            cursor: pointer;
        }




</style>


</head>
<body class="d-flex flex-column h-100">
	<main class="">
		<!-- Navigation-->
		<%@ include file="include/menu.jsp"%>
		<!-- content 시작 -->
		<div class="row" style="margin: 31px;"></div>
		<!-- container 시작 -->
		<div class="p-4" style="background-color: #F4FFFF;">		
		<div class="container">
		<div class="row">
			<div id="TitleBar" style="width: 74%;">
				<div class="IMGBAR">
					<div id="myCarousel" class="carousel carousel-dark slide" data-bs-ride="carousel"
						style="z-index: 0;">
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
								<rect width="100%" height="800px" fill="#F4FFFF"></rect></svg>
								<div class="carousel-caption text-start">
									<a href="${newList[0].url}"><img src="${newList[0].photo }"
										width="676px" height="400px" loading="lazy"></a>
									<div>
										<p style="margin: 0px;">${newList[0].newtitle }</p>
										<p style="margin: 0px;">${newList[0].newsdate }</p>
									</div>
								</div>
							</div>
							<div class="carousel-item active">
								<svg class="bd-placeholder-img" width="100%" height="550px"
									xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
									preserveAspectRatio="xMidYMid slice" focusable="false">
								<rect width="100%" height="800px" fill="#F4FFFF"></rect></svg>
								<div class="carousel-caption text-start">
									<a href="${newList[1].url}"><img src="${newList[1].photo }"
										width="676px" height="400px" loading="lazy"></a>
									<div>
										<p style="margin: 0px;">${newList[1].newtitle }</p>
										<p style="margin: 0px;">${newList[1].newsdate }</p>
									</div>
								</div>
							</div>
							<div class="carousel-item">
								<svg class="bd-placeholder-img" width="100%" height="550px"
									xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
									preserveAspectRatio="xMidYMid slice" focusable="false">
								<rect width="100%" height="800px" fill="#F4FFFF"></rect></svg>

								<div class="carousel-caption text-start">
									<a href="${newList[2].url}"><img src="${newList[2].photo }"
										width="676px" height="400px" loading="lazy"></a>
									<div>
										<p style="margin: 0px;">${newList[2].newtitle }</p>
										<p style="margin: 0px;">${newList[2].newsdate }</p>
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
			<div class="card text-center" style="width: 26%; height: 550px;">
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
								<a href="${pageContext.request.contextPath }/myInfo"> <img src="/resources/memberProfile/${sessionScope.loginProfile}"
									class="profile"></a> ${sessionScope.loginId }</h1>
							<p class="card-text" style="font-size: 20px; font-weight: bold;">오늘의 일정</p>
							
							 <div class="date">
						        <table class="Calendar">
						            <thead>
						                <tr>
						                    <td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
						                    <td colspan="5">
						                        <span id="calYear"></span>년
						                        <span id="calMonth"></span>월
						                    </td>
						                    <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
						                </tr>
						                <tr>
						                    <td>일</td>
						                    <td>월</td>
						                    <td>화</td>
						                    <td>수</td>
						                    <td>목</td>
						                    <td>금</td>
						                    <td>토</td>
						                </tr>
						            </thead>
						
						            <tbody>
						            </tbody>
						        </table>
						    </div>
							
							<a href="${pageContext.request.contextPath}/selectCalendar" class="btn btn-primary">일정보러가기</a>
						</c:otherwise>
					</c:choose>
				</div>
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


				</div>
			</div>

		</div>
		</div>
		</div>
		<div class="p-4" style="background-color: #E8F5FF;">
			<div class="container">
				<div class="row" style="">
					<div style="overflow-x: hidden; ">
						<nav style="display: -webkit-inline-box;">
							<c:forEach items="${ tdList}" var="td">
								<div class="card p-2 zoom"
									style="width: 18rem; margin:17px 9px 20px 7px; height: 370px; border:none;" onmouseenter ="asd(this)" onmouseleave ="fdsa(this)">
									<a href="/detailTdest?tdcode=${td.tdcode }"><img src="${td.tdphoto }" onerror="this.src='${pageContext.request.contextPath}/resources/tdest/3509.jpg'" class="card-img-top" alt="..."
										width="286px" height="191px" loading="lazy"></a>
									<div class="card-body">
										<h5 class="card-title">${td.tdname }</h5>
										<p class="card-text">${td.tdaddress }</p>
										<button
											class="btn btn-primary position-absolute bottom-0 start-0"
											style="margin: 10px"
											onclick="selectCdcode('${td.tdcode}','tdest')"
											data-bs-toggle="modal" data-bs-target="#exampleModal">계획에
											추가하기</button>
									</div>
								</div>
							</c:forEach>
						</nav>
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
						<button type="button" class="btn btn-primary"
							data-bs-dismiss="modal" id="selectClear">선택</button>
					</div>
				</div>
			</div>
		</div>

<div class="p-4" style="background-color: #DCEBFF;">
			<div class="container">
		<div class="row">
			<div style="overflow-x: hidden;">
				<nav style="display: -webkit-inline-box;">
					<c:forEach items="${ feList}" var="fe">
						<div class="card position-relative p-2 zoom"
							style="width: 18rem; margin:17px 9px 20px 7px; height: 420px;"onmouseenter ="asd(this)" onmouseleave ="fdsa(this)">
							<a href="/detailFestival?code=${fe.fecode }"><img src="${fe.feposter }" class="card-img-top" alt="..."
								width="286px" height="191px" loading="lazy"></a>
							<div class="card-body">
								<h5 class="card-title">${fe.fename }</h5>
								<p class="card-text">${fe.feaddress }</p>
								<p class="card-text">${fe.opendate.split(' ')[0] }~
									${fe.enddate.split(' ')[0] }</p>
								<button
									class="btn btn-primary position-absolute bottom-0 start-0"
									style="margin: 10px"
									onclick="selectCdcode('${fe.fecode}','festival')"
									data-bs-toggle="modal" data-bs-target="#exampleModal">계획에
									추가하기</button>
							</div>
						</div>
					</c:forEach>
				</nav>
			</div>
		</div>
</div>
</div>
		<!-- container 종료 -->
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
				console.log("${feList[0]}");
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
					console.log(typeof (val));
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
						console.log(rs.length);
						let modalBodyTag = document.querySelector("#selectCalendar")
						modalBodyTag.innerHTML = "";
						if(rs.length > 0){
							let checkinfo = false;
							let selTag = document.createElement("select")
							for(let cd of rs){
								console.log(cd);
								console.log(cd.cdstate);
								if(cd.cdstate == 'Y'){
									console.log('여기');
								let optionTag = document.createElement("option")
								optionTag.innerText = cd.cdname;
								optionTag.setAttribute("value", cd.cdcode)
								selTag.appendChild(optionTag);
								checkinfo = true;
								}
							}
							console.log(checkinfo);
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
	 function asd(obj){
		 obj.classList.add("w3-card-4");
		 
	 }
	 function fdsa(obj){
		 obj.classList.remove("w3-card-4");
	 }
	</script>
	
	
	<script type="text/javascript">
     window.onload = function () { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 실행

     let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
     let today = new Date();     // 페이지를 로드한 날짜를 저장
     today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화

     // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
     function buildCalendar() {

         let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
         let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날

         let tbody_Calendar = document.querySelector(".Calendar > tbody");
         document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
         document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신

         while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
             tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
         }

         let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가           

         for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
             let nowColumn = nowRow.insertCell();        // 열 추가
         }

         for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  

             let nowColumn = nowRow.insertCell();        // 새 열을 추가하고


             let newDIV = document.createElement("p");
             newDIV.innerHTML = leftPad(nowDay.getDate());        // 추가한 열에 날짜 입력
             nowColumn.appendChild(newDIV);

             if (nowDay.getDay() == 6) {                 // 토요일인 경우
                 nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
             }

             if (nowDay < today) {                       // 지난날인 경우
                 newDIV.className = "pastDay";
             }
             else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우           
                 newDIV.className = "today";
                 newDIV.onclick = function () { choiceDate(this); }
             }
             else {                                      // 미래인 경우
                 newDIV.className = "futureDay";
                 newDIV.onclick = function () { choiceDate(this); }
             }
         }
     }

     // 날짜 선택
     function choiceDate(newDIV) {
         if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
             document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
         }
         newDIV.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
     }

     // 이전달 버튼 클릭
     function prevCalendar() {
         nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
         buildCalendar();    // 달력 다시 생성
     }
     // 다음달 버튼 클릭
     function nextCalendar() {
         nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
         buildCalendar();    // 달력 다시 생성
     }

     // input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
     function leftPad(value) {
         if (value < 10) {
             value = "0" + value;
             return value;
         }
         return value;
     }
	</script>
	
</body>
</html>
