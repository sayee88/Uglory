// 링크 공유
function clip(){

	var url = contextPath + "/product/detail/" + categoryNo + "/" + pCode;
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = window.document.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("URL이 복사되었습니다.")
}

// 옵션선택 비동기 통신
function optionSelectBox(){
	
	optionCode = document.getElementsByName("product-option")[0].value;

	$.ajax({

		url : "../optionSelect",
		data : {"optionCode" : optionCode, 
			   "productCode" : productCode},
		type : "POST",

		success : function(result){
			document.getElementsByClassName("total-amount")[0].innerText = result;
		},
		
		error : function(request, status, error){
            console.log("AJAX 에러 발생");
            console.log("상태코드 : " + request.status); // 404, 500
        }

	});
}

// 구매하기 버튼
/* function productOrder(){
	const buy_btn = document.getElementById("buy-btn");

	// if(){ // 옵션을 선택했을 경우에만 이벤트 추가
		buy_btn.addEventListener("click", function(){
			let url = contextPath + "/product/order" + categoryNo + "/" + pCode;

			location.href = url;
		});
	// }
}

// 장바구니로 이동하기 버튼
const productCartBtn = productCartBtn.addEventListener("click", function(){

	let url = contextPath + "/product/cart" + categoryNo + "/" + pCode;
	location.href = url;	
}); */


