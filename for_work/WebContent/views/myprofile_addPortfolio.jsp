<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="Start your development with a Dashboard for Bootstrap 4.">
  <meta name="author" content="Creative Tim">
  <title>Argon Dashboard - Free Dashboard for Bootstrap 4</title>
  <!-- Favicon -->
  <link rel="icon" href="../assets/img/brand/favicon.png" type="image/png">
  <!-- Fonts -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
  <!-- Icons -->
  <link rel="stylesheet" href="../assets/vendor/nucleo/css/nucleo.css" type="text/css">
  <link rel="stylesheet" href="../assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
  <!-- Page plugins -->
  <!-- Argon CSS -->
  <link rel="stylesheet" href="../assets/css/argon.css?v=1.2.0" type="text/css">
<script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
  <!-- CSS -->
  <link href="CSS/myprofile.css" type="text/css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<div class="header_myProfile">
      <!-- Header container -->
      <div class="container_myProfile">
        <div class="row">
          <div class="col-lg-7 col-md-10">
            <h1 class="display-2 text-white">Hello Member</h1>
            <p class="text-white mt-0 mb-5">This is your profile page. You can see the progress you've made with your work and manage your projects or assigned tasks</p>
         <button type="button" class="btn btn-primary">Add Portfolio</button>
          </div>
        </div>
      </div>
    </div>
	<div class="content_container">
		<div class="row">
			<!-- 수정영역 -->
			<div class="column_left">
				<div class="card_">
            <div class="card-header">
              <div class="row align-items-center">
                <div class="col-8">
                  <h3 class="mb-0">포트폴리오 추가하기</h3>
                </div>
                <div class="col-4 text-right">
                  <a href="#!" class="btn btn-sm btn-primary">submit</a>
                </div>
              </div>
            </div>
            <div class="portfolio">
              <form>
                <h6 class="heading-small text-muted mb-4">Portfolio information</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label">포트폴리오 제목</label>
                        <input type="text" name="portfolio_title">
                      </div>
                    </div>

                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label">포트폴리오 기간</label><br>
                        <label class="form-control-label">
                        	<div class="portfolio_date">시작 날짜</div></label>
                        <input type="date" name="portfolio_start_date">
                         <label class="form-control-label">
                        	<div class="portfolio_date">종료 날짜</div></label>
                        <input type="date" name="portfolio_end_date">
                      </div>
                    </div>
                  </div>
                </div>
                <hr class="my-4">
                <!-- Address -->
                <h6 class="heading-small text-muted mb-4">포트폴리오 사용 언어</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label class="form-control-label" for="input-address">언어 추가</label>
                        <input type="text" name="language">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-city">추가된 언어</label>

                      </div>
                    </div>

                  </div>
                </div>
                <hr class="my-4">
                <!-- Description -->
                <h6 class="heading-small text-muted mb-4">포트폴리오 상세</h6>
                <div class="pl-lg-4">
					<div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label">포트폴리오 요약</label>
                        <textarea rows="4" class="form-control" placeholder="포트폴리오 요약">
                        </textarea>
                      </div>
                    </div>
                </div>
              </form>
            </div>
          </div>
			</div>
			
			<!-- 프로필 카드 영역 -->
			<div class="column_right">
				<div class="card card-profile">
					<div class="card-top"></div>
					<div class="row justify-content-center">
						<div class="col-lg-3 order-lg-2">
							<div class="card-profile-image">
								<a href="#"> <img src="https://ifh.cc/g/y53wll.jpg class="rounded-circle">
								</a>
							</div>
						</div>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col">
								<div class="card-profile-stats d-flex justify-content-center">
									<div>
										<span class="heading">22</span> <span class="description">Project</span>
									</div>
									<div>
										<span class="heading">10</span> <span class="description">Task-to-do</span>
									</div>
									<div>
										<span class="heading">89</span> <span class="description">Comments</span>
									</div>
								</div>
							</div>
						</div>
						<div class="text-center">
							<h5 class="h3">
								Jessica Jones<span class="font-weight-light">, 27</span>
							</h5>
							<div class="h5 font-weight-300">
								<i class="ni location_pin mr-2"></i>Bucharest, Romania
							</div>
							<div class="h5 mt-4">
								<i class="ni business_briefcase-24 mr-2"></i>Solution Manager -
								Creative Tim Officer
							</div>
							<div>
								<i class="ni education_hat mr-2"></i>University of Computer
								Science
							</div>

							<div class="card-body">
								<div class="chart-pie pt-4 pb-2">
									<div class="chartjs-size-monitor">
										<div class="chartjs-size-monitor-expand">
											<div class=""></div>
										</div>
										<div class="chartjs-size-monitor-shrink">
											<div class=""></div>
										</div>
									</div>
									<canvas id="myPieChart" width="314" height="245"
										class="chartjs-render-monitor"
										style="display: block; width: 314px; height: 245px;"></canvas>
								</div>
								<div class="mt-4 text-center small">
									<span class="mr-2"> 
									<i class="fas fa-circle text-primary"></i> Direct
									</span> 
									<span class="mr-2"> 
									<i class="fas fa-circle text-success"></i> Social
									</span> 
									<span class="mr-2"> 
									<i class="fas fa-circle text-info"></i>
										Referral
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%@ include file="footer.jsp" %>