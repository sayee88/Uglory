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
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/review/review-style.css" rel="stylesheet">

</head>

<body>
    <main>
    
        <section class="container-xxl bg-white p-0">
            
            <!-- review header -->
            <div class="container-xxl position-relative p-0">
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
                    <a href="${contextPath}" class="navbar-brand p-0">
                        <span class="text-primary m-0">
                        <i class="me-3" style="font-size:30px"></i>
                        <img src="${contextPath}/resources/img/main/logo/Uglory_farmar.png">
                        <img src="${contextPath}/resources/img/main/logo/Uglory_whitecali.png" width="150px">
                    </span>
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
                        <a href="#" class="nav-item icon"><img class="menu-chart" src="${contextPath}/resources/img/main/shopping-cart-white.png"></a>
                        <a href="${contextPath}/member/login" class="nav-item icon"><img class="menu-chart" src="${contextPath}/resources/img/main/user-white.png"></a>
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
                        <h1 class="mb-5">이용후기</h1>
                    </div>
                </div>
            </div>
            <!-- Contact End -->



            <!-- content 부분 -->
            <div class="content_container">
                
                <!-- box -->
                <div class="box_container">
                    <div class="box_text">
                        <div style="color: rgb(97, 97, 97);">
                            <img src="${contextPath}/resources/img/icon/Uglory_apple.png" width="30px"><br> Uglory 채소들로 차린 식탁 <br> 지금 확인해보세요!
                        </div>
                    </div>
                    <div class="box_content">
                        <div class="box_content_d">
                            <div class="box_review_section" style="cursor: pointer;">
                                <a href="${contextPath}/review/list">
                                    <p>전체 후기 수</p>
                                    <p>${mybox.result1}</p>
                                </a>
                            </div>
                            <div class="box_review_section box_center">
                                <p>전체만족도</p>
                                <p>${mybox.result2}</p>
                            </div>
                        </div>
                        <div class="box_content_d">
                            <div class="box_review_section box_center">
                                <p>나의 리뷰</p>
                                <p>
                                    <span style="margin-right: 7px;">${mybox.result3}</span>
                                     <a href="${contextPath}/review/list">
                                        <span style="background-color: rgb(113, 214, 199); color:white; font-size: 15px; padding: 3px 8px; border-radius: 10px; font-weigth: bold;">ON</span>
                                    </a>
                                </p>
                            </div>
                            <div class="box_review_section box_center">
                                <p>미작성 리뷰</p>
                                <p>
                                    <span style="margin-right: 15px;">${mybox.result4}</span>
                                    <a href="${contextPath}/review/list/unWritten">
                                        <span style="font-size: 15px; color: rgb(80, 124, 254);">쓰기 >></span>
                                    </a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 나의 리뷰 목록 조회 -->
                <div class="myreview-section">

                

                <div class="myreview-list">
                    <div class="myreview-content">
                        <div class="myreview-image"><img src="#"></div>
                        <div class="content-info">
                            <div class="myReview-star">
                                <div class="rating" data-rate="5">
                                    <div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>
                                    <div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>
                                    <div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>
                                    <div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>
                                    <div class="star-wrap"><div class="star"><i class="fas fa-star"></i></div></div>
                                <%-- <span>★★★★★</span> --%>
                                </div>
                            </div>
                            <div>2022.07.07</div>
                            <div>유기농 어글리 바나나 - 1.5kg</div>
                            <div>달달하니 맛있는 바나나예요~</div>
                        </div>
                    </div>
                    <div class="myreview-button">
                        <button id="updateBtn">수정</button>
                        <button id="deleteBtn">삭제</button>
                    </div>
                </div>

                <div class="myreview-list">
                    <div class="myreview-content">
                        <div class="myreview-image"><img src="#"></div>
                        <div class="content-info">
                            <div>★★★★★</div>
                            <div>2022.07.07</div>
                            <div>유기농 어글리 바나나 - 1.5kg</div>
                            <div>달달하니 맛있는 바나나예요~</div>
                        </div>
                    </div>
                    <div class="myreview-button">
                        <button id="updateBtn">수정</button>
                        <button id="deleteBtn">삭제</button>
                    </div>
                </div>
            
            
            
            </div>
            
            
            </div>
        </section>       
                


        <%-- footer --%>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

        <!-- jQuery 추가 -->
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

        <!-- Template Javascript -->
        <script src="${contextPath}/resources/js/main.js"></script>
        <script src="${contextPath}/resources/js/review/review.js"></script>
        
</body>

</html>