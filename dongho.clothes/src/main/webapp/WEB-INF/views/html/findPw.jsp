<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>findPw</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script>
goBack = function(){
	history.back();
}
$(function(){
	var id=$("#id");
	var username=$("#username");
	var pwQueryType=$("#pwQueryType option:selected").val();
	console.log(pwQueryType);
	var pwAnswer=$("#pwAnswer");
	
	//인증하기 버튼 클릭시
	$("#loginBtn").bind("click", function(){ 
		if(id.val().length == 0 || username().length() == 0){
			msg.text("로그인 정보를 ");
			modal.modal('show');
		}
	});
});
</script>
<style>
@font-face{
	font-family:'hywulm';
	src:url('../img/HYWULM.TTF') format('truetype');
}
.btn-default{
	border-radius: 20px;
}
 
#top{ 
	width: 100%; 
 	height: 50px; 
/*  	border: solid 1px black;  */
 	background-color: #cc0066;
 	font-family: hywulm;
} 
	#goback{
/* 		border: solid 1px black;  */
		margin: 0 0;
		padding: 0 0;
	}
	#back{
		height: 50px;
		width: 50px;
		color: #FFFFFF;
		background-color: #cc0066;
	}
	#title{
		color: #FFFFFF; 
		text-align: center;
/*   		border: solid 1px black; */
		width:150px; 
 		margin-right:105px; 
 		margin-left:55px; 
	}
#body{
	margin-top: 50px;
	padding-top: 130px;
	font-family: 'hywulm';  
}
	p.check{
		text-align: center;
		color: #cc0066;
		visibility: hidden;
	}
	#checkBtn{
		border: solid 1px #cc0066;
		background-color: #cc0066;
		color: #FFFFFF;
	}
	#loginBtn{
		background-color: #cc0066;
		color: #FFFFFF;
	}
#resultModal{
	font-family: 'hywulm';
	text-align: center;  
}	
	.modal-header{
		background-color: #cc0066;
		color: #FFFFFF;
	}
</style>
</head>

<body>
<div id="top" class="navbar navbar-fixed-top">
	<div id="goback" class="navbar-brand">
		<button type="button" id="back" class="btn" onclick="goBack()"><span class="glyphicon glyphicon-chevron-left"></span></button>
   	</div> 
   	<div id="title" class="navbar-brand">비밀번호 찾기</div> 
</div> 

<div id="body">
	<div class="container" id="findpwForm">
		<form role="form" action="changePw.html" method="post">
			<p class="check" id="validCheck">인증 정보를 입력해주세요</p>	
			<div class="form-group">
				<input type="text" class="form-control" id="id" maxlength="12" placeholder="아이디" required>
			</div>
			
			<div class="form-group">
				<input type="text" class="form-control" id="username" maxlength="30" placeholder="이름" required>
			</div>
			<div class="form-group">
				<select id="pwQueryType" class="form-control" required>
					<option value="select" selected disabled>비밀번호 찾기 질문</option>
					<option value="나의 별명은?">나의 별명은?</option>
					<option value="나의 고향은?">나의 고향은?</option>
					<option value="제일 좋아하는 색깔은?">제일 좋아하는 색깔은?</option>
					<option value="제일 좋아하는 음식은?">제일 좋아하는 음식은?</option>
	  		   	</select> 
	   			<input type="text" class="form-control" id="pwAnswer" placeholder="답변" size=20/>	 
			</div>
			
			<div class="col-xs-6">
				<button type="button" id="cancelBtn" class="btn btn-default btn-block" onclick="goBack()">취소</button>
			</div>
			<div class="col-xs-6">
				<button type="button" id="checkBtn" class="btn btn-default btn-block" onclick="location.href='changePw.html'">인증하기</button>
			</div>
		</form>
	</div>	
</div>
</body>
</html>