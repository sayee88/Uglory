// function secessionValidate(){
//     const secession_cnt = document.getElementsByName("choice");

//     // 사유 체크박스 체크 여부

//     if(!choice.checked){ // 체크를 안했을때

//         alert("탈퇴 사유를 체크해주세요.")
//         choice.focus();
//         return false;

//     }
// }

//사유 체크박스 체크 여부
function secessionValidate(){
    if(document.querySelector("[name='choice']:checked") == null){
        alert("탈퇴 사유를 체크해주세요.");
        return false;
    }
}