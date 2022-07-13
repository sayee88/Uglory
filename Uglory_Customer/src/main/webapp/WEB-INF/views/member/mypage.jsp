<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${contextPath}/resources/css/member/member.css" rel="stylesheet">
    <title>login</title>

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
    <link href="${contextPath}/resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />


    <!-- Customized Bootstrap Stylesheet -->
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${contextPath}/resources/css/style-1.css" rel="stylesheet">

    

</head>
<body>
    
    <main class="main">

    <jsp:include page="/WEB-INF/views/common/header-1.jsp" />

        <div class="myPage">
            <div class="myPage-info">
                <div class="myPage-nameBox">
                    <div class="nameBox">
                        <div class="nameSection">
                            <h3 class="name">${loginMember.memberName}고객님 </h3>
                        
                          
                        </div>
                    </div>
                </div>
                
                
                <div class="myPage-emailBox">
                    <p class="emailText">${loginMember.memberEmail}</p>
                    <button class="logoutBtn">로그아웃</button>
                </div>
                <div class=empty1></div>  
                <a href="${contextPath}/member/secession" class="myPageSecession">회원 탈퇴를 원하세요?</a>
            
            
            </div>
            <hr >
            <div class="myPage-item">
                
                <div class="itemBox">
                    <div class="item">
                        <img src="${contextPath}/resources/img/PYJ/mypage.png"  class="item-image">
                        <a href="${contextPath}/member/orderHistory" class="item-text">내 구독 현황</a>
                    </div>        
                </div>
                <div class="itemBox">
                    <div class="item">
                        <img src="${contextPath}/resources/img/PYJ/mypage.png"  class="item-image">
                        <a href="${contextPath}/member/orderHistory" class="item-text">주문내역</a>
                    </div>        
                </div>
                <div class="itemBox">
                    <div class="item">
                        <img src="${contextPath}/resources/img/PYJ/mypage.png"  class="item-image">
                        <a href="${contextPath}/member/subscriptionHistory" class="item-text">구독내역</a>
                    </div>        
                </div>


            </div>
        </div>

    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    
</body>
</html>