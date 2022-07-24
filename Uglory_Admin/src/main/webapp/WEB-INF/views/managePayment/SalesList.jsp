<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<%-- 문자열 관련 함수(메서드) 제공 JSTL (EL형식으로 작성) --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="refundList" value="${map.refundList}" />


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
    <link href="${contextPath}/resources/css/faq-style.css" rel="stylesheet">

    
    <!-- Fontawesome cdn 링크 -->
    <script src="https://kit.fontawesome.com/1ef9913073.js" crossorigin="anonymous"></script>

    <style>
        table{
            display:flex;
            display: -webkit-box;
            display: -ms-flexbox;
            overflow-x: auto;
            overflow-y: hidden;
            }

        tbody{
            display:flex
        
        }

        th,td{
            display:block
        }

        body{
            min-height:1000px;
        }
    </style>

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
                            <div class="faq-content">

                                <%-- 구독회원수, 개별상품 결제 건수(환불 미포함), 환불 요청 건수, 환불 완료 건수 --%>
                                <div class="container-fluid pt-4 px-4">
                                    <div class="row g-4">
                                        <div class="col-sm-6 col-xl-3">
                                            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                                <div class="ms-3" id="countCustomer">
                                                    <p class="mb-2">구독</p>
                                                    <h6 class="mb-0">${map.subsCount} 건</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xl-3">
                                            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                                <div class="ms-3">
                                                    <p class="mb-2">개별상품 결제</p>
                                                    <h6 class="mb-0">${map.prodPaymentCount} 건</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xl-3">
                                            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                                <div class="ms-3">
                                                    <p class="mb-2">환불 요청</p>
                                                    <h6 class="mb-0">${map.refundCount} 건</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xl-3">
                                            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                                <div class="ms-3">
                                                    <p class="mb-2">환불 완료</p>
                                                    <h6 class="mb-0">${map.refundDone} 건</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="faq-content-list">
                                    <div>
                                        <c:if test="${!empty refundList}">
                                            <c:forEach var="refund" items="${refundList}">
                                                <div style="display: block;">
                                                    <i class="fa-solid fa-apple-whole"></i>
                                                    <button class="faq-list" data-bs-toggle="collapse" data-bs-target="#collapse-${refund.orderCode}"> 주문 번호 : ${refund.orderCode} / ${refund.refundAmount} 원</button>
                                                </div>
                                                <div class="faq-content collapse" id="collapse-${refund.orderCode}">
                                                    <table class="table table-borderless farmTable mt-4">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">주문 번호</th>
                                                                <th scope="col">주문자 아이디(이름)</th>
                                                                <th scope="col">주문일 / 환불 요청일</th>
                                                                <th scope="col">환불 금액</th>
                                                                <th scope="col">옵션 * 수량</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>${refund.orderCode}</td>
                                                                <td>${refund.customerEmail} (${refund.customerName})</td>
                                                                <td>${refund.orderDate} / ${refund.refundDate}</td>
                                                                <td>${refund.refundAmount}</td>

                                                                <c:forEach var="option" items="${refund.optionList}">
                                                                    <td>${option.productName} - ${option.optionName} * ${option.optionCount}</td>
                                                                </c:forEach>

                                                            </tr>
                                                            <c:choose>
                                                                <c:when test="${refund.refundStatement == 'N'}">
                                                                    <tr>
                                                                        <td>
                                                                            <button type="button" class="btn btn-active refundDone">환불 처리</button>
                                                                        </td>
                                                                    </tr>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <tr>
                                                                        <td>
                                                                            환불 처리 완료
                                                                        </td>
                                                                    </tr>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </c:forEach>
                                        </c:if>
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

    <script src="${contextPath}/resources/js/salesList.js"></script>

    <script>
        const contextPath = "${contextPath}";
    </script>

</body>

</html>