// 링크 공유
function clip(){

	var url = '';
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = window.document.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("URL이 복사되었습니다.")
}

const testbox = document.getElementsByClassName("product-option")[0];

testbox.addEventListener("change", function(){

	// this.style.backgroundColor = 'yellow';
	optionCode = document.getElementsByName("product-option")[0].value;

	$.ajax({
		url : "../optionSelect",
		data : {"optionCode" : optionCode},
		type : "POST",
		dataType : "JSON",

		success : function(optionList){
			
			// if(!optionList.isEmpty()){ // 옵션 리스트가 비어이지 않을 경우

			for(let selectOption of optionList){

				// span 요소 추가
				const span = document.createElement("span");

				// span 요소에 내용 추가
				const optionName = document.createElement("h5");
				optionName.innerText = selectOption.optionName; // 옵션 이름
				
				const optionPrice = document.createElement("h5");
				optionPrice.innerText = selectOption.optionPrice; // 옵션 가격

				// 수량 변경
				const optionDiv = document.createElement("div");

				const opMinus = document.createElement("button");
				opMinus.innerText = "-";
				opMinus.style.border = 0;
				opMinus.style.backgroundColor = "#EAEAEA";
				opMinus.style.color = "#BDBDBD";
				opMinus.style.width = "10px";

				const opSapn = document.createElement("span");
				opSapn.innerText = selectOption.optionCount;

				const opPlus = document.createElement("button");
				opPlus.innerText = "+";
				opPlus.style.border = 0;
				opPlus.style.backgroundColor = "#EAEAEA";
				opPlus.style.color = "#BDBDBD";
				opPlus.style.width = "10px";

				const opDelete = document.createElement("button");
				opDelete.innerText = "X";
				opDelete.style.border = 0;
				opDelete.style.backgroundColor = "#BDBDBD";
				opDelete.style.color = "#EAEAEA";
				opDelete.style.width = "10px";

				optionDiv.append(opMinus, opSapn, opPlus, opDelete);

				span.append(optionName, optionPrice, optionDiv);
			}
			// } else { // 옵션 리스트가 비어있는 경우

			// 	const h4 = document.createElement("h4");
			// 	h4.innerText = "선택된 옵션이 없습니다.";
			// 	h4.style.color = "#EAEAEA";

			// 	div.append(h4);
			// }
		},
		error : function(request, status, error){
            console.log("AJAX 에러 발생");
            console.log("상태코드 : " + request.status); 
        }

	});

});

// 옵션 선택 후 수량 선택
function optionSelectCount(){


	$.ajax({
		url : "../optionSelect",
		data : {"optionCode" : optionCode},
		type : "POST",
		dataType : "JSON",

		success : function(optionList){
			
			// if(!optionList.isEmpty()){ // 옵션 리스트가 비어이지 않을 경우

			for(let selectOption of optionList){

				// span 요소 추가
				const span = document.createElement("span");

				// span 요소에 내용 추가
				const optionName = document.createElement("h5");
				optionName.innerText = selectOption.optionName; // 옵션 이름
				
				const optionPrice = document.createElement("h5");
				optionPrice.innerText = selectOption.optionPrice; // 옵션 가격

				// 수량 변경
				const optionDiv = document.createElement("div");

				const opMinus = document.createElement("button");
				opMinus.innerText = "-";
				opMinus.style.border = 0;
				opMinus.style.backgroundColor = "#EAEAEA";
				opMinus.style.color = "#BDBDBD";
				opMinus.style.width = "10px";

				const opSapn = document.createElement("span");
				opSapn.innerText = selectOption.optionCount;

				const opPlus = document.createElement("button");
				opPlus.innerText = "+";
				opPlus.style.border = 0;
				opPlus.style.backgroundColor = "#EAEAEA";
				opPlus.style.color = "#BDBDBD";
				opPlus.style.width = "10px";

				const opDelete = document.createElement("button");
				opDelete.innerText = "X";
				opDelete.style.border = 0;
				opDelete.style.backgroundColor = "#BDBDBD";
				opDelete.style.color = "#EAEAEA";
				opDelete.style.width = "10px";

				optionDiv.append(opMinus, opSapn, opPlus, opDelete);

				span.append(optionName, optionPrice, optionDiv);
			}
			// } else { // 옵션 리스트가 비어있는 경우

			// 	const h4 = document.createElement("h4");
			// 	h4.innerText = "선택된 옵션이 없습니다.";
			// 	h4.style.color = "#EAEAEA";

			// 	div.append(h4);
			// }
		},
		error : function(request, status, error){
            console.log("AJAX 에러 발생");
            console.log("상태코드 : " + request.status); 
        }

	});

}

// 옵션선택 후 총 가격
function optionSelectBox(){

	optionCode = document.getElementsByName("product-option")[0].value;

	$.ajax({
		url : "../optionTotal",
		data : {"optionCode" : optionCode, 
			   "productCode" : productCode},
		type : "POST",

		success : function(result){

			optionSelectCount();
			document.getElementsByClassName("total-amount")[0].innerText = result;

		},
		
		error : function(request, status, error){
            console.log("AJAX 에러 발생");
            console.log("상태코드 : " + request.status); 
        }
	});

}


// 장바구니로 이동하기 버튼
/* const productCartBtn = productCartBtn.addEventListener("click", function(){

	let url = contextPath + "/product/cart" + categoryNo + "/" + pCode;
	location.href = url;	
}); */

