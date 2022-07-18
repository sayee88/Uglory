// 상세 버튼 여러 개
const selectDetailList = document.getElementsByClassName("selectDetail");

for(const selectDetailBtn of selectDetailList){
    selectDetailBtn.addEventListener("click", function(){

        const orderCode = this.parentElement.parentElement.children[0].innerText;

        console.log(orderCode);

        $.ajax({
            url : contextPath + "/payment/checkOrder", 
            data : {"orderCode" : orderCode},
            type : "GET", 
            success : function(result){
                if(result > 0){

                    // 여기서 개별상품인지 구독상품인지 확인하고
                    // 상세조회로 넘어가고 싶은데 
                    // orderCode 값을 가지고 넘어가고 싶어용
                    // ajax 안에 ajax 가능한가용?

                    alert("개별 상품 상세 조회로 이동합니다.");
                    location.href = "PPaymentDetail";
                } else{
                    alert("구독 상품 상세 조회로 이동합니다.");
                    location.href = "SPaymentDetail";
                }

            },
            error : function(){
                console.log("에러 발생");
            }

        })

    })



}
