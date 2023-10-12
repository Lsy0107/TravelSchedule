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
				<form id="myForm" action="" method="post">
					<p>
						<img src="" class="img-thumbnail" alt="...">
					</p>
					<p>
						<label><h5>ID</h5></label> 
						<input class="w3-input" type="text" id="id" name="id" readonly value="${mInfo.mid}"> 
					</p>
					<p>
						<label><h5>Nickname</h5></label> 
						<input class="w3-input" type="text" id="email" name="email" value="${mInfo.mnickname}" required> 
					</p>
					<p class="w3-center">
						<button type="submit" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">회원정보 변경</button>
					</p>
				</form>
				<br />
				<form id="pwForm" action="" method="post">	
					<input type="hidden" name="id" value="">
					<p>
						<label>Password</label>
						<input class="w3-input" id="old_pw" name="old_pw" type="password" required>
					</p>
					<p>
						<label>New Password</label> 
						<input class="w3-input" id="pw" name="pw" type="password" required>
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
	        $(function(){
	    		if(${msg ne null}){
	    			alert('${msg}');
	    		};
	    		
	    		if($("#pwForm").submit(function(){
	    			if($("#pw").val() !== $("#pw2").val()){
	    				alert("비밀번호가 다릅니다.");
	    				$("#pw").val("").focus();
	    				$("#pw2").val("");
	    				return false;
	    			}else if ($("#pw").val().length < 8) {
	    				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
	    				$("#pw").val("").focus();
	    				return false;
	    			}else if($.trim($("#pw").val()) !== $("#pw").val()){
	    				alert("공백은 입력이 불가능합니다.");
	    				return false;
	    			}
	    		}));
	    	})
        </script>
        
    </body>
</html>
    