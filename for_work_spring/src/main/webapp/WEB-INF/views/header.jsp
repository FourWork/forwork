<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="Start your development with a Dashboard for Bootstrap 4.">
  <meta name="author" content="Creative Tim">
  <title>Argon Dashboard - Free Dashboard for Bootstrap 4</title>
  <!-- Favicon -->
  <link rel="icon" href="../../resources/assets/img/brand/favicon.png" type="image/png">
  <!-- Fonts -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
  <!-- Icons -->
  <link rel="stylesheet" href="../../resources/assets/vendor/nucleo/css/nucleo.css" type="text/css">
  <link rel="stylesheet" href="../../resources/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
  <!-- Page plugins -->
  <!-- Argon CSS -->
  <link rel="stylesheet" href="../../resources/assets/css/argon.css?v=1.2.0" type="text/css">
</head>   
  
<body>
<%@ include file="sidebar.jsp" %>
	
  <!-- Main content -->
  <div class="main-content" id="panel">
    <!-- Topnav -->
    <nav class="navbar navbar-top navbar-expand navbar-dark bg-primary border-bottom">
      <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <!-- Search form -->
          <form class="navbar-search navbar-search-light form-inline mr-sm-3" id="navbar-search-main">
            <div class="form-group mb-0">
              <div class="input-group input-group-alternative input-group-merge">
                <div class="input-group-prepend">
                  <span class="input-group-text"><i class="fas fa-search"></i></span>
                </div>
                <input class="form-control" placeholder="Search" type="text">
              </div>
            </div>
            <button type="button" class="close" data-action="search-close" data-target="#navbar-search-main" aria-label="Close">
              <span aria-hidden="true">Ã</span>
            </button>
          </form>
          <!-- Navbar links -->
          <ul class="navbar-nav align-items-center  ml-md-auto ">
            <li class="nav-item d-xl-none">
              <!-- Sidenav toggler -->
              <div class="pr-3 sidenav-toggler sidenav-toggler-dark" data-action="sidenav-pin" data-target="#sidenav-main">
                <div class="sidenav-toggler-inner">
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                </div>
              </div>
            </li>
            
            <li class="nav-item dropdown">
              <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="ni ni-chat-round"></i>
              </a>
              <div class="dropdown-menu dropdown-menu-xl  dropdown-menu-right  py-0 overflow-hidden">
                <!-- Dropdown header -->
                <div class="px-3 py-3">

                  <h6 class="text-sm text-muted m-0">You have <strong class="text-primary" id="n-chatroom"></strong> chatrooms.</h6>
                </div>
                <!-- List group -->
                <div id="listChat">
                </div>
                <!-- View all -->
                <a href="#!" class="dropdown-item text-center text-primary font-weight-bold py-3">View all</a>
              </div>
            </li>
          </ul>
          <ul class="navbar-nav align-items-center  ml-auto ml-md-0 ">
            <li class="nav-item dropdown">
              <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <div class="media align-items-center">
                  <span class="avatar avatar-sm rounded-circle">
                    <i class="ni ni-single-02"></i>
                  </span>
                  <div class="media-body  ml-2  d-none d-lg-block">
                    <span class="mb-0 text-sm  font-weight-bold">John Snow</span>
                  </div>
                </div>
              </a>
              <div class="dropdown-menu  dropdown-menu-right ">
                <div class="dropdown-header noti-title">
                  <h6 class="text-overflow m-0">Welcome!</h6>
                </div>
                <a href="#!" class="dropdown-item">
                  <i class="ni ni-single-02"></i>
                  <span>My profile</span>
                </a>
                <a href="#!" class="dropdown-item">
                  <i class="ni ni-settings-gear-65"></i>
                  <span>Settings</span>
                </a>
                <a href="#!" class="dropdown-item">
                  <i class="ni ni-calendar-grid-58"></i>
                  <span>Activity</span>
                </a>
                <a href="#!" class="dropdown-item">
                  <i class="ni ni-support-16"></i>
                  <span>Support</span>
                </a>
                <div class="dropdown-divider"></div>
                <a href="#!" class="dropdown-item">
                  <i class="ni ni-user-run"></i>
                  <span>Logout</span>
                </a>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </nav>
<input type="text" value="${userId }" id="user" style="display:none;">
<script src="/resources/assets/vendor/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/chatting.js"></script>
<script type="text/javascript">
	// TODO: userId 받아와서 채팅방 목록 꾸려주기
	let userId = document.getElementById("user").value;
	
	chattingService.getChatrooms(userId, function(chatrooms){
		chattingService.getLastMessages(userId, function(lastMessages){
			console.log(lastMessages);
			let chatroomBox = document.querySelector("#listChat");
			let chatroomNumber = document.querySelector("#n-chatroom");
			chatroomNumber.innerHTML = chatrooms.length;
			let html = "";
			chatrooms.forEach(chatroom => {
				let lastMessageOfChatroom = lastMessages.find(m => m.chatroom_id === chatroom.chatroom_id);
				if (!lastMessageOfChatroom){
					lastMessageOfChatroom = {
						"chatroom_id" : "",
						"message" : "대화를 시작해보세요",
						"message_id" : "",
						"send_time" : "",
						"sender" : ""
					}
				}
				html += 
				'<div class="list-group list-group-flush">' + 
					'<a href="/chatting/chatroomDetail?userId=' + userId + '&chatroomId=' + chatroom.chatroom_id + '" class="list-group-item list-group-item-action">'+
						'<div class="row align-items-center">'+
							'<div class="col-auto">' +'<img alt="Image placeholder" src="/resources/Img/chatroom.png" class="avatar rounded-circle">'+'</div>' +
							'<div class="col ml--2">' +
								'<div class="d-flex justify-content-between align-items-center">' +
									'<div>' +'<h4 class="mb-0 text-sm">' + chatroom.chatroom_name + '</h4>' +'</div>' +
									'<div class="text-right text-muted">' +'<small>' + lastMessageOfChatroom.send_time + '</small>' + '</div>' +
								'</div>' +
								'<p class="text-sm mb-0">' + lastMessageOfChatroom.message + '</p>' +
							'</div>' +
						'</div>' +
					'</a>' +
				'</div>'
			})
			chatroomBox.innerHTML = html;
		})
	});
</script>