<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
    .navbar{
        position: fixed;
        width: 100%;
        z-index: 2;
    }
    
</style>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container px-5">
                    <a class="navbar-brand" href="${pageContext.request.contextPath }/">여행페이지</a>
                    <div class="col" style="display: flex; align-items: center;">
                        <input placeholder="검색어를 입력해주세요." type="text" class="form-control"
                            style="display: inline-block; width: 80%; box-sizing: border-box; margin: 5px;">
                        <button class="btn btn-outline-primary"
                            style="width: 19%; box-sizing: border-box;">검색</button>
                    </div>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <c:choose>
                        	<c:when test="${sessionScope.loginId ==null }">
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/memberLoginForm">로그인</a></li>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/memberJoinForm">회원가입</a></li>
                        	</c:when>
                        	<c:otherwise>
                        	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/memberLogout">로그아웃</a></li>
                        	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/">내정보</a></li>
                        	</c:otherwise>
                        </c:choose>
                            <li class="nav-item"><a class="nav-link" href="/selectCalendar">여행계획</a></li>
                            <li class="nav-item"><a class="nav-link" href="/TdestSearchPage">여행지검색</a></li>
                            
                            <!-- 
                            토글방식 메뉴바
                            <li class="nav-item"><a class="nav-link" href="/">FAQ</a></li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Portfolio</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio">
                                    <li><a class="dropdown-item" href="portfolio-overview.html">Portfolio Overview</a></li>
                                    <li><a class="dropdown-item" href="portfolio-item.html">Portfolio Item</a></li>
                                </ul>
                            </li>
                             -->
                        </ul>
                    </div>
                </div>
            </nav>
       
