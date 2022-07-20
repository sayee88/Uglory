// 개별 상품 주문 내역 (ajax)


const orderDetailBtn = document.getElementsByClassName("orderDetailBtn");

for (let btn of orderDetailBtn) {
    btn.addEventListener("click", function () {

        const orderNo = this.getAttribute("id");

        //console.log( this.parentElement.parentElement.nextElementSibling );

        const target = this.parentElement.parentElement.parentElement;

        $.ajax({

            url: "OrderHistoryDetail",
            data: { "orderNo": orderNo },

            type: "GET",
            dataType: "JSON",
            success: function (orderHistoryDetail) {

                console.log(orderHistoryDetail);


                // 주문 내역 상세 조회 (타이틀)
                const orderHead = document.createElement("div");
                orderHead.classList.add("order-head");
                
                const orderTitle = document.createElement("h2");
                orderTitle.classList.add("orderTitle");
                orderTitle.innerText = "주문 내역 상세 조회";

                orderHead.append(orderTitle);
                target.append(orderHead);

                // 주문 내역 상세 조회(콘텐트)
                const orderInfo = document.createElement("div");
                orderInfo.classList.add("order-info");


                for(let proc of orderHistoryDetail.productList){
                    // 모든 상품 정보를 담을 div
                    const description = document.createElement("div");
                    description.classList.add("description");
                    
                    orderInfo.append(description);

                    // 상품 1개 정보를 담을 dl
                    const oBox = document.createElement("dl");
                    oBox.classList.add("oBox");

                    // 상품 이미지
                    const img = document.createElement("img");
                    img.classList.add("orderImg");

                    if(proc.imageRename == null){
                        img.setAttribute("src", contextPath + "/resources/img/쿵야/바나나쿵야.png" );
                    }else{
                        img.setAttribute("src", contextPath +  proc.imageRename);
                    }

                    
                    const div = document.createElement("div");
                    
                    const dl1 = document.createElement("dl");
                    const dt1 = document.createElement("dt");
                    dt1.innerText = "상품이름"
                    const dd1 = document.createElement("dd");
                    dd1.innerText = proc.productName;
                    dl1.append(dt1, dd1);
                    
                    
                    const dl2 = document.createElement("dl");
                    const dt2 = document.createElement("dt");
                    dt2.innerText = "상품 가격 / 옵션명 / 수량"
                    const dd2 = document.createElement("dd");
                    dd2.innerText = (Number(proc.productPrice) + Number(proc.optionPrice))+ " / " + proc.optionName + " / " + proc.optionCount + "개";
                    dl2.append(dt2, dd2);
                    
                    
                    const dl3 = document.createElement("dl");
                    const dt3 = document.createElement("dt");
                    dt3.innerText = "배송 현황"
                    const dd3 = document.createElement("dd");
                    dd3.innerText = proc.deliveryFlag;
                    dl3.append(dt3, dd3);


                    div.append(dl1, dl2, dl3);
                    oBox.append(img, div);
                    description.append(oBox);
                    orderInfo.append(description);
                }


                target.append(orderInfo);



                
                // 주문 정보 (타이틀)
                const orderHead2 = document.createElement("div");
                orderHead2.classList.add("order-head");
                
                const orderTitle2 = document.createElement("h2");
                orderTitle2.classList.add("orderTitle");
                orderTitle2.innerText = "주문 정보 조회";

                orderHead2.append(orderTitle2);
                target.append(orderHead2);

                
                // 주문 정보(콘텐트)
                const orderInfo2 = document.createElement("div");
                orderInfo2.classList.add("order-info");


                const description2 = document.createElement("div");
                description2.classList.add("description");
                orderInfo2.append(description2);


                const dl2_1 = document.createElement("dl");
                const dt2_1 = document.createElement("dt");
                dt2_1.innerText = "주문자 이름"
                const dd2_1 = document.createElement("dd");
                dd2_1.innerText = orderHistoryDetail.memberName;
                dl2_1.append(dt2_1, dd2_1);
                
                
                const dl2_2 = document.createElement("dl");
                const dt2_2 = document.createElement("dt");
                dt2_2.innerText = "결제 일시"
                const dd2_2 = document.createElement("dd");
                dd2_2.innerText = orderHistoryDetail.payDate;
                dl2_2.append(dt2_2, dd2_2);
                
                
                const dl2_3 = document.createElement("dl");
                const dt2_3 = document.createElement("dt");
                dt2_3.innerText = "총 결제 금액"
                const dd2_3 = document.createElement("dd");
                dd2_3.innerText = orderHistoryDetail.totalPrice + "원";
                dl2_3.append(dt2_3, dd2_3);


                orderInfo2.append(dl2_1, dl2_2, dl2_3);

                target.append(orderInfo2);


                // 주문 정보 (타이틀)
                const orderHead3 = document.createElement("div");
                orderHead3.classList.add("order-head");
                
                const orderTitle3 = document.createElement("h2");
                orderTitle3.classList.add("orderTitle");
                orderTitle3.innerText = "배송 정보 조회";

                orderHead3.append(orderTitle3);
                target.append(orderHead3);


                // 주문 정보(콘텐트)
                const orderInfo3 = document.createElement("div");
                orderInfo3.classList.add("order-info");


                const description3 = document.createElement("div");
                description3.classList.add("description");
                orderInfo3.append(description3);


                const dl3_1 = document.createElement("dl");
                const dt3_1 = document.createElement("dt");
                dt3_1.innerText = "수령인 이름"
                const dd3_1 = document.createElement("dd");
                dd3_1.innerText = orderHistoryDetail.orderName;
                dl3_1.append(dt3_1, dd3_1);
                
                
                const dl3_2 = document.createElement("dl");
                const dt3_2 = document.createElement("dt");
                dt3_2.innerText = "수령인 전화번호"
                const dd3_2 = document.createElement("dd");
                dd3_2.innerText = orderHistoryDetail.orderPhone;
                dl3_2.append(dt3_2, dd3_2);
                
                
                const dl3_3 = document.createElement("dl");
                const dt3_3 = document.createElement("dt");
                dt3_3.innerText = "수령인 주소"
                const dd3_3 = document.createElement("dd");
                dd3_3.innerText = orderHistoryDetail.orderAddress;
                dl3_3.append(dt3_3, dd3_3);


                const dl3_4 = document.createElement("dl");
                const dt3_4 = document.createElement("dt");
                dt3_4.innerText = "배송 요청 사항"
                const dd3_4 = document.createElement("dd");
                dd3_4.innerText = orderHistoryDetail.deliveryReq;
                dl3_4.append(dt3_4, dd3_4);


                orderInfo3.append(dl3_1, dl3_2, dl3_3, dl3_4);

                target.append(orderInfo3);






            },
            error: function (request, status, error) {
                console.log('error');
            }

        });
    });
}
