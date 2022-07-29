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
function optionSelectBox(){

	// select
	const optionCode = document.getElementsByClassName('product-option')[0];
	const options = document.querySelectorAll(".product-option > option");

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
		// calcMinusPrice();
		calcPrice()
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
		delete optionObj[code]
		span.remove();
		calcPrice();

		if(optionObj[optionCode.value] == undefined){
			options[0].selected = true;
			return;
		}
	});

	optionDiv.append(opMinus, opSapn, opPlus, opDelete);
	span.append(spanDiv, optionDiv);

	document.querySelector(".detail-product-farm").append(span);

	// 옵션 정보(옵션 코드, 수량) 객체에 추가
	optionObj[optionCode.value] = 1;
	options[0].selected = true;

	calcPrice();
}

// 가격 계산
function calcPrice(){
	
	// productPrice 상품가격
	// optionObj 옵션 코드, 옵션 수량
	// delAmount 배송비
	const options = document.querySelectorAll(".product-option > option");
	
	let optionPrice;

	sum = 0;
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

		if(Number(optionPrice) == 0){
			sum += Number(productPrice)* optionObj[key];

		} else {

			sum += (Number(productPrice) + Number(optionPrice)) * optionObj[key];
		}

		// 3만원 미만 배송비 추가
		// if(sum < 30000){
		// 	sum += delAmount;
		// }						
	}
	// 가격 * 수량
	document.getElementsByClassName("total-amount")[0].innerText = sum;
}

// 총 가격, 옵션 코드,수량, 상품 코드 보내는 함수
function orderValidate(){

	const optionSpan = document.querySelectorAll(".optionSpan");

	if(productStatus == "O"){
		alert("품절 상품은 구매가 불가능합니다.");
		return false;
	}
	// 옵션 선택했을 때
	if(optionSpan.length > 0){

		// 총 가격
		const input1 = document.createElement("input");
		input1.setAttribute("type", "hidden");
		input1.setAttribute("name", "totalAmount");
		input1.setAttribute("value", document.getElementsByClassName("total-amount")[0].innerText);

		// 옵션 코드, 옵션 수량
		const input2 = document.createElement("input");
		input2.setAttribute("type", "hidden");
		input2.setAttribute("name", "optionObj");
		input2.setAttribute("value", JSON.stringify(optionObj));

		// // 상품 코드
		const input3 = document.createElement("input");
		input3.setAttribute("type", "hidden");
		input3.setAttribute("name", "productCode");
		input3.setAttribute("value", productCode);

		document.orderForm.append(input1, input2, input3);

		console.log("성공?");

	} else {
		alert("옵션을 선택해주세요");
		return false;
	}

}	

// 장바구니 담기 버튼 클릭 시 
document.getElementById("cartButton").addEventListener("click", function(){

	const optionSpan = document.querySelectorAll(".optionSpan");

	if(productStatus == "O"){
		alert("품절 상품은 장바구니 담기가 불가능합니다.");
		return false;
	} 
	// 옵션 선택했을 때
	if(optionSpan.length > 0){
	
		const totalAmount = document.getElementsByClassName("total-amount")[0].innerText;
		
		//let cartMap = {"totalAmount":totalAmount, "optionObj":JSON.stringify(optionObj), "productCode" : productCode};

		$.ajax({
			url : contextPath + "/product/cart",
			data : {
				"totalAmount": totalAmount,
				"cartOption": JSON.stringify(optionObj),
				"productCode" : productCode},

			type : "POST",

			success : function(){
				console.log("담기 성공");
			} ,
			error : function(request, status, error){
				console.log("에러 발생");
				console.log("상태코드 : " + request.status); 
			}
		});

	} else {
		alert("옵션을 선택해주세요");
		return false;
	}
});


// 장바구니 보기 버튼 클릭 시 
document.getElementById("productCartBtn").addEventListener("click", function(){ 
	location.href = "../../cart";

});

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

(function(){

	const carousel_item = document.getElementsByClassName("carousel-item")[0];
	carousel_item.classList.add("active");	 
	
})();





