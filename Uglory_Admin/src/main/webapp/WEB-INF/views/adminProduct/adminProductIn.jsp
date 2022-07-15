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
                    <article class="col-xl-6 col-lg-8 text-center bg-light product-margin p-4 rounded">
                        <form action="">
                            <h2 class="text-start">상품 등록</h2>
                            <hr>

                            <div class="product-row">
                                <span class="fw-bold">상품 분류</span>
                                <div class="productWrap">
                                    <select name="" id="" class="productInput ps-1">
                                        <option value="">근채류</option>
                                        <option value="">두류/곡류/견과류</option>
                                        <option value="">조미채소류</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="product-row">
                                <span class="fw-bold">상품명</span>
                                <div class="productWrap">
                                    <input type="text" class="productInput ps-1" placeholder="상품명">
                                    <div class="inputMessage text-danger">상품은 한글만 입력해주세요</div>
                                </div>
                            </div>
                            
                            <div class="product-row">
                                <span class="fw-bold">생산자</span>
                                <div class="productWrap">
                                    <select name="" id="" class="productInput ps-1">
                                        <option value="">당근 농장</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="product-row">
                                <span class="fw-bold">상품 가격</span>
                                <div class="productWrap">
                                    <input type="number" class="productInput ps-1">
                                </div>
                            </div>

                            <div class="product-row">
                                <span class="fw-bold">상품 이미지</span>
                                <div class="productWrap">
                                    <input type="file" class="productInput">
                                    <input type="file" class="productInput">
                                    <input type="file" class="productInput">
                                    <input type="file" class="productInput">
                                </div>
                            </div>

                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                상품설명 작성
                            </button>
                            
                            <div class="product-row">
                                <button type="button" class="btn btn-lg btn-primary m-1 w-100">취소</button>
                                <button class="btn btn-lg btn-primary m-1 w-100">다음</button>
                            </div>

                        </form>
                    </article>
                </section>
            </main>

            <!-- Footer include -->
            <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
            
        </div>
        <!-- Content End -->


        <!-- Modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">상품 설명 작성</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <textarea name="editordata" id="summernote"></textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Understood</button>
            </div>
            </div>
        </div>
        </div>

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

    <!-- summernote js 파일 -->
    <script src="${contextPath}/resources/js/summernote/summernote-lite.min.js"></script>
    <script src="${contextPath}/resources/js/summernote/lang/summernote-ko-KR.min.js"></script>

    <!-- Template Javascript -->
    <script src="${contextPath}/resources/js/main.js"></script>
    <script src="${contextPath}/resources/js/adminPInsert.js"></script>

</body>

</html>