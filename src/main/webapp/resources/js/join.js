
  
		$('#user-id').on('focusout', function(){
			let id = $('#user-id').val();
			$.ajax({
				url : "idCheckDO",		// 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				type:  "post",			// HTTP 요청방식 (get/post)
				data: {"id": id},			// HTTP 요청과 함께 서버로 보낼 데이터
				dataType: 'text',		// 서버에서 보내줄 데이터의 타입
				// 성공적으로 값을 서버로 보냈을 경우 처리하는 코드
				success: function(result){
					console.log(result);
					if(result == 0){
						$("#idCheck-false").hide();
						$("#idCheck-true").show();
					} else{
						$("#idCheck-false").show();
						$("#idCheck-true").hide();
					}
				},
				error:function(){
					alert("서버요청실패");
				}
			})
		})
		
$(function(){
    let checkIDflag=false;
    let checkPWflag=false;
    $("#user-id").on("focusout",function(){ //아이디 이벤트
        isID();
    })

    $("#user-pw").on("focusout",function(){ // 페스워드 이벤트
        isPW();
    })
    $("#user-email").on("focusout",function(){ //메일 이벤트
        isEmail();
    })
    $("#check-id").on("focusout",function(){ // 아이디 체크
        doubleId();
    })
    $("#check-pw").on("focusout",function(){ //비밀번호 체크   
        doublePW(); 
    })
    $("#user-name").on("focusout",function(){
        isName();
    })
    $("#user-birthdate").on("focusout",function(){
        isBirthdate();
    })
    $("#join-edn").on("click",function(event){
        let count=0;
        if(isID()){count++}
        if(isPW()){count++}
        if(isEmail()){count++}
        if(doubleId()){count++}
        if(doublePW()){count++}
        if(isName()){count++}
        if(isBirthdate()){count++}
        if(isSex()){count++}
       	
        console.log(count)
        if(count==8){
            alert("회원가입에 성공하셨습니다.!")
        }
        else{
        	alert("양식에 맞게 입력해주세요.")
        	event.preventDefault();
        }
    })

    function isOverlappingID(){
        let id=$("#user-id").val();
        $.ajax({
            url : "idCheckDO",		
            type:  "post",			
            data: {"id": id},		
            dataType: 'text',	
            success: function(result){
                if(result == 0){
                   return true;
                } else{
                  return false;
                }
            },
            error:function(){
                alert("서버요청실패");
            }
        })
    }
    $('#user-id').on('focusout', function(){
        let id = $('#user-id').val();
        $.ajax({
            url : "idCheckDO",		// 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            type:  "post",			// HTTP 요청방식 (get/post)
            data: {"id": id},			// HTTP 요청과 함께 서버로 보낼 데이터
            dataType: 'text',		// 서버에서 보내줄 데이터의 타입
            // 성공적으로 값을 서버로 보냈을 경우 처리하는 코드
            success: function(result){
                console.log(result);
                if(result == 0){
                    $("#idCheck-false").hide();
                    $("#idCheck-true").show();
                } else{
                    $("#idCheck-false").show();
                    $("#idCheck-true").hide();
                }
            },
            error:function(){
                alert("서버요청실패");
            }
        })
    })
    function isEmail(){ //이메일 확인
        let emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        let userEmailvalue=$("#user-email").val();
        let check= emailPattern.test(userEmailvalue);
        if(check){
            $(".error-massage1 p").eq(2).css("display","none");
            $("#user-email").css("border","1px solid rgb(186, 186, 186)");
            return true;
        }
        else{
            $(".error-massage1 p").eq(2).css("display","block");
            $("#user-email").css("border","3px solid red");
            return false;
        }
    }

    function isID(){ //아이디 확인
        let idPattern = /^[a-z0-9]{4,12}$/i;
        let userId=$("#user-id").val();
        let check= idPattern.test(userId);
        if(checkIDflag==true){ //이거는 아이디 확인을 입력하고 아이디를 바꿨을때 
            doubleId();
        }
        if(check){
            $(".error-massage1 p").eq(0).css("display","none");
            $("#user-id").css("border","1px solid rgb(186, 186, 186)");
            return true;
        }
        else{
            $(".error-massage1 p").eq(0).css("display","block");
            $("#user-id").css("border","3px solid red");
            return false;
        }


    }
    function isPW(){
        let pwPattern =/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[\W_]).{8,16}$/;
        let userPW=$("#user-pw").val();
        let check= pwPattern.test(userPW);
        if(checkPWflag==true){
            doublePW();
        }
        if(check){
            $(".error-massage1 p").eq(1).css("display","none");
            $("#user-pw").css("border","1px solid rgb(186, 186, 186)");
            return true;
        }
        else{
            $(".error-massage1 p").eq(1).css("display","block");
            $("#user-pw").css("border","3px solid red");
            return false;
        }

    }
    function doubleId(){
        let checkId=$("#check-id").val();
        let userId=$("#user-id").val();
        if(checkId==userId){
            $(".error-massage2 p").eq(0).css("display","none");
            $("#check-id").css("border","1px solid rgb(186, 186, 186)");
            return true;
        }
        else{
            $(".error-massage2 p").eq(0).css("display","block");
            $("#check-id").css("border","3px solid red");
            checkIDflag=true;
            return false;
        }
    }

    function doublePW(){
     let userpw=$("#user-pw").val();
     let checkpw=$("#check-pw").val();
     if(checkpw==userpw){
         $(".error-massage2 p").eq(1).css("display","none");
         $("#check-pw").css("border","1px solid rgb(186, 186, 186)");
         return true;
     }
     else{
         $(".error-massage2 p").eq(1).css("display","block");
         $("#check-pw").css("border","3px solid red");
         checkPWflag=true;
         return false;
     }
}
  

    function isName(){
        let namePattern=/^[a-zA-Z-가-힣]*$/
        let name=$("#user-name").val();
        let check= namePattern.test(name);

        if(check&&name.length!=0){
            $(".error-massage3 p").eq(0).css("display","none");
            $("#user-name").css("border","1px solid rgb(186, 186, 186)");
            return true;
        }
        else{
            $(".error-massage3 p").eq(0).css("display","block");
            $("#user-name").css("border","3px solid red");
            return false;
        }
    }

    function isBirthdate(){
        let birthdatePattern=/^[0-9]{6}$/
        let birthdate=$("#user-birthdate").val();
        let check= birthdatePattern.test(birthdate);
        if(check){
            $(".error-massage3 p").eq(1).css("display","none");
            $("#user-birthdate").css("border","1px solid rgb(186, 186, 186)");
            return true;
        }
        else{
            $(".error-massage3 p").eq(1).css("display","block");
            $("#user-birthdate").css("border","3px solid red");
            return false
        }
    }
    function isSex(){
        let sex=$("input[name='sex']:checked").val();

        if(!sex||sex.length===0){
            $(".error-massage3 p").eq(2).css("display","block");
            return false;
        }
        else{
            $(".error-massage3 p").eq(2).css("display","none");
            return true;
        }
    }

});

