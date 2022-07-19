// 상세 버튼 여러 개
const selectDetailList = document.getElementsByClassName("selectDetail");

for(const selectDetailBtn of selectDetailList){
    selectDetailBtn.addEventListener("click", function(){

        const reviewNo = this.parentElement.parentElement.parentElement.children[0].innerText;

        console.log(reviewNo);

        $.ajax({
            url : contextPath + "/review/selectDetail"
        });




    })



}
