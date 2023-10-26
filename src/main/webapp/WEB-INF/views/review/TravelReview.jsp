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
                    <c:forEach items="${Cal}" var="cl" varStatus="Cl">
                        <div class="Ctitle" data-bs-toggle="modal" data-bs-target="#exampleModal"
                            onclick="PrintSchedule('${cl.cdcode}')">
                            <p class="cdname">${cl.cdname}</p>

                            <c:choose>
                                <c:when test="${cl.cdstate == 'N'}">
                                    <button class="reviewBtn btn btn-outline-primary"
                                        onclick="location.href='ReviewWriteForm?cdcode=${cl.cdcode}'">리뷰 작성</button>
                                </c:when>
                                <c:when test="${cl.cdstate == 'R'}">
                                    <button class="reviewBtn btn btn-outline-success"
                                    onclick="location.href='ReviewFix?cdcode=${cl.cdcode}'">리뷰 수정</button>
                                    <button class="reviewBtn btn btn-outline-danger"
                                    onclick="return DeleteReview('${cl.cdcode}')">리뷰 삭제</button>
                                </c:when>
                            </c:choose>
                        </div>
                    </c:forEach>
                </div>

            </div>
            </div>

            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">${sessionScope.loginId}님의 상세계획표</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body" id="selectCalendar">
                            <div class="tdArea">
                                여행지 부분
                            </div>
                            <hr>
                            <div class="feArea">
                                축제 부분
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
                    let currentCdcode = null;
                    function PrintSchedule(cdcode) {
                        console.log('선택한 캘린더 : ' + cdcode);
                        $.ajax({
                            type: 'post',
                            url: 'PrintSchedule',
                            data: {
                                'cdcode': cdcode,
                            },
                            dataType: 'json',
                            async: false,
                            success: function (e) {
                                console.log(e);
                                currentCdcode = cdcode;
                                Print(e);
                            }
                        })
                    }

                    function Print(Val) {
                        let tdnameList = [];
                        let fenameList = [];
                        let codeList = [];
                        codeList = Val;
                        for (let code in codeList) {
                            //         console.log(codeList[code].tdcode);
                            //        console.log(codeList[code].fecode);
                            if (codeList[code].fecode == null) {
                                $.ajax({
                                    type: 'get',
                                    url: 'getTdName',
                                    data: {
                                        'tdcode': codeList[code].tdcode,
                                        'cdcode': currentCdcode
                                    },
                                    async: false,
                                    dataType: 'json',
                                    success: function (tdname) {
                                        tdnameList.push(tdname);
                                        console.log(tdnameList);
                                    }
                                });
                            }
                            if (codeList[code].tdcode == null) {
                                $.ajax({
                                    type: 'get',
                                    url: 'getFeName',
                                    data: {
                                        'fecode': codeList[code].fecode,
                                        'cdcode': currentCdcode
                                    },
                                    async: false,
                                    dataType: 'json',
                                    success: function (fename) {
                                        fenameList.push(fename);
                                        console.log(fenameList);
                                    }
                                });
                            }
                        }

                        printList(tdnameList, fenameList);
                    }

                    function printList(tdnameList, fenameList) {
                        //   console.log('여행지이름 추가 확인 : ' + tdnameList);
                        //  console.log('축제 이름 추가 확인 : ' + fenameList);

                        //여행지 부분
                        console.log(tdnameList);

                        let tdAreaDiv = document.querySelector('.tdArea');
                        tdAreaDiv.innerHTML = "";
                        for (let td in tdnameList) {
                            let tdnameDiv = document.createElement('div');
                            tdnameDiv.innerText = tdnameList[td];

                            tdAreaDiv.appendChild(tdnameDiv);

                        }



                        //축제 부분
                        let feAreaDiv = document.querySelector('.feArea');
                        feAreaDiv.innerHTML = "";
                        for (let fe in fenameList) {
                            let fenameDiv = document.createElement('div');
                            fenameDiv.innerText = fenameList[fe];

                            feAreaDiv.appendChild(fenameDiv);
                        }
                    }
                </script>
                <script>
                    function DeleteReview(cdcode){
                        let DeleteConfirm = confirm('해당 리뷰를 삭제하시겠습니까?');

                        if(DeleteConfirm == true){
                            console.log(cdcode);
                            $.ajax({
                                type : 'get',
                                url : 'DeleteReview',
                                data : {'cdcode':cdcode},
                                dataType : 'json',
                                async : false,
                                success : function(e){
                                    console.log('삭제 성공');
                                    alert('리뷰를 성공적으로 삭제하였습니다.');
                                    location.href='${pageContext.request.contextPath}/'
                                }
                            });
                        }
                        else{
                            return false;
                        }
                    }
                </script>
    </body>

    </html>