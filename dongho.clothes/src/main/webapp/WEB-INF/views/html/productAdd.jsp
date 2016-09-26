<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>addProduct</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script>
goBack = function(){
	history.back();
}
uploadPhoto = function(){
	document.all.uploadFile.click();
}
function readURL(input){
    if (input.files && input.files[0]){
    	var reader = new FileReader();

    	reader.onload = function(e){
           $('#img').attr('src', e.target.result);
      	}
      reader.readAsDataURL(input.files[0]);
    }
}

function clickBtn(e){
	$("#checkBtn").click(function(){
		e.focus();
	});
}

$(function() {
	//파일불러오기
    $("#uploadFile").on('change', function(){
        readURL(this);
    });
	
	//등록 버튼 클릭시
	var modal = $("#resultModal");
	var msg = $("#msg");
	var productName = $("#productName");
	var price = $("#price");
	var charge = $("select[name=charge]");
	var status = $("select[name=status]");
	$("#addBtn").click(function(){
		if(productName.val().length == 0){
			msg.text("상품명이 입력되지 않았습니다.");
			modal.modal('show');
			clickBtn(productName);
		}else if(price.val().length == 0){
			msg.text("가격이 입력되지 않았습니다.");
			modal.modal('show');
			clickBtn(price);
		}else if(!charge.val()){
			msg.text("배송비가 선택되지 않았습니다.");
			modal.modal('show');
			clickBtn(charge);
		}else if(!status.val()){
			msg.text("상태가 선택되지 않았습니다.");
			modal.modal('show');
			clickBtn(status);
		}else{
			var product = {
					productName:productName.val(),
					price:price.val(),
					picture:"",
					condition:status.val(),
					explan: $("#contents").val(),
					deliveryCharge:charge.val()
			};
			//이미지 업로드
			var formData = new FormData($("form")[0]);
			$.ajax({
				method: "post",
				url: "uploadImg",
				data: formData,
				processData: false,
				contentType: false,
				success: function(result){
					product.picture=result;
					 $.ajax({
							url:"addProduct",
							data:product,
							success:function(result){
								msg.text("상품등록이 완료되었습니다.");
								modal.modal('show');
								$("#checkBtn").click(function(){
									location.href="main2";
								});
							}
						});
					console.log("업로드 성공");
				},
				error: function(){
					console.log("업로드 실패");
				}
			}); 
			
			//이미지 업로드
			/* var formData = new FormData($("form")[0]);
			$.ajax({
				method: "post",
				url: "addProduct",
				data: {formDate:formDate,
					product:product},
				processData: false,
				contentType: false,
				success: function(result){
					//if(result)$("#msg").text("업로드 성공");
					msg.text("상품등록이 완료되었습니다.");
					modal.modal('show');
					$("#checkBtn").click(function(){
						location.href="main2";
					});
				},
				error: function(){
					//$("#msg").css("color","red").text("업로드 실패");
				}
			});  */
			
		}
	});
});


</script>
<style>
@font-face{
	font-family:'hywulm';
	src:url("<c:url value="/img/HYWULM.TTF"/>") format('truetype');
	
}
.btn-default{
	border-radius: 20px;
}

#top{ 
	width: 100%; 
 	height: 50px; 
 	background-color: #cc0066;
 	font-family: hywulm;
} 
	#goback{
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
		width:150px; 
 		margin-right:105px; 
 		margin-left: 55px; 
	}
#body{
	margin-top: 50px;
	padding: 20px 10px 20px 10px;
	font-family: hywulm;
}
	.div_tag{
		padding: 5px;
		margin: 0;
		color: #FFFFFF;
		background-color: #cc0066;
		width: 80px; 
		text-align: center;
		border-top-left-radius: 20px;
		border-top-right-radius: 20px;
	}
	#uploadPhoto{
		border:solid 1px #DBDBDB;
		padding: 0;
		margin: 0 0 20px 0;
		width: 114px;
	}
	.photo{
		float: left;
		padding: 0px;
		margin: 1px;
	}
	#uploadFile{
		display: none;
	}
	img{
		border: none;
	}
	#productInfo{
		border:solid 1px #DBDBDB;
		padding: 0;
		margin: 0 0 44px 0;
	}
	#checkBtn, #addBtn{
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
   	<div id="title" class="navbar-brand">상품등록</div> 
</div>

<div id="body" class="container-fluid">
	<form role="form" method="post">
		<div class="div_tag">상품사진</div>
		<div id="uploadPhoto" class="container-fluid">
			<div class="photo">
				<input type="file" id="uploadFile" name="uploadFile"/>
				<img id="img" src="" width="110vw" height="110vh" onclick="uploadPhoto()"/>
			</div>
		</div>
		
		<div class="div_tag">상품정보</div>
		<div id="productInfo" class="container-fluid">
			<input type="text" class="form-control" id="productName" maxlength="12" placeholder="상품명" required>
			<input type="number" class="form-control" id="price" placeholder="가격" required>
			<select name="charge" class="form-control" required>
				<option value="select" selected disabled>배송비</option>
				<option value="무료">무료</option>
				<option value="착불">착불</option>
				<option value="가격에포함">가격에포함</option>
  		   	</select>
			<select name="status" class="form-control" required>
				<option value="select" selected disabled>상태</option>
				<option value="새상품">새상품</option>
				<option value="빈티지">빈티지</option>
				<option value="중고">중고</option>
  		   	</select>
  		   	<textarea class="form-control" id="contents" rows="5" cols="12" placeholder="설명"></textarea>
		</div>
		<hr align="center" size="10" width="100%" color="#DBDBDC" />
		
		<div class="col-xs-12" id="d">
			<button type="button" id="addBtn" class="btn btn-default btn-block">완료</button>
		</div>
	</form>
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