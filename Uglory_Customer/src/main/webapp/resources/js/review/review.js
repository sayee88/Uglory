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