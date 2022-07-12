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

    <!-- Favicon -->
    <link href="../img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../css/style.css" rel="stylesheet">

    <link rel="stylesheet" href="../css/subscription.css">

    
    
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div id="box">
        <div style="width: 70%;">

            
            <div class="inner-box" >
                <div class="step-text">
                    <h3 id="step-text">STEP 5</h3>
                    <h2>주문 확인 및 결제</h2>
                </div>
                
                <div class="outer-table">
                    <div class="gray-box">
                        <table id="table3">
                            <tr>
                                <th class="white-th" colspan="2">결제 금액</th>
                            </tr>
                            <tr>
                                <th>친환경 못난이 채소박스[스탠다드]</th>
                                <th>15,500원</th>
                            </tr>
                            <tr>
                                <th>배송비</th>
                                <th>0원</th>
                            </tr>
                            <tr></tr>
                            <tr>
                                <th class="white-th" colspan="2">총 결제 금액</th>
                            </tr>
                            <tr>
                                <th>첫 배송 날짜</th>
                                <th>2022-07-09</th>
                            </tr>
                            <tr>
                                <th colspan="2">-배송 주기 : <span style="color: red;">격주</span></th>
                            </tr>
                            <tr></tr>
                            <tr>
                                <th class="white-th" colspan="2">결제 수단</th>
                            </tr>
                            <tr>
                                <th colspan="2"><input type="radio" checked> 카카오페이</th>
                            </tr>
                            <tr>
                                <th class="submit-btn-th" colspan="2"><button class="submit-btn">구독하기</button></th>
                            </tr>
                        </table>
                        
                    </div>

                </div>

            </div>
        </div>
    </div>

        




    <%-- fotter --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <%-- jQuery --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="../js/main.js"></script>

    <!-- bootstrap Javascript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
</body>

</html>