<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${contextPath}/resources/css/member/member.css" rel="stylesheet">
    
    <title>about</title>

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

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


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
                        <a href="${contextPath}/product/cart" class="nav-item icon"><img class="menu-chart" src="${contextPath}/resources/img/main/shopping-cart-white.png"></a>
                    <c:choose>

                        <c:when test="${empty sessionScope.loginMember}">
                            <a href="${contextPath}/member/login" class="nav-item icon"><img class="menu-chart" src="${contextPath}/resources/img/main/user-white.png"></a>
                        </c:when>

                        <c:otherwise>
                            <a href="${contextPath}/member/myPage" class="nav-item icon"><img class="menu-chart" src="${contextPath}/resources/img/main/user-white.png"></a>
                        </c:otherwise>

                    </c:choose>
                    </div>
                </nav>

                <div class="container-xxl py-5 bg-dark hero-header mb-5">
                    <div class="container text-center my-5 pt-5 pb-4">
                        <h2 class="display-3 text-white mb-3 animated slideInDown" style="font-size:50px">About</h2>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-center text-uppercase">
                                <li class="breadcrumb-item"><a href="${contextPath}">Home</a></li>
                                <li class="breadcrumb-item"><a href="${contextPath}/common/about">about</a></li>
                                <li class="breadcrumb-item"><a href="${contextPath}/common/mission">Mission</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
    <main class="main">
        <!-- 1어바웃 시작 -->
        <div>
            <div class="about1">
                <p class="about1-title">
                    맞춤 박스를<br>
                    선택하세요.
                </p>
                <div class="empty1"></div>
                    <div class="about1-content">
                        
                        <%-- 1번 --%>
                        <div>
                            <div class="about1-item">
                                <p class="about1-num">1.</p>
                                <div class="about1-line"></div>
                            </div>
                            
                            <div class="empty2"></div>
                            <div class="about1-box">
                                <p class="about1-boxContent">박스 크기를 선택해요</p>
                                <p class="about1-subContext">1-2인 가구용, 3-4인 가구용</p>
                                <div class="about1-image1" >
                                    <img class="about1-image1" src="${contextPath}/resources/img/about/about1-image.png">
                                </div>                        
                                
                            </div>
                        </div>

                        <%-- 2번 --%>
                        <div>
                            <div class="about1-item">
                                <p class="about1-num">2.</p>
                                <div class="about1-line"></div>
                            </div>
                            
                            <div class="empty2"></div>
                            <div class="about1-box">
                                <p class="about1-boxContent">배송 주기를 선택해요.</p>
                                <p class="about1-subContext">매주, 격주</p>
                                <div class="about1-image1" >
                                    <img class="about1-image1" src="${contextPath}/resources/img/about/about-image2.png">
                                </div>                        
                                
                            </div>
                        </div>

                        <%-- 3번 --%>
                        <div>
                        <div class="about1-item">
                            <p class="about1-num">3.</p>
                            <div class="about1-line"></div>
                        </div>
                        
                        <div class="empty2"></div>
                        <div class="about1-box">
                            <p class="about1-boxContent">먹지 않는 채소를 제외하면 끝!</p>
                            <p class="about1-subContext">구독 후에도 변경 가능</p>
                            <div class="about1-image1" >
                                <img class="about1-image1" src="${contextPath}/resources/img/about/about-image3.png">
                            </div>                        
                            </div>
                        </div>
                    </div>


                   
                    </div>
                </div>
        </div>
        <!-- 1번 어바웃 끝 -->
    
        <!-- 2번 어바웃 시작 -->
        <div class="empty"></div> 
        <div class="about2">
            <div class="about2-content">
                                
                <div class="about2-text">
                    <p class="about2-title">이렇게<br>진행돼요.</p>
                    
                    <p class="about2-Explanation">이번 주 구출한 채소 목록을 문자로 미리 알려드려요. </p>
                    <button class="btn"></button>
                </div>

                <div class="about2-items">
                    <div class="about2-item1">
                        <div class="about2-image1">
                            <img src="${contextPath}/resources/img/about/about2-image1.png">
                            <p class="about2-text1">품목알림</p>
                           
                            <p class="about2-text2">월요일</p>
                        </div>
                    </div>
          
                </div>
                <div class="about2-items">
                    <div class="about2-item1">
                        <div class="about2-image1">
                            <img src="${contextPath}/resources/img/about/about2-image2.png">
                            <p class="about2-text1">결제일 / 배송일</p>
                            <div class="empty5"></div>
                            <p class="about2-text2">수요일</p>
                        </div>
                    </div>
          
                </div>
                <div class="about2-items">
                    <div class="about2-item1">
                        <div class="about2-image1">
                            <img src="${contextPath}/resources/img/about/about2-image3.png">
                            <p class="about2-text1">도착일</p>
                            <div class="empty5"></div>
                            <p class="about2-text2">금요일</p>
                        </div>
                    </div>
          
                </div>


            </div>
        </div>
        <!-- 2 어바웃 끝 -->

        <!-- 3어바웃 시작 -->
        <div class="empty"></div>
        <div class="about3">
            <div class="about3-content">
                <div class="about3-imagePlace">
                    <div>
                        <div class="about3-image">
                            <img  class="about3-image" src="${contextPath}/resources/img/about/Manual-vegebox.54b16562.jpg">
                        </div>
                    </div>
                </div>
                <div class="about3-text">
                    <span class="about3-textTitle">
                        설렘 같은 설렘 어떤 채소들이 올까요?
                    </span>
                    <p class="about3-textSubTitle">친환경 채소</p>
                    <p class="about3-Explanation">무농약,유기농 인증을 받은 친환경 채소로만 구성돼요.</p>
                    <p class="about3-textSubTitle">사연있는 채소</p>
                    <p class="about3-Explanation">모양이 고르지 않거나 판로가 부족해 남겨졌지만 같은 땅에서 자란 신선한 농산물들이에요.</p>
                    <p class="about3-textSubTitle">제철 채소</p>
                    <p class="about3-Explanation">지금, 가장 맛있는 제철 채소를 수확 직후 보내드려요.</p>
                    
                    <div class="vegetable-area">
                        <%-- <a class="vegetable">어글로리 채소 전체보기 click  👀🥬</a> --%>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        어글로리 채소 전체보기 click  👀🥬
                        </button>
                    </div>

                </div>
             
            </div>
        </div>
        <!-- 3어바웃 시작 -->

    <!-- Button trigger modal -->

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="height: 700px; width: 450px;">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">어글로리 채소 전체보기  👀🥬</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body text-center">
            <img src="${contextPath}/resources/img/about/어글로리전체보기.png" style="width:400px; height:550px;">
        </div>
        <div class="modal-footer p-0">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          
        </div>
        </div>
    </div>
    </div>
    </main>

    <%-- footer --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    

    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

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