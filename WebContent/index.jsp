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
	<link href="./css/index.css?after" rel="stylesheet" type="text/css">
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
            <input type="text" class="date-input form-control" id="destination" placeholder="목적지">
          </div>
        </div>
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="search-heading">
            <button type="button" class="btn search-btn btn-md" id="search" onclick="search_item();">SEARCH</button>
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
          <a href="./index.jsp">
            <h2 class="post-title" style="margin-top: 10px">
              Service
            </h2>
            <h3 class="post-subtitle">
              나만을 위한 여행 가이드
            </h3>
          </a>
          <div class="col-lg-3 col-md-6 text-center service-contents">
            <div class="mt-5" style="margin-top: 10px!important">
              <i class="fas fa-4x text-primary mb-4 service-contents"><img src="./img/Special.png" class="index-icon" /></i>
              <h3 class="h3 mb-2">Special</h3>
              <p class="text-muted mb-3">현지인만이 경험할 수 있는 최고의 품질과 차별화된 여행 서비스</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center service-contents">
            <div class="mt-5" style="margin-top: 10px!important">
              <i class="fas fa-4x text-primary mb-4 service-contents"><img src="./img/Optimum.png" class="index-icon" /></i>
              <h3 class="h3 mb-2">Optimum</h3>
              <p class="text-muted mb-3">원치않은 쇼핑과 바가지 <br>구매 등 단체 여행 속 불쾌함 제거</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center service-contents">
            <div class="mt-5" style="margin-top: 10px!important">
              <i class="fas fa-4x text-primary mb-4 service-contents"><img src="./img/Together.png" class="index-icon" /></i>
              <h3 class="h3 mb-2">Together</h3>
              <p class="text-muted mb-3">KT 임직원에 한정된 팔로워로 KT 그룹 내 소통 채널 제공</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center service-contents">
            <div class="mt-5" style="margin-top: 10px!important">
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
          <p class="post-meta">Posted by 미경
            on March 15, 2019</p>
            <!-- modal portfolio -->
            <div class="modal fade scroll" id="my-modal" role="dialog">
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
                                  <span class="meta">Posted by 미경
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
                                  <h2 class="section-heading">프라하로 떠나다.</h2>
                                  <p>KTrip에서 황홀한 부다페스트,프라하투어를 신청하여 유럽여행 일정에 가이드 투어를 추가할 수 있었다. 비엔나를 떠나 부다페스트를 향하면서 수채화 같은 전원 풍경은 사라지고 끝없이 펼쳐지는 초원만이 눈에 들어왔다.</p>
                                  <p>브람스와 리스트가 활동 한 부다페스트를 밤에 도착해 아름다운 다뉴브강의 선상에서 슈트라우스 음악을 듣고 부다페스트의 야경을 바라보며 샴페인을 마시니 꿈만 같았다. 다뉴브강에서 150년 된 가장 오래된 란찌우드 다리는 수천 개의 전구로 밝고 환하게 다뉴브강을 장식했다. 길이가 417 킬로나 되는 다뉴브강 중에서 부다페스트의 강폭이 가장 넓고 수심이 30미터 된다고 하는데 선상에서 가까이 보니 물살이 상당히 빨랐다.</p>
                                  <p>헝가리는 동양에서 이민 온 머지르 종족이 세운 나라이며 <유럽 안의 유일한 동양 족의 섬>이라고 부른다. 1200년 동안 유럽인과 동화되었으나 우랄알타이 언어와 마늘, 고추 먹는 문화가 우리와 흡사해서 친근감이 갔다. <여성천국>으로 세대주, 호주가 어머니이며 어머니의 힘이 대단하다. 헝가리에는 12명의 성인이 있는데 그 중에서 기독교를 전파하고 순교한 성인은 겔러러트 라고 한다. 루터교의 본당과 칼빈 교회가 나란히 지어져있고 또한 히틀러가 유대인 학살한 사죄로 지어준 유럽최대의 유태교회가 있다.</p>
                                  <hr>
                                  <h2 class="section-heading">부다페스트에 담겨있는 역사</h2>
                                  <p>도시 한가운데를 다뉴브강이 흐르고 언덕 위에 부다는 부다 성을 비롯해 귀족들이 사는 지역이고 페스트는 평지로 상인과 농부가 주로 거주한다. 부다페스트는 유네스코 지정도시이며 주로 150-200년 된 건물들로 새로 짓지 못하고 수리만 가능하다.
맨 처음에 간 곳은 1896년에 만든 헝가리 건국 천년동안에 역사적인 인물들의 기념비가 있는 페스트 지역의 영웅광장 이었다. 십자군 원정을 통해 교황청이 선정한 성인으로 오른손에 십자가를 든 <건국의 왕> 이스트 반 대왕의 동상이 있는데 국빈이오면 이스트 반 동상의 손에 키스한다고 했다.</p>
                                  <p>다음에는 다리를 건너 13세기부터 수도이었던 부다 지역으로 이동해 왕궁으로 올라가면서 <어부의 요새>라 부르는 계단을 통과했다. 전에는 어부들이 이곳에서 적이 쳐들 어 오는 것을 감시한곳이다. 부다 성은 13-15세기에 지었는데 외세의 침략으로 왕이 제대로 살지 못한 <비운의 성>이다. 건물만 있고 사람이 산 흔적이 별로 없다. 13세기에 몽고 군이 침공해 헝가리공주를 폴랜드 와 정략결혼을 시켜 공주가 시집가면서 성 근처에 결혼반지를 던졌는데 그곳에서 지하 300킬로나 되는 소금광산이 발견되고 부자가 되어 부다페스트 도시가 탄생되었다고 한다. 언덕 위에 부다 성 지역은 유네스코 문화재이며 영화 에비타, 닥터 지바고, 글루미 선데이 등을 촬영한곳으로도 유명하다. 길가에 총탄 투성 이인 독일군 요새와 베토벤이 최초로 연주한 기념관도 있고 현재 꽤 넓은 로마인 유적지가 발굴 중이었다.</p>
                                  <p>헝가리는 15세기 때 터키의 지배를 받고 이슬람교가 들어 왔으나 카톨릭이 오늘날 정치, 종교의 중심이며 노벨 과학상 수상자를 14명이나 배출했다. 부다페스트는 야경과 온천, 똑가이 라는 백포도주, 도자기, 자수품이 유명하다.</p>
                                  <p>부다페스트를 출발해 끝없는 평원을 3시간 달려 슬로바키아 국경의 공동구역에 도착하고 영화 <쉰들러리스트>를 버스 속에서 감상하며 2시간 가서 체코 입국수속을 하는데 시간이 많이 걸려 밤10시에 프라하에 도착했다. 저녁을 먹고 택시로 프라하성의 야경을 보러 갔다.</p>
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
                                <a href="./index.jsp#">
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
             </div>
        </div>
        <hr>
      </div>
    </div>

  <hr>
	<%@ include file="./footer.jsp"%>
</body>
</html>