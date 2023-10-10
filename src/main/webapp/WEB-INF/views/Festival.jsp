<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
.feList{
	width: 300px;
	display:inline-block;
}
.ctList{
	width: 130px;
	display:inline-block;
}
.feImg{
	width: 300px;
	height: 200px;
}
.feName{
	white-space:nowrap;
	overflow: hidden;
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

			<div class="row" data-aos="fade-down-right" data-aos-duration="600"
			data-aos-anchor-placement="top-center">
				<div class="col p-5">
					<div class="card" id="FestivalRecommend">
						<a><img src="..." class="card-img-top" alt="..."></a>
						<div class="card-body">
							<c:forEach items="${country }" var="ct">
								<div class="card mb-4 ctList">
									<button onclick="festival_country('${ct.ctcode}')">${ct.ctname }</button>
								</div>
							</c:forEach>
							<p class="card-text">축제 추천</p>
							<div id="feArea">
								<c:forEach items="${festival }" var="fe">
									<a href="">							
										<div class="card mb-4 feList" >
				                        	<img class="card-img-top feImg" src="${fe.feposter }" alt="..." onerror="this.src='${pageContext.request.contextPath}/resources/tdest/3509.jpg'" />			                            			                            				
											<h5 class="feName">${fe.fename }</h5>
											<h6>${fe.opendate} ~ ${fe.enddate }</h6>
											<h6> ${fe.feaddress }</h6>
										</div>
									</a>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
	
		<!-- content 종료 -->
		<!-- Footer-->
		<%@ include file="include/footer.jsp"%>
	</main>
	<!-- JQUERY -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>

	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<script>
		AOS.init();
	</script>
	<script>	
		function festival_country(ctcode){			
			console.log(ctcode);
			$.ajax({
				type : 'get',
				url : 'festival_country',
				data : { 'ctcode' : ctcode },
				dataType : 'json',
				async : false,
				success : function(result){
					printFestival_country(result);
				}
			});
		}
		function printFestival_country(feList){
			let feArea = document.querySelector('#feArea');
			feArea.innerHTML = "";
			for(let fe of feList){
				let feDiv = document.createElement('div');
				feDiv.classList.add('feList');
				feDiv.classList.add('card');
				feDiv.classList.add('mb-4');
				let feImg = document.createElement('img');
				feImg.classList.add('card-img-top');
				feImg.classList.add('feImg');
				feImg.setAttribute('src', fe.feposter);
				feImg.setAttribute('onerror', "this.src='${pageContext.request.contextPath}/resources/tdest/3509.jpg'");
				
				let feName = document.createElement('div');
				feName.innerText = fe.fename;
				let feDate = document.createElement('div');
				feDate.innerText = fe.opendate +" ~ " + fe.enddate;
				
				feDiv.appendChild(feImg);
				feDiv.appendChild(feName);
				feDiv.appendChild(feDate);
				feArea.appendChild(feDiv);
			}
		} 
	</script>
</body>
</html>
