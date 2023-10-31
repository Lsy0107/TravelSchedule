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
                .pagination {
                    position: relative;
                    margin-left: 80px;
                }

                ol {
                    list-style: none;
                    display: flex;
                    padding: 0px;
                    position: absolute;
                }

                ol>li:hover {
                    background-color: lightgrey;
                    cursor: pointer;
                }

                .active {
                    background-color: rgb(105, 107, 109);
                }

                ol>li {
                    padding: 3px;
                }

                ol>li>a {
                    padding: 10px;
                    max-width: 50px;
                }

                i#leftCur {
                    position: absolute;
                    top: 15px;
                    left: 28px;
                }

                i#rightCur {
                    position: absolute;
                    top: 15px;
                    left: 200px;
                }

                div#map {
                    width: 100%;
                    position: relative;
                    top: 77px;
                    height: 685px;
                    margin-left: auto;
                    margin-right: auto;
                }

                .TdListArea {
                    position: relative;
                    display: block;
                    top: 150px;
                    border: 1px solid;
                    width: 75%;
                    margin-left: auto;
                    margin-right: auto;
                }

                .TdListIn {
                    margin-left: auto;
                    margin-right: auto;
                    max-height: 628px;
                    overflow: scroll;
                    width: 100%;
                    overflow-x: hidden;
                }

                .SearchArea {
                    border-bottom: 1px solid;
                }

                .SArea {
                    margin-top: 20px;
                    margin-bottom: 20px;
                    margin-left: auto;
                    margin-right: auto;
                    width: 308px;
                }

                .Search {
                    width: 250px;
                    border-radius: 10px;
                    padding: 5px;
                }

                #btnRoadmap {
                    display: block;
                    width: 144px;
                    text-align: center;

                }

                #btnSkyview {
                    display: block;
                    width: 144px;
                    text-align: center;
                    margin-top: 10px;
                }

                #SelectMapType {
                    position: relative;
                    bottom: 557px;
                    left: 15px;
                    z-index: 4;
                }

                .selected,
                .unselected {
                    border: 1px solid;
                    padding: 10px;
                    border-radius: 4px;
                    font-size: 15px;
                    cursor: pointer;
                }

                .selected {
                    color: #1D9AF2;
                    background-color: #292D3E;
                    border: 1px solid #1D9AF2;
                    border-radius: 4px;
                    padding: 10px;
                    cursor: pointer;

                    font-size: 15px;
                    box-shadow: 0 0 4px #999;
                    background-position: center;
                    transition: background-color 0.8s;
                }

                .selected:hover {
                    background: #47a7f5 radial-gradient(circle, transparent 1%, #47a7f5 1%) center/15000%;
                    color: white;
                }

                .selected:active {
                    background-color: #292d3e;
                    background-size: 100%;
                    transition: background-color 0s;
                }



                .TdestRecommendArea {
                    position: relative;
                    top: 80px;
                    display: flex;
                }

                .JejuIslandTdest {
                    border: 1px solid;
                    padding: 25px;
                    border-radius: 0px 25px 0px 25px;
                    margin-left: auto;
                    margin-right: 50px;
                    background-image: linear-gradient(120deg, #e0c3fc 0%, #8ec5fc 100%);
                    cursor: pointer;
                }

                .FestivalRecomm {
                    border: 1px solid;
                    padding: 25px;
                    border-radius: 25px 0px 25px 0px;
                    margin-left: 50px;
                    margin-right: auto;
                }

                #RecommendTitle {
                    font-size: 22px;
                    font-weight: bold;
                }

                .JejuIslandTdest>img {
                    width: 75px;
                    height: 75px;
                }

                .photo {
                    cursor: pointer;
                }

                div.contain {
                    padding: 9px;
                    display: flex;

                }

                .Bar {
                    border: 1px solid;
                    top: 860px;
                    position: sticky;
                    padding: 0px;
                }

                .StickyBar {
                    position: fixed;
                    bottom: 80px;
                    right: 40px;
                    z-index: 12;
                    width: 5%;
                }

                main {
                    position: relative;
                    padding-bottom: 2000px;
                }

                footer {
                    position: relative;
                }

                .content_wrap {
                    width: 75%;
                    margin-left: auto;
                    margin-right: auto;
                }

                .map_wrap {
                    width: 100%;


                }

                .Tdest_wrap {
                    width: 30%;
                    position: relative;
                    top: 77px;
                }

                .ctList {
                    display: inline-block;
                    margin: 7px;
                }

                .hashTag {}

                .tdImg {
                    width: 150px;
                    height: 150px;
                }

                .TitleWrap {
                    width: 100%;
                    height: 400px;
                    background: linear-gradient(45deg, #a2d0ae, lightcyan, peachpuff);
                    margin-top: 200px;
                }

                .CtBtn {
                    width: 100%;
                    height: 200px;
                    padding: 8px;
                }
            </style>
        </head>

        <body class="">
            <!-- Navigation-->
            <%@ include file="/WEB-INF/views/include/menu.jsp" %>
                <div class="StickyBar">
                    <button class="Bar">
                        <img class="BarImage" style="width: 100%;"
                            src="${pageContext.request.contextPath}/resources/tdest/Top방향키.png" alt="">
                    </button>
                </div>
                <!-- contant 시작 -->

                <div class="TitleWrap">
                    <span>타이틀 공간</span>
                </div>

                <div class="content_wrap">

                    <table class="map_wrap">
                        <tr class="hashTag">
                            <c:forEach items="${CountryList }" var="ct">
                                <td class="ctList col-md-3">
                                    <button class="CtBtn" onclick="Select_country('${ct.ctcode}')">#${ct.ctname
                                        }</button>
                                </td>
                            </c:forEach>
                        </tr>
                    </table>

                    <div class="Tdest_wrap">
                        <div>
                            <div class="SearchArea">
                                <form action="SearchService" method="get">
                                    <div class="SArea">
                                        <input name="searchVal" class="Search" type="text">
                                        <button class="SearchBtn">검색</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="TdListIn">
                            <div id="rowid" class="row TdestArea">
                                <c:forEach var="TdList" items="${TdestList}">
                                    <div class="contain">
                                        <!-- Blog post-->
                                        <div class="card mb-4 photo" id="photo"
                                            onclick="location.href='detailTdest?tdcode=${TdList.tdcode}'">
                                            <img class="card-img-top tdImg" src="${TdList.tdphoto}" alt="..." />

                                        </div>
                                        <div class="card-body">
                                            <h3 id="title" class="card-title h4" title="${TdList.tdname}"
                                                style="overflow: hidden; white-space: nowrap;">${TdList.tdname}</h3>
                                            <button class="btn btn-primary"
                                                onclick="selectCdcode('${TdList.tdcode}','tdest')"
                                                data-bs-toggle="modal" data-bs-target="#exampleModal">계획에
                                                추가하기</button>
                                        </div>
                                    </div>

                                </c:forEach>
                            </div>
                        </div>
                        <div class="pagination">
                            <i id="leftCur" class="fa-solid fa-arrow-left"></i>
                            <ol id="numbers">

                            </ol>
                            <i id="rightCur" class="fa-solid fa-arrow-right"></i>
                        </div>
                    </div>
                </div>

                <hr style="position: relative; top: 65px;">


                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">캘린더 선택</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body" id="selectCalendar">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal"
                                    id="selectClear">선택</button>
                            </div>
                        </div>
                    </div>
                </div>






                <!-- contant 종료 -->

                <!-- Footer-->

                <!-- Bootstrap core JS-->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                <!-- Core theme JS-->
                <script src="resources/js/scripts.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
                <script src="https://kit.fontawesome.com/148f0d76e9.js" crossorigin="anonymous"></script>
                <script>
                    $(document).ready(function () {
                        console.log('페이지 로드');
                        Paging();

                    })
                </script>


                <script>
                    function Paging() {
                        const rowsPerPage = 15; //페이지당 출력할 수
                        const rows = document.querySelectorAll('.contain');
                        const rowsCount = rows.length;
                        //console.log(rows);

                        const pageCount = Math.ceil(rowsCount / rowsPerPage);
                        console.log(pageCount);
                        const numbers = document.querySelector('#numbers');

                        const prevPageBtn = document.querySelector('.fa-arrow-left');
                        const nextPageBtn = document.querySelector('.fa-arrow-right');

                        let pageActiveIdx = 0; //현재 페이지 그룹 번호
                        let currentPageNum = 0;
                        let maxPageNum = 10; //페이지 그룹 최대 개수

                        //페이지 넘버 생성 파트
                        numbers.innerHTML = "";
                        numbers.setAttribute("id", "numbers");
                        for (let i = 1; i <= pageCount; i++) {
                            numbers.innerHTML += '<li><a href="">' + i + '</a></li>';
                        }
                        const numberBtn = numbers.querySelectorAll('li');
                        console.log(numberBtn);

                        for (nb of numberBtn) {
                            nb.style.display = 'none';
                        }

                        numberBtn.forEach((item, idx) => {
                            item.addEventListener('click', (e) => {
                                e.preventDefault();
                                //    console.log(idx);
                                displayRow(idx);
                            });
                        });

                        function displayRow(idx) {

                            let start = idx * rowsPerPage;
                            let end = start + rowsPerPage;

                            let rowsArray = [...rows];
                            //console.log(rowsArray);

                            for (row of rowsArray) {
                                row.style.display = 'none';
                            }

                            let newRows = rowsArray.slice(start, end);
                            for (nr of newRows) {
                                nr.style.display = '';
                            }
                            for (nb of numberBtn) {
                                nb.classList.remove('active');
                            }
                            numberBtn[idx].classList.add('active');
                        }
                        displayRow(0);

                        //페이지네이션 그룹 표시
                        function displayPage(num) {
                            //페이지 네이션번호 감추기
                            for (nb of numberBtn) {
                                nb.style.display = 'none';
                            }
                            let totalPageCount = Math.ceil(pageCount / maxPageNum);

                            let pageArr = [...numberBtn]
                            let start = num * maxPageNum;
                            let end = start + maxPageNum;
                            let pageListArr = pageArr.slice(start, end);

                            for (let item of pageListArr) {
                                item.style.display = 'block';
                            }
                            if (pageActiveIdx == 0) {
                                prevPageBtn.style.display = 'none';
                            } else {
                                prevPageBtn.style.display = 'block';
                            }
                            if (pageActiveIdx == totalPageCount - 1) {
                                nextPageBtn.style.display = 'none';
                            } else {
                                nextPageBtn.style.display = 'block';
                            }
                        }
                        displayPage(0);

                        nextPageBtn.addEventListener('click', (e) => {
                            let nextPageNum = pageActiveIdx * maxPageNum + maxPageNum;
                            displayRow(nextPageNum);
                            ++pageActiveIdx;
                            displayPage(pageActiveIdx);
                        });

                        prevPageBtn.addEventListener('click', (e) => {
                            let nextPageNum = pageActiveIdx * maxPageNum + maxPageNum;
                            displayRow(nextPageNum);
                            --pageActiveIdx;
                            displayPage(pageActiveIdx);
                        });

                    }
                </script>
                <script>

                    function printTdest(dest) {
                        let TdestAreaDiv = document.querySelector('div.TdestArea');
                        TdestAreaDiv.innerHTML = "";
                        let TdestList = [];
                        TdestList = dest;
                        for (let Td of TdestList) {
                            let DestDiv = document.createElement('div');
                            //        DestDiv.classList.add('col-lg-4');
                            //      DestDiv.classList.add('col-md-6');
                            DestDiv.classList.add('contain');


                            let TdestImgDiv = document.createElement('div');
                            //           TdestImgDiv.classList.add('card-mb-4');
                            TdestImgDiv.classList.add('photo');
                            TdestImgDiv.addEventListener('click', function (e) {
                                DetailPageMove(Td.tdcode);
                            });

                            let TdestImg = document.createElement('img');
                            TdestImg.classList.add('tdImg');
                            TdestImg.classList.add('card-img-top');
                            TdestImg.setAttribute('src', Td.tdphoto);

                            TdestImgDiv.appendChild(TdestImg);
                            DestDiv.appendChild(TdestImgDiv);

                            let TdestTitleDiv = document.createElement('div');
                            TdestTitleDiv.classList.add('caard-body');

                            let TdestTitle = document.createElement('h3');
                            TdestTitle.classList.add('card-title');
                            TdestTitle.classList.add('h4');
                            TdestTitle.innerText = Td.tdname;

                            let TdestBtn = document.createElement('button');
                            TdestBtn.classList.add('btn');
                            TdestBtn.classList.add('btn-primary');
                            TdestBtn.innerText = '계획에 추가하기';
                            TdestBtn.setAttribute('data-bs-toggle', 'modal');
                            TdestBtn.setAttribute('data-bs-target', '#exampleModal');
                            TdestBtn.addEventListener('click', function () {
                                selectCdcode(Td.tdcode, 'tdest');
                            });
                            TdestTitleDiv.appendChild(TdestTitle);


                            TdestTitleDiv.appendChild(TdestBtn);

                            DestDiv.appendChild(TdestTitleDiv);

                            TdestAreaDiv.appendChild(DestDiv);

                        }
                        Paging();
                    }
                    function DetailPageMove(tdcode) {
                        console.log(tdcode);
                        location.href = 'detailTdest?tdcode=' + tdcode;

                    }
                    function selectCdcode(tdcode, seloption) {
                        if ("${sessionScope.loginId}" == "") {
                            location.href = "${pageContext.request.contextPath}/memberLoginForm"
                        } else {
                            $.ajax({
                                url: "/getCdcode",
                                type: "post",
                                data: { mid: "${sessionScope.loginId}" },
                                async: false,
                                success(rs) {
                                    console.log(rs.length);
                                    let modalBodyTag = document.querySelector("#selectCalendar")
                                    modalBodyTag.innerHTML = "";
                                    if (rs.length > 0) {

                                        let selTag = document.createElement("select")
                                        for (let cd of rs) {
                                            let optionTag = document.createElement("option")
                                            optionTag.innerText = cd.cdname;
                                            optionTag.setAttribute("value", cd.cdcode)
                                            selTag.appendChild(optionTag);
                                        }
                                        modalBodyTag.appendChild(selTag);
                                        let btnTag = document.querySelector("#selectClear");
                                        btnTag.addEventListener("click", function () {
                                            selectDest(tdcode, selTag.value, seloption)
                                        })
                                    }
                                    else {
                                        modalBodyTag.innerText = "달력을 추가 해주세요";
                                    }
                                }
                            })
                        }
                    }
                    function selectDest(tdcode, cdcode, seloption) {
                        console.log(tdcode + "  " + cdcode);
                        $.ajax({
                            url: "/registSelectDest",
                            type: "post",
                            data: { mid: "${sessionScope.loginId}", tdcode: tdcode, cdcode: cdcode, "seloption": seloption },
                            async: false,
                            success(rs) {
                                if (rs == 'Y') {
                                    alert('행선지 선택 완료');
                                    location.href = "/";
                                } else {
                                    alert('이미 선택된 행선지 입니다.');

                                }
                            }
                        })
                    }

                </script>
                <script>
                    $(document).ready(function () {
                        $(window).scroll(function () {
                            if ($(this).scrollTop() > 50) {
                                $('.Bar').fadeIn(500);
                                console.log('생김');
                            } else {
                                $('.Bar').fadeOut(500);
                            }
                        });
                    })
                    $('.Bar').click(function (event) {
                        console.log('클릭!');
                        event.preventDefault();
                        $('html,body').animate({ scrollTop: 0 }, 300);
                    });

                </script>
                <script>
                    function Select_country(ctcode) {
                        console.log('해시태그 고른거 : ' + ctcode);
                        $.ajax({
                            type: "get",
                            url: "TdestCtSearchPage",
                            data: { "ctcode": ctcode },
                            dataType: "json",
                            async: false,
                            success: function (e) {
                                console.log('성공');
                                printTdest(e);
                            }
                        });
                    }
                </script>

        </body>

        </html>