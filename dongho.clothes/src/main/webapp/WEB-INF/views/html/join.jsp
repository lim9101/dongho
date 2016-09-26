<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>join</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="<c:url value="/js/join.js"/>"></script>
<style>
@import url("<c:url value="/css/join.css"/>")
</style>
</head>

<body>
<div id="top" class="navbar navbar-fixed-top">
	<div id="goback" class="navbar-brand">
		<button type="button" id="back" class="btn" onclick="goBack()"><span class="glyphicon glyphicon-chevron-left"></span></button>
   	</div> 
   	<div id="title" class="navbar-brand">회원가입</div> 
</div> 

<div id="body" class="container-fluid">
	<form role="form">
		<div class="form-group">
			<input type="text" class="form-control" id="id" maxlength="12" placeholder="아이디" required>
			<p class="check" id="idCheck">영문과 숫자조합의 4~12자리를 입력하세요</p>
		</div>
		
		<div class="form-group">
			<input type="password" class="form-control" id="pw" maxlength="12" placeholder="비밀번호" required>
			<input type="password" class="form-control" id="pwConfirm" maxlength="12" placeholder="비밀번호확인" required>
			<p class="check" id="pwCheck">영문과 숫자조합의 8~12자리를 입력하세요</p>
		</div>
		
		<div class="form-group">
			<select name="pwQueryType" id="question" class="form-control" required>
				<option value="select" selected disabled>비밀번호 찾기 질문</option>
				<option value="나의 별명은?">나의 별명은?</option>
				<option value="나의 고향은?">나의 고향은?</option>
				<option value="제일 좋아하는 색깔은?">제일 좋아하는 색깔은?</option>
				<option value="제일 좋아하는 음식은?">제일 좋아하는 음식은?</option>
  		   	</select> 
   			<input type="text" class="form-control" id="pwAnswer" maxlength="20" placeholder="비밀번호 찾기 답"/>
   			<p class="check" id="pwAnCheck">비밀번호 찾기 답을 입력하세요</p>	   
		</div>

		<div class="form-group">
			<input type="text" class="form-control" id="username" maxlength="30" placeholder="이름" required>
			<p class="check" id="nameCheck">영문이나 한글을 입력하세요</p>
		</div>
		
		<div class="form-group">
			<button type="button" class="form-control" id="findAddress">주소검색</button>
			<input type="text" class="form-control" id="address" placeholder="주소" required>
			<input type="text" class="form-control" id="address2" placeholder="상세주소" required>
		</div><br>
	
		<div class="form-group">
			<input type="number" class="form-control" id="phoneNum" placeholder="휴대폰번호" required>
			<p class="check" id="phoneNumCheck">-없이 입력하세요</p>
		</div>
		
		<div class="form-group">
			<select name="bank" id="bank" class="form-control" required>
			   	<option value="select" selected disabled>은행</option>
				<option value="국민">국민</option>
				<option value="농협">농협</option>
				<option value="신한">신한</option>
				<option value="우리">우리</option>
				<option value="기업">기업</option>
				<option value="하나">하나</option>
				<option value="씨티">씨티</option>
  		   </select>
  		   <input type="number" class="form-control" id="accountNum" placeholder="계좌번호" required>
  		   <p class="check" id="accountNumCheck">-없이 입력하세요</p>
	 	</div><br>
	
		<div class="form-group">
			<div class="checkbox">
				<label><input type="checkbox" id="agree1" required>만 14세 이상 이용약관 동의</label>
				<label for="checkbox"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				약관보기></a></label>
			</div>
		</div>
		<div class="form-group">
			<div class="checkbox">
				<label><input type="checkbox" id="agree2" required>개인정보 취급방침 안내</label>
				<label for="checkbox"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;약관보기></a></label>
			</div>
		</div><br>
		
		<hr align="center" size="10" width="100%" color="#DBDBDC" />
		
		<div class="col-xs-12">
			<button type="button" id="joinBtn" class="btn btn-default btn-block">완료</button>
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