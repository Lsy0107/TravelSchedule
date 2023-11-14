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
<title>MemberList - admin</title>
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
                    <h1 class="h3 mb-2 text-gray-800">회원관리</h1>
                    

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">회원정보</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>MID</th>
                                            <th>MPW</th>
                                            <th>MNICKNAME</th>
                                            <th>MPROFILE</th>
                                            <th>MSTATE</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            <c:forEach items="${ mList}" var="mem">
                                        <tr>
                                            <td>${mem.mid}</td>
                                            <td>${mem.mpw}</td>
                                            <td>${mem.mnickname}</td>
                                            <td>${mem.mprofile}</td>
                                            <td class="dropdown no-arrow">${mem.mstate}
			                                     <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
			                                         data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
			                                     </a>
			                                     <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
			                                         aria-labelledby="dropdownMenuLink">
			                                         <div class="dropdown-header">MEMBER STATE</div>
			                                         <a class="dropdown-item" style="width: 120px;" onclick="mstateNN('${mem.mid}')">회원정지</a>
			                                         <a class="dropdown-item" style="width: 120px;" onclick="mstateNY('${mem.mid}','${mem.mpw }')">정지해제</a>
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
	function mstateNN(mid) {
		console.log(mid);
		$.ajax({
			url:"/mstateNN",
			type:"post",
			data: {'mid' : mid},
			aync:false,
			success:function(rs){
				if(rs == "Y"){
					location.reload();
				}
				if(rs == "N"){
					alert("회원정지 실패.");
				}
			}
		})
	}
	function mstateNY(mid, mpw) {
		console.log(mid);
		$.ajax({
			url:"/mstateNY",
			type:"post",
			data: {'mid' : mid, 'mpw':mpw},
			aync:false,
			success:function(rs){
				if(rs == "Y"){
					location.reload();
				}
				if(rs == "N"){
					alert("회원해제정지 실패.");
				}
			}
		})
	}
</script>


</html>