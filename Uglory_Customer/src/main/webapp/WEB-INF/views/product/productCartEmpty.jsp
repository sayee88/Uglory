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

            <!-- 장바구니 개수 -->
            <h4 class="cart-count" style="margin-top: 100px;">장바구니</h4>
                <div class="empty-product-cart">
                    <p>장바구니에 담긴 상품이 없습니다.</p>
                </div> 
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