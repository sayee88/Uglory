// ajax
function subCategory(){

    $.ajax({

        url: "selectSub",
        type : "GET",
        dataType : "JSON",
        success : function(subList){
                        // 담아올 바구니
            // list 자체를 가져와야함


        },
        error: function(req, status, error){
            console.log("리스트 조회 중 에러가 발생...");
            console.log(req.responseText);
        }
    });





}

const reviewList = document.getElementById("review-list");

function createBox(){

    const reviewContent = document.createElement("div");
    reviewContent.classList.add("review-content");

    const clickModal = document.createElement("div");
    clickModal.setAttribute("data-bs-toggle", "modal");
    clickModal.setAttribute("data-bs-target", "#exampleModal");

    const reviewImage = document.createElement("img");
    reviewImage.setAttribute("src", contextPath + '이미지루트');

    const text = document.createElement("div");
    text.classList.add("review-content-text");

    const contentTop = document.createElement("div");
    contentTop.classList.add("review-content-top-section");

    const cotentTopLeft = document.createElement("div");
    cotentTopLeft.classList.add("review-content-top-left");

    const name = document.createElement("div");
    name.innerText = "이름 얻어오기";

    const enrollDate = document.createElement("div");
    enrollDate.innerText = "리뷰 작성일";

    const starRating = document.createElement("div");
    starRating.classList.add("review-star");

    // 별점 부분



};





// 별점 
const rating = $('.rating');

rating.each(function(){
    const $this = $(this);
    const targetScore = $this.attr('data-rate');
    const firstdigit = targetScore.split('.');

    console.log(firstdigit);

    // firstdigit의 개수가 2개이면 소수점
    if(firstdigit.length > 1){

        for(let i=0; i<firstdigit[0]; i++){
            $this.find('.star').eq(i).css({width:'100%'});
        }
        $this.find('.star').eq(firstdigit[0]).css({width:firstdigit[1]+'0%'});

    } else {
        for(let i=0; i<targetScore; i++){
            $this.find('.star').eq(i).css({width:'100%'});
        }
    }

});




























// 나의 미작성 리뷰 
const subUnWrittenList = document.getElementById("subUnWrittenList");
const productUnWrittenList = document.getElementById("productUnWrittenList");


document.getElementsByClassName("subBox")[0].addEventListener("click", function(){
    
    
    if(subUnWrittenList != null){
        subUnWrittenList.style.display = "block";
    }
    productUnWrittenList.style.display = "none";

    document.getElementsByClassName("unWritten")[0].classList.add("unWrittenNone");
    document.getElementsByClassName("unWritten")[0].classList.remove("unWritten");
    this.classList.remove("unWrittenNone");
    this.classList.add("unWritten");

});
    


document.getElementsByClassName("product")[0].addEventListener("click", function(){
    
    productUnWrittenList.style.display = "block";
    
    if(subUnWrittenList != null){
        subUnWrittenList.style.display = "none";
    }

    document.getElementsByClassName("unWritten")[0].classList.add("unWrittenNone");
    document.getElementsByClassName("unWritten")[0].classList.remove("unWritten");
    this.classList.remove("unWrittenNone");
    this.classList.add("unWritten");
   
});




