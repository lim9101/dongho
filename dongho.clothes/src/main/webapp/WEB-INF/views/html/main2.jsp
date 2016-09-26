<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>main</title>
<meta charset="utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<%-- <script src="<c:url value="/js/main2.js"/>"></script> --%>
<script>
var img;
var productName;
var price;
var div;
var productDetail = function(product){
	$.ajax({
		url:"detailPage",
		data:$(product).data("product"),
		succsess:function(result){
		}
	}); 
	location.href="productDetail";
};
/* $("form").empty(); */
$.ajax({
	url:"getProducts",
	success:function(products){
		$(products).each(function(idx,product){
			div = $('<div class="productInfo" onClick="productDetail(this)">');
			img = $('<img src="<c:url value="/upload/'+product.picture+'"/>" width="100%" height="200px"></img>');
			productName =$("<div id='name'>"+"[p"+product.productNum+"]"+product.productName+"</div>");
			price = $('<div id="price">'+product.price+'</div></div>');
			$("form").append(div.append(img).append(productName).append(price));
			div.data("product",product);
		});
	}
});
$(document).ready(function() {
	$menuLeft = $('.pushmenu-left');
	$nav_list = $('#nav_list');
	
	/* 햄버거메뉴 on/off*/
	$nav_list.click(function() {
		$(this).toggleClass('active');
		$('.pushmenu-push').toggleClass('pushmenu-push-toright');
		$menuLeft.toggleClass('pushmenu-open');
	});
});

</script>
<style>
@import url("<c:url value="/css/main2.css"/>")
</style>
</head>
<body>
<div id="hamburger" class="pushmenu-push">
	<nav class="pushmenu pushmenu-left">
	    <div id="info">
	    	<div id="loginId">user님이 로그인</div>
	    	<div id="editInfo">
	    		<button type="button" id="infoBtn" class="btn" onclick="location.href='editInfo'"><span class="glyphicon glyphicon-edit"></span></button>
	    	</div>
	    </div>
	    <ul class="links">
			<li><a href="#">주문목록</a></li>
			<li><a href="#">판매목록</a></li>
		 	<li><a href="#">배송조회</a></li>
		 	<li><a href="#">설정</a></li>
		 	<li><a href="logOut">로그아웃</a></li>
	    </ul>
 	</nav>
</div>

<div id="body" class="pushmenu-push">
	<div id="nav">
       	<div id="nav_list"></div>	<!-- 햄버거 버튼 자리 -->
       	<div id="title">ㄴㅔㄴㅐㅇㅗㅅ</div>
       	<button type="button" id="addBtn" class="btn" onclick="location.href='productAdd'"><span class="glyphicon glyphicon-plus"></span></button>
   		<button type="button" id="searchBtn" class="btn" onclick="location.href='search.html'"><span class="glyphicon glyphicon-search"></span></button>
       	
	</div>
	<div id="productList" class="container-fluid">
		<form action="productDetail">
			<%-- <div class="productInfo">	
				<img src="<c:url value="/upload/user01.jpg"/>" width="100%" height="200px">
				<div id="name">옷이욯</div>
				<div id="price">5600원</div>
			</div>
			<div class="productInfo">	
				<img src="<c:url value="/upload/user01.jpg"/>" width="100%" height="200px">
				<div id="name">옷이욯</div>
				<div id="price">5600원</div>
			</div>
			<div class="productInfo">	
				<img src="" width="100%" height="200px">
				<div id="name">옷이욯</div>
				<div id="price">5600원</div>
			</div>
			<div class="productInfo">	
				<img src="" width="100%" height="200px">
				<div id="name">옷이욯</div>
				<div id="price">5600원</div>
			</div>
			<div class="productInfo">	
				<img src="" width="100%" height="200px">
				<div id="name">옷이욯</div>
				<div id="price">5600원</div>
			</div>
			<div class="productInfo">	
				<img src="" width="100%" height="200px">
				<div id="name">옷이욯</div>
				<div id="price">5600원</div>
			</div>  --%>
		</form>
	</div>
</div>

<div id="bottom" class="pushmenu-push">

</div>	
</body>
</html>