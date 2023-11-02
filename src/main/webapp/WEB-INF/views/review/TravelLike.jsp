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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Diphylleia&family=Noto+Sans+KR:wght@500;800&display=swap" rel="stylesheet">
        <style>
            .Cal {                
                margin-top: 125px;
                width: 30%;
                height: 580px;
                overflow: scroll;
                overflow-x: hidden;
                z-index: 1;
                overflow-y: hidden;
                display: inline-block;
                margin-left: 600px;
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
                width: 70%;
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
            	height: 100px;           
            	display: inline-block;
            	margin-top: 125px;            	
            	margin-left: 10px;
            	background-color: whitesmoke;    
            	position: relative;
    			bottom: -70px;        	
            }
            .select>p{
            	margin-left: 10px;
            }
            .Area{
           		display: flex;
           		height: 600px;
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
            .select>p{
            	cursor: pointer;
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
            .wrap>*{
            	font-family: 'Noto Sans KR', sans-serif;
            }
            
        </style>
    </head>

    <body class="d-flex flex-column h-100">

        <!-- Navigation-->
        <%@ include file="/WEB-INF/views/include/menu.jsp" %>
            <!-- contant 시작 -->
            <div class="wrap">
			<div class="Area">
	            <div class="Cal">	            
	                <div class="InnerCal">
	                	<div class="topicArea">
		                	<i class="fa-solid fa-heart fa-2xl book"></i>
		                	<h2 class="topic">즐겨찾기</h1>
	                	</div>
	                	<hr class="hr">
	                	<p class="td sel" style="${css1}" onclick="location.href='${pageContext.request.contextPath }/TravelLike'">여행지</p>
	                	<p class="line">|</p>
	                	<p class="fe sel" style="${css2}" onclick="location.href='${pageContext.request.contextPath }/FestivalLike'">축제</p>
	                	<p class="line">|</p>
	                	<p class="re sel" style="${css3}" onclick="location.href='${pageContext.request.contextPath }/ReviewLike'">리뷰</p>
	                	<hr class="hr2">
	                    <c:forEach items="${td}" var="td">
	                    	<a href="${pageContext.request.contextPath }/detailTdest?tdcode=${td.tdcode}">
		                        <div class="Ctitle">	                            
		                            <p class="cdname">${td.tdname}</p>		                           
		                        </div>
	                        </a>
	                    </c:forEach>
	                    <c:forEach items="${fe}" var="fe">
	                    	<a href="${pageContext.request.contextPath }/detailFestival?code=${fe.fecode}">
		                        <div class="Ctitle" >	                            
		                            <p class="cdname">${fe.fename}</p>		                           
		                        </div>
	                        </a>
	                    </c:forEach>
	                    <c:forEach items="${re}" var="re">
	                        <div class="Ctitle" >	                            
	                            <p class="cdname">${re.retitle}</p>		                           
	                        </div>
	                    </c:forEach>
	                </div>
	
	            </div>
	            <div class="select">
	            	<p style="margin-top:20px; ${sel}" onclick="location.href='${pageContext.request.contextPath }/TravelLike'">즐겨찾기</p>
	            	<p onclick="location.href='${pageContext.request.contextPath }/TravelReview'">리뷰</p>
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
                    function DeleteReview(cdcode) {
                        let DeleteConfirm = confirm('해당 리뷰를 삭제하시겠습니까?');

                        if (DeleteConfirm == true) {
                            console.log(cdcode);
                            $.ajax({
                                type: 'get',
                                url: 'DeleteReview',
                                data: {
                                    'cdcode': cdcode
                                },
                                dataType: 'json',
                                async: false,
                                success: function (e) {
                                    console.log('삭제 성공');
                                    alert('리뷰를 성공적으로 삭제하였습니다.');
                                    location.href = '${pageContext.request.contextPath}/'
                                }
                            });
                        } else {
                            return false;
                        }
                    }
                </script>
    </body>

    </html>