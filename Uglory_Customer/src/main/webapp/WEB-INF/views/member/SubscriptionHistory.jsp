<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SubscriptionHistory</title>
    <link href="resources/css/member/member.css" rel="stylesheet">

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
    <link href="resources/css/style-1.css" rel="stylesheet">
</head>
<body>
    <main class="order-main">

     <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div class="order-section">
            <div class="order-head">
                <h2 class="orderTitle">구독내역</h2>
                <div class="date">스탠다드 | 패밀리</div>
            </div>

                <div>
                    <ul class="orderList">
                        <li class="list-section">
                            
                            <div class="date">2022.07.11 (17:00)</div>
                        
                            <div class="order-goods">
                            
                                <div class="order-name">
                                    <a href="">새콤달콤 당도선별 제주 감귤</a>
                                </div>
                            
                            </div>
                        
                            <div class="order-info">
                                <div class="description">
                                  
                                    <dl>
                                        <dt>주문번호</dt>
                                        <dd>1646832984481</dd>
                                    </dl>
                                    <dl>
                                        <dt>결제금액</dt>
                                        <dd>19,922원</dd>
                                    </dl>
                                    <dl>
                                        <dt>배송상태</dt>
                                        <dd>배송완료</dd>
                                    </dl>
                                </div>
                            </div>
                        </li>
                    </ul>
                    
                    <!-- 페이지네이션 시작-->
                    <div class="pagination-area">
                        <div class="pagiDiv">
                            <a href="" class="pagiA pagiAA">첫페이지로 가기</a>
                            <a href="" class="pagiA pagiBB">이전 페이지로 가기</a>
                            <span><a href="" class="pagiNum">1</a></span>
                            <span><a href="" class="pagiNum">2</a></span>
                            <span><a href="" class="pagiNum">3</a></span>
                            <span><a href="" class="pagiNum">4</a></span>
                            <span><a href="" class="pagiNum">5</a></span>
                            <a href=""class="pagiA pagiCC">다음 페이지로 가기</a>
                            <a href=""class="pagiA pagiDD">마지막 페이지로 가기</a>
                        </div>
                    </div>
                    <!-- 페이지 네이션 끝 -->

                </div>
            
            
        </div>


    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
</body>
</html>