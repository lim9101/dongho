goBack = function(){
	history.back();
}
$(function(){
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
			pwCheck.css("color", "#000080");	//입력 값이 8 이상 12 이하일 때
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
			pwCheck.css("color", "#000080");
			pwCheck.text("비밀번호 일치 √")
		}
	});
});