// 총 가격 계산
let productPrice = document.getElementsByClassName("productCartPrice");
let sum = 0;

for(let i=0; i<productPrice.length; i++){
    sum += Number(productPrice[i].innerText);
}

document.getElementById("cartTotalPrice").innerText = sum; // 총 주문 금액
document.getElementById("cartPrice").innerText = sum; // 총 상품 금액

//----------------------------------------------------------------------------------

// 총 배송비 계산
let delPrice = document.getElementsByClassName("spanDel");
let sum1 = 0;

for(let j=0; j<delPrice.length; j++){
    sum1 += Number(delPrice[j].innerText);
}

document.getElementById("delTotalPrice").innerText = sum1;// 총 배송비

//----------------------------------------------------------------------------------

// X버튼 클릭 시 장바구니 삭제
const deleteBtnList = document.getElementsByClassName("cart-delete");

for(const deleteBtn of deleteBtnList){

    deleteBtn.addEventListener("click", function(){

        const cartDiv = deleteBtn.parentElement.parentElement;
        cartDiv.previousElementSibling.firstElementChild.innerText =  cartDiv.previousElementSibling.firstElementChild.innerText -1;
        cartDiv.remove();
        
        // OPTIONnO
        $.ajax({
            url : contextPath + "/product/cartDelete",
            data : 
        });
    });
}

//----------------------------------------------------------------------------------

// 옵션 계산
function optionCount(){
    // -버튼
    document.getElementById("option-minus").addEventListener("click", function(){
    
    });
    
    // +버튼
    document.getElementById("option-plus").addEventListener("click", function(){
    
    });

}

// // 결제페이지로
// // productCode, 옵션 수량, optionCode, 총 가격
// function orderValidate(){

// }