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
                <section class="row justify-content-center mx-0 m-5">
                    <article class="col-lg-12 bg-light rounded p-4">
                        <h2>상품 설명 등록</h2>
                        <p class="ms-1">(나는 당근이라네)</p>
                        <hr>
                        <form action="" style="font-size:16px;">

                            <!-- summer note 추가 예정 -->
                            <textarea name="editordata" id="summernote"></textarea>
                            <!-- https://programmer93.tistory.com/31?category=865642 -->

                            <div class="text-end w-100">
                                <button type="button" class="btn btn-lg btn-secondary m-1">취소</button>
                                <button class="btn btn-lg btn-primary m-1">등록</button>
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

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <%-- <script src="${contextPath}/resources/lib/chart/chart.min.js"></script> --%>
    <script src="${contextPath}/resources/lib/easing/easing.min.js"></script>
    <script src="${contextPath}/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${contextPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/moment.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- summernote js 파일 -->
    <script src="${contextPath}/resources/js/summernote/summernote-lite.min.js"></script>
    <script src="${contextPath}/resources/js/summernote/lang/summernote-ko-KR.min.js"></script>

    <script src="${contextPath}/resources/js/adminPInfo.js"></script>

    <!-- Template Javascript -->
    <script src="${contextPath}/resources/js/main.js"></script>
</body>

</html>