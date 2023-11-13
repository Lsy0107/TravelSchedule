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
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>MyPage</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
        
        <style type="text/css">
        .input-file-btn{
		  padding: 6px 25px;
		  border-radius: 4px;

		  margin-left: 11px;
		}
		
			.profile-img.big {
				width: 150px;
				height: 150px;
				border-radius: 100px;
				border: 3px solid black;
			}
			.bg-wh{
	background-color: white;
	box-shadow: 0px 0px 10px #A2A2A2;
}
.wrap{
	width: 30%;
	margin-bottom: 50px;
	margin-top: 125px;
	display: inline-block;
	margin-left: 600px;
}
.select {
            	width: 250px;
            	height: 130px;           
            	display: inline-block;
            	margin-top: 125px;            	
            	margin-left: 15px;
            	background-color: whitesmoke;    
            	position: relative;
            	bottom: -70px;     	
            }
            .select>p{
            	margin-left: 10px;
            	cursor: pointer;
            }		
            .Area{
            	display:flex;
            }
        </style>
        
    </head>
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <%@ include file="/WEB-INF/views/include/menu.jsp" %>
            <!-- contant 시작 -->           
			<div class="Area">
			 <div class="wrap w3-container">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>마이페이지</h3>
			</div>
			<div>
				<form id="myForm" enctype="multipart/form-data" action="${pageContext.request.contextPath }/memberUpdate" method="post" >
					<p>
					<c:choose>
						<c:when test="${mInfo.mprofile  == null}">
							<img id="profileImg" src="/resources/memberProfile/default.jpg" class="img-thumbnail" alt="..." style="width: 150px; height: 150px;">
						</c:when>
						<c:otherwise>
						<c:choose>
						<c:when test="${mInfo.mstate != 'YK' && mInfo.mstate != 'NA' }">
							<img id="profileImg" src="/resources/memberProfile/${mInfo.mprofile }" class="img-thumbnail" alt="${mInfo.mprofile }" style="width: 150px; height: 150px;">
						</c:when>
						<c:otherwise>
						<img id="profileImg" src="${sessionScope.loginProfile}" class="img-thumbnail" alt="${mInfo.mprofile }" style="width: 150px; height: 150px;">
						</c:otherwise>
						</c:choose>
						</c:otherwise>
					</c:choose>
					</p>
					<c:if test="${mInfo.mstate != 'AD' && mInfo.mstate != 'YK' && mInfo.mstate != 'NA' }">
						<label class="input-file-btn w3-button w3-black w3-ripple w3-round" for="input-file">
						  프로필 변경
						</label>
						<input id="input-file" onchange="changeProfile(this)" type="file" name="mprofiledata" value="${mInfo.mprofile }" style="display:none;">
					<p>
						<label><h5>ID</h5></label> 
						<input class="w3-input" type="text" name="mid" readonly value="${mInfo.mid}"> 
					</p>
					</c:if>
					<p>
						<label><h5>Nickname</h5></label> 
						<input class="w3-input" type="text" id="mnickname" name="mnickname" value="${mInfo.mnickname}" required> 
					</p>
					<c:if test="${mInfo.mstate != 'AD' && mInfo.mstate != 'YK' && mInfo.mstate != 'NA' }">
					<p class="w3-center">
						<button type="submit" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">회원정보 저장</button>
					</p>
					</c:if>
				</form>
				<br />
				<c:if test="${mInfo.mstate != 'AD' && mInfo.mstate != 'YK' && mInfo.mstate != 'NA' }">
				<form id="pwForm" action="${pageContext.request.contextPath }/updatePw" method="post" onsubmit="return pwCheck(this)">	
					<input type="hidden" id="mid" name="mid" value="${mInfo.mid}">
					<p>
						<label>Password</label>
						<input class="w3-input" id="old_pw" name="old_pw" type="password" required>
					</p>
					<p>
						<label>New Password</label> 
						<input class="w3-input" id="mpw" name="mpw" type="password" required>
					</p>
					<p>
						<label>Confirm</label>
						<input class="w3-input" type="password" id="pw2" type="password" required>
					</p>
					<p class="w3-center">
						<button type="submit" id="joinBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">비밀번호 변경</button>
					</p>
				</form>
				</c:if>
			</div>
		</div>
	</div>
	<div class="select">
					<p style="margin-top:20px; border-left: thick solid red;" onclick="location.href='${pageContext.request.contextPath }/myInfo'">내정보</p>
	            	<p onclick="location.href='${pageContext.request.contextPath }/TravelLike'">좋아요</p>
	            	<p onclick="location.href='${pageContext.request.contextPath }/TravelReview'">리뷰</p>
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
        
		<script type="text/javascript">
			let msg = '${msg }'
			if(msg.length > 0){
				alert(msg);
			}
		</script>
        
        <script type="text/javascript">
	        function pwCheck(obj) {
	        	console.log("pwCheck - 호출");
				//let oldPw = obj.old_pw.value; // a1234
				let oldPw = obj.old_pw;
				
				if(oldPw.value != '${mInfo.mpw}'){
					alert('기존비밀번호가 일치하지 않습니다.');
					oldPw.focus();
					return false;
				}
				let newPwObj = obj.mpw;
				let newPw2Obj = obj.pw2;
				
				if(newPwObj.value != newPw2Obj.value){
					alert('새로운비밀번호가 일치하지 않습니다.');
					newPwObj.focus();
					return false;
				}
			}
        </script>
        
        <script type="text/javascript">
        	function mproFile(obj) {
				console.log("프로필변경");
				
				
				
			}
        </script>
        <script type="text/javascript">
        	function changeProfile(obj){
        		let imgTag = document.querySelector("#profileImg");
        		if (obj.files && obj.files[0]) {
        		    var reader = new FileReader();
        		    reader.onload = function(e) {
        		    	imgTag.src = e.target.result;
        		    };
        		    reader.readAsDataURL(obj.files[0]);
        		  } else {
        			  imgTag.src = "";
        		  }
        	}
        </script>
    </body>
</html>
    