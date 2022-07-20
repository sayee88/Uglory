// 상세 버튼 여러 개
const selectDetailList = document.getElementsByClassName("selectDetail");

// 리뷰 리스트
// const reviewList = document.getElementById("reviewList");

for(const selectDetailBtn of selectDetailList){
    selectDetailBtn.addEventListener("click", function(){

        const reviewNo = this.parentElement.parentElement.parentElement.children[0].innerText;

        $.ajax({
            url : contextPath + "/review/reviewDetail",
            data : {"reviewNo" : reviewNo},
            type : "GET",
            dataType : "JSON",
            success : function(reviewDetail){
                console.log(reviewDetail);

                // 이미지 리스트
                // const imageList = document.getElementById("carouselExampleInterval");

                const imgbox = document.getElementsByClassName("modal-imgList")[0];
                imgbox.innerHTML = "";

                for(let reviewImage of reviewDetail.imageList){
                    const div = document.createElement("div");
                    const img = document.createElement("img");
                    img.classList.add("small");
                    img.setAttribute("src", window.location.origin+'/ugloryC' + reviewImage.reviewImageRename);

                    div.append(img);
                    imgbox.append(div);
                }


                // 리뷰 내용
                const detail1 = document.getElementById("detail-1");
                
                detail1.children[0].innerText = reviewDetail.customerName;
                detail1.children[1].innerText = reviewDetail.enrollDate;

                document.getElementById("detail-2").innerText = reviewDetail.productName;

                document.getElementById("detail-3").innerText = reviewDetail.starRating;

                document.getElementById("detail-4").innerHTML = reviewDetail.reviewContent;




            }


        });



        




    })

}


// // 상세 버튼 여러 개
// const selectDetailList = document.getElementsByClassName("selectDetail");


// for(const selectDetailBtn of selectDetailList){
//     selectDetailBtn.addEventListener("click", function(){

//         const reviewNo = this.parentElement.parentElement.parentElement.children[0].innerText;

//         if(this.classList.contains("detail-" + reviewNo)){
//             location.href = "reviewDetail/" + reviewNo;
//         }



//     })

// }