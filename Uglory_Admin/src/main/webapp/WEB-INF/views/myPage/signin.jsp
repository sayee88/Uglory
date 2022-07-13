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

        <!-- Sign In Start -->
        <div class="container-fluid" style="background-color: #F3F6F9;">
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                    <div class="bg-light rounded p-4 p-sm-8 my-4 mx-3">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <a href="${contextPath}">
                                <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>UGLORY</h3>
                            </a>
                            <h3>Sign In</h3>
                        </div>

                        <form action="signIn" method="POST" name="login-form" onsubmit="return loginValidate()">
                            <div class="form-floating mb-3">
                                <input type="email" class="form-control" id="inputEmail" name="adminEmail" value="${cookie.saveId.value}">
                                <label for="inputEmail">Email address</label>
                            </div>
                            <div class="form-floating mb-4">
                                <input type="password" class="form-control" id="inputPw" name="adminPw">
                                <label for="inputPw">Password</label>
                            </div>

                            <%-- 쿠키에 saveId가 있는 경우--%>
                            <c:if test="${ !empty cookie.saveId.value}">

                                <%-- chk 변수 생성(page scope)--%>
                                <c:set var="chk" value="checked"/>

                            </c:if>

                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="saveId" name="saveId" ${chk}>
                                    <label class="form-check-label" for="saveId">Check me out</label>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary py-3 w-100 mb-4" style="font-size: 20px;">Sign In</button>
                        </form>
                        
                        <p class="text-center mb-0">Don't have an Account? <a href="${contextPath}/signUp">Sign Up</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sign In End -->
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