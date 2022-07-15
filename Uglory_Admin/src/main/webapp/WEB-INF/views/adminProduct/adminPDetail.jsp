<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="product" value="${detailMap.product}" />
<c:set var="farm" value="${detailMap.farm}" />
<c:set var="optionList" value="${detailMap.optionType}" />
<c:set var="imageList" value="${detailMap.productImage}" />

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

            <!-- 상품 상세 조회 -->
            <main class="container-fluid pt-4 px-4">
                <section class="row justify-content-center mx-0 m-5 p-4">
                    <article class="col-lg-12 p-1">
                        <div class="productNo">${product.productCode}</div>
                        <div class="detailHead">
                            <h1 class="">${product.productName}</h1>
                            <div class="dateBox">
                                <p>상품 등록일 : ${product.productDateCh}</p>

                                <c:if test="${product.productUpdateCh} != ''">
                                    <p>최종 수정일 : ${product.productUpdateCh}</p>
                                </c:if>
                            </div>
                        </div>
                        <hr>

                        <div class="detailBody">
                            <h2>상품 정보</h2>

                            <div class="detail-con row justify-content-between">
                                <div class="col-sm-12 col-md-6 p-2 mb-2">
                                    <div class="bg-light rounded info-box p-3">

                                        <table class="table text-center">
                                            <tr class="first-row">
                                                <th>상품 분류</th>
                                                <td>${product.productCategory}</td>
                                            </tr>
                                            <tr>
                                                <th>상품 가격</th>
                                                <td>${product.productPrice}원</td>
                                            </tr>
                                            <tr>
                                                <th>상품 상태</th>
                                                <td id="state-btn">
                                                    <button class="btn btn-success in-btn">입고</button>
                                                    <button class="btn btn-outline-secondary out-btn">품절</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>원산지</th>
                                                <td>${farm.origin}</td>
                                            </tr>
                                            <tr class="last-row">
                                                <th>생산자</th>
                                                <td>${farm.farmName}(${farm.producer})</td>
                                            </tr>
                                        </table>

                                    </div>
                                </div>

                                <div class="col-sm-12 col-md-6 p-2">
                                    <div class="bg-light rounded mb-2 p-3">
                                        <h4>옵션 정보</h4>

                                        <table class="table text-center mb-0">
                                            <div class="tableLine"></div>
                                            <c:choose>
                                                <c:when test="${empty optionList}">
                                                    <tr>
                                                        <th colspan="3">옵션 정보가 없습니다.</th>
                                                    </tr>
                                                </c:when>

                                                <c:otherwise>

                                                    <c:forEach var="option" items="${optionList}">
                                                    
                                                        <tr>
                                                            <th>${option.optionCode}</th>
                                                            <td>${option.optionName}</td>
                                                            <td>${option.optionPrice}원</td>
                                                        </tr>
                                                        
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                        </table>
                                            <div class="tableLine"></div>

                                    </div>
                                    <div class="bg-light rounded p-2 mb-2 img-area">
                                        <img src="${contextPath}${imageList[0].imageRoot}" alt="상품이미지" class="detail-img">
                                        <div>
                                            <h4>첨부 이미지</h4>
                                            <a href="#" id="pre-img" data-bs-toggle="modal" data-bs-target="#exampleModal">이미지 미리보기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        
                    </article>

                    <hr>

                    <article>
                        <h2>상품 설명</h2>

                        <div class="detail-info">${product.productInfo}</div>

                        <div class="detail-btn">
                            <button type="button" class="btn btn-primary">목록으로</button>
                            <button type="button" class="btn btn-primary">수정</button>
                        </div>
                    </article>
                </section>
            </main>

            <!-- Footer include -->
            <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

        </div>
        <!-- Content End -->

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">이미지 미리보기</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    
                        <!-- 이미지 캐러셀(슬라이드) -->
                        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                            
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="${contextPath}/resources/img/vegetables-2485055.jpg" class="d-block w-100" alt="채소">
                                </div>
                                <div class="carousel-item">
                                    <img src="${contextPath}/resources/img/vegetables-2485055.jpg" class="d-block w-100" alt="채소">
                                </div>
                                <div class="carousel-item">
                                    <img src="${contextPath}/resources/img/vegetables-2485055.jpg" class="d-block w-100" alt="채소">
                                </div>
                                <div class="carousel-item">
                                    <img src="${contextPath}/resources/img/vegetables-2485055.jpg" class="d-block w-100" alt="채소">
                                </div>
                            </div>

                            <div class="carousel-indicators">
                                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
                            </div>

                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- Modal 끝 -->

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <script>
        console.log('${imageList[0].imageLevel}');
        console.log('${imageList[0].imageRoot}');

        console.log('${product.productState}');
        const productState = '${product.productState}'
    </script>

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
    <script src="${contextPath}/resources/js/adminPDetail.js"></script>  

</body>

</html>