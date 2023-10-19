<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
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
<!-- ajax -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- Navigation-->
		<%@ include file="/WEB-INF/views/include/menu.jsp"%>
		<!-- contant 시작 -->
		<div class="row" style="margin: 45px;"></div>
		<div class="container">
			<div class="row" >
				<div class="col col-3 border border-dark">계획 만들어지는 공간
				<div class="row p-1" style="min-height: 375px; display: flow;">
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
						<nav style="display: -webkit-inline-box;">
							<c:forEach items="${ scdestList}" var="td">
							<c:if test="${td.TDCODE != null }">
								<div class="card" style="width: 18rem; margin: 4px; height: 370px;">
									<img src="${td.TDPHOTO }" class="card-img-top" alt="..." width="286px" height="191px" loading="lazy">
									<div class="card-body">
										<h5 class="card-title">${td.TDNAME }</h5>
										<p class="card-text">${td.TDADDRESS }</p>
										<c:if test="${td.SCDATE == null}">
										<button class="btn btn-primary position-absolute bottom-0 start-0" style="margin: 10px"
											onclick="selectDest('${td.MID}','${td.CDCODE }','${td.TDCODE }','tdest')"
											data-bs-toggle="modal" data-bs-target="#exampleModal">계획에
											추가하기</button>
										</c:if>
										<c:if test="${td.SCDATE != null }">
										<button class="btn btn-info position-absolute bottom-0 start-0" style="margin: 10px">추가된 계획</button>
										</c:if>
										<button class="btn btn-danger position-absolute bottom-0 start-0" onclick="removeDest('${td.MID}','${td.CDCODE }','${td.TDCODE }','tdest')" style="margin: 10px">계획 삭제하기</button>
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
						<nav style="display: -webkit-inline-box;">
							<c:forEach items="${ scdestList}" var="fe">
								<c:if test="${fe.FECODE != null }">
								<div class="card" style="width: 18rem; margin: 4px; height: 370px;">
									<img src="${fe.FEPOSTER }" class="card-img-top" alt="...">
									<div class="card-body">
										<h5 class="card-title">${fe.FENAME }</h5>
										<p class="card-text">${fe.FEADDRESS }</p>
										<c:if test="${fe.SCDATE == null}">
										<button class="btn btn-primary position-absolute bottom-0 start-0" style="margin: 10px"
											onclick="selectDest('${fe.MID}','${fe.CDCODE }','${fe.FECODE }','festival')"
											data-bs-toggle="modal" data-bs-target="#exampleModal">계획에
											추가하기</button>
										</c:if>
										<c:if test="${fe.SCDATE != null }">
										<button class="btn btn-info position-absolute bottom-0 start-0" style="margin: 10px">추가된 계획</button>
										</c:if>
									</div>
								</div>
								</c:if>
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
	<!-- Footer-->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
	<!-- kakao map api -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=23bdfe79ede96bc585d6800ad13f132f"></script>
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
				console.log(scdate);
				
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
		console.log(cdcode);
		$.ajax({
			url:'/updateCdstate',
			type:"post",
			data:{'cdcode':cdcode},
			aync:false,
			success:function(rs){
				console.log(rs)
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
		console.log("${cd.cdstate == 'Y' }");
	</script>
	<script type="text/javascript">
	function removeDest(mid, cdcode, destcode, seloption){
		console.log(mid+cdcode+destcode+seloption)
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
				console.log(rs);
				if(rs == "Y"){
					location.reload();
				}
				if(rs == "N"){
					alert("행선지 삭제에 실패하였습니다.");
				}
			}
		})
	}
	</script>
</body>
</html>
