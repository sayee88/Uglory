function loginValidate(){ // 로그인 유효성 검사

    // 이메일 입력 input 요소 
    const inputEmail = document.getElementById("floatingInput");

    // 비밀번호 입력 input 요소
    const inputPw = document.getElementById("floatingPassword");

    // 이메일이 입력되지 않은 경우 false를 반환
    if( inputEmail.value.trim().length == 0 ){

        alert("이메일을 입력해주세요.");
        inputEmail.value = ""; // 이메일 input에 입력된 내용을 모두 삭제
        inputEmail.focus(); // 이메일 input에 포커스를 맞춰줌
        return false; // 기본 이벤트 제거를 위해 false 반환
    }

    // 비밀번호를 입력하지 않은 경우 false 반환
    if(inputPw.value.trim() == ""){
        alert("비밀번호를 입력해주세요.");
        inputPw.value = "";
        inputPw.focus();
        return false;
    }

    return true; // form 태그 기본 이벤트 정상 수행
}

//관리자 가입 유효성 검사

// 유효성 검사 여부를 기록할 객체 생성
const checkObj = { 
    "adminEmail"     : false,
    "adminPw"        : false,
    "adminPwConfirm" : false,
    "approvalNumber"  : false
};

if( $('#signUp') != null){


    // 이메일 유효성 검사
    const adminEmail = document.getElementById("floatingInput");
    const emailMessage = document.getElementById("emailMessage");

    adminEmail.addEventListener("input", function(){

        // 입력이 되지 않은 경우
        if( adminEmail.value.length == 0 ){
            emailMessage.innerText = "";
            emailMessage.classList.remove("text-success", "text-danger");

            checkObj.adminEmail = false; // 유효 X 기록
            return;
        }

        // 입력된 경우
        const regExp = /^[\w\-\_]{4,}@[\w\-\_]+(\.\w+){1,3}$/;

        if( regExp.test(adminEmail.value) ){ // 유효한 경우
            
            // 이메일 중복 검사(ajax)

            $.ajax({
                url : "emailDupCheck",   
                data : { "adminEmail" : adminEmail.value },
                type : "GET", // 데이터 전달 방식 type

                success : function(result){
                    // 비동기 통신(ajax)가 오류 없이 요청/응답 성공한 경우

                    if(result == 1){ // 중복 O
                        emailMessage.innerText = "이미 사용중인 이메일 입니다.";
                        emailMessage.classList.add("text-danger");
                        emailMessage.classList.remove("text-success");
                        checkObj.adminEmail = false; // 유효 X 기록

                    } else { // 중복 X
                        emailMessage.innerText = "사용 가능한 이메일 입니다.";
                        emailMessage.classList.add("text-success");
                        emailMessage.classList.remove("text-danger");
                        checkObj.adminEmail = true; // 유효 O 기록
                    }
                },
                
                error : function(){
                    // 비동기 통신(ajax) 중 오류가 발생한 경우
                    console.log("에러 발생");
                }

            });
            


        }else{
            emailMessage.innerText = "이메일 형식이 유효하지 않습니다.";
            emailMessage.classList.add("error");
            emailMessage.classList.remove("confirm");

            checkObj.memberEmail = false; // 유효 X 기록
        }

    });


    // 비밀번호 유효성 검사
    const adminPw = document.getElementById("floatingPassword");
    const adminPwConfirm = document.getElementById("floatingPwConfirm");
    const pwMessage = document.getElementById("pwMessage");

    adminPw.addEventListener("input", function(){

        if(adminPw.value.length == 0){
            pwMessage.innerText = "";
            pwMessage.classList.remove("text-success", "text-danger");

            checkObj.adminPw = false; // 유효 X 기록
            return;
        }

        const regExp = /^[\w!@#_-]{6,30}$/;

        if( regExp.test(adminPw.value) ){ // 비밀번호 유효

            checkObj.adminPw = true; // 유효 O 기록

            if(adminPwConfirm.value.length == 0){ // 비밀번호 유효, 확인 작성 X
                pwMessage.innerText = "유효한 비밀번호 형식입니다.";
                pwMessage.classList.add("text-success");
                pwMessage.classList.remove("text-danger");
            
            } else { // 비밀번호 유효, 확인 작성 O
                checkPw(); // 비밀번호 일치 검사 함수 호출()
            }

        }else{
            pwMessage.innerText = "비밀번호 형식이 유효하지 않습니다.";
            pwMessage.classList.add("text-danger");
            pwMessage.classList.remove("text-success");

            checkObj.adminPw = false; // 유효 X 기록
        }
    });


    // 비밀번호 확인 유효성 검사

    adminPwConfirm.addEventListener("input", checkPw );

    function checkPw(){ // 비밀번호 일치 검사
        // 비밀번호 / 비밀번호 확인이 같을 경우
        if(adminPw.value == adminPwConfirm.value){
            pwMessage.innerText = "비밀번호가 일치합니다.";
            pwMessage.classList.add("text-success");
            pwMessage.classList.remove("text-danger");

            checkObj.adminPwConfirm = true; // 유효 O 기록

        } else{
            pwMessage.innerText = "비밀번호가 일치하지 않습니다.";
            pwMessage.classList.add("text-danger");
            pwMessage.classList.remove("text-success");

            checkObj.adminPwConfirm = false; // 유효 X 기록
        }
    }

    const approvalNumber = document.getElementById("floatingApproval");

    if(approvalNumber.value == "kkpbsj07"){
        checkObj.approvalNumber = true;
    }
}

// 회원가입 버튼 클릭 시 유효성 검사가 완료 되었는지 확인하는 함수
function signUpValidate(){

    let str;

    for( let key  in checkObj ){ // 객체용 향상된 for문

        // 현재 접근 중인 key의 value가 false인 경우
        if( !checkObj[key] ){ 

            switch(key){
            case "adminEmail":     str="이메일이"; break;
            case "adminPw":        str="비밀번호가"; break;    
            case "adminPwConfirm": str="비밀번호 확인이"; break;
            case "approvalNumber":  str="승인번호가"; break;
            }

            str += " 유효하지 않습니다.";

            alert(str);

            document.getElementById(key).focus();
            
            return false; // form태그 기본 이벤트 제거
        }
    }

    return true; // form태그 기본 이벤트 수행
}