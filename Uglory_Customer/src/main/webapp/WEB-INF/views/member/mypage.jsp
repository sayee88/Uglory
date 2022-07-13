<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myPage</title>
    <link href="resources/css/member/member.css" rel="stylesheet">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />


    <!-- Customized Bootstrap Stylesheet -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="resources/css/style-1.css" rel="stylesheet">
   
</head>
<body>
    <main class="main">

     <jsp:include page="/WEB-INF/views/common/header-1.jsp" />

        <div class="myPage">
            <div class="myPage-info">
                <div class="myPage-nameBox">
                    <div class="nameBox">
                        <div class="nameSection">
                            <span class="name">박예찐</span>
                            <div class="subsBtn">
                                <img src="" alt="" class="icon">
                            </div>
                        </div>
                    </div>
                </div>
                
                
                <div class="myPage-emailBox">
                    <p class="emailText">justlikeyejin@gmail.com</p>
                    <button class="logoutBtn">로그아웃</button>
                </div>
                <a href="" class="myPageSecession">회원 탈퇴를 원하세요?</a>
            
            
            </div>
            <hr >
            <div class="myPage-item">
                
                <div class="itemBox">
                    <div class="item">
                        <img src="/resources/img/PYJ/mypage.png"  class="item-image">
                        <p class="item-text">주문내역</p>
                    </div>        
                </div>
                <div class="itemBox">
                    <div class="item">
                        <img src="/resources/img/PYJ/mypage.png"  class="item-image">
                        <p class="item-text">구독내역</p>
                    </div>        
                </div>


            </div>
        </div>

    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    
</body>
</html>