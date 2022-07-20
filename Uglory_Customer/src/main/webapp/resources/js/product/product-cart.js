// $.ajax({
//     url : contextPath + "/product/cart",
//     data : {
//         "totalAmount" : totalAmount,
//         "optionObj" : optionObj,
//         "productCode" : productCode,
//     },

//     dataType : "JSON",
//     type : "POST",
//     success : function(cartOptionList){

//         if(cartOptionList.isEmpty()){ // 조회한 옵션, 상품이 비어있을 경우 == 장바구니에 담긴 상품이 없을 경우

//             const cartDiv = document.createElement("div");
//             cartDiv.classList.add("empty-product-cart");

//             const cartP = document.createElement("p");
//             p.innerText = "장바구니에 담긴 상품이 없습니다.";
//             cartDiv.append(cartP);
//             document.getElementsByClassName("product-cart-area")[0].append(cartDiv);

//         } else { // 장바구니에 담긴 상품이 있을 경우
//             for(let cartList of cartOptionList){

//                 const cartChk = document.createElement("input");
//                 cartChk.setAttribute("type", "checkbox");
//                 cartChk.setAttribute("name", "cart-check");
//                 cartChk.setAttribute("id", "cart-check");
//                 cartChk.setAttribute("value", cartList.productCode);

//                 const cartDeleteBtn = document.createElement("button");
//                 cartDeleteBtn.setAttribute("id", "cart-delete")
//                 cartDeleteBtn.innerText = 'X';

//                 document.getElementsByClassName("cart-check-delete")[0].append(cartChk, cartDeleteBtn)
//             }
//         }
//     },

//     error: function(){
//         console.log("에러 발생");
//         console.log("상태코드 : " + request.status); 
//     }
// });