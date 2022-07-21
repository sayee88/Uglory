<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<%-- 문자열 관련 함수(메서드) 제공 JSTL (EL형식으로 작성) --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Uglory</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="${contextPath}/resources/img/favicon.ico" rel="icon">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    
    <!-- Libraries Stylesheet -->
    <link href="${contextPath}/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Template Stylesheet -->
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">

    <!-- 회원, 결제, 리뷰 조회 Style sheet -->
    <link href="${contextPath}/resources/css/adminselect-style.css" rel="stylesheet">
    
    <!-- Fontawesome cdn 링크 -->
    <script src="https://kit.fontawesome.com/1ef9913073.js" crossorigin="anonymous"></script>

</head>

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        
        <!-- Spinner Start -->
        <jsp:include page="/WEB-INF/views/common/spinner.jsp"/>
        <!-- Spinner End -->


        <!-- Sidebar Start -->
        <jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
        <!-- Sidebar End -->

        
        <!-- Content Start -->
        <div class="content">
        
            <!-- Navbar Start -->
            <jsp:include page="/WEB-INF/views/common/header.jsp"/>
            <!-- Navbar End -->


            <!-- 결제 관리 -->
            <div class="container-fluid pt-4 px-4">
                <div class="row bg-light rounded justify-content-center mx-0 m-5 p-4">
                    <div class="col-lg-12 text-center">
                        <h2 class="text-start">매출 관리</h2>
                        <hr>


                        <%-- 메인 --%>
                        <div class="listBody">
                            div.refund-content-list
                            <table class="table table-borderless farmTable mt-4">
                                <thead>
                                    <tr>
                                        <th scope="col">주문 번호</th>
                                        <th scope="col">주문자 아이디</th>
                                        <th scope="col">주문자 이름</th>
                                        <th scope="col">상품명</th>
                                        <th scope="col">결제일</th>
                                        <th scope="col">결제 상세</th>
                                    </tr>
                                </thead>
                                <tbody id="paymentList">
                                    <c:forEach var="payment" items="${paymentList}" >
                                        <tr>
                                            <th scope="row">${payment.orderCode}</th>
                                            <td>${payment.customerEmail}</td>
                                            <td>${payment.payAmount}</td>
                                            <td>${payment.payDate}</td>
                                            <td>
                                                <button type="button" class="btn btn-payment-detail selectDetail sort-${payment.sort}">상세</button>
                                                <%-- onclick="location.href='../selectDetail/${payment.orderCode}'" --%>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        



                        <%-- 토글 --%>
                        <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                            <div class="faq-content-list">
                                <div>
                                    <span style="font-size: 24px; color: rgb(113, 214, 199);">Q</span>
                                    <button class="faq-list" data-bs-toggle="collapse" data-bs-target="#collapse-1">어떤 채소들을 받게 되나요?</button>
                                    <div class="faq-content collapse" id="collapse-1" 
                                        style="color: rgb(150, 150, 150);">
                                        모양이나 중량으로 버려질 위기의 못난이 채소, 급식 중단으로 판로를 잃은 채소 등
                                        구출이 긴급한 채소들이 우선 구성됩니다. <br>
                                        모든 채소들은 무농약/유기농 인증을 받은 제철 친환경 채소들이에요.<br> 
                                        사연은 제각각이지만, 꼼꼼하게 선별해 맛과 신선도에는 문제가 없는 채소들로만 꾸려집니다. <br>
                                        불필요한 유통 과정을 줄여 발송 직전 수확해 가장 신선하게 보내드려요!
                                    </div>
                                </div>
                            </div>
                        </div>









                    </div>
                </div>
            </div>

            <!-- Footer Start -->
            <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
            <!-- Footer End -->
        </div>
        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${contextPath}/resources/lib/easing/easing.min.js"></script>
    <script src="${contextPath}/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${contextPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/moment.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="${contextPath}/resources/js/main.js"></script>

    <script src="${contextPath}/resources/js/paymentList.js"></script>

    <script>
        const contextPath = "${contextPath}";
        

        for(var sort of sortlist){
            console.log(sort);
        }



    </script>

</body>

</html>