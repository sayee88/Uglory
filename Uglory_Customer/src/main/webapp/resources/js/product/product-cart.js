// 총 가격 계산
let productPrice1 = document.getElementsByClassName("productCartPrice");
let sum = 0;

for(let i=0; i<productPrice1.length; i++){
    sum += Number(productPrice1[i].innerText);
}

// if(sum == 0) {
//     document.getElementById("cartTotalPrice").innerText = sum;

    document.getElementById("cartTotalPrice").innerText = sum; // 총 주문 금액
    document.getElementById("cartPrice").innerText = sum; // 총 상품 금액


//----------------------------------------------------------------------------------

// 총 가격 계산 함수 
function calcPrice(){
    let productPrice1 = document.getElementsByClassName("productCartPrice");
    let checkBox = document.getElementsByClassName("cart-check");
    let sum = 0;

    for(let i=0; i<productPrice1.length; i++){
        if(checkBox[i].checked){
            sum += Number(productPrice1[i].innerText);
        }
    }

    /* document.getElementById("cartTotalPrice").innerText = sum; // 총 주문 금액
    document.getElementById("cartPrice").innerText = sum; // 총 상품 금액 */
        
        document.getElementById("cartTotalPrice").innerText = sum; // 총 주문 금액
        document.getElementById("cartPrice").innerText = sum; // 총 상품 금액
}

//----------------------------------------------------------------------------------

// X버튼 클릭 시 장바구니 삭제
const deleteBtnList = document.getElementsByClassName("cart-delete");

for(const deleteBtn of deleteBtnList){

    deleteBtn.addEventListener("click", function(){

        const optionNo = this.getAttribute("id").replace("optionNo-", "");

        const cartDiv = deleteBtn.parentElement.parentElement;
        cartDiv.parentElement.firstElementChild.firstElementChild.innerText = cartDiv.parentElement.firstElementChild.firstElementChild.innerText -1;
        cartDiv.remove();

        // X버튼 동작 시 CART DB 삭제 진행
        calcPrice();

        $.ajax({
            url : contextPath + "/product/cartDelete",
            data : {"optionNo" : optionNo},
            type : "POST",

            success : function(result){
                if(result > 0){
                    console.log("성공");
                } else {
                    console.log("실패");
                }
            },
            
            error : function(request, status, error){
				console.log("에러 발생");
				console.log("상태코드 : " + request.status); 
			}
        });

    });
}

//----------------------------------------------------------------------------------

// - 버튼
const minusBtnList = document.getElementsByClassName("option-minus");

for(const minusBtn of minusBtnList){
    minusBtn.addEventListener("click", function(e){

        // optionNo 얻어오기
        minusOptionNo = this.getAttribute("id").replace("-1", "");

        const optionMinusCount = minusBtn.nextElementSibling;

        if(optionMinusCount.innerText > 1){ // 1 이상일 때만 수행
            optionMinusCount.innerText = optionMinusCount.innerText -1;
            optionCal(e.target, -1);
            // 가격 변동 필요
            calcPrice();
        }

        $.ajax({
            url : contextPath + "/product/cartMinus",
            data : {"minusOptionNo" : minusOptionNo,
                    "optionMinusCount" : optionMinusCount.innerText,
                    },
            type : "POST",

            success : function(){
                console.log("수량 변경 성공");
            },
            error : function(request, status, error){
				console.log("에러 발생");
				console.log("상태코드 : " + request.status); 
			}
        });
    });
}

// +버튼
const plusBtnList = document.getElementsByClassName("option-plus");

for(const plusBtn of plusBtnList){

    plusBtn.addEventListener("click", function(e){
        
        plusOptionNo = this.getAttribute("id").replace("+1", "");

        const optionplusCount = plusBtn.previousElementSibling; 
        optionplusCount.innerText = Number(optionplusCount.innerText) + 1;   
        optionCal(e.target, 1);
        calcPrice();

        $.ajax({
            url : contextPath + "/product/cartPlus",
            data : {"plusOptionNo" : plusOptionNo,
                    "optionPlusCount" : optionplusCount.innerText,
                    },
            type : "POST",

            success : function(){
                console.log("수량 변경 성공");
            },
            error : function(request, status, error){
				console.log("에러 발생");
				console.log("상태코드 : " + request.status); 
			}
        });
    });
}

// 수량 변경에 따른 가격 변동
function optionCal(target, num){

    // const optionUpdown = document.getElementsByClassName("option-updown")[0];
    // const optionCount = document.getElementsByClassName("option-count")[0].innerText;
    const opPrice = target.parentElement.getAttribute("value");
    const optionCount = target.parentElement.children[1].innerText;

    target.parentElement.nextElementSibling.children[0]

    // const opPrice = optionUpdown.getAttribute("value"); // 2000원 얻어와짐
    //target.parentElement.nextElementSibling.children[0].innerText = (opPrice * optionCount);

    let productPrice =  target.parentElement.nextElementSibling.children[0].innerText;
    productPrice = Number(productPrice) - Number(opPrice) * (Number(optionCount) - num);
    target.parentElement.nextElementSibling.children[0].innerText = productPrice + (opPrice * optionCount) ;
}

let optionNoList = [];
const productPrice = [];

// 체크한 박스만 가져오기
function getCheckboxValue(event)  {

    calcPrice();
    const checkBoxList = document.getElementsByClassName("cart-check");

    for(checkBox of checkBoxList){
        if(checkBox.checked){

            checkBox.nextElementSibling.setAttribute("name", "optionNo");
            productPrice.push(Number(checkBox.parentElement.nextElementSibling.nextElementSibling.children[1].children[1].children[0].innerText));
            console.log(productPrice);
            // optionNo
            //optionNoList.push(Number(checkBox.nextElementSibling.value));
            //console.log(optionNoList);

        } else {
            checkBox.nextElementSibling.setAttribute("name", "unableNo");
        }
    }
    // 체크되었을 때
    
//     for(let j=0; j<checkBoxList.length; j++){

//         checkBoxList.setAttribute("dis")

//         disabled
//         // if(checkBoxList[j].checked)  {

//             // productCode 얻어오기
//             const productClassList = checkBoxList[j].parentElement.nextElementSibling.children[1].getElementsByClassName("productA");

//             for(productClass of productClassList){
//                 productCode.push(productClass.getAttribute("value").replace("productCode-", ""));
//             }

//             console.log(productCode);

//             // optionCode 얻어오기
//             const optionCodeList = checkBoxList[j].nextElementSibling.value;


//             const optionCountList = document.getElementsByClassName("option-count");

//             for(let i=0 ; i< optionCode.length ; i++){
//                 optionObj[optionCode] = Number(optionCode[i].innerText);
//             }

//             //chkOptionNoList = event.target.getAttribute("value");
//     //}

//   }
}

// // 결제페이지로
// // 체크된 productCode, 옵션 수량, 체크한 optionCode, 총 가격


const optionObj = {};
const productCode = [];

function orderValidate(){

    if(!confirm("결제 페이지로 이동합니다.")){ // 취소 버튼
        return false;

    } else { // 확인

        console.log(productCode);
        console.log(optionObj);

        /// 총 가격
        const input1 = document.createElement("input");
        input1.setAttribute("type", "hidden");
		input1.setAttribute("name", "totalAmount");
        input1.setAttribute("value", document.getElementById("cartTotalPrice").innerText);

        // 상품 가격
        const input2 = document.createElement("input");
		input2.setAttribute("type", "hidden");
		input2.setAttribute("name", "productPrice");
        input2.setAttribute("value", productPrice);

        // // productCode
        // const input3 = document.createElement("input");
        // input3.setAttribute("type", "hidden");
        // input3.setAttribute("name", "productCode");
        // input3.setAttribute("value", productCode);

        document.orderForm.append(input1, input2);
        //document.orderForm.append(input1);

    }
}