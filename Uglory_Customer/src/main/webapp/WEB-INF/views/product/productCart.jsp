<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<c:set var="selectOptionList" value="${map.selectOptionList}" />

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

            <!-- 장바구니 개수 -->
            <h4 class="cart-count">장바구니 상품(<span>2</span>)</h4>

            <!-- 장바구니에 담긴 상품이 없을 경우 -->
            <!-- <div class="empty-product-cart">
                <p>장바구니에 담긴 상품이 없습니다.</p>
            </div> -->

            <form action="${contextPath}/product/order" method="GET">
                <!-- 장바구니에 담긴 상품이 있을 경우 -->
                <div class="product-cart-area">
                    
                    <!-- 장바구니 상품 선택 및 삭제 영역 -->
                    <div class="cart-check-delete">
                        <!-- 장바구니 담은 상품 선택 -->
                        <input type="checkbox" name="cart-check" value="cart-1" id="cart-check" checked>

                        <!-- 장바구니 담은 상품 삭제 버튼 -->
                        <button id="cart-delete" onclick="pDelete()">X</button>
                    </div> 

                    <!-- 장바구니 담은 상품 리스트 -->
                    <div class="cart-info-area">
                        <!-- 상품 썸네일 이미지 -->
                        <div>
                            <img src="img/broccoli.jpg" width="150px" height="150px">
                        </div>

                        <!-- 상품명(클릭 시 상품 상세조회 화면)-->
                        <div>
                            <a href=""><span>유기농 어글리 바나나 (1.5kg/2.5kg)</span></a>
                        </div>
                    </div>

                    <!-- 선택된 옵션 조회 영역 -->
                    <div class="cart-option-info">
                        <!-- 상품명 + 옵션명 -->
                        <p>옵션 - <span>유기농 어글리 바나나 1.5kg</span></p>

                        <!-- 상품 수량 변경 -->
                        <div class="option-info">
                            <div class="option-updown">
                                <button id="option-minus">-</button>
                                <span class="option-count"> 1 </span>
                                <button id="option-plus">+</button>
                            </div>
                            <p><span>14,800</span>원</p>
                        </div>
                    </div>

                    <p class="cart-option-amount">상품 <span>14,800</span> + 배송비 <span>3,000</span>원</p>

                </div>
                <!-- 장바구니에 담긴 상품이 있을 경우 끝 -->
                
                <div class="product-cart-area">
                    
                    <!-- 장바구니 상품 선택 및 삭제 영역 -->
                    <div class="cart-check-delete">
                        <!-- 장바구니 담은 상품 선택 -->
                        <input type="checkbox" name="cart-check" value="cart-1" id="cart-check" checked>

                        <!-- 장바구니 담은 상품 삭제 버튼 -->
                        <button id="cart-delete" onclick="pDelete()">X</button>
                    </div> 

                    <!-- 장바구니 담은 상품 리스트 -->
                    <div class="cart-info-area">
                        <!-- 상품 썸네일 이미지 -->
                        <div>
                            <img src="img/broccoli.jpg" width="150px" height="150px">
                        </div>

                        <!-- 상품명(클릭 시 상품 상세조회 화면)-->
                        <div>
                            <a href="#"><span>유기농 어글리 바나나 (1.5kg/2.5kg)</span></a>
                        </div>
                    </div>

                    <!-- 선택된 옵션 조회 영역 -->
                    <div class="cart-option-info">
                        <!-- 상품명 + 옵션명 -->
                        <p>옵션 - <span>유기농 어글리 바나나 1.5kg</span></p>

                        <!-- 상품 수량 변경 -->
                        <div class="option-info">
                            <div class="option-updown">
                                <button id="option-minus">-</button>
                                <span class="option-count"> 1 </span>
                                <button id="option-plus">+</button>
                            </div>
                            <p><span>14,800</span>원</p>
                        </div>
                    </div>

                    <p class="cart-option-amount">상품 <span>14,800</span> + 배송비 <span>3,000</span>원</p>

                </div>

                <div class="cart-total-amount">
                    <p>총 주문 금액</p> <p><span>84,400</span> 원</p>
                </div>
                <hr>

                <!-- 가격 상세 내역 -->
                <div class="total-product-amount">
                    <p>총 상품금액</p> <p><span>81,400</span>원</p>
                </div>

                <div class="total-del-amount">
                    <p>총 배송비</p> <p><span>3,000</span>원</p>
                </div>

                <button id="product-order">주문하기</button>
            </form>
        </section>
    </main>

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
</body>
</html>