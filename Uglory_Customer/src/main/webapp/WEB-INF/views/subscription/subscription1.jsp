<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Restoran - Bootstrap Restaurant Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <%-- favicon --%>
    <link rel="icon" href="${contextPath}/resources/img/main/logo/favicon.ico" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${contextPath}/resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">

    <link rel="stylesheet" href="${contextPath}/resources/css/subscription.css">

    <style>
        .modal{
            max-height:1000px;
        }
    </style>
    
    
</head>

<body>
        <jsp:include page="/WEB-INF/views/common/header-1.jsp" />

    <form action="${contextPath}/subscription/order" onsubmit="return subscriptionValidate()">

                <%-- choice = ${choice}<hr> --%>

        <div id="box" style="padding-bottom: 200px;">
            <div style="width: 70%;">

                <div class="inner-box">
                    <div>
                        <h3 id="step-text">STEP 1</h3>
                        <h2>구독 상품을 선택해주세요 📦 </h2>
                        <pre>매 주 나에게 맞는 6~10종의
다양한 채소/과일이 들어가요
                        </pre>
                    </div>
    
                    <div class="container" style="margin-top: 100px;">


                        <div class="row row-cols-2">
                            
                            <div class="col">
                                <div id="fieldset1" style="display:flex; justify-content:center;">
                                    <input id="standard-check" type="radio" name="box" value="1">
                                    <label for="standard-check">
                                        <img src="${contextPath}/resources/img/product/standard.png" style="cursor: pointer;">
                                        <div>
                                            <h5 id="box-name">📦 스탠다드 박스</h5>
                                            <p id="box-intro">1-2인 가구에게 적합해요</p>
                                        </div>
                                    </label>
                                </div> 
                            </div>

                            <div class="col">
                                <div id="fieldset1" style="display:flex; justify-content:center;">
                                    <input id="jumbo-check" type="radio" name="box" value="2">
                                    <label for="jumbo-check">
                                        <img src="${contextPath}/resources/img/product/jumbo.png" style="cursor: pointer;">
                                        <div>
                                            <h5 id="box-name">📦 점보 박스</h5>
                                            <p id="box-intro">3-4인 가구에게 적합해요</p>
                                        </div>
                                    </label>
                                </div> 
                            </div>

                        </div>
                    </div>

                </div>


                <div class="step2">

                    <div class="step-text">
                        <h3 id="step-text">STEP 2</h3>
                        <h2>배송 주기를 선택해주세요 📆</h2>
                    </div>
                    <div class="container" style="display: flex; justify-content: center;">
                        <div>
                            <input type="radio" class="btn-check" name="cycle" id="danger-outlined1" autocomplete="off" value="1">
                            <label class="btn btn-outline-danger week-btn" for="danger-outlined1">매주</label> 
                            <div class="wed">매주 수요일 발송됩니다</div>
                        </div>
                        <div>
                            <input type="radio" class="btn-check" name="cycle" id="danger-outlined2" autocomplete="off" value="2">
                            <label class="btn btn-outline-danger week-btn" for="danger-outlined2">격주</label>   
                            <div class="wed">둘째, 넷째 주 수요일 발송됩니다</div>
                        </div>
                    </div>

                </div>

                
                <div class="step3" style="padding: 120px 0;">

                    <div class="step-text">
                        <h3 id="step-text">STEP 3</h3>
                        <h2 style="margin-bottom: 100px;">제외할 채소를 골라주세요 😵</h2>
                    </div>

                    <div class="step3-container">

                        <!-- Button trigger modal -->
                        <button type="button" id="exception-btn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            ❌ 제외할 채소 고르기
                        </button>
                        
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                <div class="modal-content">
                                    <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">제외할 채소 고르기</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="xbtn"></button>
                                    </div>
                                    <div class="modal-body">


                                        <div class="container">

                                            <div style="display:flex; justify-content:center; margin:30px 0;">
                                                
                                                <table style="text-align:center;">
                                                    <tr><td><img src="${contextPath}/resources/img/product/제외채소.jpg" style="width:150px;"></td></tr>
                                                    <tr><th><h2>알러지 선택</h2></th></tr>
                                                    <tr><td><h4>선택 시, 다른 품목으로 대체해 보내드려요.</h4></td></tr>
                                                    <tr><td><h4>섭취가 불가한 채소가 아니라면 다양하게 즐겨보세요!</h4></td></tr>
                                                </table>
                                            </div>

                                        
                                            <div class="row">
                                                <c:forEach var="product" items="${productList}" >
                                                    <div class="col-md-4 col">
                                                        <input class="form-check-input" name="choice" onclick="count_check(this);" type="checkbox" id="product${product.productCode}" value="${product.productCode}">
                                                        <label class="form-check-label" for="product${product.productCode}">${product.productName}</label>
                                                    </div>
                                                </c:forEach>
                                            </div>

                                            
                                        </div>



                                    </div>
                                    <div class="modal-footer">
                                    <button type="button" class="btn btn-primary"  data-bs-dismiss="modal" style="background-color: #ff4444;">확인</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div style="text-align: center; margin: 100px 0">
                            <button class="submit-btn"> 다음</button>
                        </div>

                    </div>

                </div>
                
            </div>

        </div>

    </form>

        


    <%-- fotter --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <%-- jQuery --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <%-- 전역변수 선언 --%>
    <script>
        const contextPath = "${contextPath}";
    </script>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${contextPath}/resources/lib/wow/wow.min.js"></script>
    <script src="${contextPath}/resources/lib/easing/easing.min.js"></script>
    <script src="${contextPath}/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${contextPath}/resources/lib/counterup/counterup.min.js"></script>
    <script src="${contextPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/moment.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="${contextPath}/resources/js/main.js"></script>

    <!-- bootstrap Javascript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <script src="${contextPath}/resources/js/subscription.js"></script>

</body>

</html>