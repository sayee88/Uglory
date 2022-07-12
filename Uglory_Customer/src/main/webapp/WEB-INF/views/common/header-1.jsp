<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<%-- 이미지 없는 헤더 --%>
<header>

    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <%-- <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div> --%>
        <!-- Spinner End -->

        <!-- Navbar & Hero Start -->
        <div class="container-xxl position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0 sticky-top shadow-sm">
                <a href="" class="navbar-brand p-0">
                    <h1 class="text-primary m-0"><i class="fa fa-utensils me-3"></i>Uglory</h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0 pe-4">
                        <a href="${contextPath}" class="nav-item nav-link active">Home</a>
                        <a href="Mission.html" class="nav-item nav-link">Mission</a>
                        <a href="About.html" class="nav-item nav-link">About</a>
                        <a href="Market.html" class="nav-item nav-link">Market</a>
                        <a href="Review.html" class="nav-item nav-link icon">Review</a>
                    </div>
                    <a href="#" class="nav-item icon"><img class="menu-chart" src="${contextPath}/resources/images/main/shopping-cart-white.png"></a>
                    <a href="${contextPath}/member/login" class="nav-item icon"><img class="menu-chart" src="${contextPath}/resources/images/main/user-white.png"></a>
                </div>
            </nav>
        </div>
    </div>
    <!-- Navbar & Hero End -->
</header>