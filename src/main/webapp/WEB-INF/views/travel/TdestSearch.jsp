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
                    left: 50%;
                    right: 50%;
                    top: 160px;
                    margin-left: -195px;
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

                li>a {
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
                    width: 50%;
                    position: relative;
                    top: 150px;
                    height: 650px;
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
                    max-height: 1000px;
                    overflow: scroll;
                    width: 100%;
                }

                .SearchArea {
                    border: 1px solid;
                }

                .SArea {
                    margin-top: 20px;
                    margin-bottom: 20px;
                    margin-left: auto;
                    margin-right: auto;
                    width: 400px;
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
                    bottom: 450px;
                    left: 175px;
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

                img {
                    height: 300px;
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
                .FestivalRecomm{
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
            </style>
        </head>

        <body class="d-flex flex-column h-100">
            <main class="flex-shrink-0">
                <!-- Navigation-->
                <%@ include file="/WEB-INF/views/include/menu.jsp" %>
                    <!-- contant 시작 -->

                    <div class="map_wrap">
                        <div id="map">
                        </div>
                        <div id="SelectMapType" class="custom_typecontrol radius_border">
                            <span id="btnRoadmap" class="selected" onclick="setMapType('roadmap')">지도</span>
                            <span id="btnSkyview" class="unselected" onclick="setMapType('skyview')">스카이뷰</span>
                        </div>
                        <!-- 지도타입 컨트롤 div 입니다 -->

                    </div>
                    <hr style="position: relative; top: 65px;"></hr>
                    <div class="TdestRecommendArea">
                        <div class="JejuIslandTdest" onclick="location.href='/'">
                            <img src="${pageContext.request.contextPath}/resources/tdest/제주 돌하르방.png" alt="">
                            <span id="RecommendTitle">제주도에 이런 여행지는 어떠세요?</span>
                            <img src="${pageContext.request.contextPath}/resources/tdest/제주도.png" alt="">
                        </div>
                        <div class="FestivalRecomm">
                            <span id="RecommendTitle">축제를 즐기고 싶으신가요?</span>
                        </div>
                    </div>

                    <div class="row TdListArea">
                        <div class="SearchArea">
                            <form action="SearchService" method="get">
                                <div class="SArea">
                                    <input name="searchVal" class="Search" type="text">
                                    <button class="SearchBtn">검색</button>
                                </div>
                            </form>
                        </div>
                        <div class="col-lg-8 TdListIn">
                            <div id="rowid" class="row TdestArea">
                                <c:forEach var="TdList" items="${TdestList}">
                                    <div class="col-lg-4 col-md-6 contain">
                                        <!-- Blog post-->
                                        <div class="card mb-4" id="photo">
                                            <img class="card-img-top" src="${TdList.tdphoto}" alt="..." />

                                        </div>
                                        <div class="card-body">

                                            <h2 id="title" class="card-title h4" title="${TdList.tdname}"
                                                style="overflow: hidden; white-space: nowrap;">${TdList.tdname}</h2>
                                        </div>
                                    </div>

                                </c:forEach>
                            </div>
                        </div>
                    </div>

                    <div class="pagination">
                        <i id="leftCur" class="fa-solid fa-arrow-left"></i>
                        <ol id="numbers">

                        </ol>
                        <i id="rightCur" class="fa-solid fa-arrow-right"></i>
                    </div>




                    <!-- contant 종료 -->
            </main>
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
                    const numbers = document.querySelector('#numbers');

                    const prevPageBtn = document.querySelector('.fa-arrow-left');
                    const nextPageBtn = document.querySelector('.fa-arrow-right');

                    let pageActiveIdx = 0; //현재 페이지 그룹 번호
                    let currentPageNum = 0;
                    let maxPageNum = 10; //페이지 그룹 최대 개수

                    //페이지 넘버 생성 파트
                    for (let i = 1; i <= pageCount; i++) {
                        numbers.innerHTML += '<li><a href="">' + i + '</a></li>';
                    }
                    const numberBtn = numbers.querySelectorAll('a');
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
            <script type="text/javascript"
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=23bdfe79ede96bc585d6800ad13f132f"></script>

            <script>
                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                    mapOption = {
                        center: new kakao.maps.LatLng(35.2284895431993, 126.60708499996532), // 지도의 중심좌표
                        level: 13, // 지도의 확대 레벨
                        disableDoubleClickZoom: true
                    };

                // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                var map = new kakao.maps.Map(mapContainer, mapOption);

                // 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
                function setMapType(maptype) {
                    var roadmapControl = document.getElementById('btnRoadmap');
                    var skyviewControl = document.getElementById('btnSkyview');
                    if (maptype === 'roadmap') {
                        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);
                        roadmapControl.className = 'selected';
                        skyviewControl.className = 'unselected';
                    } else {
                        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);
                        skyviewControl.className = 'selected';
                        roadmapControl.className = 'unselected';
                    }
                }

                var positions = [
                    {
                        content: '<div>서울</div>',
                        latlng: new kakao.maps.LatLng(37.54664359142577, 126.99315381710171),
                        ctcode: 'CT00001'
                    },
                    {
                        content: '<div>경기</div>',
                        latlng: new kakao.maps.LatLng(37.39440609862812, 126.97365324765146),
                        ctcode: 'CT00009'
                    },
                    {
                        content: '<div>인천</div>',
                        latlng: new kakao.maps.LatLng(37.45805515784067, 126.70743142446902),
                        ctcode: 'CT00003'
                    },
                    {
                        content: '<div>제주</div>',
                        latlng: new kakao.maps.LatLng(33.38396073538159, 126.55947926554452),
                        ctcode: 'CT00017'
                    },
                    {
                        content: '<div>부산</div>',
                        latlng: new kakao.maps.LatLng(35.175398937500916, 129.07635140268044),
                        ctcode: 'CT00002'
                    },
                    {
                        content: '<div>대구</div>',
                        latlng: new kakao.maps.LatLng(35.875709389940255, 128.61405215864136),
                        ctcode: 'CT00004'
                    },
                    {
                        content: '<div>대전</div>',
                        latlng: new kakao.maps.LatLng(36.35024083449214, 127.38504504613894),
                        ctcode: 'CT00005'
                    },
                    {
                        content: '<div>광주</div>',
                        latlng: new kakao.maps.LatLng(35.15850075532579, 126.85427796577575),
                        ctcode: 'CT00006'
                    },
                    {
                        content: '<div>울산</div>',
                        latlng: new kakao.maps.LatLng(35.530793233360946, 129.35179422986909),
                        ctcode: 'CT00007'
                    },
                    {
                        content: '<div>세종</div>',
                        latlng: new kakao.maps.LatLng(36.47450836419142, 127.29068102611524),
                        ctcode: 'CT00008'
                    },
                    {
                        content: '<div>충북</div>',
                        latlng: new kakao.maps.LatLng(36.87055575768208, 127.73074019412219),
                        ctcode: 'CT00010'
                    },
                    {
                        content: '<div>충남</div>',
                        latlng: new kakao.maps.LatLng(36.535856613465555, 126.81995401264338),
                        ctcode: 'CT00011'
                    },
                    {
                        content: '<div>전북</div>',
                        latlng: new kakao.maps.LatLng(35.712288073108894, 127.13016897048418),
                        ctcode: 'CT00012'
                    },
                    {
                        content: '<div>전남</div>',
                        latlng: new kakao.maps.LatLng(34.93014343723772, 127.0000328350848),
                        ctcode: 'CT00013'
                    },
                    {
                        content: '<div>경북</div>',
                        latlng: new kakao.maps.LatLng(36.4614466650289, 128.71070899570446),
                        ctcode: 'CT00014'
                    },
                    {
                        content: '<div>경남</div>',
                        latlng: new kakao.maps.LatLng(35.40390554860735, 128.22311181830486),
                        ctcode: 'CT00015'
                    },
                    {
                        content: '<div>강원</div>',
                        latlng: new kakao.maps.LatLng(37.60700024383932, 128.42062228646495),
                        ctcode: 'CT00016'
                    },
                ];
                map.setDraggable(false);
                map.setZoomable(false);

                let markerList = [];
                let ctcodeList = [];
                for (var i = 0; i < positions.length; i++) {
                    // 마커를 생성합니다

                    let ctcode = positions[i].ctcode;

                    ctcodeList.push(ctcode);

                    var marker = new kakao.maps.Marker({
                        map: map, // 마커를 표시할 지도
                        position: positions[i].latlng, // 마커의 위치
                        ctcode: positions[i].ctcode
                    });
                    markerList.push(marker);

                    // 마커에 표시할 인포윈도우를 생성합니다 
                    var infowindow = new kakao.maps.InfoWindow({
                        content: positions[i].content // 인포윈도우에 표시할 내용
                    });

                    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
                    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
                    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
                    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
                    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
                }

                for (let mar in markerList) {
                    markerList[mar].addListener('click', function () {
                        console.log(markerList[mar].getPosition());
                        console.log(positions[mar].ctcode);
                        let ct = positions[mar].ctcode;
                        $.ajax({
                            type: "get",
                            url: "TdestCtSearchPage",
                            data: { "ctcode": ct },
                            dataType: "json",
                            async: false,
                            success: function (e) {
                                console.log('성공');
                                printTdest(e);
                            }
                        });
                    });
                }


                // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
                function makeOverListener(map, marker, infowindow) {
                    return function () {
                        infowindow.open(map, marker);
                    };
                }

                // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
                function makeOutListener(infowindow) {
                    return function () {
                        infowindow.close();
                    };
                }

                function printTdest(dest) {
                    let TdestAreaDiv = document.querySelector('div.TdestArea');
                    TdestAreaDiv.innerHTML = "";
                    let TdestList = [];
                    TdestList = dest;
                    for (let Td of TdestList) {
                        let DestDiv = document.createElement('div');
                        DestDiv.classList.add('col-lg-4');
                        DestDiv.classList.add('col-md-6');
                        DestDiv.classList.add('contain');

                        let TdestImgDiv = document.createElement('div');
                        TdestImgDiv.classList.add('card-mb-4');

                        let TdestImg = document.createElement('img');
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

                        TdestTitleDiv.appendChild(TdestTitle);
                        DestDiv.appendChild(TdestTitleDiv);

                        TdestAreaDiv.appendChild(DestDiv);

                    }
                    Paging();
                }

            </script>

        </body>

        </html>