function deleteFarm(farmNo) {

    if(!confirm("농장을 삭제하시겠습니까?")){
        return;
    }
    
    console.log(farmNo);

    $.ajax({
        url : "delete",
        data : {"farmNo" : farmNo},
        type : "GET",
        success : function(result) {

            if(result>0) {
                alert("삭제되었습니다.");
                location.reload();
            } else {
                alert("거래 중인 농장은 삭제할 수 없습니다.");
            }
        },
        error : function(request, status, error){
            console.log("에러 발생");
            console.log("상태코드 : " + request.status);
        }
    });
}

const checkObj = {
    "farmName" : false,
    "producer" : false,
    "origin" : false
}

const farmName = document.getElementById("farmName");
const farmNameText = document.getElementById("farmNameText");
const producer = document.getElementById("producer");
const origin = document.getElementById("origin");
const originText = document.getElementById("originText");
const cancelFarm = document.getElementById("cancelFarm");

if(cancelFarm != null){

    cancelFarm.addEventListener("click", function(){

        if(confirm("농장 등록을 취소하시겠습니까?")){
            location.href = contextPath + '/farm/list';
        } else {
            return;
        }
    });

    //농장이름 중복검사
    const regExp = /^[a-zA-Z0-9가-힣 ]{2,10}$/;

    farmName.addEventListener("input", function(){

        if(farmName.value.trim().length == 0){
            farmNameText.innerText = "농장 이름을 입력해주세요.";
            farmNameText.classList.remove('text-success');
            farmNameText.classList.remove('text-danger');
            checkObj.farmName = false;
        }
        
        if(regExp.test(farmName.value)) {

            $.ajax({
                url : "farmNameDupCheck",  // 필수 작성 속성
                data : { "farmName" : farmName.value }, // 서버로 전달할 값(파라미터)
                type : "GET", // 데이터 전달 방식(기본값 GET)
    
                success : function(result){ // 비동기 통신 성공 시(에러 발생 X)
    
                    if(result == 0){
                        farmNameText.innerText = "등록 가능한 농장 이름입니다.";
                        farmNameText.classList.add("text-success");
                        farmNameText.classList.remove("text-danger");
    
                        checkObj.farmName = true;

                    } else {
                        farmNameText.innerText = "이미 등록된 농장 이름입니다.";
                        farmNameText.classList.add("text-danger");
                        farmNameText.classList.remove("text-success");
                        checkObj.farmName = false; 
                    }
                },
    
                error : function(){ // 비동기 통신 중 에러가 발생한 경우
                    console.log("에러 발생");
                }
            });

        } else {
            farmNameText.innerText = "유효하지 않은 농장 이름 형식입니다.";
            farmNameText.classList.add('text-danger');
            farmNameText.classList.remove('text-success');
            checkObj.farmName = false;
        }

    });

    //생산자 이름 작성
    producer.addEventListener("input", function(){
        if(producer.value.trim().length == 0){
            checkObj.producer = false;
        } else {
            checkObj.producer = true;
        }
    });

    const regExp2 = /^[가-힣 ]{2,10}$/;

    //원산지 한글
    origin.addEventListener("input", function(){

        if(origin.value.trim().length == 0){
            originText.innerText = "원산지를 입력해주세요.";
            originText.classList.remove('text-success');
            originText.classList.remove('text-danger');
            checkObj.origin = false;
        }
        
        if(regExp2.test(origin.value)) {
            originText.innerText = "유효한 원산지 형식입니다.";
            originText.classList.add('text-success');
            originText.classList.remove('text-danger');
            checkObj.origin = true;
        } else {
            originText.innerText = "원산지는 한글만 입력해주세요.";
            originText.classList.add('text-danger');
            originText.classList.remove('text-success');
            checkObj.origin = false;
        }
    });
}

function farmValidate(){

    let str;

    for( let key  in checkObj ){ // 객체용 향상된 for문

        if( !checkObj[key] ){ 

            switch(key){
            case "farmName":    str="농장 이름이 유효하지 않습니다."; break;
            case "producer":    str="생산자를 입력해주세요."; break;    
            case "origin":      str="원산지가 유효하지 않습니다."; break;
            }

            alert(str);
            document.getElementById(key).focus();
            
            return false; // form태그 기본 이벤트 제거
        }
    }
    return true; // form태그 기본 이벤트 수행
}