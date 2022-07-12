<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Uglory</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="${contextPath}/img/favicon.ico" rel="icon">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    
    <!-- Libraries Stylesheet -->
    <link href="${contextPath}/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${contextPath}/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${contextPath}/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Template Stylesheet -->
    <link href="${contextPath}/css/style.css" rel="stylesheet">
    
    <!-- Product Style sheet -->
    <link href="${contextPath}/css/adminproduct-style.css" rel="stylesheet">

    <!-- Fontawesome cdn 링크 -->
    <script src="https://kit.fontawesome.com/1ef9913073.js" crossorigin="anonymous"></script>

</head>

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Spinner include -->
        <jsp:include page="/WEB-INF/views/common/spinner.jsp"/>

        <!-- Sidebar include -->
        <jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

        <!-- Content Start -->
        <div class="content">
            <!-- Header include -->
            <jsp:include page="/WEB-INF/views/common/header.jsp"/>

            <!-- 상품 등록 form태그 -->
            <main class="container-fluid pt-2 px-4">
                <section class="row justify-content-center mx-0">
                    <article class="col-xl-6 col-lg-8 text-center bg-light rounded farmIn-margin p-5">
                        <form action="">
                            <h2 class="text-start">농장 등록</h2>
                            <hr>
                            
                            <div class="product-row">
                                <span class="fw-bold">농장 이름</span>
                                <div class="productWrap">
                                    <input type="text" class="productInput ps-1" placeholder="농장 이름">
                                    <div class="inputMessage text-danger">이미 존재하는 농장 이름입니다</div>
                                </div>
                            </div>

                            <div class="product-row">
                                <span class="fw-bold">생산자 이름</span>
                                <div class="productWrap">
                                    <input type="text" class="productInput ps-1" placeholder="생산자 이름">
                                </div>
                            </div>

                            <div class="product-row">
                                <span class="fw-bold">원산지</span>
                                <div class="productWrap">
                                    <input type="text" class="productInput ps-1" placeholder="원산지">
                                    <div class="inputMessage text-danger">원산지는 한글만 입력해주세요</div>
                                </div>
                            </div>
                       

                            <div class="product-row">
                                <button type="button" class="btn btn-lg btn-primary m-1 w-100">취소</button>
                                <button class="btn btn-lg btn-primary m-1 w-100">등록</button>
                            </div>

                        </form>
                    </article>
                </section>
            </main>

            <!-- Footer include -->
            <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
        </div>
        <!-- Content End -->

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <%-- <script src="../lib/chart/chart.min.js"></script> --%>
    <script src="${contextPath}/lib/easing/easing.min.js"></script>
    <script src="${contextPath}/lib/waypoints/waypoints.min.js"></script>
    <script src="${contextPath}/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${contextPath}/lib/tempusdominus/js/moment.min.js"></script>
    <script src="${contextPath}/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="${contextPath}/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="${contextPath}/js/main.js"></script>
</body>

</html>