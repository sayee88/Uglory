<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Mission</title>

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
    
</head>

<body>
     <!-- Mission header -->
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
                        <h2 class="display-3 text-white mb-3 animated slideInDown" style="font-size:50px">Mission</h2>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-center text-uppercase">
                                <li class="breadcrumb-item"><a href="${contextPath}">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Pages</a></li>
                                <li class="breadcrumb-item text-white active" aria-current="page">Mission</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>


        <!-- About Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5 align-items-center">
                    <div class="col-lg-6">
                        <div class="row g-3">
                            <div class="text-start">
                                <img class="img-fluid rounded w-100 wow zoomIn" data-wow-delay="0.1s" src="${contextPath}/resources/img/main/mission4.png">
                            </div>
                            <!--<div class="col-6 text-start">
                                <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.3s" src="img/about-2.jpg" style="margin-top: 25%;">
                            </div>
                            <div class="col-6 text-end">
                                <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.5s" src="img/about-3.jpg">
                            </div>
                            <div class="col-6 text-end">
                                <img class="img-fluid rounded w-100 wow zoomIn" data-wow-delay="0.7s" src="img/about-4.jpg">
                            </div>-->
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <h5 class="section-title ff-secondary text-start text-primary fw-normal">Mission</h5>
                        <h1 class="mb-4">우리가 함께 구하는 것</h1>
                        <h6 style="color:rgb(255, 89, 87); font-size: 20px;">왜 농산물의 1/3이 버려질까요?</h6>
                        <p class="mb-4">전세계 농산물의 1/3이 "외적인 기준"이 미달해 버려지고 있습니다. 같은 땅에서 건강하게 자랐지만 모양과 크기,중량 등이 판매하기 용이하지 않다는 이유로 헐값에 처분되거나 폐기합니다.</p>
                        <h6 style="font-weight: bold;">* 혹부리 당근, 사춘기 감자, 째깐한 무, 핸드볼 크기 양배추를 마트에서 볼 수 없는 이유</h6>
                        <p class="mb-4">소비자는 농산물을 고를 때 눈에 보이는 ‘모양’을 보고 살 수 밖에 없어 실제 맛이나 품질과는 무관하게 완벽한 모양의 흠없는 농산물을 찾게됩니다.</p>
                        <h6 style="font-weight: bold;">* 수요와 공급의 불안정</h6>
                        <p class="mb-4">‘못생겼다’는 이유 외에도 농산물이 갈 곳을 잃는 경우가 있습니다. 바로 판로가 부족한 경우 그리고 단순히 많이 생산된 경우인데요. 정확한 수요공급 예측이 어려워 매년 ‘밭을 갈아엎는’ 상황이 생기고 있습니다.</p>
                        
                        <h6 style="color:rgb(255, 89, 87); font-size: 20px;">지속 가능한 농업을 지지합니다.</h6>
                        <p class="mb-4">모양으로 억울하게 남겨진 농산물을 구출하는 것 뿐만 아니라,


                            생산단계부터 거칠고 못나도 건강한 생산방식을 
                            
                            고수하는 농법을 지지합니다.
                            
                            이를 위해 단순히 수확량 증대와 외적인 품위만을 위해 필요 이상의 방제를 하지는 않는지 점검하고,
                            
                            
                            개성있는 외모를 가졌지만 친환경적인 농법으로
                            
                            안전하게 먹을 수 있는 농산물을 생산하는 산지와의 파트너쉽을 우선합니다.
                            
                            
                            건강한 땅을 위한 농부의 땀과 노력이 인정받을 수 있고 소비자는 건강한 식품을 지속가능하게 공급받을 수 있도록 합니다.</p>
                        <a class="btn btn-primary py-3 px-5 mt-2" href="${contextPath}/subscription">구독 신청하기</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->
  
    <%-- footer --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

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