
(function(){
    $.ajax({
        url : contextPath + "/product/list/all",
        dataType : "JSON",
        success : function(pList){
            const adminRoot = window.location.origin+'/ugloryA';
            
            const row = document.getElementById("row");
            row.innerText = "";
                
            for(let product of pList){
            
                const col = document.createElement("div");
                col.classList.add("col");
            
                const box = document.createElement("div");
                box.classList.add("box");

                const img_box = document.createElement("div");
                img_box.classList.add("img-box");
            
                const product_img = document.createElement("img");
                product_img.classList.add("product-img");
                product_img.setAttribute("src",  window.location.origin+'/ugloryA' + product.imgRoot);
                
                
            
                const div = document.createElement("div");
            
                const h4 = document.createElement("h4");
                h4.innerText = product.productName;
            
                const flex_container = document.createElement("div");
                flex_container.classList.add("flex-container");
            
                const h5 = document.createElement("h5");
                h5.innerText = product.productPrice;
            
                // 별점
                // sub-box 였던것...
                const review_star = document.createElement("div");
                review_star.classList.add("review-star");

                const rating = document.createElement("div");
                rating.classList.add("rating");
                rating.setAttribute("data-rate", product.starAvg);

                const star_wrap1 = document.createElement("div");
                star_wrap1.classList.add("star-wrap");
                const star1 = document.createElement("div");
                star1.classList.add("star");
                const i1 = document.createElement("i");
                i1.classList.add("fas");
                i1.classList.add("fa-star");

                const star_wrap2 = document.createElement("div");
                star_wrap2.classList.add("star-wrap");
                const star2 = document.createElement("div");
                star2.classList.add("star");
                const i2 = document.createElement("i");
                i2.classList.add("fas");
                i2.classList.add("fa-star");

                const star_wrap3 = document.createElement("div");
                star_wrap3.classList.add("star-wrap");
                const star3 = document.createElement("div");
                star3.classList.add("star");
                const i3 = document.createElement("i");
                i3.classList.add("fas");
                i3.classList.add("fa-star");

                const star_wrap4 = document.createElement("div");
                star_wrap4.classList.add("star-wrap");
                const star4 = document.createElement("div");
                star4.classList.add("star");
                const i4 = document.createElement("i");
                i4.classList.add("fas");
                i4.classList.add("fa-star");

                const star_wrap5 = document.createElement("div");
                star_wrap5.classList.add("star-wrap");
                const star5 = document.createElement("div");
                star5.classList.add("star");
                const i5 = document.createElement("i");
                i5.classList.add("fas");
                i5.classList.add("fa-star");


                const rc = document.createElement("p");
                rc.innerText = "("+product.starCount+")";
            
                // <%-- <a href="product/detail/"${categoryNo}/${productCode} --%>
                const a = document.createElement("a");
                a.setAttribute("href", "detail/"+product.categoryNo+"/"+product.productCode);
            
                // 품절시 추가
                if(product.productState == "O"){ 
                    product_img.classList.add("soldout");
            
                    const soldoutImg = document.createElement("img");
                    starImg.setAttribute("src", contextPath + "/resources/img/product/품절스티커.png");
                    starImg.classList.add("soldout-sticker");
                }
            
                
            
                i1.append(star1);
                star1.append(star_wrap1);
                i2.append(star2);
                star2.append(star_wrap2);
                i3.append(star3);
                star3.append(star_wrap3);
                i4.append(star4);
                star4.append(star_wrap4);
                i5.append(star5);
                star5.append(star_wrap5);

                rating.append(star_wrap1, star_wrap2, star_wrap3, star_wrap4, star_wrap5);
                review_star.append(rating, rc);
                flex_container.append(h5, review_star);

                div.append(h4, flex_container);
                img_box.append(product_img);
                box.append(img_box, div);
                a.append(box);
                col.append(a);
                row.append(col);
        
            }
            
        },
        error : function(){
            console.log("에러발생");
        }
    });

})();





// 만들어둔 for문 요소 function으로 뺴놓고
// 버튼에 이벤트 추가
// categoryNo만 다름 -> ajax를 categoryNo보내는 거 추가



// 카테고리

function category(selectCategoryNo){

    $.ajax({
        url : contextPath + "/product/list/category",
        dataType : "JSON",
        data : {"selectCategoryNo" : selectCategoryNo},
        success : function(pcList){

            const row = document.getElementById("row");
            row.innerText = "";
        
        
            for(let product of pcList){
            
                const col = document.createElement("div");
                col.classList.add("col");
            
                const box = document.createElement("div");
                box.classList.add("box");

                const img_box = document.createElement("div");
                img_box.classList.add("img-box");
            
                const product_img = document.createElement("img");
                product_img.classList.add("product-img");
                product_img.setAttribute("src",  window.location.origin+'/ugloryA' + product.imgRoot);
                
                
            
                const div = document.createElement("div");
            
                const h4 = document.createElement("h4");
                h4.innerText = product.productName;
            
                const flex_container = document.createElement("div");
                flex_container.classList.add("flex-container");
            
                const h5 = document.createElement("h5");
                h5.innerText = product.productPrice;
            
                // 별점
                // sub-box 였던것...
                const review_star = document.createElement("div");
                review_star.classList.add("review-star");

                const rating = document.createElement("div");
                rating.classList.add("rating");
                rating.setAttribute("data-rate", product.starAvg);

                const star_wrap1 = document.createElement("div");
                star_wrap1.classList.add("star-wrap");
                const star1 = document.createElement("div");
                star1.classList.add("star");
                const i1 = document.createElement("i");
                i1.classList.add("fas");
                i1.classList.add("fa-star");

                const star_wrap2 = document.createElement("div");
                star_wrap2.classList.add("star-wrap");
                const star2 = document.createElement("div");
                star2.classList.add("star");
                const i2 = document.createElement("i");
                i2.classList.add("fas");
                i2.classList.add("fa-star");

                const star_wrap3 = document.createElement("div");
                star_wrap3.classList.add("star-wrap");
                const star3 = document.createElement("div");
                star3.classList.add("star");
                const i3 = document.createElement("i");
                i3.classList.add("fas");
                i3.classList.add("fa-star");

                const star_wrap4 = document.createElement("div");
                star_wrap4.classList.add("star-wrap");
                const star4 = document.createElement("div");
                star4.classList.add("star");
                const i4 = document.createElement("i");
                i4.classList.add("fas");
                i4.classList.add("fa-star");

                const star_wrap5 = document.createElement("div");
                star_wrap5.classList.add("star-wrap");
                const star5 = document.createElement("div");
                star5.classList.add("star");
                const i5 = document.createElement("i");
                i5.classList.add("fas");
                i5.classList.add("fa-star");


                const rc = document.createElement("p");
                rc.innerText = "("+product.starCount+")";

                // const starImg = document.createElement("img");
                // starImg.setAttribute("src", contextPath + "/resources/img/product/star.jpg"); // 수정필요
            
                // const p = document.createElement("p");
                // p.innerText = "("+product.starCount+")";
            
                // <%-- <a href="product/detail/"${categoryNo}/${productCode} --%>
                const a = document.createElement("a");
                a.setAttribute("href", "detail/"+product.categoryNo+"/"+product.productCode);
            
                // 품절시 추가
                if(product.productState == "O"){ 
                    product_img.classList.add("soldout");
            
                    const soldoutImg = document.createElement("img");
                    starImg.setAttribute("src", contextPath + "/resources/img/product/품절스티커.png");
                    starImg.classList.add("soldout-sticker");
                }
            
            
                i1.append(star1);
                star1.append(star_wrap1);

                i2.append(star2);
                star2.append(star_wrap2);
                i3.append(star3);
                star3.append(star_wrap3);
                i4.append(star4);
                star4.append(star_wrap4);
                i5.append(star5);
                star5.append(star_wrap5);

                rating.append(star_wrap1, star_wrap2, star_wrap3, star_wrap4, star_wrap5);
                review_star.append(rating, rc);
                flex_container.append(h5, review_star);

                div.append(h4, flex_container);
                img_box.append(product_img);
                box.append(img_box, div);
                a.append(box);
                col.append(a);
                row.append(col);
        
            }

        },
        error : function(pcList){
            console.log("에러발생");
        }
    })

}


// 별점 
const rating = $('.rating');

rating.each(function(){
    const $this = $(this);
    const targetScore = $this.attr('data-rate');
    const firstdigit = targetScore.split('.');

    console.log(firstdigit);

    // firstdigit의 개수가 2개이면 소수점
    if(firstdigit.length > 1){

        for(let i=0; i<firstdigit[0]; i++){
            $this.find('.star').eq(i).css({width:'100%'});
        }
        $this.find('.star').eq(firstdigit[0]).css({width:firstdigit[1]+'0%'});

    } else {
        for(let i=0; i<targetScore; i++){
            $this.find('.star').eq(i).css({width:'100%'});
        }
    }

});
