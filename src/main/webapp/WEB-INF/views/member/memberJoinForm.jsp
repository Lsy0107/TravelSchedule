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
.button_container {
    position: relative;
    bottom: -30px;
    width: 100%;
}

.btn1 {
  width: 60%;
  border: none;
  display: block;
  text-align: center;
  cursor: pointer;
  text-transform: uppercase;
  outline: none;
  overflow: hidden;
  position: relative;
  color: #fff;
  font-weight: 700;
  font-size: 15px;
  background-color: #222;
  padding: 17px 60px;
  margin: 0 auto;
  box-shadow: 0 5px 15px rgba(0,0,0,0.20);
}

.btn1 span {
  position: relative; 
  z-index: 1;
}

.btn1:after {
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  height: 490%;
  width: 140%;
  background: #78c7d2;
  -webkit-transition: all .5s ease-in-out;
  transition: all .5s ease-in-out;
  -webkit-transform: translateX(-98%) translateY(-25%) rotate(45deg);
  transform: translateX(-98%) translateY(-25%) rotate(45deg);
}

.btn1:hover:after {
  -webkit-transform: translateX(-9%) translateY(-25%) rotate(45deg);
  transform: translateX(-9%) translateY(-25%) rotate(45deg);
}




.joinContents {
    background-color: white;
	max-width: 900px;
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


.PrimaryLogin {
	border: none;
	padding: 10px;
}

.OnceLogin {
	border: none;
	padding: 10px;
}

.leftArea{
    float: left;
    box-sizing: border-box;
    width: 50%;
    height: 100%;
    
}
.joinArea {
	float: right;
    box-sizing: border-box;
    width: 50%;
    height: 100%;
}

#password, #name, #date, #profile {
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



#id {
	width: 75%;
	height: 48px;
	padding: 0 20px;
	margin-bottom: 5px;
    border-top: none;
    border-right: none;
    border-left: none;
    outline: none;
    border-bottom: 1px solid black;
    margin-left: auto;
    margin-right: auto;
    display: block;
}

#idC {
	width: 25%;
	height: 48px;
	padding: 0 20px;
	margin-bottom: 5px;
	background-color: rgb(151, 136, 177);
	border: 1px solid rgb(151, 136, 177);
	border-radius: 12px;
}

#memail{
	width: 75%;
	height: 48px;
	padding: 0 20px;
	margin-bottom: 5px;
    border-top: none;
    border-right: none;
    border-left: none;
    outline: none;
    border-bottom: 1px solid black;
	margin-left: auto;
    margin-right: auto;
    display: block;
}

#Join-form>#check {
	margin-top: 10px;
	font-size: 10px;
}


#profile {
	padding: 8px;
}

#MsgId, #MsgPw {
	font-size: 8px;
}
.formTag{
    margin-top: 50px;
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
 
.joinContents {
    position: relative;
    animation: fadeInUp 2s;
}
.Title{
    text-align: center;
    position: relative;
    top: 25px;    }
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
.leftArea img{
    width: 100%;
    height: 100%;
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

#body{
    background-color: #eec0c6;
    background-image: linear-gradient(315deg, #eec0c6 0%, #7ee8fa 74%);
}
</style>


</head>

<body class="d-flex flex-column h-100" id="body">
	<main class="flex-shrink-0">
		<!-- Navigation-->
		<%@ include file="/WEB-INF/views/include/menu.jsp"%>
		<!-- content 시작 -->
		<div class="joinContents">
            <div class="leftArea">
            
                <img src="${pageContext.request.contextPath}/resources/3509.jpg" alt="">
            </div>
			<div class="joinArea">                
           		<h2 class="Title">회원가입</h2>
				<div class="formTag">
					<form action="" method="post" enctype="multipart/form-data">

						<input type="text" id="id" name="mid" placeholder="아이디"
    						onkeyup="idCheck()" class="formInputCheck">
						<p id="MsgId"></p>
                        <div id="passArea">
                            <input type="password" id="password" name="mpw" placeholder="비밀번호">
                            <i class="fa-solid fa-eye-slash"></i>
                            <p id="MsgPw"></p>
                        </div>

						<input type="text" id="name" name="mname" placeholder="이름입력">

						<div>
							<input type="text" id="memail" name="memail" placeholder="eamil@example.com">
						</div>
						<input type="file" id="profile" name="mfile" value="파일선택">

						<div class="button_container">
                            <button class="btn1" type="submit"><span>회원가입</span></button>
                        </div>
					</form>

				</div>
				<p style="position: relative; left: 25%; margin-top: 110px;">
					<a href="">회원가입</a> <a href="">아이디 찾기</a> <a href="">비밀번호 찾기</a>
				</p>
			</div>
		</div>
		<!-- content 종료 -->
	</main>
	<!-- Footer-->
	<footer class="bg-dark py-4 mt-auto">
		<div class="container px-5">
			<div
				class="row align-items-center justify-content-between flex-column flex-sm-row">
				<div class="col-auto">
					<div class="small m-0 text-white">Copyright &copy; Your
						Website 2023</div>
				</div>
				<div class="col-auto">
					<a class="link-light small" href="#!">Privacy</a> <span
						class="text-white mx-1">&middot;</span> <a
						class="link-light small" href="#!">Terms</a> <span
						class="text-white mx-1">&middot;</span> <a
						class="link-light small" href="#!">Contact</a>
				</div>
			</div>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
    <script src="https://kit.fontawesome.com/148f0d76e9.js" crossorigin="anonymous"></script>
	<!-- jQuery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

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

	<script>

            let submitBtnTag = document.getElementById('btn');
            let formInputEls = document.querySelectorAll('form input[type="text"] form input[type="password"]');
            console.log(formInputEls)


            let submitBtn = true;
            for (let inputel of formInputEls) {
                inputel.addEventListener('keyup', function () {

                    for (let checkEl of formInputEls) {
                        console.log("checkEl.value.length : " + checkEl.value.length)
                        if (checkEl.value.length == 0) {
                            submitBtn = false;
                            submitBtnTag.setAttribute('disabled', 'disabled');
                        }
                    }

                    if (submitBtn && idch) {
                        console.log('회원가입 버튼 생성')
                        //submitBtnTag.disabled = false;
                        submitBtnTag.removeAttribute('disabled');
                    }

                    submitBtn = true;
                })

            }


        </script>

	<script type="text/javascript">
            let idch = false;
            function idCheck() {
                let idEl = document.querySelector('#id');
                console.log("확인할 아이디 " + idEl.value);

                $.ajax({
                    type: "get",
                    url: "idCheck",
                    data: {
                        "id": idEl.value
                    },
                    success: function (repl) {
                        console.log(repl);
                        if (repl == 'Y') {
                            $('#MsgId').css("color", "green").text("사용가능한 아이디입니다.");
                            let btnTag = document.getElementById("btn")
                            //btnTag.disabled = false;
                            idch = true;
                        } else if (repl == 'N') {
                            $('#MsgId').css("color", "red").text("중복된 아이디입니다.");
                            let btnTag = document.getElementById("btn")
                            btnTag.disabled = true;
                            let idch = false;
                        } else if (repl == 'F') {
                            $('#MsgId').css("color", "#4D2B8A").text("아이디를 입력하세요.");
                            let btnTag = document.getElementById("btn")
                            btnTag.disabled = true;
                            let idch = false;
                        }
                    }
                });
            }
        </script>
</body>

</html>