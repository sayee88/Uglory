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




// ajax
function subBox(){

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

    const star = document.createElement("span");
    star.innerText = "별점";



};