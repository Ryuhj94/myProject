$(document).ready(function(){
	$("#password").on("focusout",function(){ 
		isPW();
    });
	$("#nickname").on("focusout",function(){ 
		isNickname();
    });
    $("#modifysubmit").on("click", function(event) {
		let count=0;
		if(isPW()) {count++}
		if(isNickname()) {count++}
		console.log(count);
		if(count==2){
			alert("회원정보를 수정하셨습니다. 다시 접속해주세요.");
		}
		else{
			alert("양식에 맞게 입력해주세요.");
			event.preventDefault();
		}
	});
});

function isPW(){
    let pwPattern =/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[\W_]).{8,16}$/;
    let userPW=$("#password").val();
    let check= pwPattern.test(userPW);
    if(check){
        $("#error-pw").css("display","none");
        $("#password").css("border","1px solid rgb(186, 186, 186)");
        return true;
    }
    else{
        $("#error-pw").css("display","block");
        $("#password").css("border","3px solid red");
        return false;
    }
}

function isNickname() {
	let nickNamePattern=/^[a-zA-Z가-힣]{2,16}$/;
	let nickname=$("#nickname").val();
    let check= nickNamePattern.test(nickname);
    if(check){
        $("#error-nickname").css("display","none");
        $("#nickname").css("border","1px solid rgb(186, 186, 186)");
        return true;
    }
    else{
        $("#error-nickname").css("display","block");
        $("#nickname").css("border","3px solid red");
        return false;
    }
}