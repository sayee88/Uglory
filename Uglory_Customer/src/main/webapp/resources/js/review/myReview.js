// 나의 리뷰 js 부분
// 리뷰 삭제

// document.getElementById("deleteBtn").addEventListener("click", function(){

//     let url = contextPath + "/review/list/delete" + reviewCode + "/" + reviewNo;

//     if( confirm("정말로 삭제 하시겠습니까?")){
//                  location.href = url; // get 방식으로 url에 요청
//     }

// });

function deleteReview(reviewNo, reviewCode){

    let url = contextPath + "/review/list/delete/" + reviewCode + "/" + reviewNo;

    if( confirm("정말로 삭제 하시겠습니까?")){
        location.href = url; // get 방식으로 url에 요청
    }

}


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