<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">

        <!-- Spinner include -->
        <jsp:include page="/WEB-INF/views/common/spinner.jsp"/>

        <!-- Sign Up Start -->
        <div class="container-fluid" style="background-color: #F3F6F9;">
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                    <div class="bg-light rounded p-4 p-sm-8 my-4 mx-3">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <a href="index.html" class="">
                                <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>UGLORY</h3>
                            </a>
                            <h3>Sign Up</h3>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingText" placeholder="jhondoe">
                            <label for="floatingText">Username</label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                            <label for="floatingInput">Email address</label>
                        </div>
                        <p class="text-success">사용가능한 이메일입니다.</p>
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
                            <label for="floatingPassword">Password</label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
                            <label for="floatingPassword">Password Confirm</label>
                        </div>
                        <p class="text-danger">비밀번호가 일치하지 않습니다.</p>
                        
                        <button type="submit" class="btn btn-primary py-3 w-100 mb-4" style="font-size: 20px;">Sign Up</button>
                        <p class="text-center mb-0">Already have an Account? <a href="signin.html">Sign In</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sign Up End -->
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${contextPath}/lib/easing/easing.min.js"></script>
    <script src="${contextPath}/lib/waypoints/waypoints.min.js"></script>
    <script src="${contextPath}/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${contextPath}/lib/tempusdominus/js/moment.min.js"></script>
    <script src="${contextPath}/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="${contextPath}/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="${contextPath}/js/main.js"></script>
</body>

</html>