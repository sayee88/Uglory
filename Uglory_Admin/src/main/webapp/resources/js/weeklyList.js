//조회 페이지일 때
const thisWeekList = document.getElementById("thisWeekList");

if(thisWeekList != null){

    (function(){

        let box = document.getElementById("thisWeekList");

        if(thisListNo != ''){
            selectList(thisListNo, box);
        } else {
            emptyWeeklyList(box);
        }
        
        box = document.getElementById("nextWeekList");

        if(nextListNo != ''){
            selectList(nextListNo, box);
        } else {
            emptyWeeklyList(box);
        }
        
        box = document.getElementById("afterWeekList");

        if(afterListNo != ''){
            selectList(afterListNo, box);
        } else {
            emptyWeeklyList(box);
        }

    })();
}

function emptyWeeklyList(box){
    const tr = document.createElement("tr");
    const td = document.createElement("td");
    td.classList.add("blur");
    td.setAttribute("colspan", "2");
    td.innerText = '상품 정보를 등록해주세요.';

    tr.append(td);
    box.append(tr);
}

function selectList(productListNo, box){

    $.ajax({
        url : "selectAll",
        data : {"productListNo" : productListNo},
        type : "POST",
        dataType : "JSON",
        success : function(deliveryList){

            box.innerHTML = '';

            if(deliveryList.length != 0){

                for(let del of deliveryList){
                    const tr = document.createElement("tr");
                    const td1 = document.createElement("td");
                    td1.innerText = del.productName;
    
                    const td2 = document.createElement("td");
                    td2.innerText = del.optionName + " / " + jumboOp(del.optionName);

                    tr.append(td1, td2);
                    box.append(tr);
                }
            } else {
                emptyWeeklyList(box);
            }
        },
        error : function(req, status, error){
            console.log("리스트 조회 중 에러 발생");
            console.log(req.responseText);
        }
    });

}

//등록 페이지 일때
const delPList = document.getElementById("del-p-list");
const pList = document.getElementById("pList");
const opList = document.getElementById("opList");
const addListBtn = document.getElementById("addListBtn");
const deleteWeek = document.getElementsByClassName("deleteWeek");

if(delPList!=null){
    
    (function(){
        addList();

    })();

    //옵션 선택하기
    const defaultOp = document.createElement("option");
    defaultOp.value = 0;
    defaultOp.innerText = '옵션';

    pList.addEventListener("change", function(){

        opList.innerHTML = '';
        opList.append(defaultOp);

        $.ajax({
            url: "selectOption",
            data : {"productCode" : pList.value},
            type : "POST",
            dataType : "JSON",
            success : function(optionList){

                if(optionList.length != 0){

                    for(let op of optionList){
                        const option = document.createElement("option");
                        option.value = op.optionCode;
                        option.innerText = op.optionName;

                        opList.append(option);
                    }
                }
            },
            error : function(req, status, error){
                console.log("옵션 조회 중 에러 발생");
                console.log(req.responseText);
            }
        });
    });

    addListBtn.addEventListener("click", function(){

        if(pList.value==0 || opList.value==0){
            alert("옵션 선택 후 추가 버튼을 눌러주세요.");
            return;
        }

        $.ajax({
            url: "register",
            data : {
                "optionCode" : opList.value,
                "productListNo" : productListNo
            },
            type : "POST",
            success : function(result){

                if(result > 0){
                    addList();

                    opList.innerHTML = '';
                    opList.append(defaultOp);
                    pList.value = 0;

                } else {
                    alert("이미 존재하는 상품입니다.");
                }

            },
            error : function(req, status, error){
                console.log("리스트 삽입 중 에러 발생");
                console.log(req.responseText);
            }
        });
    });


}

//ex를 서버로 보내서 상품 모두 조회 밑 delPList에 추가
function addList(){

    $.ajax({
        url: "selectAll",
        data : {"productListNo" : productListNo},
        type : "POST",
        dataType : "JSON",
        success : function(deliveryList){
            
            delPList.innerHTML = '';

            if(deliveryList.length != 0){

                for(let del of deliveryList){

                    const tr = document.createElement("tr");
                    
                    const pName = document.createElement("td");
                    pName.innerText = del.productName;
    
                    const opName = document.createElement("td");
                    opName.innerText = del.optionName + " / " + jumboOp(del.optionName);

                    const btnArea = document.createElement("td");
                    const btn = document.createElement("button");
                    btn.classList.add("btn");
                    btn.classList.add("btn-outline-danger");
                    btn.classList.add("btn-square");
                    btn.classList.add("deleteWeek");
                    btn.setAttribute("onclick", "delProduct("+ del.productNo +")");

                    const icon = document.createElement("i");
                    icon.classList.add("fa-solid");
                    icon.classList.add("fa-minus");

                    btn.append(icon);
                    btnArea.append(btn);
                    tr.append(pName, opName, btnArea);

                    delPList.append(tr);
                }
            }
        },
        error : function(req, status, error){
            console.log("리스트 목록 조회 중 에러 발생");
            console.log(req.responseText);
        }
    });

}

//목록에서 상품 삭제
function delProduct(productNo){
    console.log("리스트 번호 : " + productNo);

    $.ajax({
        url : "delete",
        data : {"productNo" : productNo},
        type : "GET",
        success : function(result){

            if(result>0){
                addList();
            } else {
                alert("삭제 실패");
            }

        },
        error : function(req, status, error){
            console.log("리스트 목록 삭제 중 에러 발생");
            console.log(req.responseText);
        }
    });
}

//점보박스 옵션 구하기
function jumboOp(param) {

    const regex = /[^0-9.]/g;
    const regex2 = /[^a-zA-Zㄱ-힣()]/g;

    let standard = param.replaceAll(regex,"");
    let jumbo = Number(standard)*1.5;

    //소수점 둘째 자리까지 표시
    jumbo *= 100;
    jumbo = Math.round(jumbo);
    jumbo /= 100;

    let unit = param.replaceAll(regex2, "");
    
    if(jumbo==0) {
        jumbo = "";
    }
    
    if(jumbo>=1000 && unit=='g'){
        jumbo /= 1000;
        unit = 'kg';
    }

    return jumbo + unit;
}