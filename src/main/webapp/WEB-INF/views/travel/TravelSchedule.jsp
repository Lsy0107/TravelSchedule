<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String strdate = simpleDate.format(date);%>
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- ajax -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">
.disnone {
	display: none;
	animation: fade-out 1s;
}

.dison {
	animation: fade-on 1s;
}

.disoff {
	animation: fade-off 1s
}

@
keyframes fade-in {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
@
keyframes fade-out {from { opacity:1;
	
}

to {
	opacity: 0;
}

}
.asd {
	height: auto;
}
.travelList{
	margin: 10px;
    display: flex;
    box-shadow: 0px 0px 4px #A2A2A2;
    width: 405px;
    border-radius: 10px;
}
.btn-pmc{
	border-radius: 25px;
    height: 40px;
    width: 40px;
}
.w-btn-pink-outline {
    border: 3px solid #f199bc;
    color: #6e6e6e;
}
.w-btn-pink-outline:hover {
    background-color: #f199bc;
    color: #d4dfe6;
}
.w-btn-blue-outline:hover {
    background-color: #6aafe6;
    color: #d4dfe6;
}
.w-btn-blue-outline {
    border: 3px solid #6aafe6;
    color: #6e6e6e;
}
.w-btn-outline {
    position: relative;
    padding: 5px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 0px 10px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
    margin: 3px;
}
.bg-wh{
	background-color: white;
	box-shadow: 0px 0px 10px #A2A2A2;
}

</style>
</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- Navigation-->

		<!-- contant 시작 -->
		<div class="p-4"
			style="display: flex; float: left; position: absolute; background-color: aliceblue; z-index: 3; height: -webkit-fill-available;">
			<div class="">
				<h5 onclick="location.href='${pageContext.request.contextPath }/'"><i class="fa-solid fa-earth-asia"></i> 여행</h5>
				<nav class="" style="border:1px solid #A2A2A2;border-radius:10px; background-color:white; box-shadow: 0 0 8px #A2A2A2">
					<ul style="list-style: none; padding: 0;">
						<li><div class="container-fluid " style="padding: 0;">
								<button class="navbar-toggler" type="button"
									data-bs-toggle="collapse"
									data-bs-target="#navbarToggleExternalContent"
									aria-controls="navbarToggleExternalContent"
									aria-expanded="false" aria-label="Toggle navigation">
									<span>여행지 선택</span>
								</button>
							</div></li>
						<li>
							<div id="scArea" class="row p-1"
								style="min-height: 614px; display: flow; text-overflow: ellipsis;">
								<c:forEach var="sc" items="${scdestList }">
									<c:if test="${sc.SCDATE != null}">
										<c:choose>
											<c:when test="${sc.TDCODE != null }">
												<p>${sc.TDNAME }: ${sc.SCDATE }</p>
											</c:when>
											<c:when test="${sc.FECODE != null }">
												<p>${sc.FENAME }: ${sc.SCDATE }</p>
											</c:when>
										</c:choose>


									</c:if>
								</c:forEach>
							</div>
							<div class="row p-1">
								<c:if test="${cd.cdstate == 'Y' }">
								<div class="col d-flex justify-content-center">
									<button class="btn btn-primary"
										onclick="updateCdstate('${cd.cdcode}')" style="width: 140px;">계획 확정하기</button>
								</div>
								</c:if>
							</div>
						</li>
					</ul>
				</nav>
			</div>
			<div class="collapse p-4 asd dison" id="navbarToggleExternalContent"
				style="overflow: scroll; background-color: aliceblue;margin-left: 15px;">
				<div class="col d-flex justify-content-center" style="margin-bottom: 15px;">
				<button class="w-btn-outline w-btn-pink-outline" onclick="disnonefe()">여행지</button>
				<button class="w-btn-outline w-btn-blue-outline" onclick="disnonetd()">축제</button>
				</div>
				<div>
					<nav id="tdArea" class="" style="">
						<c:forEach items="${ scdestList}" var="td">
							<c:if test="${td.TDCODE != null }">
								<div class="travelList" style="background-color:white;">
									<img class="col-3 img-thumbnail" src="${td.TDPHOTO }" alt="..." 
										onerror="this.src='/resources/tdest/3509.jpg'"style="width =: 286px; height: 90px;border-radius: 12px; " loading="lazy">
									<div class="col-6 p-1">
										<h6 style="font-weight: bold;">${td.TDNAME }</h6>
										<p class="" style="font-size: 13px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${td.TDADDRESS }</p>
									</div>
									<div class="col-3 p-1" style="margin: auto;">
										<c:if test="${td.SCDATE == null}">
											<button class="btn btn-primary btn-pmc"
												onclick="selectDest('${td.MID}','${td.CDCODE }','${td.TDCODE }','tdest')"
												data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-plus"></i></button>
										</c:if>
										<c:if test="${td.SCDATE != null }">
											<button class="btn btn-info btn-pmc"><i class="fa-solid fa-check"></i></button>
										</c:if>
										<button class="btn btn-danger btn-pmc"
											onclick="removeDest('${td.MID}','${td.CDCODE }','${td.TDCODE }','tdest')"><i class="fa-solid fa-minus"></i></button>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</nav>
					<nav id="feArea" class="disnone" style="">
						<c:forEach items="${ scdestList}" var="fe">
							<c:if test="${fe.FECODE != null }">
								<div class="travelList" style="background-color:white;">
									<img class="col-3 img-thumbnail" src="${fe.FEPOSTER }" alt="..."
										onerror="this.src='/resources/tdest/3509.jpg'"style="width =: 286px; height: 90px;border-radius: 12px; " loading="lazy">
									<div class="col-6 p-1">
										<h6 style="font-weight: bold;">${fe.FENAME }</h6>
										<p style="font-size: 13px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${fe.FEADDRESS }</p>
									</div>
									<div class="col-3 p-1" style="margin: auto;">
										<c:if test="${fe.SCDATE == null}">
											<button class="btn btn-primary btn-pmc"
												onclick="selectDest('${fe.MID}','${fe.CDCODE }','${fe.FECODE }','festival')"
												data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-plus"></i></button>
										</c:if>
										<c:if test="${fe.SCDATE != null }">
											<button class="btn btn-info btn-pmc"><i class="fa-solid fa-check"></i></button>
										</c:if>
										<button class="btn btn-danger btn-pmc" 
										onclick="removeDest('${fe.MID}','${fe.CDCODE }','${fe.FECODE }','festival')" ><i class="fa-solid fa-minus"></i></button>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</nav>
				</div>
			</div>

		</div>
		<div id="map" class="col border border-dark" style="height: 963px;margin-left:243px;"></div>
		<!-- 
		</div>
		<div class="row" style="margin: 45px;"></div>
		<div class="container">
			<div class="row" >
				<div class="col col-3 border border-dark">계획 만들어지는 공간
				<div id="scArea" class="row p-1" style="min-height: 375px; display: flow;">
				<c:forEach var="sc" items="${scdestList }">
				<c:if test="${sc.SCDATE != null}">
				<c:choose>
				<c:when test="${sc.TDCODE != null }"><p>${sc.TDNAME } : ${sc.SCDATE }</p></c:when>
				<c:when test="${sc.FECODE != null }"><p>${sc.FENAME } : ${sc.SCDATE }</p></c:when>
				</c:choose>
				
					
				</c:if>
				</c:forEach>
				</div>
				<div class="row p-1">
				<c:if test="${cd.cdstate == 'Y' }">
				<button class="btn btn-primary" onclick="updateCdstate('${cd.cdcode}')">계획 확정하기</button>
				</c:if>
				</div>
				</div>
				
				
				<div id="map" class="col border border-dark" style="height: 450px;"></div>
			</div>
			<div class="row p-1">
				<div class="col border border-dark">
					여행지 출력
					<div style="overflow-x: scroll;">
						<nav id="tdArea" style="display: -webkit-inline-box;">
							<c:forEach items="${ scdestList}" var="td">
							<c:if test="${td.TDCODE != null }">
								<div class="card" style="width: 18rem; margin: 4px; height: 370px;">
									<img src="${td.TDPHOTO }" class="card-img-top" alt="..." width="286px" height="191px" loading="lazy">
									<div class="card-body">
										<h5 class="card-title">${td.TDNAME }</h5>
										<p class="card-text">${td.TDADDRESS }</p>
										<c:if test="${td.SCDATE == null}">
										<button class="btn btn-primary position-absolute bottom-0 start-0" style="margin: 6px; width: 48%; font-size: 15px;"
											onclick="selectDest('${td.MID}','${td.CDCODE }','${td.TDCODE }','tdest')"
											data-bs-toggle="modal" data-bs-target="#exampleModal">계획에
											추가하기</button>
										</c:if>
										<c:if test="${td.SCDATE != null }">
										<button class="btn btn-info position-absolute bottom-0 start-0" style="margin: 6px; width: 48%; font-size: 15px;">추가된 계획</button>
										</c:if>
										<button class="btn btn-danger position-absolute bottom-0 end-0" onclick="removeDest('${td.MID}','${td.CDCODE }','${td.TDCODE }','tdest')" style="margin: 6px; font-size: 15px; width: 43%;">계획 삭제하기</button>
									</div>
								</div>
							</c:if>
							</c:forEach>
						</nav>
					</div>
				</div>
			</div>
			<div class="row p-1">
				<div class="col border border-dark">축제 정보 출력
				<div style="overflow-x: scroll;">
						<nav id="feArea" style="display: -webkit-inline-box;">
							<c:forEach items="${ scdestList}" var="fe">
								<c:if test="${fe.FECODE != null }">
								<div class="card" style="width: 18rem; margin: 4px; height: 370px;">
									<img src="${fe.FEPOSTER }" class="card-img-top" alt="..."  width="286px" height="191px" loading="lazy">
									<div class="card-body">
										<h5 class="card-title">${fe.FENAME }</h5>
										<p class="card-text">${fe.FEADDRESS }</p>
										<c:if test="${fe.SCDATE == null}">
										<button class="btn btn-primary position-absolute bottom-0 start-0" style="margin: 6px; width: 48%; font-size: 15px;"
											onclick="selectDest('${fe.MID}','${fe.CDCODE }','${fe.FECODE }','festival')"
											data-bs-toggle="modal" data-bs-target="#exampleModal">계획에
											추가하기</button>
										</c:if>
										<c:if test="${fe.SCDATE != null }">
										<button class="btn btn-info position-absolute bottom-0 start-0" style="margin: 6px; width: 48%; font-size: 15px;">추가된 계획</button>
										</c:if>
										<button class="btn btn-danger position-absolute bottom-0 end-0" onclick="removeDest('${fe.MID}','${fe.CDCODE }','${fe.FECODE }','festival')" style="margin: 6px; font-size: 15px; width: 43%;">계획 삭제하기</button>
									</div>
								</div>
								</c:if>
							</c:forEach>
						</nav>
					</div>
				</div>
			</div>
		</div>
 -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">날짜 선택하기</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body" id="selectDest">
						<p id="destName"></p>
						<input type="date" id="selDate" min="<%=strdate%>"> 
						<select id="selHH">
							<c:forEach begin="0" end="23" var="i">
								<option value="${i}">${i}</option>
							</c:forEach>
						</select> : 
						<select id="selMM">
							<option value="00">0</option>
							<option value="30">30</option>
						</select>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							data-bs-dismiss="modal" id="selectClear">선택</button>
					</div>
				</div>
			</div>
		</div>
		<!-- contant 종료 -->
	</main>
	<!-- Footer
	-->
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
	<!-- kakao map api -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=23bdfe79ede96bc585d6800ad13f132f"></script>
	<script src="https://kit.fontawesome.com/c8056a816e.js" crossorigin="anonymous"></script>
	<script type="text/javascript">
	
	let lalngList = JSON.parse('${lalngList}');
	console.log(lalngList);
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng( 37.56458948133976, 126.97730596902437), //지도의 중심좌표.
		level: 10 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	var positions = [];
	
	for(let lalng of lalngList){
		positions.push({title: lalng.name, latlng: new kakao.maps.LatLng(lalng.lati, lalng.longti)})
	}

	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	    });
	}
	</script>
	<script type="text/javascript">
		function selectDest(mid, cdcode, destcode, seloption){
			let destName = document.querySelector("#destName");
			destName.innerText = name;
			let modalBtn = document.querySelector("#selectClear");
			modalBtn.addEventListener("click", function(){
				let scdate = document.querySelector("#selDate").value;
				if(scdate == ""){
					alert("날짜도 선택해주세요");
				}else{
				let schour = document.querySelector("#selHH").value
				if(schour.length == 1){
					schour = "0"+schour;
				}
				scdate = scdate + " " + schour;
				let scmin = document.querySelector("#selMM").value;
				scdate = scdate + ":" + scmin;
				
				let dataoption = {};
				if(seloption == 'tdest'){
					dataoption = {"mid":mid,"cdcode":cdcode,"tdcode":destcode ,"scdate":scdate,"seloption":seloption}
				}else{
					dataoption = {"mid":mid,"cdcode":cdcode,"fecode":destcode ,"scdate":scdate,"seloption":seloption}
				}
				
				
				$.ajax({
					url:"/updateSc",
					type:"post",
					data:dataoption,
					success:function(rs){
						location.reload();
					}
				})
				}
			})
			}

		
	</script>
	<script type="text/javascript">
	$(document).ready(function(){
		if("${sessionScope.loginId}" == ""){
			location.herf="/memberLoginForm";
		}
	}
	)
	</script>
	<script type="text/javascript">
	function updateCdstate(cdcode){
		let check = null;
		let scAreaTag = document.querySelector("#scArea").childElementCount;
		let tdAreaTag = document.querySelector("#tdArea").childElementCount;
		let feAreaTag = document.querySelector("#feArea").childElementCount;
		console.log(lalngList);
		let today = new Date();
		console.log(today.getFullYear());
		console.log(today.getMonth());
		console.log(today.getDate());
		console.log(lalngList[0].scdate);
		let scDate = lalngList[0].scdate.split(" ")[0];
		let checkDate = false;
		if(Number(scDate.split('/')[0]) > today.getFullYear()){
			checkDate = true;
		}else if(Number(scDate.split('/')[0]) == today.getFullYear()){
			if(Number(scDate.split('/')[1])>today.getMonth()+1){
				checkDate=true;
			}else if(Number(scDate.split('/')[1])==today.getMonth()+1){
				if(Number(scDate.split('/')[2])>=today.getDate()){
					checkDate=true;
				}
			}
		}
		if(!checkDate){
			alert('이미 지난 계획이 있습니다.');
			return;
		}
		
		if(scAreaTag == tdAreaTag + feAreaTag){
			check = confirm("계획을 확정하면 더는 수정할 수 없습니다.");			
		}else{
			alert("선택하지 않은 여행지가 있습니다!")
			return;
		}
		if(check){
		$.ajax({
			url:'/updateCdstate',
			type:"post",
			data:{'cdcode':cdcode},
			aync:false,
			success:function(rs){
				switch (rs) {
				case 'Y':
					location.href="/selectCalendar";
					break;
				case 'C':
					alert("계획확정에 실패하였습니다.");
					break;
				case 'N':
					alert("계획을 1개 이상 추가해주세요");
					break;
				}
			}
		})
		}
	}
	</script>
	<script type="text/javascript">
	function removeDest(mid, cdcode, destcode, seloption){
		let dataOption = {};
		if(seloption == 'tdest'){
			dataOption = {"mid":mid, "cdcode":cdcode, "tdcode":destcode, "seloption":seloption};
		}
		if(seloption == 'festival'){
			dataOption = {"mid":mid, "cdcode":cdcode, "fecode":destcode, "seloption":seloption};
		}
		$.ajax({
			url:"/removeDest",
			type:"post",
			data:dataOption,
			aync:false,
			success:function(rs){
				if(rs == "Y"){
					location.reload();
				}
				if(rs == "N"){
					alert("행선지 삭제에 실패하였습니다.");
				}
			}
		})
	}
	function disnonetd(){
		let tdArea =document.querySelector("#tdArea");
		let feArea = document.querySelector("#feArea");
		console.log('disnonetd')
		console.log(tdArea.classList);
		console.log(feArea.classList);
		tdArea.classList.add('disnone');
		feArea.classList.remove('disnone');
		
		
	}
	function disnonefe(){
		console.log('disnonefe')
		let tdArea =document.querySelector("#tdArea");
		let feArea = document.querySelector("#feArea");
		console.log(tdArea.classList);
		console.log(feArea.classList);
		tdArea.classList.remove('disnone');
		feArea.classList.add('disnone');
		
	}
	</script>


</body>
</html>
