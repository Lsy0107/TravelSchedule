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
	<style type="text/css">
	.disnone{
		display:none;
	}
	</style>
</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- Navigation-->
		<%@ include file="/WEB-INF/views/include/menu.jsp"%>
		<!-- contant 시작 -->
		<div class="row" style="margin: 45px;"></div>
		<div class="container">
			<div class="row mb-2">
				<div
					class="col col-6 border border-dark p-3 overflow-auto rounded-start"
					style="min-height: 500px;">
					<c:forEach items="${cdList }" var="cd">
						<a class="btn btn-primary m-1"
							href="javascript:getSchedule('${cd.cdcode }','${cd.mid }','${cd.cdstate }')">캘린더
							이름 : ${cd.cdname }</a>
						<br>
					</c:forEach>
				</div>
				<div class="col col-6 border border-dark rounded-end p-3"
					>
				<div class="row" style="display: block; min-height: 429px;" id="printSchedule">
				
				</div>
				<div class="disnone" style="text-align: end;" id="btnArea">
				<button id="removebtn" class="btn btn-info">캘린더 삭제하기</button>
				<button id="travelMkSc" class="btn btn-info">캘린더 계획하기</button>
				</div>
				</div>
			</div>
			<div class="row">
				<div class="col border border-dark rounded p-4 mb-2">
					<button class="btn btn-info" onclick="makeCalender()">캘린더
						추가하기</button>
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
	<script type="text/javascript">
		function makeCalender() {
			let cdname = prompt("캘린더 이름을 입력해주세요");
			if(cdname.split(' ')[0].length>0){
			$.ajax({
				url:"/registCalendar",
				type:"post",
				data:{mid:"${sessionScope.loginId}", cdname:cdname},
				success:function(rs){
					if(rs == 'Y'){
						alert("캘린더 등록 완료");
						location.href="/selectCalendar";
					}else{
						alert("캘린더 등록 실패. 다시 시도해주세요");
					}
					
				}
			})				
			}else{
				alert("이름을 다시 입력하세요");
			}
		}
	</script>
	<script type="text/javascript">
	$(document).ready(function(){
		if("${sessionScope.loginId}" == ""){
			location.herf="/memberLoginForm";
		}
	}
	)
	function getSchedule(cdcode, mid, cdstate){
		$.ajax({
			url:"getSchedule",
			type:"post",
			data:{"cdcode":cdcode, "mid":mid},
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			async:false,
			success:function(scList){
				let scList_json = JSON.parse(scList);
				let scArea = document.querySelector("#printSchedule");
				scArea.innerHTML = "";
				let btnArea = document.querySelector("#btnArea");
				let date = "";
				for(let sc of scList_json){
					if(sc.SCDATE == null){
						continue;
					}
						
					if(date != sc.SCDATE.substring(0,10)){
						if(date != ""){
							let hrTag = document.createElement("hr");
							scArea.appendChild(hrTag);
						}
						let p_date = document.createElement("p");
						date = sc.SCDATE.substring(0,10)
						p_date.innerText = date;
						scArea.appendChild(p_date);
					}
					let name = "";
					if(sc.TDCODE != null){
						name = sc.TDNAME;
					}else if(sc.FECODE != null){
						name = sc.FENAME
					}
					let p_name_time = document.createElement("p");
					p_name_time.innerText = name;
					p_name_time.innerText = p_name_time.innerText + " : " + sc.SCDATE.substring(11,16);
					scArea.appendChild(p_name_time);
				}
    			btnArea.classList.remove("disnone");
    			let mksc = document.querySelector("#travelMkSc");
    			mksc.innerText = '';
    			
    			switch (cdstate) {
				case 'Y':
					mksc.classList.remove("btn-dangerbtn-primary");
					mksc.classList.add("btn-info");
					mksc.addEventListener("click", function(){
	    				location.href="/travelSc?cdcode="+cdcode;
	    			})
	    			mksc.innerText = '캘린더 계획하기';
					break;
				case 'N':
					let firstdate = Date.parse(scList_json[0].SCDATE)
					let nowdate = new Date();
						mksc.classList.remove("btn-info");
						mksc.classList.remove("btn-danger");
					if(firstdate > nowdate){
						mksc.addEventListener("click", function(){
		    			})
						mksc.classList.add("btn-danger");
						
					}else{
						mksc.classList.add("btn-info");
						mksc.addEventListener("click", function(){
		    				location.href="/";
		    			})
					}
						mksc.innerText = "리뷰작성하기";
					break;
				}
    			
				if(date == ""){
					let h2Tag = document.createElement("h2");
					h2Tag.innerText = "계획이 없습니다.";
					scArea.appendChild(h2Tag);
				}
    			let removebtn = document.querySelector("#removebtn");
    			removebtn.addEventListener('click', function(){
    				$.ajax({
    					url:"/removeCalendar",
    					type:"post",
    					data:{"cdcode":cdcode, "mid":mid},
    					aync:false,
    					success:function(rs){
    						if(rs){
    							location.reload();
    						}else{
    							alert('캘린더 삭제를 실패하였습니다.');
    						}
    					}
    				})
    			});
    			
    			
			}
		})
	}
	</script>
</body>
</html>
