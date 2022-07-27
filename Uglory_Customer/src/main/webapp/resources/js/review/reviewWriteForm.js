const imgHi0 = document.getElementById("imgHi0");
const imgHi1 = document.getElementById("imgHi1");
const imgHi2 = document.getElementById("imgHi2");

const inputImage = document.getElementsByClassName("inputImage");
const preview = document.getElementsByClassName("preview");
const deleteImage = document.getElementsByClassName("delete-image");

const deleteList = document.getElementById("deleteList");
const deleteSet = new Set();


let idCount = 1;
let reviewImgCount = 0;


// 파일 선택 되었을 때
for(let i=0; i<inputImage.length; i++){

    inputImage[i].addEventListener("change", function(){

        if(this.files[0] != undefined){
            const reader = new FileReader();
            reader.readAsDataURL(this.files[0]);

            reader.onload = function(e){ 
                preview[i].setAttribute("src", e.target.result);
                
                reviewImgCount++;

                inputImage[i].removeAttribute("id");

                addReviewImg();
            }
        } else {
            preview[i].removeAttribute("src");
        }

    });

    // 미리 보기 삭제 버튼의 동작
    deleteImage[i].addEventListener("click", function(){
    
        // 만약 미리보기가 존재하는 경우에만
        if( preview[i].getAttribute("src") != null){
            
            preview[i].removeAttribute("src");
    
            inputImage[i].value = "";
            
            deleteSet.add[i];

            if(document.getElementsByClassName("reviewImg").length > 1){
                this.parentElement.remove();

                reviewImgCount--;

                if(reviewImgCount == 3){
                    addReviewImg();
                }
            }else{
                preview[i].removeAttribute("src");
                this.previousElementSibling.value = "";
            }

           
        }
    
    });
}



function addReviewImg(){

    if(document.getElementsByClassName("reviewImg").length < 4){
   
        const div = document.createElement("div");
        div.classList.add("reviewImg");
        div.classList.add("m-1");
        
        const label = document.createElement("label");
        label.setAttribute("for" , "img" + idCount);
        
        const img = document.createElement("img");
        img.classList.add("preview");
    
        label.append(img);
    
    
        const input = document.createElement("input");
        input.classList.add("inputImage");
        input.setAttribute("type", "file");
        input.setAttribute("name", "images");
        input.setAttribute("accept", "image/*");
        input.setAttribute("id", "img" + idCount);
    
    
        const span = document.createElement("span");
        span.classList.add("delete-image");
        span.innerHTML = "&times;";
    
        div.append(label, input, span);
        idCount++;
    
        document.querySelector(".review-img-upload").append(div);
    
        input.addEventListener("change", function(){
    
            if(this.files[0] != undefined){
                const reader = new FileReader();
                reader.readAsDataURL(this.files[0]);
    
                reader.onload = function(e){ 
                    input.previousElementSibling.children[0].setAttribute("src", e.target.result);
                    reviewImgCount++;

                    input.removeAttribute("id");

                    addReviewImg();
                }
            } else {
                input.previousElementSibling.children[0].removeAttribute("src");
            }
    
        });

        span.addEventListener("click", function(){
            const preview = this.previousElementSibling.previousElementSibling.children[0];
            // 만약 미리보기가 존재하는 경우에만
            if( preview.getAttribute("src") != null){
                
                preview.removeAttribute("src");
        
                if(document.getElementsByClassName("reviewImg").length > 1){
                    this.parentElement.remove();

                    reviewImgCount--;
                    if(reviewImgCount == 3){
                        addReviewImg();
                    }
                }else{
                    preview.removeAttribute("src");
                    this.previousElementSibling.value = "";
                }
            }
        });

        
    }

}

