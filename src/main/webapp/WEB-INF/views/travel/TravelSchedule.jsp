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
		<%@ include file="/WEB-INF/views/include/menu.jsp"%>
		<!-- contant 시작 -->
		<div class="row" style="margin: 45px;"></div>
		<div class="container">
			<div class="row p-1">
				<div class="col col-3 border border-dark">계획 만들어지는 공간</div>
				<div id="map" class="col border border-dark" style="height:450px;"></div>
			</div>
			<div class="row p-1">
				<div class="col border border-dark">여행지 출력
				<div style="overflow-x: scroll;">
				<nav style="display: -webkit-inline-box;">
					<c:forEach items="${ tdList}" var="td">
						<div class="card" style="width: 18rem; margin: 4px;">
							<img src="${td.tdphoto }" class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">${td.tdname }</h5>
								<p class="card-text">${td.tdaddress }</p>
								<button class="btn btn-primary">계획에 추가하기</button>
							</div>
						</div>
					</c:forEach>
				</nav>
			</div>
				</div>
			</div>
			<div class="row p-1">
				<div class="col border border-dark">축제 정보 출력</div>
			</div>
		</div>
		<!-- contant 종료 -->
	</main>
	<!-- Footer-->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
	<!-- kakao map api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f27f610181c7185c2861db20210a1bd5"></script>
	<script type="text/javascript">
	console.log("${scList}")
	console.log("${tdList}");
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng( 37.56458948133976, 126.97730596902437), //지도의 중심좌표.
		level: 8 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	</script>
</body>
</html>
