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
            .wrap>*{
            	font-family: 'Noto Sans KR', sans-serif;
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
			                	<i class="fa-solid fa-book fa-2xl book"></i>
			                	<h2 class="topic">여행지리뷰</h1>
		                	</div>
		                	<hr class="hr">
		                	<p class="fe sel" style="font-weight: bold; text-decoration-line: underline;" onclick="location.href='${pageContext.request.contextPath}/ReviewList'">최신순</p>
							<p class="line">|</p>
							<p class="re sel" onclick="location.href='${pageContext.request.contextPath }/ReviewLike'">인기순</p>
   							<hr class="hr">
   							<table class="table">
	   							<thead>
	   								<tr class="thead">
	   									<th class="title">제목</th>
	   									<th class="mid">글쓴이</th>
	   									<th class="date">등록일</th>
	   									<th class="hit">조회</th>
	   									<th class="like">추천</th>
	   								</tr>
	   							</thead>
	   							<tbody>
				                	<c:forEach items="${reviewList }" var="re">			                	
				                		<tr>
				                			<th><a href="${pageContext.request.contextPath }/detailReview?recode=${re.recode}"><p class="titleSon">${re.retitle }</p></a></th>
				                			<th>${re.mid }</th>
				                			<th>${re.redate }</th>
				                			<th>${re.rehit }</th>
				                			<th>${re.relike }</th>
				                		</tr>
				                	</c:forEach>   								
	   							</tbody>
		                	</table>
	
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
                
    </body>

    </html>