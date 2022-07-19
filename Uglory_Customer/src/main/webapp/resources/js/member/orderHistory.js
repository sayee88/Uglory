// 개별 상품 주문 내역 (ajax)


const orderDetailBtn = document.getElementsByClassName("orderDetailBtn");

for(let btn of orderDetailBtn){
    btn.addEventListener("click", function(){
    
        $.ajax({

            url : "orderHistoryList",
            data : {"orderNo" : orderNo, "memberNo" : memberNo } ,

            type : "GET",
            dataType: "JSON",
            success : function(orderHistoryList){
           
            console.log(orderHistoryList);
         
            
            //


                // 층 버튼의 모든 배경색 제거
                for(let temp of floorBtn){
                    temp.classList.remove("floor-select");
                }

                // 선택한 층 버튼에만 배경색 추가
                btn.classList.add("floor-select");


                // 목록 지우기
                const top = document.querySelector(".top");
                top.innerHTML = "";
                
                // 객실 목록 만들기 (201,202,203)
                const arr = [];
                const num = btn.innerText.substring(0,1);
                for(let i=1 ; i<=3; i++){
                    arr.push(num * 100 + i);
                }

                console.log(arr);


                // 객실 출력
                for(let i=0 ; i<3; i++){

                    // 객실 테두리
                    const roomInfo = document.createElement("div");
                    roomInfo.classList.add("room-info");

                    // 객실 번호
                    const roomNo = document.createElement("div");
                    roomNo.innerText = arr[i];
                    roomInfo.append(roomNo);

                    // 예약된 객실인 경우
                    if(room[i] != undefined && ( room[i].roomNo == arr[i] ) ){ 
                        roomInfo.classList.add("in");
                        
                        const name = document.createElement("div");
                        name.innerText = room[i].memberName + " 님";


                        const rDate = document.createElement("div");
                        rDate.innerText = room[i].checkIn + "~(" + room[i].dateRange + "박)";

                        const btnArea = document.createElement("div");
                        const b = document.createElement("button");
                        b.classList.add("reserve-detail");
                        b.innerText = "예약상세";

                        btnArea.append(b);
                        
                        roomInfo.append(name, rDate, btnArea);


                    }else{ // 예약되지 않은 객실인 경우
                        const div = document.createElement("div");
                        div.innerText = "예약가능";

                        roomInfo.append(div);
                    }

                    top.append(roomInfo);
                }
    
            },
            error : function(request, status, error){
                console.log('error');
            }
    
        });
    });
}
// function orderHistory(){

//     $.ajax({
 
//         url : contextPath + "/member/selectOrderList",
//         data : {"orderNo" : orderNo},
//         type : "GET",
//         dataType: "JSON",
//         success : function(oList){
//             console.log(oList);

           

//             // oList에 저장된 요소 하나씩 접근
//             for(let orderHistory of oList){

//                 const orderHead = document.createElement("div");
//                 orderHead.classList.add("orderHead");



//                 const orderInfo = document.createElement("div");
//                 orderInfo.classList.add("orderInfo")

//                 const description = document.createElement("div");
//                 description.classList.add("description");

//                 const oBox = document.createElement("dl")
//                 oBox.classList.add("oBox");

//                 const oTitle = document.createElement("dt")
                

//                 const orderImg = document.createElement("img");
//                 orderImg.classList.add("orderImg");
//                 orderImg.setAttribute("src",window.location);
//             }
//         },
//         error:function(){
//             console.log("에러발생");
//         }
//     })
// }