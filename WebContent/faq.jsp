<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>FAQ</title>

	<!-- jQuery and moment.js -->
	<script src="./bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<link href="./bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom fonts for this template -->
	<link href="./vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="./index_files/css" rel="stylesheet" type="text/css">
	<link href="./index_files/css(1)" rel="stylesheet" type="text/css">
	<link href="./index_files/icon" rel="stylesheet">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="./css/clean-blog.min.css" rel="stylesheet">
	<!-- faq.css -->
	<link href="./css/faq.css" rel="stylesheet" type="text/css">
	<!-- common.css, common.js clean-blog.min.js -->
	<link href="./css/common.css" rel="stylesheet" type="text/css">
	<script src="./js/common.js"></script>
	<script src="./js/clean-blog.min.js"></script>
</head>
<body>
	<%@ include file="./header.jsp"%>
    <header class="masthead header-block" id="faq-header-img">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
					<div class="page-heading">
					    <h1>FAQ</h1>
					    <!--span class="subheading">자주 묻는 질문</span-->
					</div>
                </div>
            </div>
        </div>
    </header>
    <div class="container">
        <div class="row">
            <div class="col-lg-9 col-md-10 mx-auto">
                <!--Sub Header-->
                <nav class="navbar navbar-expand-lg">
                    <div class="container-fluid">
                        <div class="navbar-collapse collapse show" id="navbarResponsive">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="./notice.jsp">공지사항</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="./faq.jsp">자주묻는 질문</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="./contactus.jsp">문의하기</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <hr>
            </div>
            <div class="col-lg-8 col-md-10 mx-auto">
                <table>
                    <tr>
                        <td>예약 취소하고 싶어요.</td>
                        <td class="more" rowspan="2"><a data-toggle="modal" href="#faq-modal-1" id="faq-modal" ><img class="next-img" src="./img/next.png"></a>
                        </td>
                    </tr>
                    <tr class="even">
                        <td>관리자 | 2019.02.28</td>
                    </tr>
                    <tr>
                        <td>가이드에게 문의를 했는데 답변이 없어요.</td>
                        <td class="more" rowspan="2"><a href="./faq_detail.jsp"> <img class="next-img" src="./img/next.png"></a>
                    </tr>
                    <tr class="even">
                        <td>관리자 | 2019.02.28</td>
                    </tr>
                    <tr>
                        <td>환불은 언제 되나요?</td>
                        <td class="more" rowspan="2"><a href="./faq_detail.jsp"> <img class="next-img" src="./img/next.png"></a></td>
                    </tr>
                    <tr class="even">
                        <td>관리자 | 2019.02.28</td>
                    </tr>
                    <tr>
                        <td>계정 탈퇴는 어떻게 하나요?</td>
                        <td class="more" rowspan="2"><a href="./faq_detail.jsp"> <img class="next-img" src="./img/next.png"></a></td>
                    </tr>
                    <tr class="even">
                        <td>관리자 | 2019.02.28</td>
                    </tr>
                    <tr>
                        <td>비밀번호/로그인 계정을 잊어버렸는데 초기화할 수 있나요?</td>
                        <td class="more" rowspan="2"><a href="./faq_detail.jsp"> <img class="next-img" src="./img/next.png"></a></td>
                    </tr>
                    <tr class="even">
                        <td>관리자 | 2019.02.28</td>
                    </tr>
                </table>
                <!-- modal content -->
                <div class="modal fade" id="faq-modal-1" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <!-- Page Header -->
                            <header class="faq-modal modal-header masthead header-block">
                                <div class="overlay"></div>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-8 col-md-10 mx-auto">
                                            <div class="post-heading" id="faq-heading">
                                                <h2>예약 취소하고 싶어요.</h2>
                                                <span class="meta">관리자 | 2019.02.28</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </header>
                            <!-- Main Content -->
                            <article class="modal-body">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-10 col-md-10 mx-auto">
                                            <h5 class="text-info">제목</h5>
                                            <div class="title" id="faq_title" >예약 취소하고 싶어요.</div>
                                            <hr>
                                            <h5 class="text-info">내용</h5>
                                            <div class="content" id="faq_content">
                                                확정대기 중 취소일 경우 전액환불이 가능한, 확정 후 취소일 경우 상품 페이지에 기재된 취소/환불 규정에 따라 처리됩니다.
                                                <br><br>*일부 상품의 경우 확정 후 취소/변경/환불이 불가능한 점 참고 부탁드립니다.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                            <hr>
                            <!-- Footer -->
                            <footer class="modal-footer">
                                <div class="container">
                                    <div class="row">
                                    <div class="col-lg-8 col-md-10 mx-auto">
                                        <ul class="list-inline text-center">
                                        <li class="list-inline-item">
                                            <a href="./index.jsp#">
                                            <span class="fa-stack fa-lg">
                                                <i class="fas fa-circle fa-stack-2x"></i>
                                                <i class="fab fa-chrome fa-stack-1x fa-inverse"></i>
                                            </span>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="https://github.com/WonHyeongCho/ktcp-fresh-ktds#">
                                            <span class="fa-stack fa-lg">
                                                <i class="fas fa-circle fa-stack-2x"></i>
                                                <i class="fab fa-github fa-stack-1x fa-inverse"></i>
                                            </span>
                                            </a>
                                        </li>
                                    <li class="list-inline-item">
                                            <a href="./contactus.jsp#">
                                            <span class="fa-stack fa-lg">
                                                <i class="fas fa-circle fa-stack-2x"></i>
                                                <i class="fas fa-envelope fa-stack-1x fa-inverse"></i>
                                            </span>
                                            </a>
                                        </li>
                                        </ul>
                                        <p class="copyright text-muted">주소: 서울특별시 서초구 방배동 1001-1 대표 전화 : 02-523-7029 <br>
                                        <a href="./index.jsp#">KTrip</a>
                                        Copyright © <a href="https://www.ktds.com/index.jsp">KTds</a> All Rights Reserved.</p>
                                    </div>
                                    </div>
                                </div>
                            </footer>
                        </div>
                    </div>
                </div>
                <div class="pagination-wrap justify-content-center">
                    <div class="pagination">
                        <a></a>
                        <a class="active">1</a>
                        <a>></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <%@ include file="./footer.jsp"%>
</body>
</html>