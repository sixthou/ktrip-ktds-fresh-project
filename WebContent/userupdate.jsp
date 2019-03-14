<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Edit profile</title>
	<!-- jQuery and moment.js and rome.js-->
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
	<!-- userupdate.css -->
	<link href="./css/userupdate.css" rel="stylesheet" type="text/css">
	<!-- common.css, common.js clean-blog.min.js -->
	<link href="./css/common.css" rel="stylesheet" type="text/css">
	<script src="./js/common.js"></script>
	<script src="js/clean-blog.min.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css" rel="stylesheet" >
	<link href="./languages/ko/LC_MESSAGES/ko.po" rel="gettext" type="application/x-po"/>
	<link href="./assets/css/geodatasource-countryflag.css" rel="stylesheet">
</head>
<body>
	<%@ include file="./header.jsp"%>
	<!-- Page Header -->
	<header class="masthead header-block" id="user-update-header-img">
	    <div class="overlay"></div>
	    <div class="container">
	        <div class="row">
	            <div class="col-lg-8 col-md-10 mx-auto">
	                    <div class="page-heading">
	                        <h1>EDIT PROFILE</h1>
	                        <!--span class="subheading">자주 묻는 질문</span-->
	                    </div>
	            </div>
	        </div>
	    </div>
	</header>
	<!-- Main -->
	<div class="container">
	  <div class="row">
	    <div class="col-lg-9 col-md-10 mx-auto">
	        <!--Sub Header-->
	       <nav class="navbar navbar-expand-lg">
	           <div class="container-fluid">
	               <div class="navbar-collapse collapse show" id="navbarResponsive">
	                   <ul class="navbar-nav mr-auto">
	                       <li class="nav-item">
	                           <a class="nav-link" href="./mypage.jsp">마이페이지</a>
	                       </li>
	                       <li class="nav-item">
	                           <a class="nav-link" href="./userupdate.jsp">회원정보변경</a>
	                       </li>
	                       <li class="nav-item">
	                           <a class="nav-link" href="./guide-registration.jsp">가이드 등록</a>
	                       </li>
	                   </ul>
	               </div>
	           </div>
	       </nav>
	       <hr>
	   </div>
	   <div class="col-lg-8 col-md-10 mx-auto">
	     <form name="user_update" id="user_update" action="updateCheck" method="post">
	       <div class="control-group">
	           <h5 class=text-info>ID</h5>
	           vo.getId()
	           <p class="help-block text-danger"></p>
	       </div>
	       <div class="control-group">
	         <h5 class=text-info>PASSWORD</h5>
	           <input type="Password" class="form-control" placeholder="비밀번호를 입력해 주세요" id="pwd" name="pwd" data-validation-required-message="필수 항목입니다.">
	           <p class="help-block text-danger"></p>
	       </div>
	       <div class="control-group">
	         <h5 class=text-info>EMAIL</h5>
	           vo.getEmail()
	           <p class="help-block text-danger"></p>
	       </div>
	       <div class="control-group">
	           <h5 class=text-info>NAME</h5>
	           vo.getName()
	           <p class="help-block text-danger"></p>
	       </div>
	       <div class="control-group">
	              <h5 class=text-info>GENDER</h5>
	              vo.getSex()
	              <p class="help-block text-danger"></p>
	          </div>
	       <div class="control-group">
	           <h5 class=text-info>PHONE</h5>
	           <input type="text" class="form-control" placeholder="휴대폰 번호(-제외)를 입력해 주세요" id="phone_num" name="phone_num" data-validation-required-message="필수 항목입니다.">
	           <p class="help-block text-danger"></p>
	       </div>
	       <div class="control-group">
	           <h5 class=text-info>COUNTRY</h5>
	           vo.getNational()
	           <p class="help-block text-danger"></p>
	       </div>
	       <div class="control-group">
	           <h5 class=text-info>RESIDENTIAL COUNTRY</h5>
	           <input type="text" class="form-control" placeholder="거주국가를 입력해 주세요" id="residential_country" name="residential_country" data-validation-required-message="필수 항목입니다.">
	           <p class="help-block text-danger"></p>
	       </div>
	       <input type="hidden" name="user_id" value="">
	        <div class="form-group">
	          <button type="submit" class="btn btn-primary" id="update">UPDATE</button>
	          <button type="button" class="btn btn-primary" id="cancel" onclick="location.href='./index.jsp' "> CANCEL </button>
	        </div>
	      </form>
	    </div>
	  </div>
	</div>
	<hr>
	<%@ include file="./footer.jsp"%>
</body>
</html>