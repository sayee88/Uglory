// 모달
if(document.getElementById('myModal')){
    var myModal = document.getElementById('myModal')
        var myInput = document.getElementById('myInput')

        myModal.addEventListener('shown.bs.modal', function () {
        myInput.focus()
    })

}

function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
           

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;

        }
    }).open();
}



function subscriptionValidate(){

    const box = document.getElementsByName("box");
    const cycle = document.getElementsByName("cycle");

    let boxChk = false;
    let cycleChk = false;
    
    for(var i=0 ; i<box.length; i++){
        if(box[i].checked == true){
            boxChk = true;
            break;
        }
    }
    if(!boxChk){
        alert("구독 상품을 선택해주세요.")
        return false;
    }
    for(var i=0 ; i<cycle.length; i++){
        if(cycle[i].checked == true){
            cycleChk = true;
            break;
        }
    }
    if(!cycleChk){
        alert("배송 주기를 선택해주세요.")
        return false;
    }


}






function orderValidate(){

    const submitBtn = document.getElementById("submit-btn");

    const orderName = document.getElementById("s-orderName");
    const orderPhone = document.getElementById("s-orderPhone");

    const regExpName = /^[가-힣]{2,5}|[a-zA-Z]{2,10}$/; // 이름 정규식
    const regExpPhone = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/; // 전화번호 정규식
    

     // 이름 유효성 검사
     if(orderName.value.trim().length == 0){
        alert("이름을 입력해주세요.");
        orderName.focus();
        return false;
    }
    if(!regExpName.test(orderName.value)){
        alert("이름은 한글 2~5글자 / 영문 2~10글자 사이로 작성해주세요.");
        orderName.focus();
        return false;
    }
    // if(reqExpName.test(orderName.value)){

    // }
    
    // 전화번호 유효성 검사
    if(orderPhone.value.trim().length == 0){
        alert("연락처를 입력해주세요.(-제외)");
        orderPhone.focus();
        return false;
    }
    if(!regExpPhone.test(orderPhone.value)){
        alert("연락처 형식이 올바르지 않습니다.(-제외)");
        orderPhone.focus();
        return false;
    }
    // if(reqExpPhone.test(orderPhone.value)){

    // }
    

}


// 버섯 전체
function mushroom(){
    if(document.getElementById("mush1").checked == true){
        for(var i=0 ; i<5 ; i++) document.getElementsByName("mushroom")[i].checked = true;
    }
    if(document.getElementById("mush1").checked == false){
        for(var i=0 ; i<5 ; i++) document.getElementsByName("mushroom")[i].checked = false;
    }
}




// 갯수 제한

function count_check(obj){
    var checkBox = document.getElementsByName("choice");
    var checkCount = 0;
    for(var i=0 ; i<checkBox.length; i++){
        if(checkBox[i].checked){
            checkCount++;
        }
    }
    if(checkCount > 5){
        alert("5개까지 체크할 수 있습니다.");
        obj.checked = false;
        return false;
    }
}



// X버튼 클릭시 check 해제
const xbtn = document.getElementById("xbtn");
if(xbtn == true){
    xbtn.addEventListener("click", function(){
        const choice = document.getElementsByName("choice");
    
        for(var i=0 ; i<choice.length ; i++){
            if(choice[i].checked){
                choice[i].checked = false;
            }
        }
    })

}


// // 제외할 야채(choice) value 값 가져오기
// function getValue(){
//     const checked = 'input[name="choice"]:checked';
//     const checkedVege = document.querySelectorAll(checked);

//     let result = '';
//     checkedVege.forEach((el)=>{
//         result += el.value + ' ';
//     });



// }


// // merchant_uid(구독결제번호) 만들기 ->payNo
// for (let i=0 ; i<count_check ; i++){
//     let arr = new makePayNo()
// }



// 정기 결제
const subBtn = document.getElementById("sub-btn");
if(subBtn != undefined){
    subBtn.addEventListener("click", function(){

        var IMP = window.IMP; // 생략 가능
        IMP.init("imp97143001"); // 예: imp00000000
    
        IMP.request_pay({
            pay_method : 'card', // 기능 없음.
            merchant_uid: payNo,  // 구독결제번호
            name : boxName, // 상품명
            amount : amount, // 빌링키 발급과 함께 amount원 결제승인을 시도합니다.
            customer_uid : subsOrderNo, // 필수 입력  / 주문번호 연결
            buyer_name : memberName
        }, function(rsp) {
    
            if ( rsp.success ) {
                $.ajax({
        
                    url : contextPath + "/subscription/kakaopay",
                    data : {
                        "subsOrderNo" : subsOrderNo,
                        "orderName" : orderName,
                        "orderPhone" : orderPhone,
                        "orderAddress" : orderAddress,
                        "delText" : delText,
                        "cycle" : cycle,
                        "memberNo" : memberNo,
                        "box" : box,
                        "amount" : amount,
                        "payNo" : payNo
                        //,"firstDelDate" : firstDelDate
                    },
    
                    type : "POST",
                    success : function(res){ 
                        if(res>0){
                            location.href = contextPath + "/member/subscriptionStatus";
                            alert("주문이 완료되었습니다:)");
    
                        }else{
                            location.href = contextPath;
                            alert("주문 실패:(  에러 내용 : " +  rsp.error_msg);
                        }
                    },
                    error: function(){
                        console.log("에러 발생");
                    }
                
                });
            } else {
                console.log("결제 실패 :(  에러내용 :" + rsp.error_msg);
            }
        });
    
    
    })

}


