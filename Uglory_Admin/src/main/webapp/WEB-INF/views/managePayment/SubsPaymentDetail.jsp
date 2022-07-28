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


            <!-- 결제 상세 조회 -->
            <div class="container-fluid pt-4 px-4">
                <div class="row bg-light rounded justify-content-center mx-0 m-5 p-4">
                    <div class="col-lg-12 text-center">
                        <h2 class="text-start">결제 상세 조회</h2>
                        <hr>

                        <table class="table table-borderless mt-4">

                            <thead>
                                <tr>
                                    <th scope="col" colspan="2">결제 번호</th>
                                    <th scope="col" colspan="3">${sPaymentDetail.payNo}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th>주문 번호</th>
                                    <td>${sPaymentDetail.orderCode}</td>
                                    <th>주문자</th>
                                    <td>${sPaymentDetail.customerEmail} / ${sPaymentDetail.customerName}</td>
                                </tr>

                                <tr>
                                    <th>결제 금액</th>
                                    <td>${sPaymentDetail.payAmount}</td>
                                    <th>결제일</th>
                                    <td>${sPaymentDetail.payDate}</td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="blank"></div>

                        <table class="table table-borderless mt-4">
                            <tbody>
                                <tr>
                                    <th>배송지</th>
                                    <td>${sPaymentDetail.deliveryAddress}</td>
                                    <th>배송 상태</th>
                                    <td>${sPaymentDetail.deliveryStatement}</td>
                                </tr>

                                <tr>
                                    <th>배송일</th>
                                    <td>${sPaymentDetail.deliveryDate}</td>
                                    <th>배송 요청사항</th>
                                    <td>${sPaymentDetail.deliveryRequest}</td>
                                </tr>
                            </tbody>
                        </table>



                        <!-- 구독 조회 -->
                        <div class="blank"></div>

                        <table class="table table-borderless mt-4">
                            <thead>
                                <tr>
                                    <th colspan="3">${sPaymentDetail.subscriptionName}</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td colspan="1">배송 주기</td>
                                    <td colspan="2">${sPaymentDetail.subscriptionCycle}주</td>
                                </tr>

                                <tr>
                                    <td colspan="1">구독 제외 상품</td>
                                    <td colspan="2">${sPaymentDetail.subscriptionException}</td>
                                </tr>
                            </tbody>
                        </table>

                        <div style="margin-top: 100px;"><a class="btn btn-primary rounded-pill" href="${contextPath}/payment/selectAll">목록으로</a></div>

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
</body>

</html>