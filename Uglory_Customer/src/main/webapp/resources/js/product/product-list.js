const ca = document.getElementById("ca");

ca.addEventListener("click", function(){
    $.ajax({
        url : "/ca",
        type : "GET",
        dataType : "json",
        success : function(list){

        },
        error : function(){

        }

    })
});

$("input:button[class='btn-primary']").on("click",function(){
    var ca = $(this).val();
    $.ajax({
        url : "/ca",
        type : "post",
        data : {ca : $(this).val()},
        success : function(res){
            
        },
        error : function(res){
            alert("error");
        }
        
    })
    
});