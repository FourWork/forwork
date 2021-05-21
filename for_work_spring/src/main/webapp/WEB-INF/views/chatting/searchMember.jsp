<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.title-container {
	width: 100%;
	background-color: rgb(212, 214, 241);
	height: 80px;
	margin: auto;
}

.title {
	margin-left: 43%;
	line-height: 80px;
	font-weight: bold;
	font-size: 20px;
}

.search {
	padding-left: 2%;
	width: 97%;
	height: 40px;
	margin-top: 10px;
	border: 1px solid rgb(212, 211, 211);
}

.search:focus {
	outline: none !important;
	border: 1px solid #5a1ac0;
}

.btn {
	background-color: #5a1ac0;
	padding: 15px;
	border-radius: 10px;
	color: white;
	font-size: 13px;
	text-decoration: none;
	margin-right: 20px;
}

#all {
	height: 900px;
}

#member {
	height: 70%;
}

#footer {
	margin-left: 45%;
}

.member-list {
	list-style: none;
}

.member-list li {
	float: left;
	padding-top: 30px;
	line-height: 40px;
}

.member-list li:hover {
	font-weight: bold;
	cursor: pointer;
	color: #5a1ac0;
}

.bold {
	font-weight: bold;
	color: #5a1ac0;
}

.profile {
	padding-top: 30px;
	padding-right: 20px;
	float: left;
	clear: both;
}

.bubble {
	display: inline-block;
	max-width: 300px;
	font-size: 14px;
	position: relative;
}
</style>
</head>
<body>
	<div id="all">
		<div class="title-container">
			<div class="title">대화상대 초대</div>
		</div>
		<input type="text" class="search" placeholder="이름으로 검색해보세요" />
		<div id="member"></div>
		<div id="footer">
			<a class="btn">취소</a><a class="btn"><span id="num-member">0</span>명 초대</a>
		</div>
	</div>
</body>
<script src="/resources/assets/vendor/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/chatting.js"></script>
<script>
	let selectedMembers = [];
	let memberContainer = document.querySelector("#member");
	let numSelected = document.querySelector("#num-member");
	chattingService.getAllMembers(function(members){
		html = "<ul class='member-list'>";
		members.forEach(member => {
			html += '<img class="bubble profile" src="/resources/Img/profile.png" width="38"><li class="member" data-member-id="' + member.member_id + '" onclick="addMember(this)">' + member.name + "</li>"
		})
		html += "</ul>"
		memberContainer.innerHTML = html
	})
	
	function addMember(e){
		let memberId = e.dataset.memberId;
		if (selectedMembers.includes(memberId)){
			let idx = selectedMembers.indexOf(memberId);
			if (idx > -1) selectedMembers.splice(idx, 1);
			e.classList.remove("bold");
		} else {
			selectedMembers.push(memberId);
			e.classList.add("bold");
		}
		numSelected.innerHTML = selectedMembers.length;
	}
	
</script>
</html>
