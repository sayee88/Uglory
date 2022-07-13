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

document.getElementById("mush1").addEventListener("change", mushroom);



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


// value 값 가져오기
function getValue(){
    const checked = 'input[name="choice"]:checked';
    const selectedEls = document.querySelectorAll(checked);

    let result = '';
    selectedEls.forEach((el)=>{
        result += el.value + ' ';
    });

}

