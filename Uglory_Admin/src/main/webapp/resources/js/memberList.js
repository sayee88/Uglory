function selectAll(){ // 회원 전체 조회 함수
    // ajax코드
    $.ajax({
        url : "customer/selectAll",
        dataType : "json",    //  응답 데이터의 형식을 "json"으로 지정
                              // -> 자동으로 JS 객체로 변환됨
        success : function( list ){

            // 1) #customerList 내용 삭제
            const customerList = document.getElementById("customerList");

            customerList.innerHTML = "";

            // 2) list를 for문을 이용해서 반복 접근
            for(let item of list){
                // item == 회원 1명의 정보가 담긴 JS 객체

                // 3) tr 요소 생성
                const tr = document.createElement("tr");

                // 4) th 요소 생성
                const th = document.createElement("th"); 
                th.setAttribute("scope", "row");
                th.innerText = item.customerNo // 회원 번호

                // 5) td 요소 생성 + 내용 추가 * 3
                const td1 = document.createElement("td");
                td1.innerText = item.customerEmail; // 회원 이메일

                const td2 = document.createElement("td");
                td2.innerText = item.customerName; // 회원 이름

                const td3 = document.createElement("td");
                const subsBtn = document.createElement("button");
                subsBtn.classList.add("btn", "btn-subscription")
                if(item.subscriptionFlag == 'N'){ // 구독 O
                    subsBtn.innerText = "구독 중"; 
                } else{ // 구독X
                    subsBtn.innerText = "구독";
                }
                td3.append(subsBtn);

                const td4 = document.createElement("td");
                const accountBtn = document.createElement("button");
                accountBtn.classList.add("btn", "btn-stopaccount")
                if(item.accountFlag == 'N'){ // 계정 정지 X
                    accountBtn.innerText = "계정 정지"; 
                } else{ // 계정 정지 O
                    accountBtn.innerText = "계정 활성화"; 
                }
                td4.append(accountBtn);
                

                // 5) tr요소에 td요소 3개 추가
                tr.append(th, td1, td2, td3, td4);

                // 6) memberList에 tr 추가
                customerList.append(tr);
            }
        },
        error : function(){
            console.log("에러 발생");
        }
    });
}

(function(){
    selectAll(); // 함수 호출 -> 회원 목록을 먼저 조회

    window.setInterval(selectAll, 3600); // 1*60*60

})();