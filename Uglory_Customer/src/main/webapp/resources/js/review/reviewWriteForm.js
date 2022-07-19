const imgHi0 = document.getElementById("imgHi0");
const imgHi1 = document.getElementById("imgHi1");
const imgHi2 = document.getElementById("imgHi2");

const inputImage = document.getElementsByClassName("inputImage");
const preview = document.getElementsByClassName("preview");
const deleteImage = document.getElementsByClassName("delete-imgae");

const deleteList = document.getElementById("deleteList");
const deleteSet = new Set();


// 파일 선택 되었을 때
for(let i=0; i<inputImage.length; i++){

    inputImage[i].addEventListener("change", function(){

        if(this.files[0] != undefined){
            const reader = new FileReader();
            reader.readAsDataURL(this.files[0]);

            reader.onload = function(e){ 
                preview[i].setAttribute("src", e.target.result);
                
                deleteSet.delete(i);
            }
        } else {
            preview[i].removeAttribute("src");
        }

    });

}


// 미리 보기 삭제 버튼의 동작
deleteImage[i].addEventListener("click", function(){

    // 만약 미리보기가 존재하는 경우에만
    if( preview[i].getAttribute("src") != ""){
        
        preview[i].removeAttribute("src");

        inputImage[i].value = "";
        
        deleteSet.add[i];
    }

})




// 파일이 입력되었을 때 옆에 파일 입력란이 생기게 하는 동작
document.getElementById("img0").addEventListener("input", function(){

    if(this.value != null){
        
        imgHi0.classList.remove("imgHidden");

    } else {
        
        imgHi0.classList.add("imgHidden");
    }

});
