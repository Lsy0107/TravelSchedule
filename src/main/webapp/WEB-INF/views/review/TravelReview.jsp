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
            .Cal {
                border: 1px solid;
                margin-top: 100px;
                width: 70%;
                margin-left: auto;
                margin-right: auto;
                height: 580px;
                overflow: scroll;
                overflow-x: hidden;
                background-color: white;
                border-radius: 15px;
            }

            .InnerCal {
                height: 95%;
                margin: 15px;
            }

            .Ctitle {
                padding: 20px;
                display: flex;
            }

            .Ctitle:hover {
                background-color: lightgrey;
                cursor: pointer;
            }

            .cdname {
                font-weight: bold;
                font-size: 20px;
            }

            .reviewBtn {}
        </style>
    </head>

    <body class="d-flex flex-column h-100" style="background-color: #e9e9e9;">

        <!-- Navigation-->
        <%@ include file="/WEB-INF/views/include/menu.jsp" %>
            <!-- contant 시작 -->

            <div class="Cal">
                <div class="InnerCal">
                    <c:forEach items="${Cal}" var="cl">
                        <div class="Ctitle" data-bs-toggle="modal" data-bs-target="#exampleModal"
                            onclick="PrintSchedule('${cl.cdcode}','${cl.tdcode}','${cl.fecode}')">
                            <p class="cdname">${cl.cdname}</p>
                            <button class="reviewBtn btn btn-outline-primary">리뷰 작성</button>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">상세 계획</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body" id="selectCalendar">
                            <div>
                                컨텐츠
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!-- contant 종료 -->

            <!-- Footer-->
            <%@ include file="/WEB-INF/views/include/footer.jsp" %>
                <!-- Bootstrap core JS-->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                <!-- Core theme JS-->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
                <script src="resources/js/scripts.js"></script>
                <script>

                </script>
                <script>
                    function PrintSchedule(cdcode, tdcode, fecode) {
                        console.log('선택한 캘린더 : ' + cdcode+'_'+tdcode+'_'+fecode);
                        $.ajax({
                            type: 'post',
                            url: 'PrintSchedule',
                            data: {
                                'cdcode': cdcode,
                                'tdcode': tdcode,
                                'fecode': fecode
                            },
                            dataType: 'json',
                            async: false,
                            success: function (e) {
                                Print(e);
                            }
                        })
                    }
                    function Print(Val) {
                        console.log(Val);
                        let ScheduleListDiv = document.querySelector('modal-body');
                        ScheduleListDiv.innerHTML = "";
                        let ScList = [];
                        ScList = Val;
                        for (let Sc of ScList) {
                            let InnerDiv = document.createElement('div');
                            InnerDiv.innerText = Sc.cd

                        }
                    }
                </script>
    </body>

    </html>