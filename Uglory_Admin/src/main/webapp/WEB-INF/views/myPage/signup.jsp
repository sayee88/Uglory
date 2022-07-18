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
                            <a href="${contextPath}">
                                <img src="${contextPath}/resources/img/Uglory_AdminMintLogo.png" style="height:56px;" alt="Uglory">
                            </a>
                            <h4 id="signUp" class="mb-0 mt-3 text-primary">Sign Up</h4>
                        </div>

                        <form action="signUp" method="POST" name="signUp-form" enctype="multipart/form-data" onsubmit="return signUpValidate()">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="adminName" name="adminName" placeholder="Admin name">
                                <label for="adminName">Admin name</label>
                            </div>
                            <div class="form-floating mb-1">
                                <input type="email" class="form-control" id="adminEmail" name="adminEmail" placeholder="Email address">
                                <label for="adminEmail">Email address</label>
                            </div>
                            <p class="text-success mb-3" id="emailMessage"></p>
                            <div class="form-floating mb-3">
                                <input type="password" class="form-control" id="adminPw" name="adminPw" placeholder="Password">
                                <label for="adminPw">Password</label>
                            </div>
                            <div class="form-floating mb-1">
                                <input type="password" class="form-control" id="adminPwConfirm" placeholder="Password Confirm">
                                <label for="adminPwConfirm">Password Confirm</label>
                            </div>
                            <p class="text-danger mb-3" id="pwMessage"></p>

                            <div class="form-floating mb-3">
                                <input type="password" class="form-control" id="approvalNumber" placeholder="Approval number">
                                <label for="approvalNumber">Approval number</label>
                            </div>

                            <p class="mt-2 mb-1" style="color: #757575;">Profile Image</p>
                            <input type="file" class="productInput mb-4" name="uploadImage" accept="image/*">
                        
                            <button class="btn btn-primary py-3 w-100 mb-4" style="font-size: 20px;">Sign Up</button>
                        </form>
                        <p class="text-center mb-0">Already have an Account? <a href="${contextPath}/signIn">Sign In</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sign Up End -->
    </div>

    <c:if test="${ !empty message }">
    <script>
        alert("${message}");
    </script>
    </c:if>

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
    <script src="${contextPath}/resources/js/myPage.js"></script>
</body>

</html>