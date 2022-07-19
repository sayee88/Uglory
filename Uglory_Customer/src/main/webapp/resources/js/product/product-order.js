// 다음 우편번호 
// 우편번호 찾기 화면을 넣을 element
var element_layer = document.getElementById('layer');

function closeDaumPostcode() {
    // iframe을 넣은 element를 안보이게 한다.
    element_layer.style.display = 'none';
}

function sample2_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('order-postcode').value = data.zonecode;
            document.getElementById("order-address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("order-detailAddress").focus();

            // iframe을 넣은 element를 안보이게 한다.
            // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
            element_layer.style.display = 'none';
        },
        width : '100%',
        height : '100%',
        maxSuggestItems : 5
    }).embed(element_layer);

    // iframe을 넣은 element를 보이게 한다.
    element_layer.style.display = 'block';

    // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
    initLayerPosition();
}

// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
function initLayerPosition(){
    var width = 400; //우편번호서비스가 들어갈 element의 width
    var height = 500; //우편번호서비스가 들어갈 element의 height
    var borderWidth = 2; //샘플에서 사용하는 border의 두께

    // 위에서 선언한 값들을 실제 element에 넣는다.
    element_layer.style.width = width + 'px';
    element_layer.style.height = height + 'px';
    element_layer.style.border = borderWidth + 'px solid';
    // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
    element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
    element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
}

// 이름 유효성 검사
const p_orderName = document.getElementById("p-orderName");
const nameMessage = document.getElementById("nameMessage");

p_orderName.addEventListener("input", function(){

    // 입력이 되지 않은 경우
    if(p_orderName.value.trim().length == 0){
        nameMessage.innerText = "이름을 입력해주세요";
        nameMessage.classList.remove("confirm", "error");
        p_orderName.focus();
        return false;
    }

    // 이름 유효성 검사 정규식
    const n_regExp = /^[가-힣]{2,15}$/;

    if(n_regExp.test(p_orderName.value)){ // 유효한 경우
        nameMessage.innerText = "이름 확인 완료";
        nameMessage.classList.add("confirm");
        nameMessage.classList.remove("error");

    } else { // 유효하지 않은 경우 
        nameMessage.innerText = "이름 형식을 확인해주세요";
        nameMessage.classList.add("error");
        nameMessage.classList.remove("confirm");
    }
    
});

// 전화번호 유효성 검사
const p_orderPhone = document.getElementById("p-orderPhone");
const phoneMessage = document.getElementById("phoneMessage");

p_orderPhone.addEventListener("input", function(){
   
    // 입력이 되지 않은 경우
    if(p_orderPhone.value.trim().length == 0){
        phoneMessage.innerText = "연락처를 입력해주세요";
        phoneMessage.classList.remove("confirm", "error");
        p_orderPhone.focus();
        return false;
    }

    // 전화번호 유효성 검사 정규식
    const p_regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;

    if(p_regExp.test(p_orderPhone.value)){ // 유효한 경우
        phoneMessage.innerText = "연락처 확인 완료";
        phoneMessage.classList.add("confirm");
        phoneMessage.classList.remove("error");

    } else {
        phoneMessage.innerText = "연락처 형식을 확인해주세요";
        phoneMessage.classList.add("error");
        phoneMessage.classList.remove("confirm");
    }
});


document.getElementById("order-btn").addEventListener("click", function(){
    
    const pOrderName = document.getElementById("p-orderName").value;
    const pOrderPhone = document.getElementById("p-orderPhone").value;
    const pOrderAddress1 = document.getElementsByClassName("p-orderAddress")[0].value;
    const pOrderAddress2 = document.getElementsByClassName("p-orderAddress")[1].value;
    const pOrderReq = document.getElementById("p-orderReq").value;

    if( !agree.checked ){ // 체크를 안했을 때
        alert("약관 동의 후 주문 버튼을 클릭해주세요.");
        agree.focus();
        return;

    } else {

        if(!confirm("정말 주문하시겠습니까?")){
            return;

        } else {
            // 개별상품 결제
            var IMP = window.IMP; 
            IMP.init("imp33404182"); 

            IMP.request_pay({ // param
                pg : "kakaopay",
                pay_method: "card",
                merchant_uid: productPayNo,
                name: productName,
                amount: totalAmount,
                buyer_name : pOrderName,
                buyer_tel : pOrderPhone

            }, function (rsp) { // callback
                if (rsp.success) {
                    $.ajax({
                        url : contextPath + "/product/order",
                        data : {
                            "pOrderCode" : pOrderCode,
                            "pOrderName" : pOrderName,
                            "pOrderPhone" : pOrderPhone,
                            "pOrderAddress1" : pOrderAddress1,
                            "pOrderAddress2" : pOrderAddress2,
                            "pOrderReq" : pOrderReq,
                            "memberNo" : memberNo,
                            "totalAmount" : totalAmount ,
                            "productPayNo" : productPayNo,
                        },

                        type : "POST",
                        success : function(res){ 

                            if(res>0){
                                location.href = contextPath + "/member/orderHistory";

                                alert("결제가 완료되었습니다 :D");

                            } else {
                                location.href = contextPath;
                                alert("결제 실패 ㅠ / 에러 내용 : " + + rsp.error_msg);
                            }
                        },
                        error: function(){
                            console.log("에러 발생");
                            console.log("상태코드 : " + request.status); 
                        }
                    });
                } else {
                }
            });
        }
    }
});




