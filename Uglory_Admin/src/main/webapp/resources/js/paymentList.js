// 상세 버튼 여러 개
const selectDetailList = document.getElementsByClassName("selectDetail");

for(const selectDetailBtn of selectDetailList){
    selectDetailBtn.addEventListener("click", function(){

        const orderCode = this.parentElement.parentElement.children[0].innerText;

        console.log(orderCode);


        let sortNum;
        if(this.classList.contains("sort-1")) {
            location.href = "SPaymentDetail/" + orderCode;
        }
        else {
            
            location.href = "PPaymentDetail/" + orderCode;
        }

    })



}
