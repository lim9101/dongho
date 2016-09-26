<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>changePw</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="<c:url value="/js/changePw.js"/>"></script>
<style>
@import url("<c:url value="/css/changePw.css"/>")
</style>
</head>

<body>
<div id="top" class="navbar navbar-fixed-top">
	<div id="goback" class="navbar-brand">
		<button type="button" id="back" class="btn" onclick="goBack()"><span class="glyphicon glyphicon-chevron-left"></span></button>
   	</div> 
   	<div id="title" class="navbar-brand">비밀번호 변경</div> 
</div> 

<div id="body">
	<div class="container" id="pwForm">
		<form role="form" method="post">
			<p class="check" id="pwCheck">변경할 비밀번호를 입력하세요</p>	
			<div class="form-group">
				<input type="text" class="form-control" id="pw" name="pw" placeholder="비밀번호">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" id="pwConfirm" name="pw" placeholder="비밀번호확인">
			</div>			
			<hr align="center" size="10" width="100%" color="#DBDBDC" />
			
			<div class="col-xs-6">
				<button type="button" id="cancelBtn" class="btn btn-default btn-block" onclick="goBack()">취소</button>
			</div>
			<div class="col-xs-6">
				<button type="button" id="changePwBtn" class="btn btn-default btn-block" onclick="location.href='main2.html'">변경하기</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>