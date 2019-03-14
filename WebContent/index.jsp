<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/smoothscroll/1.4.1/SmoothScroll.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>KTrip: 나만을 위한 여행 가이드</title>
	<!-- jQuery and moment.js and rome.js-->
	<script src="./bower_components/jquery/dist/jquery.min.js"></script>
	<script src="./bower_components/moment/min/moment.min.js"></script>
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
	<!-- Bootstrap material datetimepicker -->
	<script src="./bower_components/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
	<link href="./bower_components/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet" type="text/css">
	<!-- index.css, index.js -->
	<link href="./css/index.css" rel="stylesheet" type="text/css">
	<script src="./js/index.js"></script>
	<!-- common.css, common.js clean-blog.min.js -->
	<link href="./css/common.css" rel="stylesheet" type="text/css">
	<script src="./js/common.js"></script>
	<script src="js/clean-blog.min.js"></script>
</head>
<body>
	<%@ include file="./header.jsp"%>
	<!-- Page Header -->
  <header class="masthead header-blocks scroll" id="index-header-img">
    <div class="index-overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="site-heading" id="main-heading">
            <img src="./img/logo2.png" id="main-heading-logo" alt="KTrip">
            <span class="subheading"></span>
            </div>
          </div>
          <div class="form-group search-group">
            <label class="date-label" for="start-date"></label>
            <input type="text" class="date-input form-control" id="start-date" placeholder="출발">
            <label class="date-label" for="start-date"></label>
            <input type="text" class="date-input form-control" id="end-date" placeholder="도착">
            <label class="date-label" for="destination"></label>
            <input type="text" class="date-input form-control" placeholder="목적지">
          </div>
        </div>
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="search-heading">
            <button type="button" class="btn search-btn btn-md" id="search">SEARCH</button>
          </div>
          </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container scroll">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
        <div class="post-preview">
          <a href="./index.html">
            <h2 class="post-title">
              Service
            </h2>
            <h3 class="post-subtitle">
              나만을 위한 여행 가이드
            </h3>
          </a>
          <div class="col-lg-3 col-md-6 text-center service-contents">
            <div class="mt-5">
              <i class="fas fa-4x text-primary mb-4 service-contents"><img src="./img/Special.png" class="index-icon" /></i>
              <h3 class="h3 mb-2">Special</h3>
              <p class="text-muted mb-3">현지인만이 경험할 수 있는 최고의 품질과 차별화된 여행 서비스</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center service-contents">
            <div class="mt-5">
              <i class="fas fa-4x text-primary mb-4 service-contents"><img src="./img/Optimum.png" class="index-icon" /></i>
              <h3 class="h3 mb-2">Optimum</h3>
              <p class="text-muted mb-3">원치않은 쇼핑과 바가지 <br>구매 등 단체 여행 속 불쾌함 제거</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center service-contents">
            <div class="mt-5">
              <i class="fas fa-4x text-primary mb-4 service-contents"><img src="./img/Together.png" class="index-icon" /></i>
              <h3 class="h3 mb-2">Together</h3>
              <p class="text-muted mb-3">KT 임직원에 한정된 팔로워로 KT 그룹 내 소통 채널 제공</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center service-contents">
            <div class="mt-5">
              <i class="fas fa-4x text-primary mb-4 service-contents"><img src="./img/Trust.png" class="index-icon" /></i>
              <h3 class="h3 mb-2">Trust</h3>
              <p class="text-muted mb-3">믿을 수 있는 가이드 선별을 통해 안전한 매칭 서비스 제공</p>
            </div>
          </div>
          <br><br>
        </div>
      </div>
    </div>
  </div>

  <div class="container scroll">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
        <hr>
        <div class="post-preview">
          <a data-toggle="modal" href="#my-modal" id="modal-link">
            <h2 class="post-title">
              프라하에서 보낸 환상적인 여행
            </h2>
            <span class="subheading" id="portfolio-subheading">현지 가이드와 함께 최고의 여행을 만들다.</span>
          </a>
          <p class="post-meta">Posted by
            <a href="./index.html#">KTrip</a>
            on March 15, 2019</p>
            <!-- modal portfolio -->
            <div class="modal fade" id="my-modal" role="dialog">
                <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                    <!-- Page Header -->
                    <header class="modal-header masthead header-block" style="background-image: url(&#39;img/portfolio1.jpg&#39;)">
                      <div class="overlay"></div>
                      <div class="container">
                        <div class="row">
                          <div class="col-lg-8 col-md-10 mx-auto">
                              <div class="post-heading" id="portfolio-heading">
                                  <h2>프라하에서 보낸 환상적인 여행</h2>
                                  <span class="subheading" id="portfolio-subheading">현지 가이드와 함께 최고의 여행을 만들다.</span>
                                  <span class="meta">Posted by
                                          <a href="index.html">KTrip</a>
                                          on March 15, 2019</span>
                              </div>
                          </div>
                        </div>
                      </div>
                    </header>
                    <!-- Main Content -->
                    <article class="modal-body">
                    <div class="container">
                          <div class="row">
                              <div class="col-lg-9 col-md-11 mx-auto">
                                  <h2 class="section-heading">The Final Frontier</h2>
                                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe nostrum ullam eveniet pariatur voluptates odit, fuga atque ea nobis sit soluta odio, adipisci quas excepturi maxime quae totam ducimus consectetur?</p>
                                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius praesentium recusandae illo eaque architecto error, repellendus iusto reprehenderit, doloribus, minus sunt. Numquam at quae voluptatum in officia voluptas voluptatibus, minus!</p>
                                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut consequuntur magnam, excepturi aliquid ex itaque esse est vero natus quae optio aperiam soluta voluptatibus corporis atque iste neque sit tempora!</p>
                                  <hr>
                                  <h2 class="section-heading">The Final Frontier</h2>
                                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe nostrum ullam eveniet pariatur voluptates odit, fuga atque ea nobis sit soluta odio, adipisci quas excepturi maxime quae totam ducimus consectetur?</p>
                                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius praesentium recusandae illo eaque architecto error, repellendus iusto reprehenderit, doloribus, minus sunt. Numquam at quae voluptatum in officia voluptas voluptatibus, minus!</p>
                                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut consequuntur magnam, excepturi aliquid ex itaque esse est vero natus quae optio aperiam soluta voluptatibus corporis atque iste neque sit tempora!</p>
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
                                <a href="./index.html#">
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
                                <a href="./index.html#">
                                  <span class="fa-stack fa-lg">
                                    <i class="fas fa-circle fa-stack-2x"></i>
                                    <i class="fas fa-envelope fa-stack-1x fa-inverse"></i>
                                  </span>
                                </a>
                              </li>
                            </ul>
                            <p class="copyright text-muted">주소: 서울특별시 서초구 방배동 1001-1 대표 전화 : 02-523-7029 <br>
                            <a href="./index.html#">KTrip</a>
                            Copyright © <a href="https://www.ktds.com/index.jsp">KTds</a> All Rights Reserved.</p>
                          </div>
                        </div>
                      </div>
                    </footer>
                  </div>
                </div>
              </div>
             </div>
        </div>
        <hr>
      </div>
    </div>

  <hr>
	<%@ include file="./footer.jsp"%>
</body>
</html>