<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                .wrap {
                    width: 75%;
                    margin-left: auto;
                    margin-right: auto;
                    margin-top: 115px;
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

                img {
                    width: 300px;
                    height: 300px;
                }

                .ReTextArea {
                    width: 100%;
                    height: 500px;
                }

                .Title {
                    width: 100%;
                    height: 60px;
                    padding: 10px;
                    border-radius: 10px;
                }
            </style>
        </head>

        <body class="d-flex flex-column h-100">
            <%@ include file="/WEB-INF/views/include/menu.jsp" %>
                <form action="">
                    <div class="wrap">
                        <div class="ReTitle">
                            <input type="text" class="Title" placeholder="제목">
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
                                            <img src="${td.TDPHOTO}" alt="">
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="fest disnone" id="weatherTag">
                                    <div class="fImg">
                                        <c:forEach var="fe" items="${Fe}">
                                            <img src="${fe.FEPOSTER}" alt="">
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ReContents">
                            <textarea class="ReTextArea" name=""></textarea>
                        </div>

                    </div>

                </form>



                <!-- Footer-->
                <%@ include file="/WEB-INF/views/include/footer.jsp" %>
                    <!-- Bootstrap core JS-->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                    <!-- Core theme JS-->
                    <script src="resources/js/scripts.js"></script>

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