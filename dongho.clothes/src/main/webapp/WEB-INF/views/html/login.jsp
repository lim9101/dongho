<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>login</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="<c:url value="/js/login.js"/>"></script>
<style>
@import url("<c:url value="/css/login.css"/>")
</style>
</head>

<body>
<div id="top" class="navbar navbar-fixed-top">
	<div id="goback" class="navbar-brand">
		<button type="button" id="back" class="btn" onclick="goBack()"><span class="glyphicon glyphicon-chevron-left"></span></button>
   	</div> 
   	<div id="title" class="navbar-brand">로그인</div> 
</div> 

<div id="body">
	<div class="container" id="joinForm">
		<form role="form" method="post">
			<p class="check" id="loginCheck">로그인 정보를 입력해주세요</p>	
			<div class="form-group">
				<input type="text" class="form-control" id="id" name="id" placeholder="아이디">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호">
			</div>			
			<hr align="center" size="10" width="100%" color="#DBDBDC" />
			
			<div class="col-xs-6">
				<button type="button" id="findpwBtn" class="btn btn-default btn-block" onclick="location.href='findPw'">비밀번호찾기</button>
			</div>
			<div class="col-xs-6">
				<button type="button" id="loginBtn" class="btn btn-default btn-block">로그인</button>
			</div>
		</form>
	</div>
</div>

<!-- modal -->
<div id="resultModal" class="modal fade" >
   	<div class="modal-dialog">
       	<div class="modal-content">
           	<div class="modal-header">
           		알림
           	</div>
           	<div class="modal-body">
           		<p id="msg"></p>
           	</div>            
           	<div class="modal-footer">
           		<div>
           			<button type="button" id="checkBtn" class="btn btn-default btn-block" data-dismiss="modal">확인</button>
           		</div>
        	</div>
     	</div>
     </div>
</div>


</body>
</html>