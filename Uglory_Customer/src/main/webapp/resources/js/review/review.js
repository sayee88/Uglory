//모달창
// (function(){
//     grantModalEvent();
//     const modal = document.getElementsByClassName("modal")[0];
//     const openBtn = document.getElementsByClassName("modal-open")[0];
//     const closeBtn = modal.querySelector(".modal-close");
    
//     // openBtn.addEventListener("click", function(){
//     //     openBtn.classList.remove("hidden");
//     // })
    

// })();







// 클릭한 사진으로 바뀌게 만들기
const bigPic = document.querySelector("#big"); // 큰사진
const smallPics = document.querySelectorAll(".small"); // 작은 사진(여러개)

for(var i = 0; i < smallPics.length; i++){
    smallPics[i].addEventListener("click", changepic);
}

function changepic(){
    const smallPicsAttribute = this.getAttribute("src");
    bigPic.setAttribute("src", smallPicsAttribute);
}