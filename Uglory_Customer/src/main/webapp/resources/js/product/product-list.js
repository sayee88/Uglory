(function(){
    $.ajax({
        url : contextPath + "/product/list/all",
        dataType : "JSON",
        success : function(pList){
            const adminRoot = window.location.origin+'/ugloryA';
            console.log(window.location.origin+'/ugloryA');
            console.log(pList);
            const row = document.getElementById("row");
            row.innerText = "";
        
            for(let product of pList){
            
                const col = document.createElement("div");
                col.classList.add("col");
            
                const box = document.createElement("div");
                box.classList.add("box");
            
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
                p.innerText = product.starCount;
            
            
                // 품절시 추가
                if(pList.productList == 'O'){ 
                    product_img.classList.add("soldout");
            
                    const soldoutImg = document.createElement("img");
                    starImg.setAttribute("src", contextPath + "/resources/img/product/품절스티커.png");
                    starImg.classList.add("soldout-sticker");
                }
            
            
                sub_box.append(starImg, p);
            
                flex_container.append(h4, sub_box);
            
                div.append(h5, flex_container);
            
                box.append(product_img, div);
            
                col.append(box);
            
                row.append(col);

            }
        },
        error : function(){
            console.log("에러발생");
        }
    });

})();




// 품절이면 append
