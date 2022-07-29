<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pagination" value="${map.pagination}" />
<c:set var="farmList" value="${map.farmList}" />

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
    
    <!-- Product Style sheet -->
    <link href="${contextPath}/resources/css/adminproduct-style.css" rel="stylesheet">

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

            <!-- 농장 목록 조회 -->
            <main class="container-fluid pt-4 px-4">
                <section class="row bg-light rounded justify-content-center mx-0 m-5 p-4">
                    <article class="col-lg-12 text-center">
                        <h2 class="text-start">농장 관리</h2>
                        <hr>

                        <table class="table table-borderless farmTable mt-4">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">농장 이름</th>
                                    <th scope="col">생산자</th>
                                    <th scope="col">원산지</th>
                                    <th scope="col">삭제</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${empty farmList}">
                                        <tr>
                                            <td colspan="5">등록된 농장이 없습니다.</td>
                                        </tr>
                                    </c:when>

                                    <c:otherwise>
                                        <c:forEach var="farm" items="${farmList}">
                                            <tr>
                                                <th scope="row">${farm.farmNo}</th>
                                                <td>${farm.farmName}</td>
                                                <td>${farm.producer}</td>
                                                <td>${farm.origin}</td>
                                                <td>
                                                    <button type="button" class="btn btn-danger" onclick="deleteFarm(${farm.farmNo})">삭제</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                                
                            </tbody>
                        </table>
                        
                        <a href="insert" class="farmInBtn"><i class="fa-solid fa-plus"></i> 농장 추가하기</a>

                        <c:if test="${!empty pagination}">
                            <%-- 페이지네이션 --%>
                            <div class="pagination-area mt-4 row">
                                <!-- 페이지네이션 a태그에 사용될 공통 주소를 저장한 변수 선언 -->
                                <c:set var="url" value="?cp="/>
                                <%-- selectAll?cp= --%>

                                <ul class="pagination justify-content-center">
                                    <!-- 첫 페이지로 이동 -->
                                    <li class="m-1"><a href="${url}1"><i class="fa-solid fa-angles-left"></i></a></li>

                                    <!-- 이전 목록 마지막 번호로 이동 -->
                                    <li class="m-1"><a href="${url}${pagination.prevPage}"><i class="fa-solid fa-angle-left"></i></a></li>

                                    <!-- 범위가 정해진 일반 for문 사용 -->
                                    <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

                                        <c:choose>
                                            <c:when test="${i == pagination.currentPage}">
                                                <li class="m-1"><a class="current">${i}</a></li>
                                            </c:when>

                                            <c:otherwise>
                                                <li class="m-1"><a href="${url}${i}">${i}</a></li>        
                                            </c:otherwise>
                                        </c:choose>

                                    </c:forEach>
                                    
                                    <!-- 다음 목록 시작 번호로 이동 -->
                                    <li class="m-1"><a href="${url}${pagination.nextPage}"><i class="fa-solid fa-angle-right"></i></a></li>

                                    <!-- 끝 페이지로 이동 -->
                                    <li class="m-1"><a href="${url}${pagination.maxPage}"><i class="fa-solid fa-angles-right"></i></a></li>
                                </ul>
                            </div>
                        </c:if>


                    </article>
                </section>
            </main>

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
    <script src="${contextPath}/resources/lib/easing/easing.min.js"></script>
    <script src="${contextPath}/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${contextPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/moment.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="${contextPath}/resources/js/main.js"></script>  
    <script src="${contextPath}/resources/js/adminFarm.js"></script>

</body>

</html>