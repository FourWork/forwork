<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
session.setAttribute("member_id", 1);
%>
    <!-- Latest compiled and minified CSS -->

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<!-- 수정영역 -->
			<div class="column_left">
				<div class="card_">
            <div class="card-header">
              <div class="row align-items-center">
                <div class="col-8">
                  <h3 class="mb-0">포트폴리오 추가하기</h3>
                </div>
               <form action="insertPortfolioAction.do" method="post">
                <div class="col-4 text-right">
                 <!--  <a class="btn btn-sm btn-primary">submit</a> -->
                   <input class="btn btn-primary" type="submit" value="Submit">
                </div>
              </div>
            </div>
            <div class="portfolio">
      
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
                <!-- Description -->
                <h6 class="heading-small text-muted mb-4">포트폴리오 상세</h6>
                <div class="pl-lg-4">
					<div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label">포트폴리오 요약</label>
                        <textarea rows="4" class="form-control" placeholder="포트폴리오 요약" name="portfolio_detail">
                        </textarea>
                      </div>
                    </div>
                </div>
              </form>
   <!-- 언어 -->
                   <hr class="my-4">
                <h6 class="heading-small text-muted mb-4">포트폴리오 사용 언어</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label class="form-control-label" for="input-address">언어 추가</label>
                        <input type="text" name="language">
                        <button type="button" class="btn btn-primary">Add</button>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-city">추가된 언어</label>
						<div class="list-group">
						  <button type="button" class="list-group-item list-group-item-action active" aria-current="true">
						    The current button
						  </button>
						  <button type="button" class="list-group-item list-group-item-action">A second item</button>
						  <button type="button" class="list-group-item list-group-item-action">A third button item</button>
						  <button type="button" class="list-group-item list-group-item-action">A fourth button item</button>
						  <button type="button" class="list-group-item list-group-item-action" disabled>A disabled button item</button>
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