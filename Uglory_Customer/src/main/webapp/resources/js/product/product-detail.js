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

// 구매하기 버튼
function productOrder(){
	const buy_btn = document.getElementById("buy-btn");

	// if(){ // 옵션을 선택했을 경우에만 이벤트 추가
		buy_btn.addEventListener("click", function(){
			let url = contextPath + "/product/order" + categoryNo + "/" + pCode;

			location.href = url;
		});
	// }
}

// 장바구니 모달창


