<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Sidebar Start -->
<div class="sidebar pe-4 pb-3">
    <nav class="navbar bg-light navbar-light">
        <a href="index.html" class="navbar-brand mx-4 mb-3">
            <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>UGLORY</h3>
        </a>
        <div class="d-flex align-items-center ms-4 mb-4">
            <div class="position-relative">
                <img class="rounded-circle" src="../img/bananaKoongya.jpg" alt="" style="width: 40px; height: 40px;">
                <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
            </div>
            <div class="ms-3">
                <h6 class="mb-0">바나나 쿵야</h6>
                <span>Admin</span>
            </div>
        </div>

        <!-- 사이드바 내용 -->
        <div class="navbar-nav w-100">
            <!-- 회원 관리 -->
            <div class="nav-item dropdown">
                <a href="#" class="nav-link"><i class="fa-solid fa-user me-2"></i>회원 관리</a>
            </div>

            <!-- 상품 관리 -->
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa-solid fa-carrot me-2"></i>상품 관리</a>
                <div class="dropdown-menu bg-transparent border-0">
                    <div class="dropdown-item">
                        <a href="adminProductList.html" class="sub-menu">상품 조회</a>
                    </div>
                    <div class="dropdown-item">
                        <a href="adminProductIn.html" class="sub-menu">상품 등록</a>
                    </div>
                    <div class="dropdown-item">
                        <a href="adminPList.html" class="sub-menu">구독 상품 알림</a>
                    </div>
                </div>
            </div>

            <!-- 농장 관리 -->
            <div class="nav-item dropdown">
                                                                                        <!-- <i class="fa-solid fa-hat-cowboy me-2"></i> -->
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa-solid fa-house me-2"></i>농장 관리</a>
                <div class="dropdown-menu bg-transparent border-0">
                    <div class="dropdown-item">
                        <a href="adminFarmList.html" class="sub-menu">농장 조회</a>
                    </div>
                    <div class="dropdown-item">
                        <a href="adminFarmIn.html" class="sub-menu">농장 등록</a>
                    </div>
                </div>
            </div>

            <!-- 결제 관리 -->
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa-solid fa-user me-2"></i>결제&매출</a>
                <div class="dropdown-menu bg-transparent border-0">
                    <div class="dropdown-item">
                        <a href="" class="sub-menu">결제 관리</a>
                    </div>
                    <div class="dropdown-item">
                        <a href="signup.html" class="sub-menu">매출 관리</a>
                    </div>
                </div>
            </div>

            <!-- 리뷰게시판 관리 -->
            <div class="nav-item dropdown">
                <a href="#" class="nav-link"><i class="fa-solid fa-user me-2"></i>리뷰 관리</a>
            </div>

            <!-- 마이페이지 -->
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa-solid fa-user me-2"></i>마이페이지</a>
                <div class="dropdown-menu bg-transparent border-0">
                    <div class="dropdown-item">
                        <a href="signin.html" class="sub-menu">Sign In</a>
                    </div>
                    <div class="dropdown-item">
                        <a href="signup.html" class="sub-menu">Sign Up</a>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</div>
<!-- Sidebar End -->