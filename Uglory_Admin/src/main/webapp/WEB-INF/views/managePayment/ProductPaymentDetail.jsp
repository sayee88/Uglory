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
                                    <th scope="col" colspan="2">주문 번호</th>
                                    <th scope="col" colspan="3">${detail.orderCode}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th>주문자</th>
                                    <td>블랙이</td>
                                    <th>주문자 아이디</th>
                                    <td>test01@uglory.com</td>
                                </tr>

                                <tr>
                                    <th>결제 금액</th>
                                    <td>100,400원</td>
                                    <th>결제일</th>
                                    <td>2022-07-07 17:46:14</td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="blank"></div>

                        <table class="table table-borderless mt-4">
                            <tbody>
                                <tr>
                                    <th>배송지</th>
                                    <td>서울시 강서구 금낭화로11길 59-2</td>
                                    <th>배송 상태</th>
                                    <td>배송 완료</td>
                                </tr>

                                <tr>
                                    <th>배송일</th>
                                    <td>2022-07-10 17:46:16</td>
                                    <th>배송 요청사항</th>
                                    <td>배송 전 전화 부탁드립니다.</td>
                                </tr>
                            </tbody>
                        </table>



                        <!-- 개별 상품 조회 -->
                        <div class="blank"></div>

                        <table class="table table-borderless mt-4">
                            <thead>
                                <tr>
                                    <th>배송 상품</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>바나나 3kg</td>
                                </tr>

                                <tr>
                                    <td>자두 1kg</td>
                                </tr>

                                <tr>
                                    <td>감자 5kg</td>
                                </tr>
                            </tbody>
                        </table>

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