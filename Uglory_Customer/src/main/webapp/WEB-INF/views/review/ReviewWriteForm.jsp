<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>이용후기</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

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
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/review/review-style.css" rel="stylesheet">

</head>

<body>
    <div class="container-xxl bg-white p-0">
        
       <!-- review header -->
        <div class="container-xxl position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
                <a href="${contextPath}" class="navbar-brand p-0">
                    <h1 class="text-primary m-0"><i class="fa fa-utensils me-3"></i>Uglory</h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0 pe-4">
                        <a href="${contextPath}" class="nav-item nav-link active">Home</a>
                        <a href="${contextPath}/common/mission" class="nav-item nav-link">Mission</a>
                        <a href="${contextPath}/common/about" class="nav-item nav-link">About</a>
                        <a href="${contextPath}/product/list" class="nav-item nav-link">Market</a>
                        <a href="${contextPath}/review/list" class="nav-item nav-link icon">Review</a>
                    </div>
                    <a href="#" class="nav-item icon"><img class="menu-chart" src="${contextPath}/resources/images/main/shopping-cart-white.png"></a>
                    <a href="${contextPath}/member/login" class="nav-item icon"><img class="menu-chart" src="${contextPath}/resources/images/main/user-white.png"></a>
                </div>
            </nav>

            <div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h2 class="display-3 text-white mb-3 animated slideInDown" style="font-size:50px">Review</h2>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="${contextPath}">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Pages</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Review</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>

        <!-- Contact Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">Review</h5>
                    <h1 class="mb-5">리뷰작성</h1>
                </div>
            </div>
        </div>
        <!-- Contact End -->


        <!-- 리뷰 작성 form -->
        <div class="review-container">
            <div class="review-writeform">
                <h3>리뷰 작성</h3>
                <div style="padding: 10px 0; font-size: 14px;" class="px-1">개별상품</div>
                <div class="purchase-product">
                    <div>
                        <img src="img/리뷰/이용후기5.png">
                    </div>
                    <div>
                        <div>2022.07.07</div>
                        <div>유기농 어글리 바나나 - 1.5kg</div>
                        <!-- <div>15,000원</div> -->
                    </div>
                </div>

                <div class="review-star-section">
                    <h3>상품은 어떠셨나요?</h3>
                    <div>
                        <span>★</span>
                        <span>★</span>
                        <span>★</span>
                        <span>★</span>
                        <span>★</span>
                    </div>
                </div>

                <div class="review-img-upload">
                    <label for="img0">
                        <img class="preview" src="#">
                    </label>
                    <input type="file" class="inputImage" id="img1" name="1" accept="image/*">
                </div>

                <div class="review-inputtext">
                    <textarea name="boardContent"></textarea>
                </div>

                <div class="review-precautions">
                    <h6>품질, 배송, 문의 응대 등 상품의 구매 경험을 알려주세요.</h6>
                    <div>상품과 무관한 사진 및 욕설/비속어가 포함된 리뷰는 고지 없이 삭제될 수 있습니다.</div>
                    <div>리뷰 작성에 대한 고지사항 알림사항 적어두기</div>
                </div>

                <div class="review-insert">
                    <button type="submit" id="writeBtn">작성완료</button>
                </div>


            </div>
        </div>
        


    <%-- footer --%>
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


        <%-- Template Javascript --%>
        <script src="${contextPath}/resources/js/main.js"></script>
</body>

</html>