<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<% response.setStatus(200);%>
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

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js" integrity="sha512-sW/w8s4RWTdFFSduOTGtk4isV1+190E/GghVffMA9XczdJ2MDzSzLEubKAs5h0wzgSJOQTRYyaz73L3d6RtJSg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <!-- Fontawesome cdn 링크 -->
        <script src="https://kit.fontawesome.com/1ef9913073.js" crossorigin="anonymous"></script>

        
    </head>

    <body>
        <div class="container-xxl position-relative bg-white d-flex p-0">
            <!-- Spinner include -->
            <jsp:include page="/WEB-INF/views/common/spinner.jsp"/>


            <!-- Sidebar include -->
            <jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>


            <!-- Content Start -->
            <div class="content">
                <!-- Header include -->
                <jsp:include page="/WEB-INF/views/common/header.jsp"/>


                <!-- 404 Start -->
                <div style="text-align:center;">
                    <img src="${contextPath}/resources/img/404.jpg" style="display: block; width: 100%;">
                    <a class="btn btn-primary rounded-pill py-3 px-5" style="margin: 50px;" href="${contextPath}">Go Back To Home</a>
                </div>
                <!-- 404 End -->

                <!-- Footer include -->
                <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

            </div>
            <!-- Content End -->

            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <%-- <script src="lib/chart/chart.min.js"></script> --%>
        <script src="${contextPath}/resources/lib/easing/easing.min.js"></script>
        <script src="${contextPath}/resources/lib/waypoints/waypoints.min.js"></script>
        <script src="${contextPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="${contextPath}/resources/lib/tempusdominus/js/moment.min.js"></script>
        <script src="${contextPath}/resources/lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="${contextPath}/resources/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="${contextPath}/resources/js/main.js"></script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    </body>

</html>