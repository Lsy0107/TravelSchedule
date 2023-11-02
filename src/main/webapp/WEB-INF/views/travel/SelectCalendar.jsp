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
<script src="https://kit.fontawesome.com/65020fc203.js" crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<%-- background-color : white; 
	height : auto; 
	width : 400px;
	border-radius: 5px;
	box-shadow: 0px 40px 30px -20px rgba(0, 0, 0, 0.3);
	width: 400px;
	height: auto;
	background-color: white;
	margin: 0 auto;
	--%>
<link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">
<style type="text/css">
.disnone {
	display: none;
}
.bg-wh{
	background-color: white;
	box-shadow: 0px 0px 10px #A2A2A2;
}

@import
	url('https://fonts.googleapis.com/css?family=Questrial&display=swap');

#printSchedule {
	padding: 20px;
	margin: 0px; 
	margin : 0 auto; 
}

td {
	width: 50px;
	height: 50px;
	text-align: center;
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
	height: 45px;
	width: 45px;
	border-radius: 45px;
	transition-duration: .2s;
	line-height: 45px;
	margin: 2.5px;
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

.futureDay:hover {
	background: #eee;
}

.futureDay.choiceDay, .today.choiceDay {
	background: #0A174E;
	color: #fff;
	font-weight: 600;
	cursor: pointer;
}
.calendarShadow{
	box-shadow: 0px 0px 10px #A2A2A2;
	border-radius: 10px;
}
.w-btn {
    position: relative;
    border: none;
    padding: 8px 2px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 0px 5px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
    text-align: center;
}

element.style {
}
.w-btn-gra-anim {
    background-size: 400% 400%;
    animation: gradient1 5s ease infinite;
}
.w-btn-gra1 {
    background: linear-gradient(-45deg, #33ccff 0%, #ff99cc 100%);
    color: white;
}
.w-btn:active {
    transform: scale(0.1);
}
.w-btn:hover {
    letter-spacing: 1px;
    transform: scale(1.1);
    cursor: pointer;
}
body, div, p, h4, a, td, span, tr, button{
	font-family: 'Jua' !important;
}
.bg-c{
    height: 100vh;
    width: 100vw;
	background-image: url("https://thumb.ac-illust.com/d0/d06e2d3177a17ae4c850d644f1423766_t.jpeg");
	background-repeat : no-repeat;
    background-size : cover;
    image-rendering: -moz-crisp-edges; /* firefox */
	image-rendering: -o-crisp-edges; /* opera */
	image-rendering: -webkit-optimize-contrast; /* chrome */
	image-rendering: crisp-edges;
	transform: translateZ(0);
	backface-visibility: hidden;
	position: absolute;
	z-index: 1;
}
</style>
</head>
<body class="d-flex flex-column h-100 bg-c">
	<main class="flex-shrink-0">
		<!-- Navigation-->
		<%@ include file="/WEB-INF/views/include/menu.jsp"%>
		<!-- contant 시작 -->
		<div class="row" style="margin: 45px;"></div>
		<div class="container">
			<div class="row mb-2 calendarShadow font-jua" style="positon :relative; z-index: 2;">
				<div
					class="col col-2 p-3 overflow-auto rounded-start"
					style="min-height: 500px; border-right: 1px solid #a2a2a28f; border-radius: 10px; background-color: ivory;">
					<div style="height:505px;">
					<h4 style="text-align:center;margin-top:0;">캘린더</h4>
					<c:forEach items="${cdList }" var="cd">
						<a style="display:block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"class="btn btn-primary m-1 w-btn w-btn-gra1 w-btn-gra-anim"
							href="javascript:getSchedule('${cd.cdcode }','${cd.mid }','${cd.cdstate }')">${cd.cdname }</a>
						<br>
					</c:forEach>
					</div>
					<div style="text-align:end;">
					<button style="border-radius:30px; height: 41px; width: 41px;" class="btn btn-info" onclick="makeCalender()"><i class="fa-solid fa-plus"></i></button>
					</div>
				</div>
				<div class="col col-10 rounded-end p-3 "style=" background-color: white;">
					<div class="row" style="display: block; min-height: 510px;"
						id="printSchedule">
						<table class="Calendar">
							<thead>
								<tr>
									<td id="prevCalendar" onclick="prevCalendar([])" style="cursor: pointer;">&#60;</td>
									<td colspan="5"><span id="calYear"></span>년 <span
										id="calMonth"></span>월</td>
									<td onClick="nextCalendar([]);" style="cursor: pointer;">&#62;</td>
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
					<div class="disnone" style="text-align: end;" id="btnArea">
						<button id="removebtn" class="btn btn-info" onclick="removeCal()">캘린더
							삭제하기</button>
						<button id="travelMkSc" class="btn btn-info">캘린더 계획하기</button>
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
	<script type="text/javascript">
		function makeCalender() {
			let cdname = prompt("캘린더 이름을 입력해주세요");
			if(cdname == null){	
				return;
			}
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
		selcdcode = cdcode;
		selmid = mid;
		$.ajax({
			url:"getSchedule",
			type:"post",
			data:{"cdcode":cdcode, "mid":mid},
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			async:false,
			success:function(scList){
				let scList_json = JSON.parse(scList);
				console.log(scList_json)
				let scArea = document.querySelector("#printSchedule");
				scArea.innerHTML = '<table class="Calendar"><thead><tr><td id="prevCalendar"style="cursor: pointer;">&#60;</td><td colspan="5"><span id="calYear"></span>년 <span id="calMonth"></span>월</td><td id="nextCalendar" style="cursor: pointer;">&#62;</td></tr><tr><td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td>	</tr></thead><tbody></tbody></table>';
				nowMonth = new Date();
				buildCalendar(scList_json)
				// onClick="prevCalendar('+scList_json+');" 
				let prevCalendarBtn = document.querySelector("#prevCalendar");
				prevCalendarBtn.addEventListener("click",function(){
					prevCalendar(scList_json);
				})
				
				let nextCalendarBtn = document.querySelector("#nextCalendar");
				nextCalendarBtn.addEventListener("click",function(){
					nextCalendar(scList_json);
				})
				let btnArea = document.querySelector("#btnArea");
				let date = "";
    			btnArea.classList.remove("disnone");
    			let mksc = document.querySelector("#travelMkSc");
    			mksc.innerText = '';
    			console.log(cdstate);
    			switch (cdstate) {
				case 'Y':
					mksc.classList.remove("btn-danger");
					mksc.classList.remove("btn-success");
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
						mksc.classList.remove("btn-success");
					if(firstdate > nowdate){
						mksc.addEventListener("click", function(){
		    			})
						mksc.classList.add("btn-danger");
						
					}else{
						mksc.classList.add("btn-info");
						mksc.addEventListener("click", function(){
		    				location.href="/ReviewWriteForm?cdcode="+cdcode;
		    			})
					}
						mksc.innerText = "리뷰작성하기";
					break;
				case 'R':
					mksc.classList.remove("btn-info");
					mksc.classList.remove("btn-danger");
					mksc.classList.add("btn-success");
					mksc.addEventListener("click", function(){
	    				location.href="ReviewFix?cdcode="+cdcode;
	    			})
    				mksc.innerText = "리뷰수정하기";
					break;
				}
    			/*
				if(date == ""){
					let h2Tag = document.createElement("h2");
					h2Tag.innerText = "계획이 없습니다.";
					scArea.appendChild(h2Tag);
				}
    			*/
			}
		})
	}
	let selcdcode = "";
	let selmid = "";
	function removeCal() {
		$.ajax({
			url:"/removeCalendar",
			type:"post",
			data:{"cdcode":selcdcode, "mid":selmid},
			aync:false,
			success:function(rs){
				if(rs){
					alert("캘린더 삭제를 성공하였습니다.");
					location.reload();
				}else{
					alert("캘린더 삭제를 실패하였습니다.");
				}
			}
		})
	}
	
	</script>
	<script>
        window.onload = function () { buildCalendar([]); }    // 웹 페이지가 로드되면 buildCalendar 실행

        let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
        let today = new Date();     // 페이지를 로드한 날짜를 저장
        today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화

        // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
        function buildCalendar(scList) {
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
                nowColumn.setAttribute("style", "text-align: -webkit-center;");

                let newDIV = document.createElement("p");
                newDIV.innerHTML = leftPad(nowDay.getDate());        // 추가한 열에 날짜 입력
                nowColumn.appendChild(newDIV);
                if (nowDay.getDay() == 6) {                 // 토요일인 경우
                    nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
                }
                if (nowDay < today) {                       // 지난날인 경우
                    newDIV.className = "pastDay";
                }
				for(let sc of scList){
					let scdate = "";
					if(sc.SCDATE != null){
					scdate = sc.SCDATE.split(' ')[0];
					let scyear = scdate.split('/')[0];
					let scmouth = scdate.split('/')[1];
					let scday = scdate.split('/')[2];
						if(nowDay.getFullYear() == scyear && nowDay.getMonth()+1 == scmouth && nowDay.getDate() == scday){
							newDIV.className = "today";
						}
					}
						
				}
				/*
                else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우 
                	console.log(today.getFullYear());
                console.log(today.getMonth());
                console.log(today.getDate())
                    newDIV.className = "today";
                    newDIV.onclick = function () { choiceDate(this); }
                }
                else {                                      // 미래인 경우
                    newDIV.className = "futureDay";
                    newDIV.onclick = function () { choiceDate(this); }
                }
				*/
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
        function prevCalendar(scList) {
            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
            buildCalendar(scList);    // 달력 다시 생성
        }
        // 다음달 버튼 클릭
        function nextCalendar(scList) {
            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
            buildCalendar(scList);    // 달력 다시 생성
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
