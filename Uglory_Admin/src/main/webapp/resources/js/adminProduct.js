// 상품 리스트 조회
(function(){

    $.ajax({
        url : "selectAll",
        dataType : "json",
        success : function(list){

            const rootBox = document.getElementById("rootBox");
            const beansBox = document.getElementById("beansBox");
            const vegBox = document.getElementById("vegBox");
            const fnvBox = document.getElementById("fnvBox");
            const herbsBox = document.getElementById("herbsBox");
            const mushBox = document.getElementById("mushBox");
            const fruitBox = document.getElementById("fruitBox");

            // for문 안에서 switch로 카테고리별로 Box에 집어넣기
            for(let items of list ){

                // div (class="card m-4 col-sm-5 col-xl-3")
                // a (href="detail/${productCode}")
                    // img (src="${contextPath}${thumbnail}")
                    // div (class="cardBody")
                        // div (class="card-tit")
                            // p (${productCode})
                            // p (${productName})
                        // p (class="pCategory", ${productCategory})
                        // div (class="card-con")
                            // p (상품등록일)
                            // p (class="pData", ${productDateCh})
                        // div (class="card-con")    
                            // p (생산자)
                            // p (class="pData", ${farmName})
                
                // if({productState} == 'O') -> 품절 표시 넣기
            }

        },
        error : function(request, status, error){
            console.log("에러 발생");
            console.log("상태코드 : " + request.status);
        }

    });

})();