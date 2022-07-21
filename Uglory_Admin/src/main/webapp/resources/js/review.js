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
            async : false,
            success : function(reviewDetail){
                console.log(reviewDetail);

                // 리뷰 내용
                const detail1 = document.getElementById("detail-1");
        
                detail1.children[0].innerText = reviewDetail.customerName;
                detail1.children[1].innerText = "등록일 : " + reviewDetail.enrollDate;

                document.getElementById("detail-2").innerText = reviewDetail.productName + "에 대한 리뷰";

                document.getElementById("detail-3").innerText = reviewDetail.starRating + "점";

                document.getElementById("detail-4").innerHTML = reviewDetail.reviewContent;
                
                // 이미지 슬라이드
                const imageSlide = document.getElementsByClassName("carousel-inner")[0];

                // 이미지 리스트
                const imgbox = document.getElementsByClassName("modal-imgList")[0];
                
                if(reviewDetail.imageList != null){

                    imageSlide.innerHTML = "";
                    imgbox.innerHTML = "";

                    let idx = 0;
                    for(let reviewImage of reviewDetail.imageList){
                        const divSlide = document.createElement("div");
                        divSlide.classList.add("carousel-item");

                        const imgSlide = document.createElement("img");

                        imgSlide.classList.add("d-block", "w-100");
                        imgSlide.setAttribute("src", window.location.origin+'/ugloryC' + reviewImage.reviewImageRename);


                        if(idx == 0){
                            divSlide.classList.add("active");
                            divSlide.setAttribute("style", "object-fit: contain;");
                            idx++;
                        }

                        divSlide.append(imgSlide);
                        imageSlide.append(divSlide);

                        // 이미지 리스트
                        const div = document.createElement("div");
                        const img = document.createElement("img");
                        img.classList.add("small");
                        img.setAttribute("src", window.location.origin+'/ugloryC' + reviewImage.reviewImageRename);
    
                        div.append(img);
                        imgbox.append(div);
                    }

                } else{
                    imageSlide.innerHTML = "";
                    imgbox.innerHTML = "";

                }

               
                // 이미지 리스트 왜 안 없어져!??!?! 
                

                // 삭제하기 위한 함수에 reviewNo 매개변수 추가
                const deleteBtn = document.getElementsByClassName("btn-delete")[0];
                deleteBtn.setAttribute("onclick", "deleteReview("+reviewDetail.reviewNo+")");

            }, 
            error : function(){
                console.log("조회 실패");
            }

        });


    })
}

function deleteReview(reviewNo){
    if(confirm("정말로 삭제하시겠습니까?")){
        $.ajax({
            url : contextPath + "/review/deleteReview",
            data : {"reviewNo" : reviewNo},
            type : "GET",
            success : function(result){
                if(result>0) {
                    alert("삭제 완료");
                    location.href = contextPath + "/review/selectAll";
                } else{
                    console.log("삭제 실패");
                    location.href = contextPath + "/review/selectAll";
                }
            },
            error : function(){
                console.log("댓글 삭제 중 오류 발생");
            }
            
        });
    }
}

