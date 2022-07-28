// 상세 버튼 여러 개
const selectDetailList = document.getElementsByClassName("selectDetail");

for(const selectDetailBtn of selectDetailList){
    selectDetailBtn.addEventListener("click", function(){

        const payNo = this.parentElement.parentElement.children[0].innerText;

        console.log(payNo);


        let sortNum;
        if(this.classList.contains("sort-1")) {
            location.href = "SPaymentDetail/" + payNo;
        }
        else {
            
            location.href = "PPaymentDetail/" + payNo;
        }

    })

}
