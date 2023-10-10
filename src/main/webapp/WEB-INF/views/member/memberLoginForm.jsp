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

<style type="text/css">
    .loginContents{
        max-width: 492px;
        min-width: 360px;
        border: 1px solid black;
        min-height: 60vh;
        margin: 0 auto;
        position: relative;
        top: 50%;
        bottom: 50%;
        height: 60vh;
        margin-top: -75px;
        box-shadow: 15px 15px lightslategrey;
    }
    .idArea{
        width: 90%;
        padding: 8px;
        display: block;
        margin-bottom: 25px;
        margin-left: auto;
        margin-right: auto;
    }
    .pwArea{
        width: 90%;
        padding: 8px;
        display: block;
        margin-bottom: 25px;
        margin-left: auto;
        margin-right: auto;
    }
    .btnArea{
        width: 70%;
        border: 1px solid;
        margin: 0 auto;
        display: block;
        padding: 10px;
        border-radius: 15px;
        position: relative;
        bottom: -50px;
    }
    .PrimaryLogin{
        border: none;
        padding: 10px;
    }
    .OnceLogin{
        border: none;
        padding: 10px;
    }
    .loginArea{
        position: relative;
        top: 30px;
        
    }
    @keyframes fadeInUp {
    0% {
        opacity: 0;
        transform: translate3d(0, 25%, 0);
    }
    to {
        opacity: 1;
        transform: translateZ(0);
    }
}
.loginContents {
    position: relative;
    animation: fadeInUp 2s;
    background-color: white;
}
#body{
    background-color: #eec0c6;
    background-image: linear-gradient(315deg, #eec0c6 0%, #7ee8fa 74%);
}
#password, #id {
	width: 75%;
	height: 48px;
	padding: 0 20px;
	margin-bottom: 5px;
    margin-left: auto;
    margin-right: auto;
    display: block;
    border-top: none;
    border-right: none;
    border-left: none;
    outline: none;
    border-bottom: 1px solid black;
}
input[type=password]::-ms-clear {
   display: none;
    width: 0;
    height: 0;
}
input[type=password]::-ms-reveal {
    display: none;
    width: 0;
    height: 0;
}
div#passArea{
    position: relative;
}
div#passArea i{
    position: absolute;
    left: 80%;
    top: 17px;
    color: black;
}
.Title{
    text-align: center;
}
</style>


</head>
<body class="d-flex flex-column h-100" id="body">
	<main class="flex-shrink-0">
		<!-- Navigation-->
		<%@ include file="/WEB-INF/views/include/menu.jsp"%>
		<!-- content 시작 -->
		<div class="loginContents">
			<div id="wrap">
                <ul style="display: block;">
                    <li style="display: inline-block; margin-top: 15px;"><button class="PrimaryLogin btn btn-outline-dark">기본 로그인</button></li>
                    <li style="display: inline-block;"><button class="OnceLogin btn btn-outline-dark">일회용 로그인</button></li>
                </ul>
            </div>
            <hr>
            <div class="loginArea">
                <h2 class="Title">로그인</h2>
                <div>
                    <form action="/memberLogin">
                        <input type="text" id="id" name="mid" placeholder="아이디">
                        <div id="passArea">
                            <input type="password" id="password" name="mpw" placeholder="비밀번호">
                            <i class="fa-solid fa-eye-slash"></i>
                        </div>
                        <input type="submit" class="btn btnArea btn-outline-secondary" value="로그인">
                    </form>
                </div>
                <p style="position: relative; left: 24%; bottom: -80px;">
                    <a href="/memberJoinForm">회원가입</a>
                    <a href="">아이디 찾기</a>
                    <a href="">비밀번호 찾기</a>
                </p>
            </div>
		</div>
		<!-- content 종료 -->
	</main>
	<!-- Footer-->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>

    <!-- jQuery -->
	<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

    <script src="https://kit.fontawesome.com/148f0d76e9.js" crossorigin="anonymous"></script>

    <script>
        $(document).ready(function(){
            $('#passArea i').on('click',function(){
                $('input').toggleClass('active');
                if($('input').hasClass('active')){
                    $(this).attr('class',"fa-solid fa-eye")
                    .prev('input').attr('type',"text");
                }else{
                    $(this).attr('class',"fa-solid fa-eye-slash")
                    .prev('input').attr('type','password');
        }
    });
});
        
    </script>
</body>
</html>
