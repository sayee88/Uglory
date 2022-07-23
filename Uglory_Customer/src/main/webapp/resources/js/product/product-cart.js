// 총 가격 계산
let productPrice1 = document.getElementsByClassName("productCartPrice");
let sum = 0;

for(let i=0; i<productPrice1.length; i++){
    sum += Number(productPrice1[i].innerText);
}

// if(sum == 0) {
//     document.getElementById("cartTotalPrice").innerText = sum;
if(sum < 30000){
    document.getElementById("cartTotalPrice").innerText = sum + 3000;
    document.getElementById("cartPrice").innerText = sum;
} else { 
    document.getElementById("cartTotalPrice").innerText = sum; // 총 주문 금액
    document.getElementById("cartPrice").innerText = sum; // 총 상품 금액
}


//----------------------------------------------------------------------------------

// 총 가격 계산 함수 
function calcPrice(){
    let productPrice1 = document.getElementsByClassName("productCartPrice");
    let sum = 0;

    for(let i=0; i<productPrice1.length; i++){
        sum += Number(productPrice1[i].innerText);
    }

    /* document.getElementById("cartTotalPrice").innerText = sum; // 총 주문 금액
    document.getElementById("cartPrice").innerText = sum; // 총 상품 금액 */

    if(sum < 30000){
        document.getElementById("cartTotalPrice").innerText = sum + 3000;
        document.getElementById("cartPrice").innerText = sum;
        
    } else {
        document.getElementById("cartTotalPrice").innerText = sum; // 총 주문 금액
        document.getElementById("cartPrice").innerText = sum; // 총 상품 금액
    }
}

//----------------------------------------------------------------------------------

// X버튼 클릭 시 장바구니 삭제
const deleteBtnList = document.getElementsByClassName("cart-delete");

for(const deleteBtn of deleteBtnList){

    deleteBtn.addEventListener("click", function(){

        const optionNo = this.getAttribute("id").replace("optionNo-", "");

        const cartDiv = deleteBtn.parentElement.parentElement;
        cartDiv.previousElementSibling.firstElementChild.innerText = cartDiv.previousElementSibling.firstElementChild.innerText -1;
        cartDiv.remove();

        calcPrice();

        // X버튼 동작 시 CART DB 삭제 진행

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

// // 결제페이지로
// // productCode, 옵션 수량, optionCode, 총 가격

const optionObj = {}; // 선택한 옵션 정보 추가
const productPrice = document.getElementById("cartTotalPrice").innerText; // 상품 가격

function orderValidate(){
    document.getElementById("product-order").addEventListener("click", function(){

        if(!confirm("결제 페이지로 이동합니다.")){ // 취소 버튼
            return;

        } else { // 확인

        }

    })
}