const stateBtn = document.getElementById("state-btn");

(function(){

    if(productState == 'I'){
        makeInBtn();
    } else{
        makeOutBtn();
    }

})();

//입고 버튼 만들기
function makeInBtn() {

    stateBtn.innerHTML = '';
    
    const inBtn = document.createElement("button");
    inBtn.classList.add("btn");
    inBtn.classList.add("btn-success");
    inBtn.classList.add("in-btn");
    inBtn.innerText = "입고";

    const outBtn = document.createElement("button");
    outBtn.classList.add("btn");
    outBtn.classList.add("btn-outline-secondary");
    outBtn.classList.add("out-btn");
    outBtn.setAttribute("onclick", "activeOutBtn()")
    outBtn.innerText = '품절';

    stateBtn.append(inBtn, outBtn);
    
}

//품절 버튼 만들기
function makeOutBtn() {

    stateBtn.innerHTML = '';
    
    const inBtn = document.createElement("button");
    inBtn.classList.add("btn");
    inBtn.classList.add("btn-outline-secondary");
    inBtn.classList.add("in-btn");
    inBtn.setAttribute("onclick", "activeInBtn()")
    inBtn.innerText = "입고";

    const outBtn = document.createElement("button");
    outBtn.classList.add("btn");
    outBtn.classList.add("btn-danger");
    outBtn.classList.add("out-btn");
    outBtn.innerText = '품절';

    stateBtn.append(inBtn, outBtn);

}

//품절 활성화
function activeOutBtn(){

    $.ajax({
        url : '../soldout',
        data : {"productCode" : productCode},
        type : 'GET',
        success : function(result){

            if(result>0){
                alert('해당 상품을 품절 처리하였습니다.');
                makeOutBtn();

            } else {
                alert('상품 상태 변경을 실패하였습니다.');
            }
        },
        error : function(req, status, error){
            console.log("에러 발생");
            console.log(req.responseText);
        }

    });
}

//입고 활성화
function activeInBtn(){

    $.ajax({
        url : '../stocked',
        data : {"productCode" : productCode},
        type : 'GET',
        success : function(result){

            if(result>0){
                alert('해당 상품이 입고되었습니다.');
                makeInBtn();

            } else {
                alert('상품 상태 변경을 실패하였습니다.');
            }
        },
        error : function(req, status, error){
            console.log("에러 발생");
            console.log(req.responseText);
        }

    });

}

const goToListBtn = document.getElementById("goToListBtn");

goToListBtn.addEventListener("click", function(){

    let url = contextPath + "/product/list" + "?";
    //   /ugloryA + /product/list/

    // http://localhost:8080/community/board/detail?no=249&cp=6&type=1&key=c&query=9
    const params = new URL(location.href).searchParams;

    // 검색 key, query가 존재하는 경우 url에 추가
    if(params.get("key") != null){
        const key = "key=" + params.get("key");
        const query = "&query=" + params.get("query");

        url += key + query; // url 뒤에 붙이기
    }

    // location.href = "주소";  -> 해당 주소로 이동
    location.href = url; 

});

//옵션 추가 유효성 검사
const checkObj = {
    "optionName" : false,
    "optionPrice" : false
}

const optionName = document.getElementById("optionName");
const optionNameText = document.getElementById("optionNameText");
const optionPrice = document.getElementById("optionPrice");

function resetOption(){
    optionNameText.innerText = "옵션 명을 입력해주세요.";
    optionNameText.classList.remove('text-success');
    optionNameText.classList.remove('text-danger');
    checkObj.optionName = false;
}

optionName.addEventListener("input", function(){

    const regExp = /^[a-zA-Z0-9가-힣. ]{2,10}$/;

    if(this.value.trim().length == 0){
        optionNameText.innerText = "옵션 명을 입력해주세요.";
        optionNameText.classList.remove('text-success');
        optionNameText.classList.remove('text-danger');
        checkObj.optionName = false;
    } else {

        if(regExp.test(optionName.value)){
            optionNameText.innerText = "유효한 옵션 명입니다";
            optionNameText.classList.add('text-success');
            optionNameText.classList.remove('text-danger');
            checkObj.optionName = true;
        } else {
            optionNameText.innerText = "옵션 명이 유효하지 않습니다.";
            optionNameText.classList.remove('text-success');
            optionNameText.classList.add('text-danger');
            checkObj.optionName = false;
        }
    }
});

optionPrice.addEventListener("input", function(){
    if(this.value.trim().length == 0){
        checkObj.optionPrice = false;
    } else {
        checkObj.optionPrice = true;
    }
});

function optionValidate(){

    let str;

    for( let key  in checkObj ){ // 객체용 향상된 for문

        if( !checkObj[key] ){ 

            switch(key){
            case "optionName" :    str="옵션 명이 유효하지 않습니다."; break;
            case "optionPrice":    str="옵션 가격을 입력해주세요."; break;    
            }

            alert(str);
            document.getElementById(key).focus();
            
            return false; // form태그 기본 이벤트 제거
        }
    }
    return true; // form태그 기본 이벤트 수행
}

//옵션 삭제 메소드
function deleteOption(optionCode) {

    if(!confirm('해당 옵션을 삭제하시겠습니까?')){
        return;
    }
    
    $.ajax({
        url : '../option/delete',
        data : {"optionCode" : optionCode},
        type : 'GET',
        success : function(result){

            if(result>0){
                alert('옵션이 삭제되었습니다.');
                location.reload();
            } else {
                alert('옵션 삭제를 실패하였습니다.');
            }
        },
        error : function(req, status, error){
            console.log("에러 발생");
            console.log(req.responseText);
        }

    });
}