<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<%-- 문자열 관련 함수(메서드) 제공 JSTL (EL형식으로 작성) --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:forEach var="customer" items="${customerList}">
    <c:set var="boardName" value="${boardType.boardName}" />
</c:forEach>

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


            <!-- 회원 관리 form태그 -->
            <div class="container-fluid pt-4 px-4">
                <div class="row bg-light rounded justify-content-center mx-0 m-5 p-4">
                    <div class="col-lg-12 text-center">
                        <h2 class="text-start">회원 관리</h2>
                        <hr>

                        <%-- 검색창 --%>
                        <div class="listHead">
                            <form action="selectAll">
                                <select name="key">
                                    <option value="customerEmail">회원 이메일</option>
                                    <option value="customerName">회원 이름</option>
                                </select>

                                <input type="text" name="query" id="memberSearch">
                                <button type="submit" class="btn btn-secondary"><i class="fa-solid fa-magnifying-glass"></i></button>
                            </form>
                        </div>

                        <%-- 메인 --%>
                        <div class="listBody">
                            <table class="table table-borderless farmTable mt-4">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">회원 이메일</th>
                                        <th scope="col">회원 이름</th>
                                        <th scope="col">구독 상태</th>
                                        <th scope="col">계정 정지</th>
                                    </tr>
                                </thead>
                                <tbody id="customerList">
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>test01@uglory.com</td>
                                        <td>양배추쿵야</td>
                                        <td>
                                            <button type="button" class="btn btn-subscription">구독 중</button>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-stopaccount">계정 정지</button>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="row">1</th>
                                        <td>test01@uglory.com</td>
                                        <td>양배추쿵야</td>
                                        <td>
                                            <button type="button" class="btn btn-secondary">구독</button>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-stopaccount">계정 정지</button>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>test01@uglory.com</td>
                                        <td>양배추쿵야</td>
                                        <td>
                                            <button type="button" class="btn btn-subscription">구독 중</button>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-stopaccount">계정 정지</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

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

    <%-- <script src="${contextPath}/resources/js/memberList.js"></script> --%>
</body>

</html>