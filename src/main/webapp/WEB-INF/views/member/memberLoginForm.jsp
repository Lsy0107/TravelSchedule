<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />

        <style type="text/css">
            .loginContents {
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

            .idArea {
                width: 90%;
                padding: 8px;
                display: block;
                margin-bottom: 25px;
                margin-left: auto;
                margin-right: auto;
            }

            .pwArea {
                width: 90%;
                padding: 8px;
                display: block;
                margin-bottom: 25px;
                margin-left: auto;
                margin-right: auto;
            }

            .btnArea {
                width: 70%;
                border: 1px solid;
                margin: 0 auto;
                display: block;
                padding: 10px;
                border-radius: 15px;
                position: relative;
                bottom: -50px;
            }

            .PrimaryLogin {
                border: none;
                padding: 10px;
            }

            .OnceLogin {
                border: none;
                padding: 10px;
            }

            .loginArea {
                position: relative;
                top: 30px;

            }

            .bg-wh {
                background-color: white;
                box-shadow: 0px 0px 10px #A2A2A2;
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

            #body {
                background-color: #eec0c6;
                background-image: linear-gradient(315deg, #eec0c6 0%, #7ee8fa 74%);
            }

            #password,
            #id {
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

            div#passArea {
                position: relative;
            }

            div#passArea i {
                position: absolute;
                left: 80%;
                top: 17px;
                color: black;
            }

            .Title {
                text-align: center;
            }

            .KakaoBtn,
            .NaverBtn {
                padding: 0px;
                border: none;
                background: none;
            }

            .KakaoBtn {
                position: relative;
                left: 190px;
                top: 20px;
            }

            .NaverBtn {
                position: relative;
                top: 20px;
                left: 209px;
            }

            .kakaoImg,
            .naverImg {
                width: 43px;
            }

            .LoginApiDiv {
                position: relative;
                top: 40px;
            }
        </style>

    </head>

    <body class="d-flex flex-column h-100" id="body">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <%@ include file="/WEB-INF/views/include/menu.jsp" %>
                <!-- content 시작 -->
                <div class="loginContents">
                    <hr>
                    <div class="loginArea">
                        <h2 class="Title">로그인</h2>
                        <div>
                            <form action="/memberLogin" type="post">
                                <input type="text" id="id" name="mid" placeholder="아이디">
                                <div id="passArea">
                                    <input type="password" id="password" name="mpw" placeholder="비밀번호">
                                    <i class="fa-solid fa-eye-slash"></i>
                                </div>
                                <input type="submit" class="btn btnArea btn-outline-secondary" value="로그인">
                            </form>
                        </div>
                        <div class="LoginApiDiv">
                            <button onclick="Login_Kakao()" class="KakaoBtn"><img class="kakaoImg"
                                    src="${pageContext.request.contextPath}/resources/img/카카오로그인버튼.png" alt=""></button>
                            <button id="naver_id_login" class="NaverBtn"><img class="naverImg"
                                    src="${pageContext.request.contextPath}/resources/img/네이버로그인버튼.png" alt=""></button>
                        </div>
                        <p style="position: relative; left: 45%; bottom: -80px;">
                            <a href="/memberJoinForm" >회원가입</a>
                        </p>
                    </div>
                </div>
                <!-- content 종료 -->
        </main>
        <!-- Footer-->
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
            <!-- Bootstrap core JS-->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
            <!-- Core theme JS-->
            <script src="resources/js/scripts.js"></script>

            <!-- jQuery -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

            <script src="https://kit.fontawesome.com/148f0d76e9.js" crossorigin="anonymous"></script>

            <!-- 네이버 로그인 JS -->
            <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
                charset="utf-8"></script>
            <!-- 카카오 로그인 JS -->
            <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js"
                integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH"
                crossorigin="anonymous"></script>
            <script type="text/javascript">
                Kakao.init('963b2e12b6b2948f660fa6eab737705a');
                Kakao.isInitialized();
            </script>
            <script type="text/javascript">
                function Login_Kakao() {
                    console.log('카카오 로그인 호출');
                    Kakao.Auth.authorize({
                        redirectUri: 'http://121.65.47.74:5575/memberJoinForm'
                    });
                }
                let authCode = '${param.code}';
                console.log("authCode : " + authCode);

                if (authCode.length > 0) {
                    console.log("인증토근 요청");
                    $.ajax({
                        type: 'post',
                        url: 'https://kauth.kakao.com/oauth/token',
                        contentType: 'application/x-www-form-urlencoded;charset=utf-8',
                        data: {
                            'grant_type': 'authorization_code',
                            'client_id': 'a3431cbff51101bc0a8832f02f739e85',
                            'redirect_uri': 'http://121.65.47.74:5575/memberJoinForm',
                            'code': authCode
                        },
                        success: function (response) {
                            console.log("인증토큰" + response.access_token);
                            Kakao.Auth.setAccessToken(response.access_token);

                            Kakao.API.request({
                                url: '/v2/user/me',
                            })
                                .then(function (response) {
                                    console.log("카카오 계정 정보")
                                    console.log(response)
                                    console.log("id : " + response.id);
                                    console.log("nickname : " + response.properties.nickname);
                                    console.log("profile_image : " + response.properties.profile_image);

                                    $.ajax({
                                        type: 'get',
                                        url: 'memberLogin_Kakao',
                                        data: { 'id': response.id },
                                        success: function (checkMember_kakao) {
                                            if (checkMember_kakao == 'Y') {
                                                alert('로그인 되었습니다');
                                                location.href = "/";
                                            } else {
                                                let check = confirm('가입된 정보가 없습니다\n 카카오 계정으로 가입하시겠습니까?')
                                                if (check) {
                                                    console.log("카카오 회원가입 기능 호출");
                                                    Join_kakao(response);

                                                }
                                            }
                                        }
                                    });
                                })
                                .catch(function (error) {
                                    console.log(error);
                                })
                        }
                    })
                }
            </script>

            <script>
                function Join_kakao(response) {
                    $.ajax({
                        type: 'get',
                        url: 'memberJoin_Kakao',
                        data: {
                            "mid": response.id,
                            "mnickname": response.properties.nickname,
                            "mprofile": response.properties.profile_image
                        },
                        success: function (Result) {
                            alert('카카오 계정으로 회원가입 되었습니다.');
                            location.href = "/memberJoinForm";
                        }

                    })
                }
            </script>

            <script>

                var naver_id_login = new naver_id_login("LBJBGOQrRWS1gNyVVoZX", "http://121.65.47.74:5575/memberJoinForm");
                var state = naver_id_login.getUniqState();
                naver_id_login.setButton("green", 1, 40);
                naver_id_login.setDomain("http://121.65.47.74:5575/memberJoinForm");
                naver_id_login.setState(state);

                naver_id_login.init_naver_id_login();

            </script>

            <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
                charset="utf-8"></script>
            <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
            <script type="text/javascript">
                var naver_id_login = new naver_id_login("LBJBGOQrRWS1gNyVVoZX", "http://121.65.47.74:5575/memberLoginForm");
                // 접근 토큰 값 출력

                // 네이버 사용자 프로필 조회
                naver_id_login.get_naver_userprofile("naverSignInCallback()");
                // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
                function naverSignInCallback() {
                    console.log(naver_id_login.getProfileData('nickname'));
                    console.log(naver_id_login.getProfileData('id'));
                    console.log(naver_id_login.getProfileData('profile_image'));
                    $.ajax({
                        type: 'get',
                        url: 'NaverLoginCheck',
                        data: {
                            'nickname': naver_id_login.getProfileData('nickname'),
                            'name': naver_id_login.getProfileData('name'),
                            'id': naver_id_login.getProfileData('id'),
                            'profile': naver_id_login.getProfileData('profile_image'),
                        },


                        success: function (res) {
                            console.log(res);
                            if (res == 'Y') {
                                alert('로그인 되었습니다');
                                location.href = "/";
                            } else {
                                console.log('네이버 계정 없음');
                                let check = confirm('가입된 정보가 없습니다\n 네이버 계정으로 가입하시겠습니까?')
                                if (check) {
                                    console.log("네이버 회원가입 기능 호출");
                                    Join_Naver(res);

                                }
                            }
                        }
                    });
                }

                function Join_Naver(response) {
                    console.log(response);
                    $.ajax({
                        type: 'get',
                        url: 'MemberJoin_Naver',
                        data: {
                            'mid': naver_id_login.getProfileData('id'),
                            'mprofile': naver_id_login.getProfileData('profile_image'),
                            'mnickname': naver_id_login.getProfileData('name')
                        },


                        success: function (result) {
                            alert('네이버 계정으로 회원가입 되었습니다.');
                            location.href = "/memberLoginForm"
                        }
                    })
                }

            </script>



            <script>
                $(document).ready(function () {
                    $('#passArea i').on('click', function () {
                        $('input').toggleClass('active');
                        if ($('input').hasClass('active')) {
                            $(this).attr('class', "fa-solid fa-eye")
                                .prev('input').attr('type', "text");
                        } else {
                            $(this).attr('class', "fa-solid fa-eye-slash")
                                .prev('input').attr('type', 'password');
                        }
                    });
                });

            </script>
            
			<script type="text/javascript">
				let msg = '${msg }'
				if(msg.length > 0){
					alert(msg);
				}
			</script>
    </body>

    </html>
