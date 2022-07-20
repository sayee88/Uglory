<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>

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

    <link href="${contextPath}/resources/css/member/member.css" rel="stylesheet">
    

</head>
<body>
    
<main class="main">

<jsp:include page="/WEB-INF/views/common/header-1.jsp" />

    <div class="order-section">
        <div class="order-head">
            <h2 class="orderTitle"> 개별 주문 내역</h2>
        </div>

        <div id="result1">
        <c:if test="${empty orderHistoryList}">
        주문 내역이 없습니다.
        </c:if>
        <c:if test="${!empty orderHistoryList}">
        
            <ul class="orderList">

                <c:forEach var="item" items="${orderHistoryList}">
                    <li class="list-section">
                        <div class="date">${item.orderDate}</div>
                    
                        <div class="order-goods">
                        
                            <div class="order-name">
                                ${item.origin}
                                
                                <c:if test="${item.count > 0}">
                                    외 ${item.count} 개
                                </c:if>

                                <button class="orderDetailBtn" id="${item.orderNo}" style="border:none; font-weight:bold; color: #FF5957;">></button>
                            </div>
                        
                        </div>
                    
                        <div class="order-info">
                            <div class="description" id=selectOne>
                                <dl>
                                    <dt>주문번호</dt>
                                    <a href="" id="goToDetail"><dd>${item.orderNo}</dd></a>
                                </dl>
                                <dl>

                                    <dt>결제금액</dt>
                                    <dd>${item.totalPrice}</dd>
                                </dl>

                                <dl>
                                    <dt>배송상태</dt>
                                    <dd>${item.deliveryFlag}</dd>
                                </dl>
                            </div>
                        </div>


                    </li>
                </c:forEach>
        </c:if>

                <hr><hr>
                <li class="list-section">
                    
                    <%-- <div class="date">${item.orderDate}</div>
                
                    <div class="order-goods">
                    
                        <div class="order-name">
                            ${item.origin} ${item.productName}
                        </div>
                    
                    </div>
                
                    <div class="order-info">
                        <div class="description" id=selectOne>

                            <dl>
                                <dt>주문번호</dt>
                                <a href="" id="goToDetail"><dd>${item.orderNo}</dd></a>
                            </dl>
                            <dl>

                                <dt>결제금액</dt>
                                <dd>${item.productPrice}</dd>
                            </dl>

                            <dl>
                                <dt>배송상태</dt>
                                <dd>${item.deliveryFlag}</dd>
                            </dl>
                        </div>
                    </div> --%>


                    <%-- <div class="order-head">
                        <h2 class="orderTitle"> 주문 내역 상세 조회</h2>
                    </div>




                    <div class="order-info">

                        <div class="description" >
                            <dl class=oBox>
                                <img src="${contextPath}/resources/img/쿵야/바나나쿵야.png" class="orderImg">

                                <div>
                                    <dl>
                                        <dt>상품이름</dt>
                                        <dd>과즙 팡팡 딱복숭아${item.productName}</dd>
                                    </dl>

                                    <dl>
                                        <dt>상품 가격 / 옵션명 / 수량 </dt>
                                        <dd>27,000원 / 2.5KG${item.productPrice}/${item.optionName}</dd>
                                    </dl>

                                    <dl>
                                        <dt>배송 현황</dt>
                                        <dd>배송중${item.deliveryFlag}</dd>
                                    </dl>
                                </div>
                                
                            </dl>

                            
                        </div>

                        
                    </div>


                    <div class="order-head">
                        <h2 class="orderTitle"> 주문 정보</h2>
                    </div>

                    <div class="order-info">
                        <div class="description" id=selectOne>

                            <dl>
                                <dt>주문자 이름</dt>
                                <dd>박예진${item.memberName}</dd>
                                
                            </dl>
                            <dl>
                                <dt>결제 일시</dt>
                                <dd> 2022/07/19 11:28:50${item.payDate}</dd>
                            </dl>

                            <dl>
                                <dt>총 결제 금액</dt>
                                <dd>27,000원${item.totalPirce}</dd>
                            </dl>

                        </div>
                    </div>


                    <div class="order-head">
                        <h2 class="orderTitle"> 배송 정보</h2>
                    </div>

                    <div class="order-info">
                        <div class="description" id=selectOne>

                            <dl>
                                <dt>수령인 이름</dt>
                                <dd>박예진${item.orderName}</dd>
                                
                            </dl>
                            <dl>
                                <dt>수령인 전화번호</dt>
                                <dd>010-2222-3333${item.orderPhone}</dd>
                            </dl>

                            <dl>
                                <dt>수령인 주소</dt>
                                <dd>압구정로 79-16 1층${item.orderaddress}</dd>
                            </dl>

                            <dl>
                                <dt>배송 요청 사항</dt>
                                <dd>굿뜨${item.deliveryReq}</dd>
                            </dl>

                        </div>
                    </div> --%>

                </li>
                
            </ul>
            

            <!-- 페이지네이션 시작-->   
            <nav aria-label="Page navigation example">
            <ul class="pagination d-flex justify-content-center">
                <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
                </li>
            </ul>
            </nav>
            <!-- 페이지 네이션 끝 -->
            
        </div>
    </div>
</main>
            
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
    <%-- <script src="${contextPath}/resources/js/main.js"></script> --%>
    <script>
        const contextPath = "${contextPath}" ;
        const loginMemberNo = "${loginMember.memberNo}";
    </script>

    <script src="${contextPath}/resources/js/member/orderHistory.js"></script>
    
</body>
</html>