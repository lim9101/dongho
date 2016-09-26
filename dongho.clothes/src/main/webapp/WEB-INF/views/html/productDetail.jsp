<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>productDetail</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script>
goBack = function(){
	history.back();
}
/* var productDetail = function(){
	var img=$('<img src="../img/'+product.picture+'" class="img-thumbnail" width="100%" height="100">');
	var 
	 <img src="../img/logo2.png" class="img-thumbnail" width="100%" height="100">	<!-- 가로 100%가 기준이됨 -->
   	<div id="productDetail" class="container-fluid">
   		<div id="productName">상품명</div><div id="price">5000원</div>
   		<div id="seller"><span>판매자ID : </span></div>
   		<div id="regDate"><span>등록일 : </span></div>
   		<div id="charge"><span>배송비 : </span></div>
   		<div id="status"><span>상태 : </span></div>
   		<div id="productIntro">
   			상품설명<br>
   			<br><br><br><br><br><br><br><br>
   		</div>
   	</div> 
} */
$(function(){
	//주문하기 버튼 클릭시
	$("#orderBtn").click(function(){
		location.href="order.html";
	});
	
	//문의하기 버튼 클릭시
	$("#queryBtn").click(function(){
		location.href="query.html";
	});
});
</script>

<style>
@import url("<c:url value="/css/productDetail.css"/>")
</style>
</head>

<body>
<div id="top" class="navbar navbar-fixed-top">
	<div id="goback" class="navbar-brand">
		<button type="button" id="back" class="btn" onclick="goBack()"><span class="glyphicon glyphicon-chevron-left"></span></button>
   	</div> 
   	<div id="title" class="navbar-brand">상품상세정보</div> 
</div> 

<div id="body">
   	<img src="<c:url value="/upload/${product.picture}"/>" class="img-thumbnail" width="100%" height="100">	<!-- 가로 100%가 기준이됨 -->
   	<div id="productDetail" class="container-fluid">
   		<div id="productName">상품명 ${product.productName}</div><div id="price">${product.price}</div>
   		<div id="seller"><span>판매자ID : ${product.userId}</span></div>
   		<div id="regDate"><span>등록일 : ${product.productDate}</span></div>
   		<div id="charge"><span>배송비 : ${product.deliveryCharge}</span></div>
   		<div id="status"><span>상태 : ${product.condition}</span></div>
   		<div id="productIntro">
   			상품설명<br>
   			${product.explan}
   			<br><br><br><br><br><br><br><br>
   		</div>
   	</div>
</div>

<div id="bottom" class="navbar navbar-fixed-bottom">
	<div class="container">
		<div class="col-xs-6">
			<button type="button" id="queryBtn" class="btn btn-default btn-block">문의하기</button>
		</div>
		<div class="col-xs-6">
			<button type="button" id="orderBtn" class="btn btn-default btn-block">주문하기</button>
		</div>
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