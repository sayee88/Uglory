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
            
                const h5 = document.createElement("h5");
                h5.innerText = product.productName;
            
                const flex_container = document.createElement("div");
                flex_container.classList.add("flex-container");
            
                const h4 = document.createElement("h4");
                h4.innerText = product.productPrice;
            
                const sub_box = document.createElement("div");
                sub_box.classList.add("sub-box");
            
                const starImg = document.createElement("img");
                starImg.setAttribute("src", contextPath + "/resources/img/product/star.jpg"); // 수정필요
            
                const p = document.createElement("p");
                p.innerText = "("+product.starCount+")";
            
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
            
                
            
                sub_box.append(starImg, p);
                flex_container.append(h4, sub_box);
                div.append(h5, flex_container);
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
            
                const h5 = document.createElement("h5");
                h5.innerText = product.productName;
            
                const flex_container = document.createElement("div");
                flex_container.classList.add("flex-container");
            
                const h4 = document.createElement("h4");
                h4.innerText = product.productPrice;
            
                const sub_box = document.createElement("div");
                sub_box.classList.add("sub-box");
            
                const starImg = document.createElement("img");
                starImg.setAttribute("src", contextPath + "/resources/img/product/star.jpg"); // 수정필요
            
                const p = document.createElement("p");
                p.innerText = "("+product.starCount+")";
            
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
            
                
            
                sub_box.append(starImg, p);
                flex_container.append(h4, sub_box);
                div.append(h5, flex_container);
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
// 클래스 불러와서 for문 돌리고 이벤트 추가