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

<!-- Favicon-->
<link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">

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
.wrap{
	margin-top:150px;
	width: 1000px;
	margin-left: auto;
	margin-right: auto;
}
.Img{
	width: 1000px;	
}
.name{
	padding-left: 30px;
	padding-top: 20px;
	font-size:30px;
	font-weight:bold;
}
.address{
	padding-left: 30px;
	padding-top: 10px;
	font-weight: bold;
	width: 1000px;
	font-size:20px;
}
.addr{
	padding-left: 30px;
	font-weight: bold;
}
.hr{
	width:1000px;
}
.heart{
	padding-left: 30px;
	cursor:pointer;
}
.fa-solid{
	color: #ff0000;
}
.fa-regular{
	color: #000000;
}
.Bar{
	border: 1px solid;
	top: 860px;
    position: sticky;
	padding: 0px;
}
.StickyBar{
	position: fixed;
	bottom: 80px;
    right: 40px;
    z-index: 12;	
	width: 5%;
}
main{
	position: relative;
    padding-bottom: 2000px;
}
footer{
	position: relative;
}
</style>



</head>
<body class="d-flex flex-column" style="height: 2000px;">
	<%@ include file="../include/menu.jsp"%>
	<div class="StickyBar">
		<button class="Bar">
			<img style="width: 100%;" src="${pageContext.request.contextPath}/resources/tdest/Top방향키.png" alt="">
		</button>
	</div>
	
		<!-- Navigation-->
		<!-- content 시작 -->	
		<div class="wrap">
			<img class="card-img-top Img" src="${detailTd.tdphoto }" alt="..." onerror="this.src='${pageContext.request.contextPath}/resources/tdest/3509.jpg'" />
			<p class="name"> ${detailTd.tdname }</p>
			<p class="addr"> ${detailTd.tdaddress}</p>
			<i class="fa-regular fa-heart fa-xl heart" onclick="clickHeart()" id="heart"></i>
			<hr class="hr">
			<div id="map" style="width:1000px;height:400px;"></div>
			<p class="address">${detailTd.tdaddress }</p>

			<div class="RelativeRecomm">
				
			</div>

		</div>
		<!-- content 종료 -->
		<!-- Footer-->
		<%@ include file="../include/footer.jsp"%>
	
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<script>
		AOS.init();
	</script>
	<script type="text/javascript">
		function clickHeart(){
			console.log('클릭');
			let heart = document.querySelector('#heart');
			const cl = document.querySelector('#heart').classList;
			if(cl.contains("fa-regular") ){
			heart.classList.replace('fa-regular', 'fa-solid');
			} else{
			heart.classList.replace('fa-solid', 'fa-regular');
			}
		}
		
	</script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=74571bb2dc8fe8db5069ca3d6dcd15a9"></script>
	<script type="text/javascript">
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(${detailTd.tdlongti}, ${detailTd.tdlati}), // 지도의 중심좌표
	        level: 3, // 지도의 확대 레벨
	    };
	
		var map = new kakao.maps.Map(mapContainer, mapOption); //지도 생성 및 객체 리턴
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(${detailTd.tdlongti}, ${detailTd.tdlati}); 
	
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
	
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		
	</script>
	<script>
		$(document).ready(function(){
			$(window).scroll(function(){
				if($(this).scrollTop()>50){
					$('.Bar').fadeIn(500);
					console.log('생김');
				}else{
					$('.Bar').fadeOut(500);
				}
			});
		})
		$('.Bar').click(function(event){
			console.log('클릭!');
			event.preventDefault();
			$('html,body').animate({scrollTop:0},300);
		});
		
	</script>

</body>
</html>
