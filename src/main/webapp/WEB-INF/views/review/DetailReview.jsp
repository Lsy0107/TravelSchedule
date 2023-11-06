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
                <input type="text" class="Recode Disn">
                <div class="ReTitle">
                    <input type="text" class="Title" name="title" placeholder="제목" value="${Re.RETITLE}" readonly>
                </div>
                
                <div class="ReContents">
                    <textarea class="ReTextArea" name="contents" readonly>${Re.RECOMMENT}</textarea>
                </div>
                <div class="RePhotoArr">
                    <c:forEach var="ph" items="${Ph}" varStatus="status">
                        <img src="/resources/ReviewPhoto/${ph}" alt="">
                    </c:forEach>
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
    </body>

    </html>