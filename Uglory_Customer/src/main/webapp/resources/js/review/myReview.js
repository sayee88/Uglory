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