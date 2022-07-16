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

const productPrice = document.getElementsByClassName('product-price')[0].firstChild.innerText; // 상품 가격
const delAmount = 3000; // 배송비
let sum = 0; // 합계
//let productCode;

// 선택한 옵션 정보 추가
const optionObj = {};

// 옵션선택 후 총 가격
function 	optionSelectBox(){

	// select
	const optionCode = document.getElementsByClassName('product-option')[0];
	const options = document.querySelectorAll(".product-option > option")

	if(optionObj[optionCode.value] != undefined){
		alert("이미 선택된 상품입니다.");
		options[0].selected = true;
		return;
	}

	// 옵션 가격
	let optionPrice;
	let optionName;

	for(const op of options){
		if(op.value == optionCode.value){ // 선택된 옵션코드와 option의 옵션코드가 같다면

			const temp = op.innerText;

			optionName =  temp.substring(0, temp.lastIndexOf("-")-1);
			optionPrice =  temp.substring(temp.lastIndexOf("-") + 2 ,temp.lastIndexOf("원") )
			break;
		}
	}

	// span 요소 추가
	const span = document.createElement("span");
	span.classList.add("optionSpan");

	const spanDiv = document.createElement("div");
	spanDiv.classList.add("spanDiv");

	// span 요소에 내용 추가
	const spanName = document.createElement("h6");
	spanName.classList.add("spanName");
	spanName.innerText = optionName + " -  "; // 옵션 이름
	
	const spanPrice = document.createElement("h6");
	spanPrice.classList.add("spanPrice");
	spanPrice.innerText = "\u00a0" + optionPrice + "원"; // 옵션 가격

	spanDiv.append(spanName, spanPrice);

	// 수량 변경
	const optionDiv = document.createElement("div");
	optionDiv.setAttribute("id", optionCode.value);
	optionDiv.classList.add("optionDiv");

	const opMinus = document.createElement("button");
	opMinus.setAttribute("type", "button");
	opMinus.classList.add("opMinus");
	opMinus.innerText = "-";

	opMinus.addEventListener("click", function(){
		const code = this.parentElement.getAttribute("id");
		const price = this.parentElement.previousElementSibling.innerText;

		if(this.nextElementSibling.innerText > 1){
			this.nextElementSibling.innerText = Number(this.nextElementSibling.innerText) - 1;
			optionObj[code] = optionObj[code] -1;
		}
		calcMinusPrice();
	});

	const opSapn = document.createElement("span");
	opSapn.innerText = 1;

	const opPlus = document.createElement("button");
	opPlus.setAttribute("type", "button");
	opPlus.classList.add("opPlus");
	opPlus.innerText = "+";

	opPlus.addEventListener("click", function(){
		const code = this.parentElement.getAttribute("id");
		const price = this.parentElement.previousElementSibling.innerText;

		this.previousElementSibling.innerText = Number(this.previousElementSibling.innerText) + 1;
		optionObj[code] = optionObj[code] + 1;
		calcPrice();
	});

	// 옵션 영역 삭제 버튼
	const opDelete = document.createElement("button");
	opDelete.setAttribute("type", "button");
	opDelete.innerText = "X";
	opDelete.classList.add("opDelete");

	opDelete.addEventListener("click", function(){
		const code = this.parentElement.getAttribute("id");
		optionObj[code] = optionObj[code] ;
		
		span.remove();
	});

	optionDiv.append(opMinus, opSapn, opPlus, opDelete);
	span.append(spanDiv, optionDiv);

	document.querySelector(".detail-product-farm").append(span);

	// 옵션 정보(옵션 코드, 수량) 객체에 추가
	optionObj[optionCode.value] = 1;
	options[0].selected = true;

	calcPrice();

}

// 가격 플러스 계산
function calcPrice(){
	
	// productPrice 상품가격
	// optionObj 옵션 코드, 옵션 수량
	// delAmount 배송비
	const options = document.querySelectorAll(".product-option > option");
	
	let optionPrice;

	sum = Number(productPrice);
	// 옵션 가격 계산
	for(const key in optionObj){

		// 옵션 별 가격 검색
		for(const op of options){
			if(op.value == key){ // 선택된 옵션코드와 key가 같다면 == 같은 상품
	
				const temp = op.innerText;
				optionPrice =  temp.substring(temp.lastIndexOf("-") + 2 ,temp.lastIndexOf("원") )
				break;
			}
		}
		sum += Number(optionPrice) * optionObj[key];
		// 3만원 미만 배송비 추가
		if(sum < 30000){
			sum += delAmount;
		}						
	}
	// 가격 * 수량
	document.getElementsByClassName("total-amount")[0].innerText = sum;
}

// 가격 마이너스 계산
function calcMinusPrice(){
	
	// productPrice 상품가격
	// optionObj 옵션 코드, 옵션 수량
	// delAmount 배송비
	const options = document.querySelectorAll(".product-option > option");
	
	let optionPrice;
	// 옵션 가격 계산
	for(const key in optionObj){
	
		// 옵션 별 가격 검색
		for(const op of options){
			if(op.value == key){ // 선택된 옵션코드와 key가 같다면 == 같은 상품
	
				const temp = op.innerText;
				optionPrice = temp.substring(temp.lastIndexOf("-") + 2 ,temp.lastIndexOf("원") )
				break;
			}
		}
		sum -= Number(optionPrice) * optionObj[key];
							// 가격 * 수량
	}

	document.getElementsByClassName("total-amount")[0].innerText = sum;

}


function orderValidate(){
	// 유효성 검사

	
	// 유효할 때
	
	// document.orderForm

	// document.getElementsByClassName("total-amount")[0]
	// orderObj

	const input1 = document.createElement("input");
	input1.setAttribute("type", "hidden");
	input1.setAttribute("name", "totalAmount");
	input1.setAttribute("value", document.getElementsByClassName("total-amount")[0].innerText);

	const input2 = document.createElement("input");
	input2.setAttribute("type", "hidden");
	input2.setAttribute("name", "optionObj");
	input2.setAttribute("value", JSON.stringify(optionObj));


	document.orderForm.append(input1, input2);

	//return false;
}	


// // 보낼때 optionObj 랑 sum 보내야됨


// // 장바구니로 이동하기 버튼
//  const productCartBtn = productCartBtn.addEventListener("click", function(){

// 	let url = contextPath + "/product/cart" + categoryNo + "/" + pCode;
// 	location.href = url;	
// }); 
