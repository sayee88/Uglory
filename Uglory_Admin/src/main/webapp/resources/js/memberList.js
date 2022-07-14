// ajax에서는 this 못 씀!! 

const statusBtnList = document.getElementsByClassName("status-btn");

for (const statusBtn of statusBtnList) {
    statusBtn.addEventListener("click", function (e) { // 계정 상태 버튼 클릭되었을 때

        const customerNo = this.parentElement.parentElement.children[0].innerText;

        $.ajax({
            url :  contextPath + "/customer/changeSt",
            data : {"customerNo" : customerNo},
            type : "GET",
            success : function(result){
                if(result>0){ // 회원 상태 변경 완료
                    alert("회원 상태 변경 완료");

                    e.target.classList.toggle("btn-stopaccount");
                    e.target.classList.toggle("btn-active");

                    if(e.target.innerText == "계정 정지") e.target.innerText = "계정 활성화";
                    else e.target.innerText = "계정 정지"
            
                } else{
                    alert("회원 상태 변경 실패");
                }
            },

            error : function(){
                console.log("에러 발생");
            }
        }); 

    })

}
