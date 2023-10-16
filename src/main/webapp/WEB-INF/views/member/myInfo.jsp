<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>MyPage</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
        
        <style type="text/css">
			.profile-img.big {
				width: 150px;
				height: 150px;
				border-radius: 100px;
				border: 3px solid black;
			}
        </style>
        
    </head>
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <%@ include file="/WEB-INF/views/include/menu.jsp" %>
            <!-- contant 시작 -->
            <div class="row" style="margin-top:90px;"></div>
			 <div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>My Page</h3>
			</div>
			<div>
				<form id="myForm" action="${pageContext.request.contextPath }/memberUpdate" method="post">
					<p>
					<c:choose>
						<c:when test="${mInfo.mprofile  == null}">
							<img src="/resources/memberProfile/default.jpg" class="img-thumbnail" alt="..." style="width: 150px;">
						</c:when>
						<c:otherwise>
							<img src="/resources/memberProfile/${mInfo.mprofile }" class="img-thumbnail" alt="${mInfo.mprofile }" style="width: 150px;">
						</c:otherwise>
					</c:choose>
					</p>
					<p>
						<label><h5>ID</h5></label> 
						<input class="w3-input" type="text" name="mid" readonly value="${mInfo.mid}"> 
					</p>
					<p>
						<label><h5>Nickname</h5></label> 
						<input class="w3-input" type="text" id="mnickname" name="mnickname" value="${mInfo.mnickname}" required> 
					</p>
					<p class="w3-center">
						<button type="submit" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">회원정보 변경</button>
					</p>
				</form>
				<br />
				<form id="pwForm" action="${pageContext.request.contextPath }/updatePw" method="post" onsubmit="return pwCheck(this)">	
					<input type="hidden" id="mid" name="mid" value="${mInfo.mid}">
					<input type="hidden" id="mpw2" name="mpw2" value="${mInfo.mpw}">
					<p>
						<label>Password</label>
						<input class="w3-input" id="old_pw" name="old_pw" type="password" required>
					</p>
					<p>
						<label>New Password</label> 
						<input class="w3-input" id="mpw" name="mpw" type="password" required>
					</p>
					<p>
						<label>Confirm</label>
						<input class="w3-input" type="password" id="pw2" type="password" required>
					</p>
					<p class="w3-center">
						<button type="submit" id="joinBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">비밀번호 변경</button>
					</p>
				</form>
			</div>
		</div>
	</div>	
		<!-- contant 종료 -->
        </main>
        <!-- Footer-->
       <%@ include file="/WEB-INF/views/include/footer.jsp"%>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
        
		<script type="text/javascript">
			let msg = '${msg }'
			if(msg.length > 0){
				alert(msg);
			}
		</script>
        
        <script type="text/javascript">
	        function pwCheck(obj) {
	        	console.log("pwCheck - 호출");
				let mpw = obj.mpw2.value;
				let oldPw = obj.old_pw.value;
				
				let newPw = obj.mpw.value;
				let newPw2 = obj.pw2.value;
				console.log(mpw);
				console.log(oldPw != mpw);
				if(oldPw != mpw){
					alert('기존비밀번호가 일치하지 않습니다.');
					oldPw.focus();
					return false;
				}
				if(newPw != newPw2){
					alert('새로운비밀번호가 일치하지 않습니다.');
					newPw.focus();
					return false;
				}
				return true;
			}
        </script>
        
    </body>
</html>
    