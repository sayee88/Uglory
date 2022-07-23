<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>

    <%-- favicon --%>
    <link rel="icon" href="${contextPath}/resources/img/main/logo/favicon.ico" />

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

    <link href="${contextPath}/resources/css/member/member.css" rel="stylesheet">
    

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
                
                <%-- ${contextPath}/member/logout --%>
                <div class="myPage-emailBox">
                    <p class="emailText">${loginMember.memberEmail}</p>
                    <a href="#" onclick="kakaoLogout()" class="logoutBtn">로그아웃</a>
                </div>
                <div class=empty1></div>  
                <a href="${contextPath}/member/secession" class="myPageSecession">
                    <img src="${contextPath}/resources/img/myPage/door.png" style="width:40px; height:40px;">
                    회원 탈퇴를 원하세요?</a>
                </div>
            <hr>
            <div class="myPage-item">
                
                <div class="itemBox">
                    <div class="item">
                        
                        <a href="${contextPath}/member/subscriptionStatus" class="item-text"><img src="${contextPath}/resources/img/myPage/mypage_sub.png" style="padding-bottom:15px"  class="item-image">
                        내 구독 현황</a>
                    </div>        
                </div>
                <div class="itemBox">
                    <div class="item">
                       
                        <a href="${contextPath}/member/orderHistory" class="item-text"> <img src="${contextPath}/resources/img/myPage/mypage_order.png" style="padding-bottom:15px" class="item-image">주문내역</a>
                    </div>        
                </div>
                <div class="itemBox">
                    <div class="item">
                       
                        <a href="${contextPath}/member/subscriptionHistory" class="item-text"> <img src="${contextPath}/resources/img/myPage/mypage_subOrder.png" style="padding-bottom:15px" class="item-image">구독내역</a>
                    </div>        
                </div>


            </div>
        </div>

    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <%-- <!— jQuery 추가 —> --%>
    
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

    
    
    <%-- Template Javascript  --%>
    <%-- <script src="${contextPath}/resources/js/main.js"></script>  --%>

    <script>
        const contextPath = "${contextPath}";
    </script>


    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
        <script>
        /* function kakaoLogout() {
            
            if (Kakao.Auth.getAccessToken()) {
            Kakao.API.request({
                url: '/v1/user/unlink',
                success: function (response) {
                    console.log(response)
                },
                fail: function (error) {
                console.log(error)
                },
            })
            Kakao.Auth.setAccessToken(undefined)
            }
        }  */
        function kakaoLogout() {
            Kakao.init('d16c24decd0c24025e4473a953442aa0'); // 초기화
            Kakao.isInitialized();
            Kakao.Auth.setAccessToken(Kakao.Auth.getAccessToken());

            Kakao.API.request({
            url: '/v1/user/unlink',
            success: function(response) {
                console.log(response);
                    location.href = contextPath + "/member/logout";
                },
                fail: function(error) {
                    //alert('탈퇴처리가 미완료되었습니다. \n관리자에게 문의하시기 바랍니다.');
                    location.href = contextPath + "/member/logout";
                console.log(error);
                }
            });
        };

    </script>
    
</body>
</html>