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
        </head>

        <body class="d-flex flex-column h-100">
            <main class="flex-shrink-0">
                <!-- Navigation-->
                <%@ include file="/WEB-INF/views/include/menu.jsp" %>
                    <!-- contant 시작 -->
                    <div class="row">
                        <div class="col-lg-8">
                            <div id="rowid" class="row">
                                <c:forEach var="TdList" items="${TdestList}">
                                    <div id="contain" class="col-lg-4 col-md-6">
                                        <!-- Blog post-->
                                        <div class="card mb-4" id="photo">
                                            <a href=""><img class="card-img-top" src="${TdList.tdphoto}"
                                                    alt="..." /></a>

                                            <div class="card-body">

                                                <h2 id="title" class="card-title h4" title="${TdList.tdname}"
                                                    style="overflow: hidden; white-space: nowrap;">${TdList.tdname}</h2>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                    <div class="pagination-container">
                        <div class="prev-button">이전</div>
                        <div class="number-button-wrapper"><span class="number-button">1</span></div>
                        <div class="next-button">이후</div>
                    </div>


                    <!-- contant 종료 -->
            </main>
            <!-- Footer-->
            <%@ include file="/WEB-INF/views/include/footer.jsp" %>
                <!-- Bootstrap core JS-->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                <!-- Core theme JS-->
                <script src="resources/js/scripts.js"></script>

              

        </body>

        </html>