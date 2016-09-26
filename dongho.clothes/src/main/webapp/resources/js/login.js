goBack = function(){
	history.back();
}
$(function(){
	var id=$("#id");
	var pw=$("#pw");
	var loginCheck=$("#loginCheck");
	var modal = $("#resultModal");
	var msg = $("#msg");
	
	//로그인 버튼 클릭시
	$("#loginBtn").bind("click", function(){
		//로그인 정보 일치 여부 검사
		$.ajax({
			url:"check",
			data:{id:id.val(),
				pw:pw.val()},
				success:function(result){
					if(result){
						location.href="main2";
					}else{
						if(id.val().length == 0 && pw.val().length == 0){
							loginCheck.text("로그인 정보를 입력해주세요");
							loginCheck.css("visibility", "visible");
						}else if(id.val().length == 0){
							loginCheck.text("아이디를 입력해주세요");
							loginCheck.css("visibility", "visible");
						}else if(pw.val().length == 0){
							loginCheck.text("비밀번호를 입력해주세요");	
							loginCheck.css("visibility", "visible");
						}
						else{
							msg.text("로그인 정보를 확인해주세요");
							modal.modal('show');
						}
					}
				}
		});
	});
});

