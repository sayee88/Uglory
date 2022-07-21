const stateBtn = document.getElementById("state-btn");

(function(){

    if(productState == 'I'){
        makeInBtn();
    } else{
        makeOutBtn();
    }

    selectOption();

})();


//옵션조회
const optionTable = document.getElementById("optionTable");

function selectOption(){

    $.ajax({
        url : "../option/select",
        data : {"productCode" : productCode},
        type : "POST",
        dataType : "JSON",
        success : function(optionList){
            
            optionTable.innerHTML='';

            if(optionList.length != 0){

                for(let op of optionList){
                    const tr = document.createElement("tr");
                    const th = document.createElement("th");
                    th.innerText = op.optionCode;

                    const opName = document.createElement("td");
                    opName.innerText = op.optionName;

                    const opPrice = document.createElement("td");
                    opPrice.innerText = op.optionPrice + "원";

                    const btnArea = document.createElement("td");
                    const button = document.createElement("button");
                    button.classList.add("btn");
                    button.classList.add("btn-outline-danger");
                    button.classList.add("option-delete");
                    button.setAttribute("onclick", "deleteOption(" + op.optionCode + ")");

                    const icon = document.createElement("i");
                    icon.classList.add("fa-solid");
                    icon.classList.add("fa-delete-left");

                    button.append(icon);
                    btnArea.append(button);

                    tr.append(th, opName, opPrice, btnArea);
                    optionTable.append(tr);

                }

            } else {
                const tr = document.createElement("tr");
                const th = document.createElement("th");
                th.innerText = '옵션 정보가 없습니다.';
                th.classList.add("blur");
                th.setAttribute("colspan", "3");

                tr.append(th);
                optionTable.append(tr);
            }

        },
        error : function(req, status, error){
            console.log("옵션 조회 중 에러 발생");
            console.log(req.responseText);
        }
    });
}


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

//옵션 추가 유효성 검사
let flag = false;

const optionName = document.getElementById("optionName");
const optionNameText = document.getElementById("optionNameText");
const optionPrice = document.getElementById("optionPrice");

function resetOption(){
    optionNameText.innerText = "옵션 명을 입력해주세요.";
    optionNameText.classList.remove('text-success');
    optionNameText.classList.remove('text-danger');
    flag = false;
}

optionName.addEventListener("input", function(){

    const regExp = /^[a-zA-Z0-9가-힣. ]{2,10}$/;

    if(this.value.trim().length == 0){
        optionNameText.innerText = "옵션 명을 입력해주세요.";
        optionNameText.classList.remove('text-success');
        optionNameText.classList.remove('text-danger');
        flag = false;
    } else {

        if(regExp.test(optionName.value)){
            optionNameText.innerText = "유효한 옵션 명입니다";
            optionNameText.classList.add('text-success');
            optionNameText.classList.remove('text-danger');
            flag = true;
        } else {
            optionNameText.innerText = "옵션 명이 유효하지 않습니다.";
            optionNameText.classList.remove('text-success');
            optionNameText.classList.add('text-danger');
            flag = false;
        }
    }
});

//옵션 삽입 메서드
const insertBtn = document.getElementById("insertBtn");

insertBtn.addEventListener("click", function(){

    if(optionPrice.value.trim().length == 0){
        alert('옵션 가격을 입력해 주세요.');
        return;
    }

    if(!flag){
        alert('옵션 명이 유효하지 않습니다.');
        return;
    }
    
    $.ajax({
        url : "../option/insert",
        data : {
            "optionName" : optionName.value,
            "optionPrice" : optionPrice.value,
            "productCode" : productCode
        },
        type : "POST",
        success : function(result){

            if(result>0){
                alert('옵션이 등록되었습니다.');
                selectOption();
                resetOption();

                optionName.value = '';
                optionPrice.value = '';
            } else {
                alert('옵션 등록을 실패하였습니다.');
            }

        },
        error : function(req, status, error){
            console.log("에러 발생");
            console.log(req.responseText);
        }
    });
});

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
                selectOption();
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