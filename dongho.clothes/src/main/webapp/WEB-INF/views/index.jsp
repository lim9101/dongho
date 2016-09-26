<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>index</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
@import url("<c:url value="/css/index.css"/>")
</style>
</head>
<body>
<div id="top" class="navbar navbar-fixed-top"> 
	<div id="logo">
		<div id="title">ㄴㅔㄴㅐㅇㅗㅅ</div>
	 	<img src="<c:url value="/img/logo2.png"/>" alt="logo">
	</div>
	<div id="content">
		네옷 내옷을 거래하는 프리마켓<br>
		ㄴㅔㄴㅐㅇㅗㅅ
	</div>
</div> 
		
<div id="bottom" class="navbar navbar-fixed-bottom">
<div class="container">
	<form>
		<div class="col-xs-6">
			<button type="button" id="loginBtn" class="btn btn-default btn-block" onclick="location.href='login'">로그인</button>
		</div>
		<div class="col-xs-6">
			<button type="button" id="joinBtn" class="btn btn-default btn-block" onclick="location.href='join'">회원가입</button>
		</div>
	</form>
</div>
</div>	
</body>
</html>