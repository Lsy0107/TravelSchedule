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
        <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Diphylleia&family=Noto+Sans+KR:wght@500;800&display=swap" rel="stylesheet">
        <style>
            #wrap>*{
            	font-family: 'Noto Sans KR', sans-serif !important; 
            }        
        	.Cal {                
                    margin-top: 125px;
				    width: 50%;
				    height: 580px;
				    overflow: scroll;
				    overflow-x: hidden;
				    z-index: 1;
				    overflow-y: hidden;
				    display: inline-block;
				    margin-left: auto;
				    margin-right: auto;
            }

            .InnerCal {
                height: 95%;
                margin: 15px;
            }

            .Ctitle {                
                display: flex;
            }

            .Ctitle:hover {
                border: 3px solid #41acd4;
                cursor: pointer;
            }

            .cdname {
                font-size: 16px;
                text-overflow: ellipsis;
    			overflow: hidden;
    			margin-left: 10px;
				font-family: 'Noto Sans KR', sans-serif;
                
            }            

            .reviewBtn {}

            .WriteBtn {
                animation-duration: 3s;
                animation-name: BtnMove;
                margin-left: auto;
            }

            @keyframes BtnMove {
                from {
                    top: 5px;

                }

                to {
                    bottom: 5px;
                }

            }

            #Circle1 {
                width: 100px;
                height: 100px;
                border-radius: 50%;
                background-color: aquamarine;
            }

            .BottomDiv {
                width: 100%;
                height: 480px;
                background: white;
                border-radius: 60px 60px 0px 0px;
                position: absolute;
                bottom: 0px;
                z-index: 0;
            }
            .select {
            	width: 250px;
            	height: 130px;           
            	display: inline-block;
            	margin-top: 125px;            	
            	margin-left: 10px;
            	background-color: whitesmoke;    
            	position: relative;
    			bottom: -70px;        	
            }
            .select>p{
            	margin-left: 10px;
            	cursor: pointer;
            }
            .Area{
           		display: flex;
           		height: 850px;
            }
            .ModifyBtn{
            	margin-left: auto;
            }
            .DeleteBtn{
            	margin-left: 5px;
            }
            .hr{
            	border: 1px solid black;
            	opacity: 0.8;
            }
            .topic{
            	font-family: 'Noto Sans KR', sans-serif;
            	display: inline;
            	position: relative;
  				bottom: -5px;
            }
            .topicArea{
            	height: 30px;
            }
            .book{
            	margin-left: 15px;
            }            
            .hr2{
            	border-top: 1px solid black;
            }
            .sel{
            	display: inline;
            	cursor: pointer;
            }
            .line{
            	display: inline;
            }
            .InnerCal>a{
            	text-decoration: none;
            	color: black;
            }
            .thead{
            	font-size: 18px;
            }
            .title{
            	width: 35%;
            }
            .mid{
            	width: 20%;
            }
            .date{
            	width: 15%;
            }
            .hit{
            	width: 10%;
            }
            .like{
            	width: 10%;
            }
            .table{
            	text-align: center;
            }
            .titleSon{
            	cursor: pointer;
            	display: contents;
            }
            #numbers{
            	display: flex;
            }
            .searchArea{
            	margin-left: auto;
            	margin-right: auto;
            	margin-bottom: 50px;
            }
            .search{
            	width: 300px;
    			height: 40px;
            }
            .searchBtn{
            	height: 40px;
            	margin-left:-5px;
            	background-color: white;
            	position: relative;
    			top: -1px;
    			border: 1px solid black;
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
            
			  
        </style>
    </head>

    <body class="d-flex flex-column h-100">

        <!-- Navigation-->
        <%@ include file="/WEB-INF/views/include/menu.jsp" %>
            <!-- contant 시작 -->
            <div class="wrap" id="wrap">
				<div class="Area">
		            <div class="Cal">	            
		                <div class="InnerCal">
		                	<div class="topicArea">
			                	<i class="fa-solid fa-book fa-2xl book"></i>
			                	<h2 class="topic">여행지리뷰</h1>
		                	</div>
		                	<hr class="hr">
		                	<p class="fe sel" style="${css1}" onclick="location.href='${pageContext.request.contextPath}/ReviewList'">최신순</p>
							<p class="line">|</p>
							<p class="re sel" style="${css2}" onclick="location.href='${pageContext.request.contextPath }/ReviewBest'">인기순</p>
   							<hr class="hr">
   							<table class="table" style="font-family: 'Noto Sans KR', sans-serif !important;">
	   							<thead>
	   								<tr class="thead">
	   									<th class="title">제목</th>
	   									<th class="mid">글쓴이</th>
	   									<th class="date">등록일</th>
	   									<th class="hit">조회</th>
	   									<th class="like">추천</th>
	   								</tr>
	   							</thead>
	   							<tbody id="tbody">
				                	<c:forEach items="${reviewList }" var="re">			                	
				                		<tr id="containDest">
				                			<th><a href="${pageContext.request.contextPath }/detailReview?recode=${re.recode}"><p class="titleSon">${re.retitle }</p></a></th>
				                			<th>${re.mid }</th>
				                			<th>${re.redate }</th>
				                			<th>${re.rehit }</th>
				                			<th>${re.lknum }</th>
				                		</tr>
				                	</c:forEach>   								
	   							</tbody>
		                	</table>
	
	                    </div>
	                </div>
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
            <div class="searchArea">           	
            	<input type="text" class="search" id="search">
            	<input type="submit" value="검색" class="searchBtn" placeholder="검색어를 입력해주세요." onclick="Search()">      
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
					function Paging(){
                        let paingDiv = document.querySelector('.paginD').style.display = 'block';
                        const rowsPerPage = 10; //페이지당 출력할 수
                        let rows = null;

                        rows = document.querySelectorAll('#containDest');


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
                <script type="text/javascript">
                	function Search(){
                		let searchVal = document.querySelector('#search').value                		
                		$.ajax({
                			type: "get",
                			url: "searchReview",
                			data: {
                                'retitle' : searchVal
                            },
                            dataType: 'json',
                            async: false,
                            success: function (e) {
                                printReview(e);
                            }
                		});
                	}
                	function printReview(e){                		
                		let tbody = document.querySelector('#tbody');
                		tbody.innerHTML = "";
                		for(let re of e){
                			let tr = document.createElement('tr');
                			tr.id = 'containDest';                			
                			
                			let retitle = document.createElement('th');
                			let retitle_a = document.createElement('a');
                			retitle_a.setAttribute('href', '${pageContext.request.contextPath }/detailReview?recode='+re.recode);
                			let retitle_p = document. createElement('p');
                			retitle_p.innerText = re.retitle;
                			retitle_a.appendChild(retitle_p);
                			retitle.appendChild(retitle_a);
                			tr.appendChild(retitle);
                			
                			let mid = document.createElement('th');
                			mid.innerText = re.mid;
                			tr.appendChild(mid);
                			
                			let redate = document.createElement('th');
                			redate.innerText = re.redate;
                			tr.appendChild(redate);
                			
                			let rehit = document.createElement('th');
                			rehit.innerText = re.rehit;
                			tr.appendChild(rehit);
                			
                			let lknum = document.createElement('th');
                			lknum.innerText = re.lknum;
                			tr.appendChild(lknum);                			
                			
                			tbody.appendChild(tr);
                		}
                	}
                </script>
                <script type="text/javascript">
                	Paging();
                </script>
    </body>

    </html>