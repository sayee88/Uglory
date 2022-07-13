<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Navbar Start -->
<header class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
    <a href="${contextPath}" class="navbar-brand d-flex d-lg-none me-4">
        <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
    </a>
    <a href="#" class="sidebar-toggler flex-shrink-0">
        <i class="fa fa-bars"></i>
    </a>
    
    <div class="navbar-nav align-items-center ms-auto">
        <div class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                <img class="rounded-circle me-lg-2" src="${contextPath}/resources/img/seed.jpg" alt="프로필 사진" style="width: 40px; height: 40px;">
                <span class="d-none d-lg-inline-flex fw-bold">로그인이 필요합니다</span>
            </a>
            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                <a href="${contextPath}/signIn" class="dropdown-item text-center">Sign In</a>
                <a href="${contextPath}/signUp" class="dropdown-item text-center">Sign UP</a>
            </div>
        </div>
    </div>
</header>
<!-- Navbar End -->