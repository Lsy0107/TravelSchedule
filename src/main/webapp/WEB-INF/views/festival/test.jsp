<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
					<c:forEach items="${TdestList }" var="td" begin="0" end="3" step="1">																
						<div class="card feList" >
							<a href="${pageContext.request.contextPath }/detailTdest?tdcode=${td.tdcode }">
					            <img class="card-img-top feImg" src="${td.tdphoto }" alt="..." onerror="this.src='${pageContext.request.contextPath}/resources/tdest/3509.jpg'" />			                            			                            				
								<div class="feName">${td.tdname }  ${td.contentid }</div>
								
							</a>
						</div>
					</c:forEach>
</body>
</html>