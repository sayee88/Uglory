// 개별 상품 주문 내역 (ajax)


const orderDetailBtn = document.getElementsByClassName("orderDetailBtn");

for (let btn of orderDetailBtn) {
    btn.addEventListener("click", function () {

        const subOrderNo = this.getAttribute("id");

        //console.log( this.parentElement.parentElement.nextElementSibling );

        const target = this.parentElement.parentElement.parentElement;

        $.ajax({

            url: "SubHistoryDetail",
            data: { "subOrderNo": subOrderNo },

            type: "GET",
            dataType: "JSON",
            success: function (SubHistoryDetail) {

                console.log(SubHistoryDetail);


         


                
                // 주문 정보 (타이틀)
                const orderHead2 = document.createElement("div");
                orderHead2.classList.add("order-head");
                
                const orderTitle2 = document.createElement("h2");
                orderTitle2.classList.add("orderTitle");
                orderTitle2.innerText = "구독 정보 조회";

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
                dd2_1.innerText = SubHistoryDetail.memberName;
                dl2_1.append(dt2_1, dd2_1);
                
                
                const dl2_2 = document.createElement("dl");
                const dt2_2 = document.createElement("dt");
                dt2_2.innerText = "결제 일시"
                const dd2_2 = document.createElement("dd");
                dd2_2.innerText = SubHistoryDetail.subDate;
                dl2_2.append(dt2_2, dd2_2);
                
                
                const dl2_3 = document.createElement("dl");
                const dt2_3 = document.createElement("dt");
                dt2_3.innerText = "결제 금액"
                const dd2_3 = document.createElement("dd");
                dd2_3.innerText = SubHistoryDetail.subPrice + "원";
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
                dd3_1.innerText = SubHistoryDetail.subOrderName;
                dl3_1.append(dt3_1, dd3_1);
                
                
                const dl3_2 = document.createElement("dl");
                const dt3_2 = document.createElement("dt");
                dt3_2.innerText = "수령인 전화번호"
                const dd3_2 = document.createElement("dd");
                dd3_2.innerText = SubHistoryDetail.subOrderPhone;
                dl3_2.append(dt3_2, dd3_2);
                
                
                const dl3_3 = document.createElement("dl");
                const dt3_3 = document.createElement("dt");
                dt3_3.innerText = "수령인 주소"
                const dd3_3 = document.createElement("dd");
                dd3_3.innerText = SubHistoryDetail.subOrderAddress;
                dl3_3.append(dt3_3, dd3_3);


                const dl3_4 = document.createElement("dl");
                const dt3_4 = document.createElement("dt");
                dt3_4.innerText = "알러지 제외 상품"
                const dd3_4 = document.createElement("dd");
                dd3_4.innerText = SubHistoryDetail.productName;
                dl3_4.append(dt3_4, dd3_4);


                const dl3_5 = document.createElement("dl");
                const dt3_5 = document.createElement("dt");
                dt3_5.innerText = "배송 요청 사항"
                const dd3_5 = document.createElement("dd");
                dd3_5.innerText = SubHistoryDetail.subDeliveryReq;
                dl3_5.append(dt3_5, dd3_5);

                orderInfo3.append(dl3_1, dl3_2, dl3_3, dl3_4,dl3_5);

                target.append(orderInfo3);


            },
            error: function (request, status, error) {
                console.log('error');
            }

        });
    });
}
