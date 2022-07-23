<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Restoran - Bootstrap Restaurant Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <%-- favicon --%>
    <link rel="icon" href="${contextPath}/resources/img/main/logo/favicon.ico" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${contextPath}/resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">

    <link rel="stylesheet" href="${contextPath}/resources/css/product/product-list.css">
</head>

<body>

    <script>
        const pImg =  window.location.origin + 'ugloryA';
    
    </script>

    <jsp:include page="/WEB-INF/views/common/header-1.jsp" />

    <!-- Menu Start -->
    <div class="container-xxl py-5">
        <div class="container">
            
            <!-- 슬라이드 -->
            <div class="slide-container">
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" style="width: 97%;">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                        <img src="${contextPath}/resources/img/product/수박슬라이드.png" class="d-block w-100" alt="${contextPath}/resources.">
                        </div>
                        <div class="carousel-item">
                        <img src="${contextPath}/resources/img/product/복숭아슬라이드.png" class="d-block w-100" alt="${contextPath}/resources.">
                        </div>
                        <div class="carousel-item">
                        <img src="${contextPath}/resources/img/product/옥수수슬라이드.png" class="d-block w-100" alt="${contextPath}/resources.">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>

            </div>

            <!-- line -->

            <div class="container">
                <div class="row">
                    <div class="col" style="margin: 20px;">

                        <h2>👀 상품보기</h2>
                    </div>
                    
                </div>
            </div>
            
            
            <div class="line"></div>

            <!-- 상품 카테고리 -->
            <div class="category">
                <button class="btn btn-primary"><a href="${contextPath}/product/list"  style="color: white;">ALL</a> </button>
                <button class="btn btn-primary" id="c1" onclick="category(1)">🥔 근채류</button>
                <button class="btn btn-primary" id="c2" onclick="category(2)">🌾 곡식류/견과류</button>
                <button class="btn btn-primary" id="c3" onclick="category(3)">🥬 채소류</button>
                <button class="btn btn-primary" id="c4" onclick="category(4)">🍆 과채류</button>
                <button class="btn btn-primary" id="c5" onclick="category(5)">🌿 나물류</button>
                <button class="btn btn-primary" id="c6" onclick="category(6)">🍄 버섯류</button>
                <button class="btn btn-primary" id="c7" onclick="category(7)">🍋 과일류</button>
            </div>



            <!-- 상품 목록 -->
            <div class="container">

                <div class="row" id="row">

                   
                    <div class="col">
                        <%-- <a href="product/detail/"${categoryNo}/${productCode} --%>
                        <div class="box" style="display : flex; justify-content:center;">
                            <div class="img-box">
                                <img src="${contextPath}/resources/img/쿵야/바나나쿵야.png" alt="" class="product-img soldout">                            
                            </div>
                            
                            <div>
                                <h5>친환경 초당 옥수수 - 10개/20개</h5>
                                <div class="flex-container">
                                    <h4>25,000</h4>
                                    <div class="sub-box">
                                        <img src="${contextPath}/resources/img/product/star.jpg" alt=""><p>(49)</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <script>

        // const pList =${pList};
        const contextPath = "${contextPath}";
    </script>

    <%-- fotter --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <%-- jQuery --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="${contextPath}/resources/js/main.js"></script>

    <script src="${contextPath}/resources/js/product/product-list.js"></script>

    <!-- bootstrap Javascript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

</html>