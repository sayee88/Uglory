<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Uglory</title>
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
    <link href="resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="resources/css/style.css" rel="stylesheet">
</head>

<body>
    <main>

    <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <!-- About Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5 align-items-center">
                    <div class="col-lg-6">
                        <div class="row g-3">
                            <div class="col-6 text-start">
                                <img class="img-fluid rounded w-100 wow zoomIn" data-wow-delay="0.1s" src="${contextPath}/resources/img/main/famer.png">
                            </div>
                            <div class="col-6 text-start">
                                <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.3s" src="${contextPath}/resources/img/main/mission_2.jpg" style="margin-top: 25%;">
                            </div>
                            <div class="col-6 text-end">
                                <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.5s" src="${contextPath}/resources/img/main/mission_3.jpg">
                            </div>
                            <div class="col-6 text-end">
                                <img class="img-fluid rounded w-100 wow zoomIn" data-wow-delay="0.7s" src="${contextPath}/resources/img/main/about-5.png">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <h5 class="section-title ff-secondary text-start text-primary fw-normal">Our Mission</h5>
                        <h1 class="mb-4" style="@font-face {
                            font-family: 'ROKAFSansBold';
                            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts2201-3@1.0/ROKAFSansBold.woff') format('woff');
                            font-weight: normal;
                            font-style: normal;
                        }">우리가 함께 구한 것</h1>
                        <p class="mb-4">
                            SAVE NOT UGLY, BUT GLORY PRODUCTS<br>
                            맛과 영양에는 문제 없지만 못생겼다는 이유로 폐기되는 농산물은
                            농부의 소득을 저하하고 많은 쓰레기를 유발합니다.<br>
                            물과 비료, 노동에너지의 낭비를 줄이고 
                            궁극적으로는 지구를 구하는 길에 동참합니다. 
                        <p class="mb-4">
                            농부의 땀과 노력으로 이루어진 농산물의 가치를 발견하여
                            모두의 건강한 식탁과 미래를 위한 환경을 만들어갑니다.</p>
                        <div class="row g-4 mb-4">
                            <div class="col-sm-6">
                                <div class="d-flex align-items-center border-start border-5 border-primary px-3">
                                    <h1 class="flex-shrink-0 display-5 text-primary mb-0" data-toggle="counter-up">${farmCount}</h1>
                                    <div class="ps-4">
                                        <p class="mb-0">Farm</p>
                                        <h6 class="text-uppercase mb-0">함께하는 농가</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="d-flex align-items-center border-start border-5 border-primary px-3">
                                    <h1 class="flex-shrink-0 display-5 text-primary mb-0" data-toggle="counter-up">${productCount}</h1>
                                    <div class="ps-4">
                                        <p class="mb-0">Vegiterable</p>
                                        <h6 class="text-uppercase mb-0 mission-about">구출한 채소</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <a class="btn btn-primary py-3 px-5 mt-2" href="${contextPath}/common/mission">Mission About</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->


        <!-- 이번주 다음주 배송상품 Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">Market</h5>
                    <h1 class="mb-5">DELIVERY</h1>
                </div>
                <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
                    <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab-1">
                                    <i class="fa fa-coffee fa-2x text-primary"></i>
                                <div class="ps-3 mx-4">
                                    <small class="text-body ml-5">GOODS TO BE RECEIVED</small>
                                    <h6 class="mt-n1 mb-0">THIS WEEK</h6>
                                </div>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill" href="#tab-2">
                                    <i class="fa fa-hamburger fa-2x text-primary"></i>
                                <div class="ps-3 mx-4">
                                    <small class="text-body">GOODS TO BE RECEIVED</small>
                                    <h6 class="mt-n1 mb-0">NEXT WEEK</h6>
                                </div>
                            </a>
                        </li>
                        <!--
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill" href="#tab-3">
                                <i class="fa fa-utensils fa-2x text-primary"></i>
                                <div class="ps-3">
                                    <small class="text-body">Lovely</small>
                                    <h6 class="mt-n1 mb-0">Dinner</h6>
                                </div>
                            </a>
                        </li>
                        -->
                    </ul>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="row g-4" id="thisWeekTab"></div>
                        </div>
                        <div id="tab-2" class="tab-pane fade show p-0">
                            <div class="row g-4" id="nextWeekTab"></div>
                        </div>
                    </div>
                </div>  
            </div>
        </div>
        <!-- 이번주 다음주 배송상품 End -->


        <!-- 배송 진행 방식 Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">Delivery</h5>
                    <div style="padding: 10px 0; font-size: 18px; color: gray;">이렇게 해결해요</div>
                    <h1 class="mb-5">생산자와 소비자, 환경에도 더 이로운 방식으로</h1>
                </div>
                <div class="delivery">

                    <div class="delivery_content text">
                        <div>
                            <div class="text_num">
                                <div class="text_num_bg">
                                    <div class="text_num_content">1</div>
                                </div>
                            </div>
                            <div>
                                <h5 class="text_content">수확 직후 직매입</h5>
                                <div class="text_content">
                                    판로를 칮지 못한 농산물들을  <br>
                                    농부님께 수확 2~7일 이내 직접 공급받아요.
                                </div>
                            </div>
                        </div>

                        <div class="delivery_text">
                            <div class="text_num">
                                <div class="text_num_bg">
                                    <div class="text_num_content">2</div>
                                </div>
                            </div>
                            <div>
                                <h5 class="text_content">조금씩 다양하게 소포장</h5>
                                <div class="text_content">
                                    가구 수에 맞게 소량으로 포장해요.
                                </div>
                            </div>
                        </div>

                        <div class="delivery_text">
                            <div class="text_num">
                                <div class="text_num_bg">
                                    <div class="text_num_content">3</div>
                                </div>
                            </div>
                            <div>
                                <h5 class="text_content">집 앞까지 정기배송</h5>
                                <div class="text_content">
                                    중간 유통 절차없이 즉시 보내드려요.
                                </div>
                            </div>
                        </div>
                    </div>
                    
        
                    <div class="delivery_content img">
                        <img class="delivery_img" src="${contextPath}/resources/img/main/farm.jpg">
                    </div>
            </div>
        </div>
        <!-- 배송 진행 방식 End -->
       


        <!-- 구독 방식 Start -->
        <div class="container-xxl pt-5 pb-3">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">Subscription method</h5>
                    <h1 class="mb-5">구독, 이렇게 진행돼요</h1>
                </div>

                <div class="row g-4">
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="team-item text-center rounded overflow-hidden">
                            <div class="rounded-circle overflow-hidden m-4">
                                <img class="img-fluid subs-img" src="${contextPath}/resources/img/main/main_box.png" alt="">
                            </div>
                            <h5 class="mb-0">박스 사이즈 선택</h5>
                            <%-- <small>Designation</small>
                            <div class="d-flex justify-content-center mt-3">
                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                            </div> --%>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="team-item text-center rounded overflow-hidden">
                            <div class="rounded-circle overflow-hidden m-4">
                                <img class="img-fluid subs-img" src="${contextPath}/resources/img/main/main_vagetable.png" alt="">
                            </div>
                            <h5 class="mb-0">알러지 제외 가능</h5>
                            <%-- <small>Designation</small>
                            <div class="d-flex justify-content-center mt-3">
                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                            </div> --%>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="team-item text-center rounded overflow-hidden">
                            <div class="rounded-circle overflow-hidden m-4">
                                <img class="img-fluid subs-img" src="${contextPath}/resources/img/main/main_calendar.png" alt="">
                            </div>
                            <h5 class="mb-0">매주 / 격주 선택 가능</h5>
                            <%-- <small>Designation</small>
                            <div class="d-flex justify-content-center mt-3">
                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                            </div> --%>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
                        <div class="team-item text-center rounded overflow-hidden">
                            <div class="rounded-circle overflow-hidden m-4">
                                <img class="img-fluid subs-img" src="${contextPath}/resources/img/main/main_card.png" alt="">
                            </div>
                            <h5 class="mb-0">해지 가능</h5>
                            <%-- <small>Designation</small>
                            <div class="d-flex justify-content-center mt-3">
                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                            </div> --%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Team End -->


        <!-- Testimonial Start -->
        <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container">
                <div class="text-center">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">Review</h5>
                    <h1 class="mb-5">지속가능한 가능한 식탁을 만들어가요!</h1>
                </div>

                <div class="owl-carousel testimonial-carousel">
                    
                    <c:forEach var="review" items="${recentReviewList}">
                    
                        <div class="testimonial-item bg-transparent border rounded p-4">
                            <div class="rating">
                                <c:if test="${review.starRating % 2 == 0}">
                                    <c:forEach var="i" begin="1" end="${review.starRating / 2}">
                                        <div class="star-wrap"><div class="star" style="width:100%"><i class="fa fa-2x text-primary mb-3">★</i></div></div>
                                    </c:forEach>
                                </c:if>

                                <c:if test="${review.starRating % 2 == 1}">
                                    <c:forEach var="i" begin="1" end="${review.starRating / 2}">
                                        <div class="star-wrap"><div class="star" style="width:100%"><i class="fa fa-2x text-primary mb-3">★</i></div></div>
                                    </c:forEach>

                                    <div class="star-wrap"><div class="star" style="width:50%"><i class="fa fa-2x text-primary mb-3">★</i></div></div>
                                </c:if>
                                
                            </div>
                            <div class="d-flex align-items-center">
                                <div class="ps-3">
                                    <c:choose>
                                        <c:when test="${review.productName != null}">
                                            <h5 class="mb-1" style="font-size: 15px;">${review.productName}</h5>
                                        </c:when>
                                        <c:otherwise>
                                            <h5 class="mb-1" style="font-size: 15px;">어글로리 구독 상품</h5>
                                        </c:otherwise>
                                    </c:choose>
                                    <div style="font-size: 14px;">${review.reviewEnrollDate}</div>
                                    <div>${review.memberName}</div>
                                </div>

                                <c:choose>
                                    <c:when test="${review.thumbnail != null}">
                                        <img class="img-fluid flex-shrink-0 rounded-circle" src="${contextPath}${review.thumbnail}" style="width: 100px; height: 100px;">
                                    </c:when>
                                    <c:otherwise>
                                        <img class="img-fluid flex-shrink-0 rounded-circle" src="${contextPath}/resources/img/icon/tomato.png" style="width: 100px; height: 100px;">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="review-content">${review.reviewContent}</div>
                        </div>

                    </c:forEach>
                    

                </div>
            </div>
        </div>
        <!-- Testimonial End -->
    </div>
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <%-- <!— jQuery 추가 —> --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <script>
        const contextPath = '${contextPath}';
    </script>

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

    <!— Template Javascript —>
    <script src="${contextPath}/resources/js/main.js"></script>
</body>

</html>