<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html lang="en">

		<head>
			<meta charset="utf-8" />
			<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
			<meta name="description" content="" />
			<meta name="author" content="" />
			<title>Modern Business - Start Bootstrap Template</title>

			<script src="https://kit.fontawesome.com/c8056a816e.js" crossorigin="anonymous"></script>

			<!-- Favicon-->
			<link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">

			<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
			<!-- Bootstrap icons-->
			<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
			<!-- Core theme CSS (includes Bootstrap)-->
			<link href="resources/css/styles.css" rel="stylesheet" />

			<!-- Data AOS-->
			<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
			<link
				href="https://fonts.googleapis.com/css2?family=Diphylleia&family=Noto+Sans+KR:wght@500;800&display=swap"
				rel="stylesheet">
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

			<style type="text/css">
				.wrap>* {
					font-family: 'Noto Sans KR', sans-serif;
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

				.bg-wh {
					background-color: white;
					box-shadow: 0px 0px 10px #A2A2A2;
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
					position: relative;
					bottom: -50px;
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

				.wrap {
					margin-top: 150px;
					width: 1000px;
					margin-left: auto;
					margin-right: auto;
					margin-bottom: 50px;
				}

				.Img {
					width: 1000px;
				}

				.name {
					padding-left: 30px;
					padding-top: 20px;
					font-size: 30px;
					font-weight: bold;
				}

				.date {
					padding-left: 30px;
					font-weight: bold;
				}

				.address {
					padding-left: 30px;
					padding-top: 10px;
					font-weight: bold;
					width: 1000px;
					font-size: 20px;
				}

				.hr {
					width: 1000px;
					border-top: 1px solid black;
				}

				.heart {
					padding-left: 30px;
					cursor: pointer;
				}

				.wrap>.fa-solid {
					color: #ff0000;
				}

				.fa-regular {
					color: #000000;
				}

				.TdestRecommendArea {
					position: relative;
					width: 1000px;
				}

				.Tdest {
					border: 1px solid;
					padding: 25px;
					border-radius: 0px 25px 0px 25px;
					background-image: linear-gradient(120deg, #e0c3fc 0%, #8ec5fc 100%);
					width: 1000px;
				}

				.FestivalRecomm {
					border: 1px solid;
					padding: 25px;
					border-radius: 25px 0px 25px 0px;
					margin-top: 5px;
					width: 1000px;
					background-image: linear-gradient(120deg, #8ec5fc 0%, #e0c3fc 100%);
				}

				#RecommendTitle {
					font-size: 22px;
					font-weight: bold;
					color: dodgerblue;
				}

				.feImg {
					width: 200px;
					height: 150px;
				}

				.countryImg {
					width: 100px;
					height: 100px;
				}

				.feList {
					display: inline-block;
					cursor: pointer;
					margin-top: 5px;
				}

				.feName {
					font-size: 20px;
					text-align: center;
					height: 30px;
					width: 200px;
					overflow: hidden;
				}

				a {
					text-decoration: none;
					color: black;
				}

				.more {
					left: 30px;
					background-color: white;
					border-radius: 1000px;
					width: 65px;
					height: 65px;
					position: relative;
					bottom: 35px;
				}

				.moreIn {
					position: relative;
					left: 20px;
					top: 20px;
				}

				.moreArea {
					width: 117px;
					display: inline-block;
				}

				.moreText {
					position: relative;
					font-weight: bold;
					bottom: 30px;
					left: 40px;
				}

				.feinfo {
					width: 1000px;
					padding-left: 30px;
					padding-right: 30px;
				}

				.homepage {
					margin-left: 30px;
					background-color: white;
					border-radius: 20px;
					padding: 10px;
					border-color: gray;
				}

				.fetel {
					width: 900px;
					padding-left: 15px;
					padding-right: 30px;
					display: inline-block;
					padding-top: 10px;
				}

				.phoneImg {
					width: 50px;
					height: 50px;
					margin-left: 30px;
				}

				.phoneArea {
					display: flex;
					width: 1000px;
					margin-bottom: 10px;
				}

				.lknum {
					display: inline-block;
				}

				.FestivalComment {
					min-height: 700px;
					border: none;
					overflow: scroll;
					overflow-x: hidden;
					margin-top: 25px;
				}

				.InnerComment {
					padding: 15px;
				}

				.MemberImg {
					width: 45px;
				}

				.Recommhr {
					border-top: 1px solid black;
				}

				.TitleDiv {
					margin-top: 10px;
				}

				.lknum {
					display: inline-block;
				}

				.NoRe {
					position: absolute;
					left: 27%;
					top: 70%;
					font-size: 35px
				}
			</style>



		</head>

		<body class="d-flex flex-column h-100">
			<main class="">
				<!-- Navigation-->
				<%@ include file="../include/menu.jsp" %>
					<!-- content 시작 -->
					<div class="wrap">
						<img class="card-img-top Img" src="${detailTd.tdphoto }" alt="..."
							onerror="this.src='${pageContext.request.contextPath}/resources/tdest/3509.jpg'" />
						<p class="name"> ${detailTd.tdname }</p>
						<i class="fa-regular fa-heart fa-xl heart" onclick="clickHeart('${detailTd.tdcode}', 'tdest')"
							id="heart"></i>
						<p class="lknum" id="lknum">${detailTd.lknum }</p>
						<button class="btn btn-outline-success" onclick="selectCdcode('${detailTd.tdcode}','tdest')"
							data-bs-toggle="modal" data-bs-target="#exampleModal">계획에
							추가하기</button>
						<hr class="hr">
						<p class="feinfo">${detailTd.tdinfo }</p>
						<c:if test="${detailTd.tdtel ne null }">
							<div class="phoneArea">
								<img class="phoneImg"
									src="${pageContext.request.contextPath}/resources/detail/phone-icon-file.png">
								<p class="fetel">${detailTd.tdtel }</p>
							</div>
						</c:if>
						<c:if test="${detailTd.homepage ne null }">
							<button class="homepage" onclick="location.href='${detailTd.homepage }';">공식 홈페이지</button>
						</c:if>
						<hr class="hr">
						<div id="map" style="width:1000px;height:400px;"></div>
						<p class="address">${detailTd.tdaddress }</p>
						<hr class="hr">
						<div class="TdestRecommendArea">
							<div class="Tdest">
								<div class="countryIdentity">
									<span id="RecommendTitle">${country }에 이런 여행지는 어떠세요?</span>
								</div>
								<c:forEach items="${nearby }" var="td" begin="0" end="3" step="1">
									<div class="card feList">
										<a href="${pageContext.request.contextPath }/detailTdest?tdcode=${td.tdcode}">
											<img class="card-img-top feImg" src="${td.tdphoto }" alt="..."
												onerror="this.src='${pageContext.request.contextPath}/resources/tdest/3509.jpg'" />
											<div class="feName">${td.tdname }</div>
										</a>
									</div>
								</c:forEach>
								<div class="moreArea">
									<a href="/TdestSearchPage?category=여행지&ctcode=${country }">
										<div class="feList more">
											<i class="fa-solid fa-arrow-right fa-2xl moreIn"
												style="color: #000000;"></i>
										</div>
									</a>
									<h5 class="moreText">더보기</h5>
								</div>
							</div>
							<div class="FestivalRecomm">
								<span id="RecommendTitle">축제를 즐기고 싶으신가요?</span>
								<div>
									<c:forEach items="${festival }" var="fe" begin="0" end="3" step="1">
										<div class="card feList">
											<a
												href="${pageContext.request.contextPath }/detailFestival?code=${fe.fecode }">
												<img class="card-img-top feImg" src="${fe.feposter }" alt="..."
													onerror="this.src='${pageContext.request.contextPath}/resources/tdest/3509.jpg'" />
												<div class="feName">${fe.fename }</div>
											</a>
										</div>
									</c:forEach>
									<div class="moreArea">
										<a href="/TdestSearchPage?category=축제&ctcode=지역">
											<div class="feList more">
												<i class="fa-solid fa-arrow-right fa-2xl moreIn"
													style="color: #000000;"></i>
											</div>
										</a>
										<h5 class="moreText">더보기</h5>
									</div>

								</div>
							</div>
							<div class="FestivalComment">
								<div class="InnerComment">
									<c:if test="${CR == 0}">
										<span class="NoRe">아직 해당 여행지에 리뷰가 없습니다!</span>
									</c:if>
									<c:if test="${CR > 0}">
										<c:forEach items="${Re}" var="re">
											<div>
												<div>
													<img class="MemberImg" src="/resources/memberProfile/${re.MPROFILE}"
														alt="">
													<span>${re.MID}</span>
													<span>추천 수 : ${re.REHIT}</span>
												</div>
												<div class="TitleDiv">
													<span>${re.RETITLE}</span>
													<a class="d-flex justify-content-end"
														href="/detailReview?recode=${re.RECODE}">리뷰 자세히보기</a>
												</div>
												<hr class="Recommhr">
											</div>
										</c:forEach>
									</c:if>
								</div>
							</div>

						</div>
					</div>
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">캘린더 선택</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body" id="selectCalendar">
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-outline-success" data-bs-dismiss="modal"
										id="selectClear">선택</button>
								</div>
							</div>
						</div>
					</div>
					<!-- content 종료 -->
					<!-- Footer-->
					<%@ include file="../include/footer.jsp" %>
			</main>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
			<!-- Bootstrap core JS-->
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
			<!-- Core theme JS-->
			<script src="resources/js/scripts.js"></script>

			<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
			<script>
				AOS.init();
			</script>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=963b2e12b6b2948f660fa6eab737705a"></script>
			<script type="text/javascript">
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center: new kakao.maps.LatLng(${ detailTd.tdlongti }, ${ detailTd.tdlati }), // 지도의 중심좌표
						level: 3, // 지도의 확대 레벨
					};

				var map = new kakao.maps.Map(mapContainer, mapOption); //지도 생성 및 객체 리턴
				// 마커가 표시될 위치입니다 
				var markerPosition = new kakao.maps.LatLng(${ detailTd.tdlongti }, ${ detailTd.tdlati });

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					position: markerPosition
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);


			</script>
			<script type="text/javascript">
				function clickHeart(code, seloption) {
					console.log(code);
					if ("${sessionScope.loginId}" == "") {
						location.href = "${pageContext.request.contextPath}/memberLoginForm"
					} else {
						$.ajax({
							url: "/clickHeart",
							type: "post",
							data: { mid: "${sessionScope.loginId}", code: code, "seloption": seloption },
							aysnc: false,
							success: function (res) {
								console.log('클릭');
								let lknum = document.querySelector('#lknum');
								let heart = document.querySelector('#heart');
								const cl = document.querySelector('#heart').classList;
								if (cl.contains("fa-regular")) {
									heart.classList.replace('fa-regular', 'fa-solid');
									lknum.innerText = res;
								} else {
									heart.classList.replace('fa-solid', 'fa-regular');
									lknum.innerText = res;
								}

							}
						});

					}
				}

			</script>
			<script type="text/javascript">
				function selectCdcode(code, seloption) {
					if ("${sessionScope.loginId}" == "") {
						location.href = "${pageContext.request.contextPath}/memberLoginForm"
					} else {
						$.ajax({
							url: "/getCdcode",
							type: "post",
							data: { mid: "${sessionScope.loginId}" },
							async: false,
							success(rs) {
								let modalBodyTag = document.querySelector("#selectCalendar")
								modalBodyTag.innerHTML = "";
								if (rs.length > 0) {
									let checkinfo = false;
									let selTag = document.createElement("select")
									for (let cd of rs) {
										if (cd.cdstate == 'Y') {
											let optionTag = document.createElement("option")
											optionTag.innerText = cd.cdname;
											optionTag.setAttribute("value", cd.cdcode)
											selTag.appendChild(optionTag);
											checkinfo = true;
										}
									}
									if (checkinfo) {
										modalBodyTag.appendChild(selTag);
										let btnTag = document.querySelector("#selectClear");
										btnTag.addEventListener("click", function () {
											selectDest(code, selTag.value, seloption)
										})
									} else {
										modalBodyTag.innerText = "계획 가능한 달력이 없습니다.";
									}
								}
								else {
									modalBodyTag.innerText = "달력을 추가 해주세요";
								}
							}
						})
					}
				}
				function selectDest(tdcode, cdcode, seloption) {
					console.log(tdcode + "  " + cdcode);
					$.ajax({
						url: "/registSelectDest",
						type: "post",
						data: { mid: "${sessionScope.loginId}", tdcode: tdcode, cdcode: cdcode, "seloption": seloption },
						async: false,
						success(rs) {
							alert('행선지 선택 완료');
							location.href = "/detailTdest?tdcode=" + tdcode;
						}
					})
				}
			</script>
			<script type="text/javascript">
				let heart = document.querySelector('#heart');
				const cl = document.querySelector('#heart').classList;
				let Y = 'Y';
				let N = 'N';
				if (${ like } == 'Y') {
					heart.classList.replace('fa-regular', 'fa-solid');
				}
			</script>


		</body>

		</html>