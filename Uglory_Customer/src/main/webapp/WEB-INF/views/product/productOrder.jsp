<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<c:set var="selectOptionList" value="${map.selectOptionList}" />
<c:set var="cartList" value="${map.cartList}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>상품결제</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <%-- favicon --%>
    <link rel="icon" href="${contextPath}/resources/img/main/logo/favicon.ico" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${contextPath}/resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />


    <!-- Customized Bootstrap Stylesheet -->
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${contextPath}/resources/css/style-1.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/product/product-order.css" rel="stylesheet">

    <%-- 다음 우편번호 API --%>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>

    <main>
        <jsp:include page="/WEB-INF/views/common/header-1.jsp" />

        <!-- 상품, 옵션, 개별상품주문정보, 결제 테이블 -->
        <!-- 결제페이지 -->
        <section class="product-order">
            <h4 class="order-info" style="margin-top: 100px;">배송지 정보</h4>
                       <%--  onsubmit="return orderValidate()" --%>
            <form action="order" method="POST">
                <div class="product-order-area">

                    <label for="p-orderName">받으시는 분 이름</label>
                    <div class="order-input-area">
                        <input type="text" id="p-orderName" name="p-orderName" placeholder="이름을 입력해주세요" maxlength="30" autocapitalize="off" required>
                    </div>
                    <span class="order-message" id="nameMessage"></span>

                    <label for="p-orderPhone">연락처</label> 
                    <div class="order-input-area">
                        <input type="text" id="p-orderPhone" name="p-orderPhone" placeholder="연락처를 입력해주세요" maxlength="30" required>
                    </div>
                    <span class="order-message" id="phoneMessage"></span>
                    
                    <label for="p-orderAddress">주소</label>
                    <div class="order-input-area">
                        <input type="text" id="order-postcode" name="p-orderAddress" placeholder="우편번호" disabled>
                        <button type="button" id="addressBtn" onclick="sample2_execDaumPostcode()">검색</button>
                    </div>

                    <div class="order-input-area">
                        <input type="text" name="p-orderAddress" class ="p-orderAddress" id="order-address" placeholder="주소를 입력해주세요" required>
                    </div>

                    <div class="order-input-area">
                        <input type="text" name="p-orderAddress" class="p-orderAddress" id="order-detailAddress" placeholder="상세주소를 입력해주세요" required>
                    </div>

                    <label for="p-orderReq">배송 요청사항(선택)</label>
                    <div class="order-input-area">
                        <input type="text" id="p-orderReq" name="p-orderReq" placeholder="예) 집 앞에 놔주세요"> 
                    </div>

                    <hr>
                    <h4 class="order-product">주문 상품</h4>

                    <!-- 결제상품 리스트 -->
                    <div class="order-product-area">
                        <!-- 상품 썸네일 이미지 -->
                        <div class="order-productImgName">
                            <div>
                                <img src="${contextPath}/resources/img/main/broccoli.jpg" width="150px" height="150px">
                            </div>

                            <div class="orderProductName"> 

                                <%-- 중복제거 --%>
                                <c:forEach var="selectOption" items="${selectOptionList}" varStatus="vs1">

                                    <c:set var="fl" value="true"/>

                                    <c:if test="${!vs1.first}">
                                        <c:forEach var="temp" items="${selectOptionList}" varStatus="vs2" begin="0" end="${vs1.index-1}">
                                            <c:if test="${selectOption.productName == temp.productName}">
                                                <c:set var="fl" value="false"/>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>

                                    <c:if test="${fl == 'true'}">

                                        <a href="${contextPath}/product/detail/${selectOption.productCategoryNo}/${selectOption.productCode}">${selectOption.productName}</a>

                                    </c:if>

                                </c:forEach>

                                <br>
                                <%-- <c:forEach var="selectOption" items="${selectOptionList}" varStatus="vs"> --%>
                                <c:forEach var="optionCode" items="${map.optionCodeList}" varStatus="vs">
                                    <span>
                                        <c:forEach var="selectOption" items="${selectOptionList}">
                                            <c:if test="${optionCode == selectOption.optionCode}">
                                                ${selectOption.optionName}
                                            </c:if>
                                        </c:forEach>
                                         - ${map.amountList[vs.index]}개
                                    </span>
                                   
                                   
                                    <c:if test="${!vs.last}">
                                    /
                                    </c:if> 
                                </c:forEach>

                                <div class="orderPrice">
                                    <!-- 옵션 선택에 따른 상품 가격 -->
                                    <p><span>${map.totalAmount}</span>원</p>
                                </div>
                            </div>
                        </div>

                        <!-- 상품명(클릭 시 상품 상세조회 화면)-->
                        <%-- <div class="order-product-info"> --%>
                            <%-- <a href="${contextPath}/product/detail/${selectOptionList[0].productCategoryNo}/${selectOptionList[0].productCode}">${selectOptionList[0].productName}</a> --%>
<%--                            
                            <c:forEach var="selectOption" items="${selectOptionList}" varStatus="vs">

                                <span>${selectOption.optionName} - ${map.amountList[vs.index]}개</span> 

                            </c:forEach> --%>
                            <!-- 선택된 상품 개수 -->
       
                        <%-- </div> --%>
                    </div>

                    <!-- 결제수단 카카오페이 -->
                    <hr>
                    <h4 class="product-pay">결제 수단</h4>
                    <div class="kakaoPayChk">
                        <input type="radio" checked><label>카카오페이</label>
                    </div>

                    <!-- 총 결제 금액 -->
                    <div class="total-pay">
                        <c:if test="${map.totalAmount < 30000}">
                        <p>총 결제 금액</p> <p><span>${map.totalAmount+3000}</span>원</p>
                        </c:if>
                        <c:if test="${map.totalAmount > 30000}">
                        <p>총 결제 금액</p> <p><span>${map.totalAmount}</span>원</p>
                        </c:if>
                    </div>

                    <hr>

                    <!-- 금액 상세 내역 -->
                    <div class="product-total-pay">
                        <c:if test="${map.totalAmount < 30000}">
                        <p>총 상품금액</p> <p><span>${map.totalAmount-3000}</span>원</p>
                        </c:if>
                        <c:if test="${map.totalAmount >= 30000}">
                        <p>총 상품금액</p> <p><span>${map.totalAmount}</span>원</p>
                        </c:if>
                    </div>

                    <div class="delivery-total-pay">
                        <c:if test="${map.totalAmount < 30000}">
                        <p>총 배송비</p> <p><span>3,000</span>원</p>
                        </c:if>
                        <c:if test="${map.totalAmount >= 30000}">
                        <p>총 배송비</p> <p><span>0</span>원</p>
                        </c:if>
                    </div>

                    <div class="privacyPolicy">
                        <input type="checkbox" name="agree" id="agree"><label for="agree">개인정보 수집 및 이용 동의</label>
                    </div>
                    <button type="button" id="order-btn">주문하기</button>
                </div>
                    
                    <input type="hidden" name="totalAmount" value="${map.totalAmount}">
            </form>
        </section>
    </main>

    <%-- 다음 우편번호 API --%>
    <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
    <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

     <script>
        const contextPath = "${contextPath}";
        const pOrderCode = "${map.pOrderCode}";
        const productName = "${selectOptionList[0].productName}";
        const totalAmount = "${map.totalAmount}"
        const productPayNo = "${map.productPayNo}";
        const memberNo = "${loginMember.memberNo}";
        const amountList = "${map.amountList}";
        const optionCodeList = "${map.optionCodeList}";

     </script>

    <%-- 아임포트  --%>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
        
    <%-- <!— jQuery 추가 —> --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${contextPath}/resources/lib/wow/wow.min.js"></script>
    <script src="${contextPath}/resources/lib/easing/easing.min.js"></script>
    <script src="${contextPath}/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${contextPath}/resources/lib/counterup/counterup.min.js"></script>
    <script src="${contextPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/moment.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <%-- Template Javascript --%>
    <script src="${contextPath}/resources/js/main.js"></script>

    <script src="${contextPath}/resources/js/product/product-order.js"></script>
</body>
</html>