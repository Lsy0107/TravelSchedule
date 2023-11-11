<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <script src="https://kit.fontawesome.com/c8056a816e.js" crossorigin="anonymous"></script>
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
        <style>
            #img {
                width: 150px;
                height: 150px;
            }

            .Disn {
                display: none;
            }

            body {
                background-color: white;
            }

            .img {
                width: 300px;
                height: 300px;
                padding: 20px;
            }

            .ReTextArea {
                width: 100%;
                height: 500px;
                padding: 10px;
                border-radius: 10px;
            }

            .ReTitle {
                text-align: center;
                margin-bottom: 4px;
            }

            .Title {
                width: 100%;
                height: 60px;
                padding: 10px;
                border-radius: 10px;
                font-size: 25px;
            }

            .wrap {
                width: 60%;
                margin-left: auto;
                margin-right: auto;
                margin-top: 115px;
                margin-bottom: 50px;
                background-color: white;
                padding: 20px;
                border-radius: 25px;
                box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0 4px 20px 0 rgba(0,0,0,0.19);
            }

            .disnone {
                display: none;
            }

            .imgDiv {
                overflow-x: scroll;
                max-width: 100%;
            }

            .tImg {
                display: flex;
            }

            .fImg {
                display: flex;
            }


            .hit {
                max-width: 16%;
                min-width: 16%;
                text-align: center;
                border-right: 1px solid #ababab;
            }

            .id {
                width: 100%;
                font-size: 19px;
            }
            .ReWriter{
                text-align: center;
            }

            .like {
                max-width: 16%;
                min-width: 16%;
                text-align: center;
            }

            #like {
                font-size: 40px;
            }

            .ReInfo {
                display: flex;
            }

            .LikeArea>.fa-solid {
                color: #60b7d1;
            }

            .LikeArea {
                display: flex;
                margin-left: auto;

                width: max-content;
                margin-right: auto;
                padding: 15px;
            }

            #lknum {
                margin-top: auto;
                margin-bottom: auto;
                font-size: 25px;
                margin-left: 10px;
            }

            .fa-regular {
                color: #000000;
            }

            .InfoWrap {
                background: white;
                max-width: 17%;
                min-width: 17%;
                border: 1px solid;
                border-radius: 15px;
                padding: 8px;
                position: absolute;
                right: 26px;
                top: 120px;
            }

            .InfoHr {
                border: 1px solid black;
                margin: 3px;
            }

            .InfoTitle {
                margin: 0px;
                font-size: 16px;
                text-align: center;
            }

            .pTag {
                margin: 5px;
                text-overflow: ellipsis;
                white-space: nowrap;
                overflow: hidden;
            }

            .ReDate {
                text-align: right;
                width: 95%;
            }

            #Rdate {
                font-size: 20px;
            }
        </style>
    </head>

    <body class="d-flex flex-column h-100">

        <%@ include file="/WEB-INF/views/include/menu.jsp" %>

            <div class="wrap">
                <input type="text" class="Recode Disn">
                <div class="ReTitle">
                    <span class="Title" name="title" placeholder="제목">${Re.RETITLE}</span>
                </div>
                <div class="ReWriter">
                    <div class="id">작성자 : ${Re.MID}</div>
                </div>
                <div class="ReInfo d-flex justify-content-end">
                    <div class="hit">조회수 : ${Re.REHIT}</div>
                    <div class="like">추천 : ${Re.LKNUM}</div>
                </div>
                <div class="ReDate">
                    <span id="Rdate">${Re.REDATE}</span>
                </div>
                <div class="ReContents">
                    <textarea class="ReTextArea" name="contents" readonly>${Re.RECOMMENT}</textarea>
                </div>
                <div class="LikeArea">
                    <i class="fa-regular fa-thumbs-up" id="like" onclick="IncreaseLike('${Re.RECODE}','review')"></i>
                    <p class="lknum" id="lknum">${Re.LKNUM }</p>
                </div>
                <div class="RePhotoArr">
                    <c:forEach var="ph" items="${Ph}" varStatus="status">
                        <img src="/resources/ReviewPhoto/${ph}" alt="">
                    </c:forEach>
                </div>



            </div>
            <div class="InfoWrap">
                <p class="InfoTitle">다녀온 여행지</p>
                <hr class="InfoHr">
                <c:forEach items="${TdList}" var="td">
                    <p class="pTag">${td.tdname}</p>
                </c:forEach>
                <c:forEach items="${FeList}" var="fe">
                    <p class="pTag">${fe.fename}</p>
                </c:forEach>
            </div>

            <!-- Footer-->
            <%@ include file="/WEB-INF/views/include/footer.jsp" %>
                <!-- Bootstrap core JS-->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                <!-- Core theme JS-->
                <script src="resources/js/scripts.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

                <script type="text/javascript">

                    function chageDisplay(seloption) {
                        let meminfoTag = document.querySelector('#meminfoTag');
                        let weatherinfoTag = document.querySelector('#weatherTag');
                        let meminfoA = document.querySelector('#meminfoA');
                        let weatherA = document.querySelector('#weatherA');
                        switch (seloption) {
                            case 'meminfo':
                                if (meminfoTag.classList.contains('disnone')) {
                                    weatherinfoTag.classList.add('disnone');
                                    meminfoTag.classList.remove('disnone');
                                    meminfoA.classList.add('active');
                                    weatherA.classList.remove('active');
                                }
                                break;
                            case 'weather':
                                if (weatherTag.classList.contains('disnone')) {
                                    weatherinfoTag.classList.remove('disnone');
                                    meminfoTag.classList.add('disnone');
                                    meminfoA.classList.remove('active');
                                    weatherA.classList.add('active');
                                }
                                break;
                        }
                    }
                </script>

                <script>
                    function IncreaseLike(recode, seloption) {
                        console.log(recode);
                        if ("${sessionScope.loginId}" == "") {
                            alert('로그인후 이용 가능합니다.');
                            location.href = "${pageContext.request.contextPath}/memberLoginForm"
                        } else {
                            $.ajax({
                                url: "/clickHeart",
                                type: "post",
                                data: {
                                    'mid': "${sessionScope.loginId}",
                                    'code': recode,
                                    "seloption": seloption
                                },
                                aysnc: false,
                                success: function (res) {
                                    console.log('클릭');
                                    let lknum = document.querySelector('.lknum');
                                    let likeDiv = document.querySelector('.like');
                                    let like = document.querySelector('#like');
                                    const cl = document.querySelector('#like').classList;
                                    if (cl.contains("fa-regular")) {
                                        like.classList.replace('fa-regular', 'fa-solid');
                                        lknum.innerText = res;
                                        likeDiv.innerText = '추천 수 : ' + res;
                                        console.log(res);
                                    } else {
                                        like.classList.replace('fa-solid', 'fa-regular');
                                        lknum.innerText = res;
                                        likeDiv.innerText = '추천 수 : ' + res;
                                        console.log(res);
                                    }

                                }
                            });

                        }
                    }
                </script>
                <script>
                    let like = document.querySelector('#like');
                    const cl = document.querySelector('#like').classList;
                    let Y = 'Y';
                    let N = 'N';
                    if (${ like } == 'Y') {
                        like.classList.replace('fa-regular', 'fa-solid');
                    }
                </script>
    </body>

    </html>