<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Sidebar Start -->
<div class="sidebar pe-4 pb-3">
    <nav class="navbar bg-light navbar-light">
        <a href="${contextPath}" class="navbar-brand mx-3 mb-3 pt-0">
            <img src="${contextPath}/resources/img/Uglory_AdminMintLogo.png" style="height:60px;" alt="Uglory">
        </a>

        <%-- 로그인 X --%>
        <c:if test="${ empty loginAdmin }">
            <div class="d-flex align-items-center ms-4 mb-4">
                <div class="position-relative">
                    <img class="rounded-circle" src="${contextPath}/resources/img/seed.jpg" alt="프로필 사진" style="width: 45px; height: 45px; opacity:0.5">
                    <div class="bg-danger rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                </div>
                <div class="ms-3">
                    <h6 class="mb-0 text-secondary">씨앗 쿵야</h6>
                    <span>Seed</span>
                </div>
            </div>
        </c:if>

        <%-- 로그인 O --%>
        <c:if test="${ !empty loginAdmin }">
            <div class="d-flex align-items-center ms-4 mb-4">
                <div class="position-relative">
                    <img class="rounded-circle" src="${contextPath}${loginAdmin.profileImage}" alt="프로필 사진" style="width: 45px; height: 45px;">
                    <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                </div>
                <div class="ms-3">
                    <h6 class="mb-0">${loginAdmin.adminName}</h6>
                    <span>Admin</span>
                </div>
            </div>
        </c:if>

        <!-- 사이드바 내용 -->
        <div class="navbar-nav w-100">
            <!-- 회원 관리 -->
            <div class="nav-item dropdown">
                <a href="${contextPath}/customer/selectAll" class="nav-link"><i class="fa-solid fa-people-group me-2"></i>회원 관리</a>
            </div>

            <!-- 상품 관리 -->
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa-solid fa-carrot me-2"></i>상품 관리</a>
                <div class="dropdown-menu bg-transparent border-0">
                    <div class="dropdown-item">
                        <a href="${contextPath}/product/list" class="sub-menu">상품 조회</a>
                    </div>
                    <div class="dropdown-item">
                        <a href="${contextPath}/product/register?mode=insert" class="sub-menu">상품 등록</a>
                    </div>
                    <div class="dropdown-item">
                        <a href="${contextPath}/product/weekly/list" class="sub-menu">구독 상품 알림</a>
                    </div>
                </div>
            </div>

            <!-- 농장 관리 -->
            <div class="nav-item dropdown">
                                                                                        <!-- <i class="fa-solid fa-hat-cowboy me-2"></i> -->
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa-solid fa-house me-2"></i>농장 관리</a>
                <div class="dropdown-menu bg-transparent border-0">
                    <div class="dropdown-item">
                        <a href="${contextPath}/farm/list" class="sub-menu">농장 조회</a>
                    </div>
                    <div class="dropdown-item">
                        <a href="${contextPath}/farm/insert" class="sub-menu">농장 등록</a>
                    </div>
                </div>
            </div>

            <!-- 결제 관리 -->
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa-solid fa-credit-card me-2"></i>결제&매출</a>
                <div class="dropdown-menu bg-transparent border-0">
                    <div class="dropdown-item">
                        <a href="${contextPath}/payment/selectAll" class="sub-menu">결제 관리</a>
                    </div>
                    <div class="dropdown-item">
                        <a href="${contextPath}/payment//refundList" class="sub-menu">매출 관리</a>
                    </div>
                </div>
            </div>

            <!-- 리뷰게시판 관리 -->
            <div class="nav-item dropdown">
                <a href="${contextPath}/review/selectAll" class="nav-link"><i class="fa-solid fa-clipboard-list me-2"></i>리뷰 관리</a>
            </div>

        </div>
    </nav>
</div>
<!-- Sidebar End -->