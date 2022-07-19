// 개별 상품 주문 내역 (ajax)


    $.ajax({
       url : contextPath + "/member/",
       data : {"optionCode" : optionCode, 
             "productCode" : productCode},
       type : "POST",
       async : false,
 
       success : function(result){
 
          $.ajax({
             url : "../optionSelect",
             data : {"optionCode" : optionCode},
             type : "POST",
             dataType : "JSON",
             async    : false,
       
             success : function(optionList){
                
                // if(!optionList.isEmpty()){ // 옵션 리스트가 비어이지 않을 경우
       
                for(let selectOption of optionList){
       
                   // span 요소 추가
                   const span = document.createElement("span");
       
                   // span 요소에 내용 추가
                   const optionName = document.createElement("h5");
                   optionName.innerText = selectOption.optionName; // 옵션 이름
                   
                   const optionPrice = document.createElement("h5");
                   optionPrice.innerText = selectOption.optionPrice; // 옵션 가격
       
                   // 수량 변경
                   const optionDiv = document.createElement("div");
       
                   const opMinus = document.createElement("button");
                   opMinus.innerText = "-";
                   opMinus.style.border = 0;
                   opMinus.style.backgroundColor = "#EAEAEA";
                   opMinus.style.color = "#BDBDBD";
                   opMinus.style.width = "10px";
       
                   const opSapn = document.createElement("span");
                   opSapn.innerText = selectOption.optionCount;
       
                   const opPlus = document.createElement("button");
                   opPlus.innerText = "+";
                   opPlus.style.border = 0;
                   opPlus.style.backgroundColor = "#EAEAEA";
                   opPlus.style.color = "#BDBDBD";
                   opPlus.style.width = "10px";
       
                   const opDelete = document.createElement("button");
                   opDelete.innerText = "X";
                   opDelete.style.border = 0;
                   opDelete.style.backgroundColor = "#BDBDBD";
                   opDelete.style.color = "#EAEAEA";
                   opDelete.style.width = "10px";
       
                   optionDiv.append(opMinus, opSapn, opPlus, opDelete);
       
                   span.append(optionName, optionPrice, optionDiv);
                }
             }
          });
 
          document.getElementsByClassName("total-amount")[0].innerText = result;
 
       },
       
       error : function(request, status, error){
             console.log("AJAX 에러 발생");
             console.log("상태코드 : " + request.status); 
         }
    });


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


