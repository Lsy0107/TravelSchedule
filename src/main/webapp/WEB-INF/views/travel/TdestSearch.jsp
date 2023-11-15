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

            <!-- Data AOS-->
            <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

            <!-- Data AOS-->
            <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

            <style>
                .pagination {
                    position: relative;
                }

                ol {
                    list-style: none;
                    display: flex;
                    padding: 0px;
                    position: relative;
                }

                .bg-wh {
                    background-color: white;
                    box-shadow: 0px 0px 10px #A2A2A2;
                }

                ol>li:hover {
                    background-color: lightgrey;
                    cursor: pointer;
                }
                ol>li>a:hover{
                    color: gray;
                }

                .active {
                    background-color: rgb(0, 0, 0);                    
                }
                .active > a{
                    color: white;
                }

                ol>li {
                    padding: 3px;
                    border: 1px solid gray;
                    margin: 3px;
                    text-align: center;
                    min-width: 57px;
                    min-height: 45px;
                }

                ol>li>a {
                    padding: 10px;
                    max-width: 50px;
                    position: relative;
                    top: 21%;
                    color: gray;
                }

                i#leftCur {
                    position: relative;
                    top: -7px;
                    right: 0px;
                }

                i#rightCur {
                    position: relative;
                    top: -7px;
                    left: 0px;
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
                    width: 100%;
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

                div.containDest,
                div.containFest {
                    padding: 9px;
                    display: flex;
                    margin-bottom: 20px;
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
                    width: 100%;
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
                    border-radius: 15px;
                    margin-right: 10px;
                }

                .TitleWrap {
                    width: 100%;
                    height: 550px;
                    background: linear-gradient(45deg, #a2d0ae, lightcyan, peachpuff);
                }

                .CtBtn {
                    width: 100%;
                    height: 200px;
                    padding: 8px;
                }

                #SelCity {
                    width: 210px;
                    height: 50px;
                    padding: 15px;
                    border-radius: 10px;
                    border: 1px solid;
                    font-weight: bold;
                    outline: none;
                }

                #SelCate {
                    width: 210px;
                    height: 50px;
                    padding: 15px;
                    border-radius: 10px;
                    border: 1px solid;
                    font-weight: bold;
                    outline: none;
                }

                option {
                    font-weight: bold;
                    color: black;
                }

                .SelOpDiv {
                    text-align: center;
                    position: relative;
                    top: 140px;
                }

                .SearchBtn {
                    width: 120px;
                    height: 50px;
                    border-radius: 15px;
                    border: none;
                }

                .TitleSpan {
                    width: 100%;
                    display: block;
                    text-align: center;
                    font-size: 70px;
                    position: relative;
                    top: 100px;
                    font-family: fantasy;
                    color: black;
                    text-shadow: 7px 10px 6px gray;
                }

                .ResetBtn {
                    width: 50px;
                    height: 50px;
                    border-radius: 10px;
                }

                .Selection {
                    border: 1px solid blue;
                }

                .hTag {
                    overflow: hidden;
                    white-space: nowrap;
                    max-width: calc(240px);
                    white-space: nowrap;
                    text-overflow: ellipsis;
                    display: block;
                }

                html,
                body {
                    height: 100%;
                }

                .SearchTag {
                    position: relative;
                    top: 170px;
                    text-align: right;
                    width: 43%;
                    margin-left: auto;
                    margin-right: auto;
                }

                #SearchIcon {
                    font-size: 40px;
                    color: #224d68;
                    cursor: pointer;
                }

                .SearchBox {
                    border: 1px solid;
                    background: white;
                    width: 60%;
                    position: relative;
                    top: 120px;
                    margin-left: auto;
                    margin-right: auto;
                    display: none;
                    height: 200px;
                    border-radius: 20px;
                }

                .SearchInput {
                    width: 75%;
                    height: 42px;
                    padding: 8px;
                    border: none;
                }

                .SearchCate {
                    height: 40px;
                    width: 100px;
                    padding: 8px;
                    outline: none;
                    border: none;
                }

                .SearchBtn2 {
                    width: 43px;
                    height: 43px;
                    border: none;
                    background: white;
                    outline: none;
                }

                .SearchD {
                    display: block;
                    margin-left: auto;
                    margin-right: auto;
                    width: 75%;
                    margin-top: 15px;
                }

                #CloseIcon {
                    position: absolute;
                    top: -8px;
                    right: -7px;
                    width: 40px;
                    height: 40px;
                    border: none;
                    padding: 0px;
                    background: none;
                }

                #Close {
                    font-size: 40px;
                }
                a{
                    text-decoration: none;
                }
            </style>
        </head>

        <body class="">
            <!-- Navigation-->
            <%@ include file="/WEB-INF/views/include/menu.jsp" %>
                <div class="StickyBar">
                    <button class="Bar">
                        <img class="BarImage" style="width: 60px;;"
                            src="${pageContext.request.contextPath}/resources/tdest/Top방향키.png" alt="">
                    </button>
                </div>
                <!-- contant 시작 -->

                <div class="TitleWrap">
                    <span class="TitleSpan">R.O.K Travel</span>
                    <div class="SelOpDiv">
                        <select name="ctcode" id="SelCity" onchange="selectCity(this)">
                            <option class="OptionCity" value="">지역</option>
                            <c:forEach items="${CountryList }" var="ct">
                                <option class="OptionCity" value="${ct.ctname}">${ct.ctname}</option>
                            </c:forEach>
                        </select>

                        <select name="category" id="SelCate" required="required" onchange="selectCategory(this)">
                            <option value="">카테고리</option>
                            <option value="여행지">여행지</option>
                            <option value="축제">축제</option>
                        </select>
                        <button class="SearchBtn btn btn-primary" onclick="SearchClick()">검색<i style="padding: 5px;"
                                class="fa-solid fa-magnifying-glass"></i></button>
                    </div>
                    <div class="SearchTag">
                        <i id="SearchIcon" class="fa-solid fa-magnifying-glass"></i>
                    </div>
                    <div class="SearchBox">
                        <div class="SearchD">
                            <form action="javascript:SearchDetail()">
                            <select name="cateVal" id="selectCategory" class="SearchCate" required="required"
                                onchange="selectCategory(this)">
                                <option value="">카테고리</option>
                                <option value="축제">축제</option>
                                <option value="여행지">여행지</option>
                            </select>
                            <input class="SearchInput" id="SearchInput" onkeyup="previewInput(this)" type="text"
                                placeholder="검색어를 입력해주세요.">
                            <button type="submit"class="SearchBtn2" onclick="SearchDetail()"><i id=""
                                    class="fa-solid fa-magnifying-glass"></i></button>
                            </form>
                        </div>
                        <button id="CloseIcon"><i id="Close" class="fa-solid fa-circle-xmark"
                                style="color: #000000;"></i></button>
                        <div id="previewtext"
                            style="margin: 0px 30px 0px 30px; overflow-y: auto; height: 125px; border-radius:10px;">
                        </div>
                    </div>

                </div>

                <div class="content_wrap">
                    <div class="Tdest_wrap">
                        <div class="TdListIn">
                            <div id="rowid" class="row TdestArea">

                                <div class="containDest">
                                    <!-- Blog post-->

                                </div>

                            </div>

                            <div class="row paginD" style="display: none;">
                                <div class="pagination d-flex justify-content-center">
                                    <i id="leftCur" class="align-items-center fa-solid fa-arrow-left fa-xl"></i>
                                    <div class="d-flex align-items-center">
                                        <ol id="numbers">

                                        </ol>
                                    </div>
                                    <i id="rightCur"
                                        class="align-items-center fa-solid fa-arrow-right fa-xl"></i>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>



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
                                <button type="button" class="btn btn-outline-success" data-bs-dismiss="modal"
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

                <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
                <script>
                    AOS.init();
                </script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
                <script src="https://kit.fontawesome.com/148f0d76e9.js" crossorigin="anonymous"></script>
                <script>

                    $(document).ready(function () {
                        let selectCity = document.querySelector(".SelCity");
                        selectCity.innerText = "";

                    })
                </script>

                <script>
                    function selectCity(selOp) {
                        if (selOp.value == '지역') {
                            $('#SelCity').css('color', 'black');
                        }
                        else if (selOp.value != '지역') {
                            $('#SelCity').css('color', 'blue');
                        }
                    }
                    function selectCategory(selOp) {
                        if (selOp.value == '') {
                            $('#SelCate').css('color', 'black');
                        }
                        else if (selOp.value != '') {
                            $('#SelCate').css('color', 'blue');
                        }
                    }

                </script>
                <script>
                    let currentCity = null;
                    let currentCate = null;
                    function SearchClick() {

                        let SelCate = document.querySelector('#SelCate').value;
                        let SelCity = document.querySelector('#SelCity').value;


                        if (SelCate == '여행지') {
                            $.ajax({
                                type: 'post',
                                url: 'TravelSearch',
                                data: {
                                    'ctcode': SelCity,
                                    'category': SelCate
                                },
                                dataType: 'json',
                                async: false,
                                success: function (e) {
                                    console.log('전송 성공');
                                    console.log(e);
                                    currentCate = SelCate;                                    
                                    PrintTdest(e);
                                }
                            });
                        }
                        else if (SelCate == '축제') {
                            $.ajax({
                                type: 'post',
                                url: 'FestSearch',
                                data: {
                                    'ctcode': SelCity,
                                    'category': SelCate
                                },
                                dataType: 'json',
                                async: false,
                                success: function (e) {
                                    console.log('전송 성공');
                                    console.log(e);
                                    currentCate = SelCate;

                                    PrintFest(e);
                                }
                            });
                        } else if (SelCate == '') {
                            alert('카테고리 선택은 필수입니다!!');
                            return false;
                        }
                    }


                    function PrintTdest(resultDest) {
                        let TdestAreaDiv = document.querySelector('div.TdestArea');
                        TdestAreaDiv.innerHTML = "";
                        let TdestList = [];
                        TdestList = resultDest;
                        for (let Td of TdestList) {
                            let DestDiv = document.createElement('div');
                            //        DestDiv.classList.add('col-lg-4');
                            //      DestDiv.classList.add('col-md-6');
                            DestDiv.classList.add('containDest');
                            DestDiv.classList.add('col-lg-4');
                            DestDiv.classList.add('col-md-6');

                            let TdestImgDiv = document.createElement('div');
                            //           TdestImgDiv.classList.add('card-mb-4');
                            TdestImgDiv.classList.add('photo');
                            TdestImgDiv.addEventListener('click', function (e) {
                                DetailPageMoveDest(Td.tdcode);
                            });

                            let TdestImg = document.createElement('img');
                            TdestImg.classList.add('tdImg');
                            TdestImg.classList.add('card-img-top');
                            //TdestImg.classList.add('img-thumbnail');
                            TdestImg.setAttribute('src', Td.tdphoto);
                            TdestImg.setAttribute('onerror', "this.src='${pageContext.request.contextPath}/resources/tdest/3509.jpg'");
                            TdestImgDiv.appendChild(TdestImg);
                            DestDiv.appendChild(TdestImgDiv);

                            let TdestTitleDiv = document.createElement('div');
                            TdestTitleDiv.classList.add('card-body');

                            let TdestTitle = document.createElement('h3');
                            TdestTitle.classList.add('card-title');
                            TdestTitle.classList.add('h4');
                            TdestTitle.classList.add('hTag');
                            TdestTitle.innerText = Td.tdname;

                            let TdestBtn = document.createElement('button');
                            TdestBtn.classList.add('btn');
                            TdestBtn.classList.add('btn-outline-success');
                            TdestBtn.innerText = '계획에 추가하기';
                            TdestBtn.setAttribute('data-bs-toggle', 'modal');
                            TdestBtn.setAttribute('data-bs-target', '#exampleModal');
                            TdestBtn.addEventListener('click', function () {
                                DestselectCdcode(Td.tdcode, 'tdest');
                            });
                            TdestTitleDiv.appendChild(TdestTitle);


                            TdestTitleDiv.appendChild(TdestBtn);

                            DestDiv.appendChild(TdestTitleDiv);

                            TdestAreaDiv.appendChild(DestDiv);

                        }
                        Paging();
                    }


                    function PrintFest(resultFest) {
                        let TdestAreaDiv = document.querySelector('div.TdestArea');
                        TdestAreaDiv.innerHTML = "";
                        let FestList = [];
                        FestList = resultFest;
                        for (let Fe of FestList) {
                            let DestDiv = document.createElement('div');
                            //        DestDiv.classList.add('col-lg-4');
                            //      DestDiv.classList.add('col-md-6');
                            DestDiv.classList.add('containDest');
                            DestDiv.classList.add('col-lg-4');
                            DestDiv.classList.add('col-md-6')


                            let TdestImgDiv = document.createElement('div');
                            //           TdestImgDiv.classList.add('card-mb-4');
                            TdestImgDiv.classList.add('photo');
                            TdestImgDiv.addEventListener('click', function (e) {
                                DetailPageMoveFest(Fe.fecode);
                            });

                            let TdestImg = document.createElement('img');
                            TdestImg.classList.add('tdImg');
                            TdestImg.classList.add('card-img-top');
                            //TdestImg.classList.add('img-thumbnail');
                            TdestImg.setAttribute('src', Fe.feposter);
                            TdestImg.setAttribute('onerror', "this.src='${pageContext.request.contextPath}/resources/tdest/3509.jpg'");
                            TdestImgDiv.appendChild(TdestImg);
                            DestDiv.appendChild(TdestImgDiv);

                            let TdestTitleDiv = document.createElement('div');
                            TdestTitleDiv.classList.add('card-body');

                            let TdestTitle = document.createElement('h3');
                            TdestTitle.classList.add('card-title');
                            TdestTitle.classList.add('h4');
                            TdestTitle.classList.add('hTag');
                            TdestTitle.innerText = Fe.fename;

                            let TdestBtn = document.createElement('button');
                            TdestBtn.classList.add('btn');
                            TdestBtn.classList.add('btn-outline-success');
                            TdestBtn.innerText = '계획에 추가하기';
                            TdestBtn.setAttribute('data-bs-toggle', 'modal');
                            TdestBtn.setAttribute('data-bs-target', '#exampleModal');
                            TdestBtn.addEventListener('click', function () {
                                FestselectCdcode(Fe.fecode, 'festival');
                            });
                            TdestTitleDiv.appendChild(TdestTitle);


                            TdestTitleDiv.appendChild(TdestBtn);

                            DestDiv.appendChild(TdestTitleDiv);

                            TdestAreaDiv.appendChild(DestDiv);

                        }
                        Paging();
                    }
                </script>
                <script>
                    function Paging() {
                        let paingDiv = document.querySelector('.paginD').style.display = 'block';
                        const rowsPerPage = 30; //페이지당 출력할 수
                        let rows = null;

                        rows = document.querySelectorAll('.containDest');


                        const rowsCount = rows.length;
                        //console.log(rows);

                        const pageCount = Math.ceil(rowsCount / rowsPerPage);
                        const numbers = document.querySelector('#numbers');

                        const prevPageBtn = document.querySelector('#leftCur');
                        const nextPageBtn = document.querySelector('#rightCur');

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
                                prevPageBtn.classList.remove('d-flex');
                                prevPageBtn.style.display = 'none';
                            } else {
                                prevPageBtn.classList.add('d-flex')
                                prevPageBtn.style.display = 'block';
                            }
                            if (pageActiveIdx == totalPageCount - 1) {
                                nextPageBtn.classList.remove('d-flex');
                                nextPageBtn.style.display = 'none';
                            } else {
                                nextPageBtn.classList.add('d-flex');
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
                            let nextPageNum = pageActiveIdx * maxPageNum - maxPageNum;
                            displayRow(nextPageNum);
                            --pageActiveIdx;
                            displayPage(pageActiveIdx);
                        });

                    }
                </script>
                <script>


                    function DetailPageMoveDest(tdcode) {
                        console.log(tdcode);
                        location.href = 'detailTdest?tdcode=' + tdcode;

                    }
                    function DetailPageMoveFest(fecode) {
                        console.log(fecode);
                        location.href = 'detailFestival?code=' + fecode;

                    }
                    function DestselectCdcode(code, seloption) {
                        if ("${sessionScope.loginId}" == "") {
                            location.href = "${pageContext.request.contextPath}/memberLoginForm"
                        } else {
                            $.ajax({
                                url: "/getCdcode",
                                type: "post",
                                data: { mid: "${sessionScope.loginId}" },
                                async: false,
                                success(rs) {
                                    let modalBodyTag = document.querySelector("#selectCalendar")
                                    modalBodyTag.innerHTML = "";
                                    if (rs.length > 0) {
                                        let checkinfo = false;
                                        let selTag = document.createElement("select")
                                        for (let cd of rs) {
                                            if (cd.cdstate == 'Y') {
                                                let optionTag = document.createElement("option")
                                                optionTag.innerText = cd.cdname;
                                                optionTag.setAttribute("value", cd.cdcode)
                                                selTag.appendChild(optionTag);
                                                checkinfo = true;
                                            }
                                        }
                                        if (checkinfo) {
                                            modalBodyTag.appendChild(selTag);
                                            let btnTag = document.querySelector("#selectClear");
                                            btnTag.addEventListener("click", function () {
                                                selectDest(code, selTag.value, seloption)
                                            })
                                        } else {
                                            modalBodyTag.innerText = "계획 가능한 달력이 없습니다.";
                                        }
                                    }
                                    else {
                                        modalBodyTag.innerText = "달력을 추가 해주세요";
                                    }
                                }
                            })
                        }
                    }
                    function selectDest(tdcode, cdcode, seloption) {
                        let Cate = document.querySelector('#SelCate').value;
                        let City = document.querySelector('#SelCity').value;
                        console.log(tdcode + "  " + cdcode);

                        let Scate = document.querySelector('.SearchCate').value;
                        let Sinput = document.querySelector('.SearchInput').value;
                        $.ajax({
                            url: "/registSelectDest",
                            type: "post",
                            data: { mid: "${sessionScope.loginId}", tdcode: tdcode, cdcode: cdcode, "seloption": seloption },
                            async: false,
                            success(rs) {
                                if (rs == 'Y') {
                                    alert('행선지 선택 완료');
                                } else {
                                	console.log('asdasd')
                                    alert('이미 선택된 행선지 입니다.');
                                    
                                }
                                if(Sinput == ""){
                                    location.href = "/TdestSearchPage?category="+Cate+"&ctcode="+City;
                                }
                                else{
                                    location.href = "/TdestSearchPage?category="+Scate+"&name="+Sinput;
                                   
                                }  
                            }
                        })
                    }
                    function FestselectCdcode(code, seloption) {
                        if ("${sessionScope.loginId}" == "") {
                            location.href = "${pageContext.request.contextPath}/memberLoginForm"
                        } else {
                            $.ajax({
                                url: "/getCdcode",
                                type: "post",
                                data: { mid: "${sessionScope.loginId}" },
                                
                                success(rs) {
                                    let modalBodyTag = document.querySelector("#selectCalendar")
                                    modalBodyTag.innerHTML = "";
                                    if (rs.length > 0) {
                                        let checkinfo = false;
                                        let selTag = document.createElement("select")
                                        for (let cd of rs) {
                                            if (cd.cdstate == 'Y') {
                                                let optionTag = document.createElement("option")
                                                optionTag.innerText = cd.cdname;
                                                optionTag.setAttribute("value", cd.cdcode)
                                                selTag.appendChild(optionTag);
                                                checkinfo = true;
                                            }
                                        }
                                        if (checkinfo) {
                                            modalBodyTag.appendChild(selTag);
                                            let btnTag = document.querySelector("#selectClear");
                                            btnTag.addEventListener("click", function () {
                                                selectFest(code, selTag.value, seloption)
                                            })
                                        } else {
                                            modalBodyTag.innerText = "계획 가능한 달력이 없습니다.";
                                        }
                                    }
                                    else {
                                        modalBodyTag.innerText = "달력을 추가 해주세요";
                                    }
                                }
                            })
                        }
                    }
                    function selectFest(fecode, cdcode, seloption) {
                        let Cate = document.querySelector('#SelCate').value;
                        let City = document.querySelector('#SelCity').value;

                        let Scate = document.querySelector('.SearchCate').value;
                        let Sinput = document.querySelector('.SearchInput').value;
                        console.log(Scate);
                        console.log(Sinput);
                        console.log(fecode + "  " + cdcode);
                        $.ajax({
                            url: "/registSelectDest",
                            type: "post",
                            data: { mid: "${sessionScope.loginId}", fecode: fecode, cdcode: cdcode, "seloption": seloption},
                            
                            success(rs) {
                                if (rs == 'Y') {
                                    alert('행선지 선택 완료');
                                } else {
                                    alert('이미 선택된 행선지 입니다.');
                                }            
                                if(Sinput == ""){
                                    location.href = "/TdestSearchPage?category="+Cate+"&ctcode="+City;
                                }
                                else{
                                    location.href = "/TdestSearchPage?category="+Scate+"&name="+Sinput;
                                   
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
                            } else {
                                $('.Bar').fadeOut(500);
                            }
                        });
                    })
                    $('.Bar').click(function (event) {
                        event.preventDefault();
                        $('html,body').animate({ scrollTop: 0 }, 300);
                    });

                </script>

                <script>
                    $(function () {
                        $("#SearchIcon").on("click", function () {
                            $(".SearchBox").fadeIn();
                            $('#SelCate').css('color','black');
                            $('#SelCity').css('color','black');   
                            document.querySelector("#SelCate").value="";
                            document.querySelector("#SelCity").value="";                         
                        });
                    });

                    $(function () {
                        $("#CloseIcon").on("click", function () {
                            $(".SearchBox").fadeOut();

                        });
                    });
                </script>

                <script>
                    function SearchDetail() {
                        let cateTag = document.querySelector('.SearchCate').value;
                        let inputTag = document.querySelector('.SearchInput').value;
                        currentCate = cateTag;

                        if (currentCate == '축제') {
                            $.ajax({
                                type: 'get',
                                url: 'SearchServiceFe',
                                data: {
                                    'searchval': inputTag,
                                    'searchcate': cateTag
                                },
                                dataType: 'json',
                                async: false,
                                success: function (e) {
                                    FestDetailSearch(e);
                                }

                            });
                        }
                        else if (currentCate == '여행지') {
                            $.ajax({
                                type: 'get',
                                url: 'SearchServiceTd',
                                data: {
                                    'searchval': inputTag,
                                    'searchcate': cateTag
                                },
                                dataType: 'json',
                                async: false,
                                success: function (e) {
                                    DestDetailSearch(e);
                                }
                            });
                        }

                    }

                    function FestDetailSearch(Fest) {
                        let TdestAreaDiv = document.querySelector('div.TdestArea');
                        TdestAreaDiv.innerHTML = "";
                        let FestList = [];
                        FestList = Fest;
                        for (let Fe of FestList) {
                            let DestDiv = document.createElement('div');
                            //        DestDiv.classList.add('col-lg-4');
                            //      DestDiv.classList.add('col-md-6');
                            DestDiv.classList.add('containDest');
                            DestDiv.classList.add('col-lg-4');
                            DestDiv.classList.add('col-md-6')


                            let TdestImgDiv = document.createElement('div');
                            //           TdestImgDiv.classList.add('card-mb-4');
                            TdestImgDiv.classList.add('photo');
                            TdestImgDiv.addEventListener('click', function (e) {
                                DetailPageMoveFest(Fe.fecode);
                            });

                            let TdestImg = document.createElement('img');
                            TdestImg.classList.add('tdImg');
                            TdestImg.classList.add('card-img-top');
                            //TdestImg.classList.add('img-thumbnail');
                            TdestImg.setAttribute('src', Fe.feposter);
                            TdestImg.setAttribute('onerror', "this.src='${pageContext.request.contextPath}/resources/tdest/3509.jpg'");

                            TdestImgDiv.appendChild(TdestImg);
                            DestDiv.appendChild(TdestImgDiv);

                            let TdestTitleDiv = document.createElement('div');
                            TdestTitleDiv.classList.add('card-body');

                            let TdestTitle = document.createElement('h3');
                            TdestTitle.classList.add('card-title');
                            TdestTitle.classList.add('h4');
                            TdestTitle.classList.add('hTag');
                            TdestTitle.innerText = Fe.fename;

                            let TdestBtn = document.createElement('button');
                            TdestBtn.classList.add('btn');
                            TdestBtn.classList.add('btn-outline-success');
                            TdestBtn.innerText = '계획에 추가하기';
                            TdestBtn.setAttribute('data-bs-toggle', 'modal');
                            TdestBtn.setAttribute('data-bs-target', '#exampleModal');
                            TdestBtn.addEventListener('click', function () {
                                FestselectCdcode(Fe.fecode, 'festival');
                            });
                            TdestTitleDiv.appendChild(TdestTitle);


                            TdestTitleDiv.appendChild(TdestBtn);

                            DestDiv.appendChild(TdestTitleDiv);

                            TdestAreaDiv.appendChild(DestDiv);

                        }
                        Paging();
                    }

                    function DestDetailSearch(Tdest) {
                        let TdestAreaDiv = document.querySelector('div.TdestArea');
                        TdestAreaDiv.innerHTML = "";
                        let TdestList = [];
                        TdestList = Tdest;
                        for (let Td of TdestList) {
                            let DestDiv = document.createElement('div');
                            //        DestDiv.classList.add('col-lg-4');
                            //      DestDiv.classList.add('col-md-6');
                            DestDiv.classList.add('containDest');
                            DestDiv.classList.add('col-lg-4');
                            DestDiv.classList.add('col-md-6');


                            let TdestImgDiv = document.createElement('div');
                            //           TdestImgDiv.classList.add('card-mb-4');
                            TdestImgDiv.classList.add('photo');
                            TdestImgDiv.addEventListener('click', function (e) {
                                DetailPageMoveDest(Td.tdcode);
                            });

                            let TdestImg = document.createElement('img');
                            TdestImg.classList.add('tdImg');
                            TdestImg.classList.add('card-img-top');
                            //TdestImg.classList.add('img-thumbnail');
                            TdestImg.setAttribute('src', Td.tdphoto);
                            TdestImg.setAttribute('onerror', "this.src='${pageContext.request.contextPath}/resources/tdest/3509.jpg'")

                            TdestImgDiv.appendChild(TdestImg);
                            DestDiv.appendChild(TdestImgDiv);

                            let TdestTitleDiv = document.createElement('div');
                            TdestTitleDiv.classList.add('card-body');

                            let TdestTitle = document.createElement('h3');
                            TdestTitle.classList.add('card-title');
                            TdestTitle.classList.add('h4');
                            TdestTitle.classList.add('hTag');
                            TdestTitle.innerText = Td.tdname;

                            let TdestBtn = document.createElement('button');
                            TdestBtn.classList.add('btn');
                            TdestBtn.classList.add('btn-outline-success');
                            TdestBtn.innerText = '계획에 추가하기';
                            TdestBtn.setAttribute('data-bs-toggle', 'modal');
                            TdestBtn.setAttribute('data-bs-target', '#exampleModal');
                            TdestBtn.addEventListener('click', function () {
                                DestselectCdcode(Td.tdcode, 'tdest');
                            });
                            TdestTitleDiv.appendChild(TdestTitle);


                            TdestTitleDiv.appendChild(TdestBtn);

                            DestDiv.appendChild(TdestTitleDiv);

                            TdestAreaDiv.appendChild(DestDiv);

                        }
                        Paging();
                    }
                </script>
                <script type="text/javascript">
                    function previewInput(obj) {
                        console.log(obj);
                        let SelCateTag = document.querySelector('#selectCategory');
                        let previewText = document.querySelector('#previewtext');
                        let Data = {};
                        switch (SelCateTag.value) {
                            case '':
                                previewText.innerHTML = "";
                                previewText.innerText = '카테고리를 선택해주세요!';
                                return;
                                break;
                            case '축제':
                                Data = { "searchInfo": obj.value, "seloption": 'fe' };
                                break;
                            case '여행지':
                                Data = { "searchInfo": obj.value, "seloption": 'td' };
                                break;
                        }
                        $.ajax({
                            url: "/sreachPreview",
                            type: "post",
                            data: Data,
                            success: function (rs) {
                                printPreview(rs, previewText, SelCateTag.value, obj);
                            }
                        })
                    }
                    //미리보기 텍스트 출력
                    function printPreview(rs, previewText, seloption, searchbox) {
                        console.log(rs);
                        console.log(previewText);
                        previewText.innerHTML = '';
                        for (let pre of rs) {
                            let pTag = document.createElement('p');
                            if (seloption == '축제') {
                                pTag.innerText = pre.FENAME;
                            } else {
                                pTag.innerText = pre.TDNAME;
                            }
                            pTag.style.margin = "0";
                            pTag.style.cursor = "pointer";
                            pTag.classList.add("p-2");
                            pTag.addEventListener('click', function () {
                                searchbox.value = pTag.innerText;
                                SearchDetail()
                            })
                            previewText.appendChild(pTag);
                        }
                    }
                </script>
                <script type="text/javascript">
                    if (${ category != null }) {
                        if(${ctcode != null}){
                            document.querySelector("#SelCate").value = '${category}';
                            document.querySelector("#SelCity").value = '${ctcode}';                            
                            $("#SelCate").css('color', 'blue');
                            $("#SelCity").css('color', 'blue');
                            SearchClick();
                        }
                        else{
                            
                            $('.SearchBox').css('display','block');
                            $("#SelCate").css('color', 'black');
                            $("#SelCity").css('color', 'black');
                            document.querySelector('#selectCategory').value = '${category}';
                            document.querySelector('#SearchInput').value = '${name}';
                            SearchDetail();
                        }
                    }

                    
                </script>
        </body>

        </html>