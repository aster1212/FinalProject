<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>kingsman 관리자페이지</title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=cp %>/resources/admincss/bootstrapadmin.min.css" rel="stylesheet" type="text/css">
	<style type="text/css">
		@media(min-width:768px) {
   		 #page-wrapper {
        margin: 0 0 0 250px !important;
       
  
    }
}
	</style>

	 <!-- Custom CSS -->
    <link href="<%=cp %>/resources/admincss/sb-admin-2.css" rel="stylesheet">
	<!-- jQuery -->
	
    <script src="<%=cp %>/resources/admincss/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%=cp %>/resources/admincss/bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<%=cp %>/resources/admincss/sb-admin-2.js"></script>
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0;background-color:#337AB7">
            <div class="navbar-header" style="background-color:#337AB7">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand"style="color:#fff;" href="/kingsman/admin/adminPage">KINGSMAN 관리자페이지</a>
            </div>
            <!-- /.navbar-header -->
	
	
	
	
	
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        
                        <li>
                            <a href="/kingsman/admin/adminPage" style="background: #e7e7e7;border-bottom: 1px solid #F8F8F8;"><i class="fa fa-dashboard fa-fw"></i>관리자홈</a>
                        </li>
						<li>
                            <a href="/kingsman/main" style="background: #e7e7e7;border-bottom: 1px solid #F8F8F8;"><i class="fa fa-dashboard fa-fw"></i>쇼핑몰로</a>
                        </li>
						<li class="active">
                            <a href="#"style="background: #e7e7e7;"><i class="fa fa-bar-chart-o fa-fw"></i>상품관리<span class="fa arrow">▼</span></a>
							 <ul class="nav nav-second-level">
                                <li>
                                    <a href="/kingsman/goods/goodsList">- 상품목록★ </a>
                                </li>
                                <li>
                                    <a href="/kingsman/goods/goodsForm">- 상품등록</a>
                                </li>
                            </ul>
                        </li>
                        <li class="active">
                            <a href="#"style="background: #e7e7e7;"><i class="fa fa-dashboard fa-fw"></i>회원관리<span class="fa arrow">▼</span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/kingsman/admin/memberList?onOff=0&searchNum=0&isSearch=">회원목록 </a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>   
                                             
                        <li class="active">
                            <a href="#"style="background: #e7e7e7;"><i class="fa fa-bar-chart-o fa-fw"></i>주문관리<span class="fa arrow">▼</span></a>
							 <ul class="nav nav-second-level">
                                <li>
                                    <a href="/kingsman/order/orderList">- 주문목록</a>
                                </li>
                                <li>
                                    <a href="/kingsman/cancel/cancelList">- 주문취소목록</a>
                                </li>
                                <li>
                                    <a href="/kingsman/cancel/exchangeList">- 교환/반품목록</a>
                                </li>
                            </ul>
                        </li>
                        <li class="active">
                            <a href="#"style="background: #e7e7e7;"><i class="fa fa-bar-chart-o fa-fw"></i>게시판관리<span class="fa arrow">▼</span></a>
							 <ul class="nav nav-second-level">
                                <li>
                                    <a href="/kingsman/notice/noticeAdminList">- 공지사항</a>
                                </li>
                                <li>
                                    <a href="/kingsman/ad/adList">- 광고</a>
                                </li>
                                <li>
                                    <a href="/kingsman/admin/reviewAdmin">- 구매후기</a>
                                </li>
                                 <li>
                                    <a href="/kingsman/admin/faqAdmin">- FAQ</a>
                                </li>
                                <li>
                                    <a href="/kingsman/qna/qnaList">- Q&A</a>
                                </li>

                            </ul>
                        </li>
                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    

</body>

</html>