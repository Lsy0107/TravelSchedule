<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" ontent="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>ReviewList - admin</title>
<style>
	
</style>

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
			
            <!-- Navigation-->
            <%@ include file="/WEB-INF/views/include/menu.jsp" %>	
			<div class="row" style="margin: 45px;"></div>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">리뷰관리</h1>
                    

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">리뷰목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>MID</th>
                                            <th>RETITLE</th>
                                            <th>RECOMMENT</th>
                                            <th>REPHOTO</th>
                                            <th>REHIT</th>
                                            <th>REDATE</th>
                                            <th>RESTATE</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            <c:forEach items="${ rList}" var="re">
                                        <tr>
                                            <td>${re.mid}</td>
                                            <td>${re.retitle}</td>
                                            <td>${re.recomment}</td>
                                            <td>${re.rephoto}</td>
                                            <td>${re.rehit}</td>
                                            <td>${re.redate}</td>
                                            <td class="dropdown no-arrow">${re.restate}
                                            	<a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
			                                         data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
			                                     </a>
			                                     <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
			                                         aria-labelledby="dropdownMenuLink">
			                                         <div class="dropdown-header">REVIEW STATE</div>
			                                         <a class="dropdown-item" style="width: 120px;" onclick="reviewDel('${re.mid}', '${re.recode}', '${re.cdcode }')">리뷰삭제</a>
			                                     </div>
                                            </td>
                                        </tr>
                            </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer-->
       		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

</body>
<script type="text/javascript">
	function reviewDel(mid, recode, cdcode) {
		console.log(recode+', '+mid);
		$.ajax({
			url:"/reviewDelete",
			type:"post",
			data: {'mid' : mid, 'recode' : recode, 'cdcode':cdcode},
			aync:false,
			success:function(rs){
				if(rs == "Y"){
					location.reload();
				}
				if(rs == "N"){
					alert("리뷰삭제 실패");
				}
			}
		})
	}
</script>
</html>