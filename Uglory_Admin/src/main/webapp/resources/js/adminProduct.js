// 상품 리스트 조회
(function (){

    $.ajax({
        url : "selectAll",
        dataType : "json",
        success : function(list){

            console.log(list);

            // for문 안에서 switch로 카테고리별로 Box에 집어넣기
            for(let items of list ){

                // div (class="card m-4 col-sm-5 col-xl-3") : 1
                const card = document.createElement("div");
                card.classList.add("card");
                card.classList.add("m-4");
                card.classList.add("col-sm-5");
                card.classList.add("col-xl-3");

                // a (href="detail/${productCode}") : 2
                const a = document.createElement("a");
                a.setAttribute("href", "detail/" + items.productCode);

                // img (src="${contextPath}${thumbnail}") : 3
                const img = document.createElement("img");
                img.setAttribute("src", contextPath + items.thumbnail);

                // div (class="cardBody") : 3
                const cardBody = document.createElement("div");
                cardBody.classList.add("cardBody");

                // div (class="card-tit") : 4
                const cardTit = document.createElement("div");
                cardTit.classList.add("card-tit");

                // p (${productCode}) : 5
                const pCode = document.createElement("p");
                pCode.innerText = items.productCode;

                // p (${productName}) : 5
                const pName = document.createElement("p");
                pName.innerText = items.productName;

                // p (class="pCategory", ${productCategory}) : 4
                const pCategory = document.createElement("p")
                pCategory.classList.add("pCategory");
                pCategory.innerText = items.productCategory;

                // div (class="card-con") : 4
                const cardCon1 = document.createElement("div");
                cardCon1.classList.add("card-con");

                // p (상품등록일) : 5
                const p1 = document.createElement("p");
                p1.innerText = '상품등록일';

                // p (class="pData", ${productDateCh}) : 5
                const pData1 = document.createElement("p");
                pData1.classList.add("pData");
                pData1.innerText = items.productDateCh;

                // div (class="card-con")    : 4
                const cardCon2 = document.createElement("div");
                cardCon2.classList.add("card-con");

                // p (생산자) : 5
                const p2 = document.createElement("p");
                p2.innerText = '생산자';

                // p (class="pData", ${farmName}) : 5
                const pData2 = document.createElement("p");
                pData2.classList.add("pData");
                pData2.innerText = items.farmName;

                // if({productState} == 'O') -> 품절 표시 넣기(a태그 안에)
                // div (class="sold-out-bg") : 3
                const soldOutBg = document.createElement("div");
                soldOutBg.classList.add("sold-out-bg");

                //img (class="sold-out" src="${contextPath}/resources/img/soldOut.png") : 4
                const soldOut = document.createElement("img");
                soldOut.classList.add("sold-out");
                soldOut.setAttribute("src", contextPath + "/resources/img/soldOut.png");

                //요소 넣기
                cardTit.append(pCode, pName);
                cardCon1.append(p1, pData1);
                cardCon2.append(p2, pData2);

                cardBody.append(cardTit, pCategory, cardCon1, cardCon2);

                soldOutBg.append(soldOut);

                if(items.productState != 'O'){
                    a.append(img, cardBody);
                } else {
                    a.append(soldOutBg, img, cardBody);
                }
                
                card.append(a);

                switch(items.productCategoryNo){
                    case 1 : document.getElementById("rootBox").append(card); break;
                    case 2 : document.getElementById("beansBox").append(card); break;
                    case 3 : document.getElementById("vegBox").append(card); break;
                    case 4 : document.getElementById("fnvBox").append(card); break;
                    case 5 : document.getElementById("herbsBox").append(card); break;
                    case 6 : document.getElementById("mushBox").append(card); break;
                    case 7 : document.getElementById("fruitBox").append(card); break;
                }

            }
        },
        error : function(request, status, error){
            console.log("에러 발생");
            console.log("상태코드 : " + request.status);
        }
    });
})();