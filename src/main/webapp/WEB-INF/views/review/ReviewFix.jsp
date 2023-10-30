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
        <style>
            #img {
                width: 150px;
                height: 150px;
            }

            .Disn {
                display: none;
            }

            body {
                background-color: lightgrey;
            }

            img {
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

            .Title {
                width: 100%;
                height: 60px;
                padding: 10px;
                border-radius: 10px;
            }

            .wrap {
                width: 60%;
                margin-left: auto;
                margin-right: auto;
                margin-top: 115px;
                background-color: white;
                padding: 20px;
                border-radius: 25px;
                box-shadow: grey 10px 10px;
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
        </style>
    </head>

    <body class="d-flex flex-column h-100">

        <%@ include file="/WEB-INF/views/include/menu.jsp" %>

            <div class="wrap">
                <input type="text" class="Recode Disn" value="${getRe.RECODE}">
                <div class="ReTitle">
                    <input type="text" class="Title" name="title" placeholder="제목" value="${getRe.RETITLE}">
                </div>
                <div class="ReSelImg">
                    <div class="card-header">
                        <ul class="nav nav-tabs card-header-tabs">
                            <li class="nav-item"><a id="meminfoA" class="nav-link active" aria-current="true"
                                    href="javascript:chageDisplay('meminfo')">여행지</a></li>
                            <li class="nav-item"><a id="weatherA" class="nav-link"
                                    href="javascript:chageDisplay('weather')">축제</a></li>
                        </ul>
                    </div>
                    <div class="imgDiv">
                        <div class="tdest" id="meminfoTag">
                            <div class="tImg">
                                <c:forEach var="td" items="${Td}">
                                    <img src="${td.tdphoto}" alt="">
                                </c:forEach>
                            </div>
                        </div>
                        <div class="fest disnone" id="weatherTag">
                            <div class="fImg">
                                <c:forEach var="fe" items="${Fe}">
                                    <img src="${fe.feposter}" alt="">
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ReContents">
                    <textarea class="ReTextArea" name="contents">${getRe.RECOMMENT}</textarea>
                </div>
                <div class="RePhotoArr">
                    <c:forEach var="ph" items="${Ph}" varStatus="status">
                        <img src="/resources/ReviewPhoto/${ph}" alt="">
                    </c:forEach>
                </div>

                <div class="FormBtn">
                    <button class="btn btn-outline-success" onclick="return ReviewSave()">저장</button>
                    <button class="btn btn-outline-warning" onclick="return ReviewCancel()">취소</button>
                </div>
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
                    function ReviewSave() {
                        let Rsave = confirm('지금까지의 변경을 저장하시겠습니까?');

                        if(Rsave == true){
                            let title = document.querySelector(".Title");
                            let contents = document.querySelector(".ReTextArea");
                            let Recode = document.querySelector(".Recode");

                            let UpTitle = title.value;
                            let UpContents = contents.value;
                            let Re = Recode.value;
                            console.log(UpTitle);
                            console.log(UpContents);
                            console.log(Re);

                            $.ajax({
                                type : 'get',
                                url : 'UpdateReview',
                                data : {'title' : UpTitle,
                                        'contents' : UpContents,
                                        'recode' : Re},
                                dataType : 'json',
                                async : false,
                                success : function(r){
                                    console.log('성공');
                                    location.href='${pageContext.request.contextPath}/'
                                }
                            })
                        }else{
                            return false;
                        }
                    }

                    function ReviewCancel() {
                        let Rcancel = confirm('지금까지의 변경을 취소하고 돌아가시겠습니까?');

                        if (Rcancel == true) {
                            location.href='${pageContext.request.contextPath}/TravelReview';
                        } else {
                            return false;
                        }
                    }
                </script>
    </body>

    </html>