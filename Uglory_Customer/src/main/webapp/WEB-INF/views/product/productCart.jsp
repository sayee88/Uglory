<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<c:set var="cartOptionList" value="${cartMap.cartOptionList}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>장바구니</title>
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
    <link href="${contextPath}/resources/css/product/product-cart.css" rel="stylesheet">
    
</head>
<body>

    <main>

        <jsp:include page="/WEB-INF/views/common/header-1.jsp" />

        <!-- 상품, 옵션, 개별상품주문정보 테이블 -->
        <!-- 장바구니 -->
        <section class="product-cart">

            <!-- 장바구니에 담긴 상품이 없을 경우 -->
            <c:if test="${empty productCartList}">
            <!-- 장바구니 개수 -->
            <h4 class="cart-count" style="margin-top: 100px;">장바구니 상품</h4>
                <div class="empty-product-cart" style="margin-bottom:500px;">
                    <p>장바구니에 담긴 상품이 없습니다.</p>
                </div> 
            </c:if>

            <%-- 장바구니에 담긴 상품이 있을 경우 --%>
            <c:if test="${!empty productCartList}">

                <form action="${contextPath}/product/cartOrder" method="GET" name="orderForm" onsubmit="return orderValidate()">

                    <!-- 장바구니에 담긴 상품이 있을 경우 -->
                    <h4 class="cart-count" style="margin-top: 100px;">장바구니 상품(<span id="cartCount">${fn:length(productCartList)}</span>)</h4>
                    
                    <c:forEach var="cartList" items="${productCartList}">

                        <div class="product-cart-area" style="background-color:#EAEAEA; padding:10px; margin-top:10px; border-radius: 10px;">
                            
                            <!-- 장바구니 상품 선택 및 삭제 영역 -->
                            <div class="cart-check-delete">
                                <!-- 장바구니 담은 상품 선택 -->
                                <input type="checkbox" name="cart-check" value="${cartList.optionNo}" class="cart-check" onclick="getCheckboxValue(event)" checked>
                                    <input type="hidden" value="${cartList.optionNo}" name="optionNo">
                                <!-- 장바구니 담은 상품 삭제 버튼 -->
                                <button type="button" id="optionNo-${cartList.optionNo}" class="cart-delete">X</button>
                            </div> 

                            <!-- 장바구니 담은 상품 리스트 -->
                            <div class="cart-info-area">
                                <!-- 상품 썸네일 이미지 -->
                                <div>
                                    <img src="http://localhost:8080/ugloryA${cartImagelist[0]}" width="150px" height="150px">
                                </div>
                                
                                <!-- 상품명(클릭 시 상품 상세조회 화면)-->
                                <div>
                                    <a href="${contextPath}/product/detail/${cartList.categoryNo}/${cartList.productCode}" 
                                       value="productCode-${cartList.productCode}" class="productA" style="color: #747474; margin-left:10px; font-size:20px;">
                                        <span>${cartList.productName}</a>
                                </div>
                            </div>

                            <!-- 선택된 옵션 조회 영역 -->
                            <div class="cart-option-info" style="margin-top:15px">
                                <!-- 상품명 + 옵션명 -->
                                <p style="margin-top: -5px;">상품 : <span>${cartList.productName} - </span><span class="optionCd" value="optionCd-${cartList.optionCode}">${cartList.optionName}</span></p>

                                <!-- 상품 수량 변경 -->
                                <div class="option-info">
                                    <div class="option-updown" style="margin-top:-5px;" value="${cartList.optionPrice}">
                                            <%-- onclick="함수명(${cartList.optionNo, -1)}" --%>
                                        <button type="button" class="option-minus" id="${cartList.optionNo}-1">-</button>
                                        <span class="option-count"> ${cartList.optionCount} </span>
                                        <%-- onclick="함수명(${cartList.optionNo, 1) --%>
                                        <button type="button" class="option-plus" id="${cartList.optionNo}+1">+</button>
                                    </div>
                                        <p style="margin-top: -3px;"><span class="productCartPrice">${cartList.productPrice+(cartList.optionCount*cartList.optionPrice)}</span>원</p>
                                </div>
                            </div>

                            <!-- <p class="cart-option-amount" style="margin-top:10px;">상품 : <span class="">${cartList.productPrice+(cartList.optionCount*cartList.optionPrice)}원</span>
                            <%-- 상품 가격이 30,000원 미만일 때 3,000원 추가해서 보여줌 --%>
                            <c:if test="${cartList.productPrice+(cartList.optionCount*cartList.optionPrice) >= 30000}">
                                + 배송비 : 0원
                            </c:if>
                            <%-- 상품 가격이 30,000원 미만일 때 3,000원 추가해서 보여줌 --%>
                            <c:if test="${cartList.productPrice+(cartList.optionCount*cartList.optionPrice) < 30000}">
                                + 배송비 : <span class="spanDel">3000</span>원
                            </c:if>
                            </p> -->
                        </div>
                    </c:forEach> 
                    <!-- 장바구니에 담긴 상품이 있을 경우 끝 -->

                    <div class="cart-total-amount" style="margin-top : 15px; margin-bottom : -20px;">
                        <p>총 주문 금액</p> <p><span id="cartTotalPrice">0</span> 원</p>
                    </div>
                    <hr>

                    <!-- 가격 상세 내역 -->
                    <div class="total-product-amount">
                        <p>총 상품금액</p> <p><span id="cartPrice">0</span>원</p>
                    </div>

                    <%-- <div class="total-del-amount">

                        <p>총 배송비</p> <p><span id="delTotalPrice">0</span>원</p>
                    </div> --%>

                    <button type="submit" id="product-order">주문하기</button>

                </form>
            </c:if>
        </section>
    </main>

    <script>
        const contextPath = "${contextPath}";
    </script>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
        
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
    
        <%-- <!— Template Javascript —> --%>
        <script src="${contextPath}/resources/js/main.js"></script>
        <script src="${contextPath}/resources/js/product/product-cart.js"></script>
</body>
</html>