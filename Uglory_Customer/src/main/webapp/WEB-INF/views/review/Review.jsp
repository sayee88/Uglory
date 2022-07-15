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
                            <div class="box_review_section">
                                <p>전체 후기 수</p>
                                <p>2000</p>
                            </div>
                            <div class="box_review_section box_center">
                                <p>전체만족도</p>
                                <p>4.8</p>
                            </div>
                        </div>
                        <div class="box_content_d">
                            <div class="box_review_section box_center">
                                <p>나의 리뷰</p>
                                <p>
                                    <span style="margin-right: 7px;">1</span>
                                    <span style="background-color: rgb(190, 190, 190); color:white; font-size: 15px; padding: 3px 8px; border-radius: 10px;">OFF</span>
                                </p>
                            </div>
                            <div class="box_review_section box_center">
                                <p>미작성 리뷰</p>
                                <p>
                                    <span style="margin-right: 15px;">2</span>
                                    <a href="${contextPath}/review/ReviewWriteForm.jsp">
                                        <span style="font-size: 15px; color: rgb(80, 124, 254);">쓰기 >></span>
                                    </a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- category -->
                <div class="category_section"> 
                    <div class="category_button">
                        <div style="background-color: rgb(113, 214, 199); color:white">모두보기</div>
                        <div>구독박스</div>
                        <div>상점</div>
                    </div>
                </div>
                

            <!-- 리뷰 목록 -->
            <div class="review-section">
                <div class="review-list">
                    
                    <%-- <c:choose>
                        <c:when test="">

                        </c:when>
                    </c:choose> --%>

                <div class="review-content">
                    <div data-bs-toggle="modal" data-bs-target="#exampleModal">
                        <img src="${contextPath}/resources/img/review/review_img1.png">
                    </div>
                    <div class="review-content-text">
                        <div class="review-content-top-section">
                            <div class="review-content-top-left">
                                <div>고*비</div>
                                <div>2022.07.10</div>
                            </div>
                            <div class="review-star">
                                <span>★</span>
                                <span>★</span>
                                <span>★</span>
                                <span>★</span>
                                <span>★</span>
                            </div>
                        </div>
                        <div class="review-content-text-section modal-open">
                            <div href="#" style="color: black;" >
                                신선한 토마토로 카프레제 해먹었어요~ 멋쟁이 토마토로 파스타도 해먹구 신이 나요~
                            </div> 
                        </div>
                        <div class="review-content-bottom-section">
                            <div>정기구독박스</div>
                        </div>
                    </div>
                </div>
                
                <div class="review-content">
                    <div>
                        <img src="img/리뷰/이용후기2.jpeg">
                    </div>
                    <div class="review-content-text">
                        <div class="review-content-top-section">
                            <div class="review-content-top-left">
                                <div>김*희</div>
                                <div>2022.07.06</div>
                            </div>
                            <div class="review-star">
                                <span>★</span>
                                <span>★</span>
                                <span>★</span>
                                <span>★</span>
                                <span>☆</span>
                            </div>
                        </div>
                        <div class="review-content-text-section">
                            <div href="#" style="color: black;">
                                모히또가서 몰디브 한잔?
                            </div>
                        </div>
                        <div class="review-content-bottom-section">
                            <div>개별상품구매</div>
                        </div>
                    </div>
                </div>
                
                <div class="review-content">
                    <div>
                        <img src="img/리뷰/이용후기3.jpeg">
                    </div>
                    <div class="review-content-text">
                        <div class="review-content-top-section">
                            <div class="review-content-top-left">
                                <div>박*진</div>
                                <div>2022.07.05</div>
                            </div>
                            <div class="review-star">
                                <span>★</span>
                                <span>★</span>
                                <span>★</span>
                                <span>★</span>
                                <span>★</span>
                            </div>
                        </div>
                        <div class="review-content-text-section">
                            <div href="#" style="color: black;">
                                양상추로 푸짐한 샐러드완성~ 아삭아삭 신선해요!
                            </div>
                        </div>
                        <div class="review-content-bottom-section">
                            <div>정기구독박스</div>
                        </div>
                    </div>
                </div>

                </div>
                <div class="review-list">
                    
                    <div class="review-content">
                        <div>
                            <img src="img/리뷰/이용후기4.jpeg">
                        </div>
                        <div class="review-content-text">
                            <div class="review-content-top-section">
                                <div class="review-content-top-left">
                                    <div>백*현</div>
                                    <div>2022.07.04</div>
                                </div>
                                <div class="review-star">
                                    <span>★</span>
                                    <span>★</span>
                                    <span>★</span>
                                    <span>★</span>
                                    <span>★</span>
                                </div>
                            </div>
                            <div class="review-content-text-section">
                                <div href="#" style="color: black;">
                                    버섯으로 라비올리 뚝딱 만들어 먹기 버섯이 달다~
                                </div>
                            </div>
                            <div class="review-content-bottom-section">
                                <div>정기구독박스</div>
                            </div>
                        </div>
                    </div>

                    <div class="review-content">
                        <div>
                            <img src="img/리뷰/이용후기5.png">
                        </div>
                        <div class="review-content-text">
                            <div class="review-content-top-section">
                                <div class="review-content-top-left">
                                    <div>신*윤</div>
                                    <div>2022.07.03</div>
                                </div>
                                <div class="review-star">
                                    <span>★</span>
                                    <span>★</span>
                                    <span>★</span>
                                    <span>★</span>
                                    <span>★</span>
                                </div>
                            </div>
                            <div class="review-content-text-section">
                                <div href="#" style="color: black;">
                                    발그레한 복숭아>< 나는 말랑이 복숭아파
                                </div>
                            </div>
                            <div class="review-content-bottom-section">
                                <div>개별상품구매</div>
                            </div>
                        </div>
                    </div>

                    <div class="review-content">
                        <div>
                            <img src="img/리뷰/이용후기6.png">
                        </div>
                        <div class="review-content-text">
                            <div class="review-content-top-section">
                                <div class="review-content-top-left">
                                    <div>전*영</div>
                                    <div>2022.07.03</div>
                                </div>
                                <div class="review-star">
                                    <span>★</span>
                                    <span>★</span>
                                    <span>★</span>
                                    <span>★</span>
                                    <span>★</span>
                                    
                                </div>
                            </div>
                            <div class="review-content-text-section">
                                <div href="#" style="color: black;">
                                    비빔면에 오이 팍팍 넣어 먹어야 맛이쥬
                                </div>
                            </div>
                            <div class="review-content-bottom-section">
                                <div>개별상품구매</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

       


        <!-- 모달창 -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" style="object-fit: contain;">
                <div class="modal-content">
                    
                    <div class="modal-header">
                        <div class="modal-title" id="exampleModalLabel"></div>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    
                    <div class="modal-body" style="display: flex;">
                        <div class="modal-mainImage">
                            <div>
                                <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
                                    <div class="carousel-inner">
                                      <div class="carousel-item active" >
                                        <img src="${contextPath}/resources/img/review/review_img1.png" class="d-block w-100" style="object-fit: contain;">
                                      </div>
                                      <div class="carousel-item">
                                        <img src="${contextPath}/resources/img/review/review_img10.png" class="d-block w-100">
                                      </div>
                                      <div class="carousel-item">
                                        <img src="${contextPath}/resources/img/review/review_img11.png" class="d-block w-100" alt="...">
                                      </div>
                                    </div>
                                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
                                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                      <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
                                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                      <span class="visually-hidden">Next</span>
                                    </button>
                                </div>
                            </div>
                            <div class="modal-imgList">
                                <div><img class="small" src="${contextPath}/resources/img/review/review_img1.png"></div>
                                <div><img class="small" src="${contextPath}/resources/img/review/review_img10.png"></div>
                                <div><img class="small" src="${contextPath}/resources/img/review/review_img11.png"></div>
                                <div class="img4">x</div>
                            </div>
                        </div>
                        
                        <div class="modal-mycontent">
                            <div class="modal-content-info">
                                
                                <div>
                                    <div class="info-name-date">
                                        <span>신*윤</span>
                                        <span>2022.07.02</span>
                                    </div>
                                    <div class="purchase">정기구독박스</div>
                                </div>
                                <div class="modal-star">
                                    <div>
                                        <span>★</span>
                                        <span>★</span>
                                        <span>★</span>
                                        <span>★</span>
                                        <span>☆</span>
                                    </div>
                                    <div class="avgstar">4.0</div>
                                </div>
        
                            </div>
                            <div class="modal-content-text">
                                신선한 토마토로 카프레제 해먹었어요~ 멋쟁이 토마토로 파스타도 해먹구 신이 나요~
                            </div>
                            <div class="modal-bottom">
                                <div class="modal-sub">
                                    <img src="${contextPath}/resources/img/icon/tomato.png" width="50px">
                                    <a href="#">   구독 박스가 궁금하다면? >></a>
                                </div>
                            </div>
                        </div>
                    </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"
                        style="background-color:rgb(113, 214, 199); border:0; font-weight: bold;">수정하기</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"
                        style="background-color:rgb(113, 214, 199); border:0; font-weight: bold;">삭제하기</button>
                </div>
                </div>
            </div>
        </div>

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
    
</body>

</html>