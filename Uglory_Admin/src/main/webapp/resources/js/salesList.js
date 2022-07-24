const refundBtnList = document.getElementsByClassName("refundDone");

for(const refundBtn of refundBtnList){
    refundBtn.addEventListener("click", function(e){

        const orderCode = this.parentElement.parentElement.previousElementSibling.children[0].innerText;

        console.log(orderCode);

        $.ajax({
            url : contextPath + "/payment/refund",
            data : {"orderCode" : orderCode},
            type : "GET",
            success : function(result){
                if(result > 0){
                    alert("환불 요청 처리 완료");
                    e.target.parentElement.innerText = "환불 처리 완료";
                    e.target.remove();


                } else{
                    alert("환불 처리 실패");
                }
            },
            error : function(){
                console.log("에러 발생");

            }
        })

    })
}