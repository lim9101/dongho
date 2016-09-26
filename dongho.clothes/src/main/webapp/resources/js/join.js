goBack = function(){
	history.back();
}
$(function(){
	//아이디 형식 검사
	var id=$("#id");
	var idCheck=$("#idCheck");
	id.focus( function(){	//input 클릭시
		idCheck.css("visibility", "visible");
		idCheck.css("color", "#cc0066");
		idCheck.text("아이디는 영문, 영문+숫자조합의 4~12자리 입력하세요.");
	});
	id.keyup( function() {	//키보드 입력시
		idCheck.css("visibility", "visible");
		idCheck.css("color", "#cc0066");
		if (id.val().length == 0){ 			//입력 값이 없을 때
			idCheck.text("아이디는 영문, 영문+숫자조합의 4~12자리 입력하세요.");
		}else if(id.val().length < 4){ 		//입력 값이 4자리 미만일때
			idCheck.text("아이디는 4자리 이상"); 
		}else if(id.val().length > 12){ 	//입력 값이 12자리를 초과할때
			idCheck.text("아이디는 12자리 미만"); 
		}else{ 								//입력 값이 4 이상 12 이하일 때
			idCheck.css("color", "blue");
			idCheck.text("아이디 √"); 
		}
	});
	
	//비밀번호 형식 검사
	var pw=$("#pw");
	var pwCheck=$("#pwCheck");
	pw.focus( function(){	//input 클릭시
		pwCheck.css("visibility", "visible");
		pwCheck.css("color", "#cc0066");
		pwCheck.text("비밀번호는 영문+숫자조합의 8~12자리 입력하세요.");
	});
	pw.keyup( function() {	//키보드 입력시
		pwCheck.css("visibility", "visible");
		pwCheck.css("color", "#cc0066");
		if(pw.val().length == 0){			//입력 값이 없을 때
			pwCheck.text("비밀번호는 영문+숫자조합의 8~12자리 입력하세요.");
		}else if (pw.val().length < 8){ 	//입력 값이 8자리 미만일때
			pwCheck.text("비밀번호는 8자리 이상"); 
		}else if (pw.val().length > 12){ 	//입력 값이 12자리를 초과할때
			pwCheck.text("비밀번호는 12자리 미만"); 
		}else{ 					
			pwCheck.css("color", "blue");	//입력 값이 8 이상 12 이하일 때
			pwCheck.text("비밀번호  √"); 
		}
	});
	
	//비밀번호 재입력 비교 검사
	var pwConfirm=$("#pwConfirm");
	var pwCheck=$("#pwCheck");
	pwConfirm.focus( function(){	//input 클릭시
		pwCheck.css("visibility", "visible");
		pwCheck.css("color", "#cc0066");
		pwCheck.text("비밀번호를 재입력하세요.");
	});
	pwConfirm.keyup(function(){		//키보드 입력시
		if(pw.val() != pwConfirm.val()){
			pwCheck.css("color", "#cc0066");
			pwCheck.text("비밀번호가 불일치");
		}else{
			pwCheck.css("color", "blue");
			pwCheck.text("비밀번호 일치 √")
		}
	});
	
	//비밀번호 찾기 답 입력 알림
	var question=$("#question");
	var pwAnswer=$("#pwAnswer");
	var pwAnCheck=$("#pwAnCheck");
	pwAnswer.focus( function(){
		pwAnCheck.css("visibility", "visible");
		pwAnCheck.text("비밀번호 찾기 답을 입력하세요.");
	});
	
	//이름 형식 알림
	var username=$("#username");
	var nameCheck=$("#nameCheck");
	username.focus( function(){	//input 클릭시
		nameCheck.css("visibility", "visible");
	});
	
	//폰번호 형식 알림
	var phoneNum=$("#phoneNum");
	var phoneNumCheck=$("#phoneNumCheck");
	phoneNum.focus( function(){
		phoneNumCheck.css("visibility", "visible");
	});
	
	//계좌번호 형식 알림
	var bank=$("#bank");
	var accountNum=$("#accountNum");
	var accountNumCheck=$("#accountNumCheck");
	accountNum.focus( function(){
		accountNumCheck.css("visibility", "visible");
	});
	
	//완료버튼을 눌렀을 때
	var modal = $("#resultModal");
	var msg = $("#msg");
	
	var address=$("#address");
	var address2=$("#address2");
	$("#joinBtn").click(function(){
		if(id.val().length == 0 || pw.val().length == 0 || pwConfirm.val().length==0 ||
			pwAnswer.val().length == 0 || username.val().length == 0 ||
			address.val().length == 0 || address2.val().length == 0 ||
			phoneNum.val().length == 0 || accountNum.val().length == 0){
			msg.text("입력되지 않은 정보가 있습니다.");
			modal.modal('show');
		}else if(!$("select[name=bank]").val() || !$("select[name=pwQueryType]").val()){
			console.log("선택안함");
			msg.text("선택되지 않은 정보가 있습니다.");
			modal.modal('show');
		}else if(!$('#agree1').is(":checked") || !$('#agree2').is(":checked")){
			console.log("체크안함");
			msg.text("체크되지 않은 정보가 있습니다.");
			modal.modal('show');
		}else{
			var user={id:id.val(),
					  pw:pw.val(),
					  userName:username.val(),
					  address:address.val()+address2.val(),
					  phoneNum:phoneNum.val(),
					  question:question.val(),
					  answer:pwAnswer.val(),
					  bank:bank.val(),
					  accountNum:accountNum.val(),
					  };
			console.log(user);
			$.ajax({
				url:"addUser",
				data:user,
				success:function(result){
					console.log(result);
					msg.text("가입이 완료되었습니다.");
					modal.modal('show');
					$("#checkBtn").click(function(){
						location.href="main2";
					});
				}
			})
		}
	});
//join validation end
});