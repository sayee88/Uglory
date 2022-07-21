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
    
    <!-- Product Style sheet -->
    <link href="${contextPath}/resources/css/adminproduct-style.css" rel="stylesheet">

    <!-- Fontawesome cdn 링크 -->
    <script src="https://kit.fontawesome.com/1ef9913073.js" crossorigin="anonymous"></script>

    <!-- summernote css 파일 -->
    <link rel="stylesheet" href="${contextPath}/resources/css/summernote/summernote-lite.min.css">
    
    <!-- summernote 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">

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

            <!-- 상품 등록 form태그 -->
            <main class="container-fluid pt-4 px-4">
                <section class="row justify-content-center mx-0 ">
                    <article class="col-xl-6 col-md-8 bg-light product-margin p-4 rounded">

                        <form action="register?mode=${mode}&productCode=${product.productCode}" enctype="multipart/form-data" method="POST" onsubmit="return productValidate()">
                            <h2 class="text-start">상품 등록</h2>
                            <hr>

                            <div class="product-row">
                                <span class="fw-bold">상품 분류</span>
                                <div class="productWrap">
                                    <select name="productCategoryNo" id="category" class="productInput ps-1">
                                        <c:if test="${!empty categoryList}">
                                            <c:forEach var="category" items="${categoryList}">
                                                <c:if test="${category.productCategoryNo == product.productCategoryNo}">
                                                    <option value="${category.productCategoryNo}" selected>${category.productCategoryName}</option>
                                                </c:if>
                                                <option value="${category.productCategoryNo}">${category.productCategoryName}</option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="product-row">
                                <span class="fw-bold">상품명</span>
                                <div class="productWrap">
                                    <%-- 상품명 중복검사 + 한글 입력 유효성 검사 --%>
                                    <input name="productName" id="productName" type="text" class="productInput ps-1" placeholder="상품명" value="${product.productName}">
                                    <div class="inputMessage" id="pnameText">상품명을 입력해주세요.</div>
                                </div>
                            </div>
                            
                            <div class="product-row">
                                <span class="fw-bold">생산자</span>
                                <div class="productWrap">
                                    <select name="farmNo" id="farm" class="productInput ps-1">
                                        <c:if test="${!empty farmList}">
                                            <c:forEach var="farm" items="${farmList}">
                                                <c:if test="${farm.farmNo == product.farmNo}">
                                                    <option value="${farm.farmNo}" selected>${farm.farmName}</option>
                                                </c:if>
                                                <option value="${farm.farmNo}">${farm.farmName}</option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="product-row">
                                <span class="fw-bold">상품 가격</span>
                                <div class="productWrap">
                                    <input name="productPrice" id="productPrice" type="number" class="productInput ps-1" value="${product.productPrice}">
                                </div>
                            </div>

                            <div class="product-row">
                                <span class="fw-bold">상품 이미지</span>
                                <div class="imgWrap thumbnailWrap">
                                    <label for="productImg0">
                                        <img class="preview" src="">
                                    </label>
                                    <input type="file" class="inputImage" name="productImg" id="productImg0" accept="image/*">
                                </div>
                            </div>

                            <div class="product-row">
                                <div class="imgWrap">
                                    <label for="productImg1">
                                        <img class="preview" src="">
                                    </label>
                                    <input type="file" class="inputImage" name="productImg" id="productImg1" accept="image/*">
                                </div>

                                <div class="imgWrap">
                                    <label for="productImg2">
                                        <img class="preview" src="">
                                    </label>
                                    <input type="file" class="inputImage" name="productImg" id="productImg2" accept="image/*">
                                </div>

                                <div class="imgWrap">
                                    <label for="productImg3">
                                        <img class="preview" src="">
                                    </label>
                                    <input type="file" class="inputImage" name="productImg" id="productImg3" accept="image/*">
                                </div>
                            </div>

                            <!-- Button trigger modal -->
                            <div class="info-btn-area ps-3 pe-3">
                                <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                    상품설명 작성
                                </button>
                                <p class="m-0">
                                    <%-- summernote 내용 있을때 전구 모양 변하기 --%>
                                    <i id="info-st" class="fa-regular fa-lightbulb text-warning" style="font-size:36px;"></i>
                                </p>
                            </div>
                            
                            <div class="product-row">
                                <%-- 취소 버튼 클릭 시 alret 띄우고 insert -> list로 / update -> detail로 --%>
                                <button id="calcelInsert" type="button" class="btn btn-lg btn-secondary m-1 w-100">취소</button>
                                <button class="btn btn-lg btn-primary m-1 w-100">등록</button>
                            </div>

                            <!-- Modal -->
                            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                <div class="modal-dialog modal-xl">
                                    <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">상품 설명 작성</h5>
                                    </div>
                                    <div class="modal-body">
                                        <textarea name="productInfo" id="summernote"></textarea>
                                    </div>
                                    <div class="modal-footer">
                                        <%-- 취소 버튼 클릭 시 alret 띄우고 summernote 내용 삭제 --%>
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="cancleNote">취소</button>
                                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">저장</button>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </form>
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

    <script>
        const contextPath = '${contextPath}';
        const mode = '${mode}';
        const productCode = '';
        const productInfo = '${product.productInfo}';
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

    <!-- summernote js 파일 -->
    <script src="${contextPath}/resources/js/summernote/summernote-lite.min.js"></script>
    <script src="${contextPath}/resources/js/summernote/lang/summernote-ko-KR.min.js"></script>

    <!-- Template Javascript -->
    <script src="${contextPath}/resources/js/main.js"></script>
    <script src="${contextPath}/resources/js/adminPInsert.js"></script>

</body>

</html>