// 개별 상품 주문 내역 (ajax)

function selectOne(){
    $.ajax({
        url:"member/orderHistory/selectOne",
        dataType:"json",
        success: function(){

        }
    });
};






// document.getElementById("select1").addEventListener("click", function(){

//     const div = document.getElementById("result1");

//     // ajax 코드 작성 (jQuery)
//     $.ajax({
//         url : "/orderHistory/selectOne",
//         data : {"memberNo":loginMember.value},
//         type : "POST",
//         dataType:"JSON",
//         success : function(){

//         } ,
//         error : function(request,status,error){
//             console.log("ajax 에러 발생");
            
//             console.log(" 상태 코드 : " + request.status); // 404 500 에러 번호 출력

//             console.log(request.responseText);  // 에러 메세지 출력 

//             console.log(error); // 에러 객체 출력  




//         }
//     });

 

// })


