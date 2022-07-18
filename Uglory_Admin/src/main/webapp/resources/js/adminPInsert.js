//취소 버튼 클릭 시 alret 띄우고 insert -> list로 / update -> detail로
document.getElementById("calcelInsert").addEventListener("click", function(){

  console.log(mode);
  if(confirm('상품 등록을 취소하시겠습니까?')){
    if(mode == 'insert'){
      location.href = contextPath + '/product/list';
    } else {
      location.href = contextPath + '/product/detail/' + productCode;
    }

  } else {
    return;
  }
});



// 상품 등록 유효성 검사
const checkObj = {
  "productName" : false,
  "productPrice" : false,
  "productInfo" : false
}

$(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
          toolbar: [
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
            ['color', ['forecolor','color']],
            // ['table', ['table']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['insert',['picture']],
          ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체','sans-serif'],
        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	});

  
  const note = document.getElementsByClassName("note-editable")[0];
  const infoSt = document.getElementById("info-st");

  //update일때 info 넣어놓기
  if(mode=='update'){
    note.innerHTML = productInfo;
    infoSt.classList.remove("fa-regular");
    infoSt.classList.add("fa-solid");
    checkObj.productInfo = true;
    checkObj.productName = true;
    checkObj.productPrice = true;
  }

  //summernote 내용 있을때 전구 모양 변하기
  note.addEventListener("input", function(){

    if(note.innerHTML.trim().length != 0){
      infoSt.classList.remove("fa-regular");
      infoSt.classList.add("fa-solid");
      checkObj.productInfo = true;
    }

  });

  //취소 버튼 클릭 시 alret 띄우고 summernote 내용 삭제
  document.getElementById("cancleNote").addEventListener("click", function(){
    if(confirm('작성한 내용을 삭제하시겠습니까?')){
      note.innerHTML = '';
      infoSt.classList.remove("fa-solid");
      infoSt.classList.add("fa-regular");
      checkObj.productInfo = false;
    } else {
      return;
    }
  });
});

const productName = document.getElementById("productName");
const pnameText = document.getElementById("pnameText");
const regExp = /^[가-힣 ]*$/;

//상품명 한글 입력 유효성 검사
productName.addEventListener("input", function(){

  if(productName.value.trim().length == 0){
    pnameText.innerText = "상품명을 입력해주세요.";
    pnameText.classList.remove('text-success');
    pnameText.classList.remove('text-danger');
    checkObj.productName = false;
  }
  
  if(regExp.test(productName.value)) {
    pnameText.innerText = "사용 가능한 상품명입니다.";
    pnameText.classList.add('text-success');
    pnameText.classList.remove('text-danger');
    checkObj.productName = true;
  } else {
    pnameText.innerText = "상품명은 한글만 입력해주세요.";
    pnameText.classList.add('text-danger');
    pnameText.classList.remove('text-success');
    checkObj.productName = false;
  }

});


const productPrice = document.getElementById("productPrice");

productPrice.addEventListener("input", function(){

  if(productPrice.value.length != 0) {
    checkObj.productPrice = true;
  } else {
    checkObj.productPrice = false;
  }

});


function productValidate(){

  let str;
  for(let key in checkObj) {

    if(!checkObj[key]){
      switch(key){
        case "productName":     str="상품명이 유효하지 않습니다."; break;
        case "productPrice":        str="상품 가격을 입력해주세요."; break;    
        case "productInfo": str="상품 설명을 입력해주세요"; break;
      }

      alert(str);

      return false; // form태그 기본 이벤트 제거
    }
  }
  return true;
}