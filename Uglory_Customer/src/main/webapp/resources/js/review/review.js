const reviewList = document.getElementById("review-list");

// 즉시실행 함수
(function(){
    allReviewList();
})();


const reviewRadio = document.getElementsByClassName("reviewRadio");
const reviewBtn = document.getElementsByClassName("reviewBtn");

for(let i=0; i < reviewRadio.length; i++){
    reviewRadio[i].addEventListener("change", function () {

        for(let j=0; j<reviewRadio.length; j++){
            
            if( reviewRadio[j].checked ){
                reviewRadio[j].nextElementSibling.classList.add("reviewChecked");
            } else {
                reviewRadio[j].nextElementSibling.classList.remove("reviewChecked");
            }

        }

    });    
}




//전체

//함수 >
//reviewList.innerHTML = "";
//구독 ajax, 상품 ajax

function allReviewList(){

    $.ajax({

        url: "list/allReviewList", 
        type : "POST",
        dataType : "JSON",
        success : function(allList){
                        // 담아올 바구니
            // list 자체를 가져와야함
            reviewList.innerHTML = "";

            if(allList.length != 0){
                
                for(let item of allList){
                    createBox(item);
                }
            }
        },
        error: function(req, status, error){
            console.log("리스트 조회 중 에러가 발생...");
            console.log(req.responseText);
        }
    });

}


// 구독 ajax
function subCategory(){

    $.ajax({

        url: "list/selectSub", 
        type : "POST",
        dataType : "JSON",
        success : function(subList){
                        // 담아올 바구니
            // list 자체를 가져와야함
            reviewList.innerHTML = "";

            if(subList.length != 0){
                
                
                for(let item of subList){
                    createBox(item);
                }
            }
        },
        error: function(req, status, error){
            console.log("리스트 조회 중 에러가 발생...");
            console.log(req.responseText);
        }
    });
}


// 상품 ajax
function productCaregory(){

    $.ajax({

        url: "list/selectProduct",
        type : "POST",
        dataType : "JSON",
        success : function(productList){
                        // 담아올 바구니
            // list 자체를 가져와야함
            reviewList.innerHTML = "";

            if(productList.length != 0){

                //reviewList.innerHTML = "";

                for(let item of productList){
                    createBox(item);
                }
            }
        },
        error: function(req, status, error){
            console.log("리스트 조회 중 에러가 발생...");
            console.log(req.responseText);
        }
    });
}





function createBox(item){

    // reviewList.innerHTML = "";

    const reviewContent = document.createElement("div");
    reviewContent.classList.add("review-content");
    reviewContent.classList.add("col-4");
    reviewContent.classList.add("mb-5");

    const clickModal = document.createElement("div");
    clickModal.setAttribute("data-bs-toggle", "modal");
    clickModal.setAttribute("data-bs-target", "#exampleModal");
    clickModal.setAttribute("onclick", "openModal("+item.reviewNo+")");

    const reviewImage = document.createElement("img");
    reviewImage.setAttribute("src", contextPath + item.thumbnail);

    const text = document.createElement("div");
    text.classList.add("review-content-text");
    text.classList.add("openModal2");

    const contentTop = document.createElement("div");
    contentTop.classList.add("review-content-top-section");

    const cotentTopLeft = document.createElement("div");
    cotentTopLeft.classList.add("review-content-top-left");

    const name = document.createElement("div");
    name.innerText = item.memberName;

    const enrollDate = document.createElement("div");
    enrollDate.innerText = item.reviewEnrollDate;

    // 별점 부분
    // 별점
    const review_star = document.createElement("div");
    review_star.classList.add("review-star");

    const rating = document.createElement("div");
    rating.classList.add("rating");
    rating.setAttribute("data-rate", item.starRating);

    const star_wrap1 = document.createElement("div");
    star_wrap1.classList.add("star-wrap");
    const star1 = document.createElement("div");
    star1.classList.add("star");
    const i1 = document.createElement("i");
    i1.classList.add("fas");
    i1.classList.add("fa-star");

    const star_wrap2 = document.createElement("div");
    star_wrap2.classList.add("star-wrap");
    const star2 = document.createElement("div");
    star2.classList.add("star");
    const i2 = document.createElement("i");
    i2.classList.add("fas");
    i2.classList.add("fa-star");

    const star_wrap3 = document.createElement("div");
    star_wrap3.classList.add("star-wrap");
    const star3 = document.createElement("div");
    star3.classList.add("star");
    const i3 = document.createElement("i");
    i3.classList.add("fas");
    i3.classList.add("fa-star");

    const star_wrap4 = document.createElement("div");
    star_wrap4.classList.add("star-wrap");
    const star4 = document.createElement("div");
    star4.classList.add("star");
    const i4 = document.createElement("i");
    i4.classList.add("fas");
    i4.classList.add("fa-star");

    const star_wrap5 = document.createElement("div");
    star_wrap5.classList.add("star-wrap");
    const star5 = document.createElement("div");
    star5.classList.add("star");
    const i5 = document.createElement("i");
    i5.classList.add("fas");
    i5.classList.add("fa-star");


    const contentSection = document.createElement("div");
    contentSection.classList.add("review-content-text-section");
    contentSection.classList.add("modal-open");

    const contentText = document.createElement("div");
    contentText.setAttribute("data-bs-toggle", "modal");
    contentText.setAttribute("data-bs-target", "#exampleModal");
    contentText.style.color = "black";
    // contentText 리뷰 내용 넣어주기
    contentText.innerText = item.reviewContent;


    const contentBottom = document.createElement("div");
    contentBottom.classList.add("review-content-bottom-section");

    const reviewCode = document.createElement("div");

    if(item.reviewCode == 1){
        reviewCode.innerText = "정기구독박스";
    } else {
        reviewCode.innerText = "개별상품";
    }
    

    clickModal.append(reviewImage);
    cotentTopLeft.append(name, enrollDate);


    // 별점
    star1.append(i1);
    star_wrap1.append(star1);

    star2.append(i2);
    star_wrap2.append(star2);

    star3.append(i3);
    star_wrap3.append(star3);

    star4.append(i4);
    star_wrap4.append(star4);

    star5.append(i5);
    star_wrap5.append(star5);
    
    //rating.append(star-wrap, star-wrap, star-wrap, star-wrap, star-wrap)
    rating.append(star_wrap1, star_wrap2, star_wrap3, star_wrap4, star_wrap5);
    review_star.append(rating);
 

    contentSection.append(contentText);

    contentBottom.append(reviewCode);
    
    contentTop.append(cotentTopLeft, review_star);

    text.append(contentTop, contentSection, contentBottom);

    reviewContent.append(clickModal, text);

    reviewList.append(reviewContent);


    const $this = $(rating)
    const targetScore = $this.attr('data-rate');
    const firstdigit = targetScore.split('.');

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

};

//==========================================================


// 별점 
const rating = $('.rating');

rating.each(function(){
    const $this = $(this);
    const targetScore = $this.attr('data-rate');
    const firstdigit = targetScore.split('.');

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

//==========================================================


// 모달 리뷰 상세보기
function openModal(reviewNo){

    $.ajax({

        url: "list/reviewDetail", 
        data : {"reviewNo" : reviewNo},
        type : "GET",
        dataType : "JSON",
        async : false,
        success : function(reviewDetail){
                        // 담아올 바구니

            console.log(reviewDetail[0]);

            console.log(reviewDetail[0].imageList);

            //console.log(reviewDetail[0].imageList[0].reviewImageRename);
            console.log(reviewDetail[0].imageList[3]);


            // 이미지 슬라이드 부분

            const carouselInner = document.getElementsByClassName("carousel-inner")[0];
            carouselInner.innerHTML = "";
            
            if(reviewDetail[0].imageList.length != 0){
                for(let i = 0; i<reviewDetail[0].imageList.length; i++){
                    const carouselItem = document.createElement("div");
                    carouselItem.classList.add("carousel-item");
                    
                    if(i==0){
                        carouselItem.classList.add("active");
                    }
                    
                    const image = document.createElement("img");
                    image.setAttribute("src", contextPath + reviewDetail[0].imageList[i].reviewImageRename);
                    
                    carouselItem.append(image);
                    
                    carouselInner.append(carouselItem);
                }
            } else {
                carouselInner.innerHTML = "";
            }

            // 이미지 리스트
            const imgList = document.getElementsByClassName("modal-imgList")[0];
            imgList.innerHTML = "";

            
            const noImage = document.createElement("div");
            noImage.classList.add("img4");
            noImage.innerText = "x";
            
            //reviewDetail[0].imageList.legth == 0  검사
            if(reviewDetail[0].imageList.length == 0){
                
                imgList.append(noImage, noImage, noImage, noImage);
                
            } else {
                
                for(let i=0; i < 4; i++){
                    
                    if(reviewDetail[0].imageList[i] != undefined){
                        const imgListDiv = document.createElement("div");
                        const image = document.createElement("img");
                        image.classList.add("small");
                        image.setAttribute("src", contextPath + reviewDetail[0].imageList[i].reviewImageRename);
                        
                        imgListDiv.append(image);
                        imgList.append(imgListDiv);

                    } else {
                        // 이미지 없을 때
                        imgList.append(noImage);
                        
                    }
                }
            }

            const contentInfo = document.getElementsByClassName("modal-content-info")[0];
            contentInfo.innerHTML = "";

            const contentSection = document.createElement("div");
            const infoNameDate = document.createElement("div");
            infoNameDate.classList.add("info-name-date");

            const spanName = document.createElement("div");
            spanName.innerText = reviewDetail[0].memberName;

            const spanEnrollDate = document.createElement("div");
            spanEnrollDate.innerText = reviewDetail[0].reviewEnrollDate;

            const purchase = document.createElement("div");
            purchase.classList.add("purchase");
            if(reviewDetail.reviewCode == 1){
                purchase.innerText = "정기구독박스";

            } else {
                purchase.innerText = "개별상품";
            }

            infoNameDate.append(spanName, spanEnrollDate);

            contentSection.append(infoNameDate, purchase);


            // 별점
            const modalStar = document.createElement("div");
            modalStar.classList.add("modal-star");

            const modalStarSection = document.createElement("div");

            const review_star = document.createElement("div");
            review_star.classList.add("myReview-star");

            const rating = document.createElement("div");
            rating.classList.add("rating");
            rating.setAttribute("data-rate", reviewDetail[0].starRating);

            const star_wrap1 = document.createElement("div");
            star_wrap1.classList.add("star-wrap");
            const star1 = document.createElement("div");
            star1.classList.add("star");
            const i1 = document.createElement("i");
            i1.classList.add("fas");
            i1.classList.add("fa-star");

            const star_wrap2 = document.createElement("div");
            star_wrap2.classList.add("star-wrap");
            const star2 = document.createElement("div");
            star2.classList.add("star");
            const i2 = document.createElement("i");
            i2.classList.add("fas");
            i2.classList.add("fa-star");

            const star_wrap3 = document.createElement("div");
            star_wrap3.classList.add("star-wrap");
            const star3 = document.createElement("div");
            star3.classList.add("star");
            const i3 = document.createElement("i");
            i3.classList.add("fas");
            i3.classList.add("fa-star");

            const star_wrap4 = document.createElement("div");
            star_wrap4.classList.add("star-wrap");
            const star4 = document.createElement("div");
            star4.classList.add("star");
            const i4 = document.createElement("i");
            i4.classList.add("fas");
            i4.classList.add("fa-star");

            const star_wrap5 = document.createElement("div");
            star_wrap5.classList.add("star-wrap");
            const star5 = document.createElement("div");
            star5.classList.add("star");
            const i5 = document.createElement("i");
            i5.classList.add("fas");
            i5.classList.add("fa-star");

            star1.append(i1);
            star_wrap1.append(star1);

            star2.append(i2);
            star_wrap2.append(star2);

            star3.append(i3);
            star_wrap3.append(star3);

            star4.append(i4);
            star_wrap4.append(star4);

            star5.append(i5);
            star_wrap5.append(star5);
            
            // 별점 숫자로 표시
            const numStarRating = document.createElement("div");
            numStarRating.classList.add("modal-starRating");
            numStarRating.innerText = reviewDetail[0].starRating;
            
            //rating.append(star-wrap, star-wrap, star-wrap, star-wrap, star-wrap)
            rating.append(star_wrap1, star_wrap2, star_wrap3, star_wrap4, star_wrap5, numStarRating);
            review_star.append(rating);
            modalStarSection.append(review_star);
            modalStar.append(modalStarSection);



            contentInfo.append(contentSection, modalStar);

            const modalContentText = document.getElementsByClassName("modal-content-text")[0];
            modalContentText.innerText = "";
            modalContentText.innerText = reviewDetail[0].reviewContent;


            // 별점
            const $this = $(rating)
            const targetScore = $this.attr('data-rate');
            const firstdigit = targetScore.split('.');

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


            
        },
        error: function(req, status, error){
            console.log("리스트 조회 중 에러가 발생...");
            console.log(req.responseText);
        }
    });


}









//==========================================================



// 나의 미작성 리뷰 js 부분
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



// br 태그 제거
const reg = /<[^>]*>?/g

String.replace(/<[^>]*>?/g, '');