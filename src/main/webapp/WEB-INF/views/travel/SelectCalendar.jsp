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
</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- Navigation-->
		<%@ include file="/WEB-INF/views/include/menu.jsp"%>
		<!-- contant 시작 -->
		<div class="row" style="margin-top: 90px;"></div>
		<button onclick="makeCalender()">캘린더 추가하기</button>
		selectCalendar페이지
		<div>
		<c:forEach items="${cdList }" var="cd">
		<a href="/travelSc?cdcode=${cd.cdcode }">캘린더 이름 : ${cd.cdname }</a>
		
		<br>
		</c:forEach>
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
		console.log("${cdList}")
		function makeCalender() {
			let cdname = prompt("캘린더 이름을 입력해주세요");
			console.log();
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
	$(document).ready({
		if("${sessionScope.loginId == ''}"){
			location.herf="/memberLoginForm";
		}
	})
	</script>
</body>
</html>
