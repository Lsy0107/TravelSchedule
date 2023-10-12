<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        
        <style type="text/css">
			.profile-img.big {
				width: 150px;
				height: 150px;
				border-radius: 100px;
				border: 3px solid black;
			}
        </style>
        
    </head>
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <%@ include file="/WEB-INF/views/include/menu.jsp" %>
            <!-- contant 시작 -->
            <div class="row" style="margin-top:90px;"></div>

			<div class="container">
				<div>
					<h1 class="title">${mInfo.mnickname}님</h1>
				</div>
			<div class="flex">
				<div>
					<div class="row">
						<a>개인정보 변경</a>
					</div>
					<div class="row">
						<a>비밀번호 변경</a>
					</div>
					<div class="row">
						<a>회원 탈퇴</a>
					</div>
				</div>
				<div>
					<div>
						<a><img src="${mInfo.mprofile}" class="img-thumbnail" alt="..."></a>
					</div>
					<div class="row">
						<table>
							<tbody>
								<tr>
									<th>아이디</th>
									<td>${mInfo.mid}</td>
								</tr>
								<tr>
									<th>닉네임</th>
									<td>${mInfo.mnickname}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- contant 종료 -->
        </main>
        <!-- Footer-->
       <%@ include file="/WEB-INF/views/include/footer.jsp"%>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
    </body>
</html>
    