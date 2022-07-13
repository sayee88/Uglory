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

        <div class="login">
            <section class="login-area">
                <div class="login-text">로그인</div>
                <div class="login-full">
                    <a href="javascript:kakaoLogin();">
                        <img class="kakao" src="${contextPath}/resources/img/PYJ/kakao_login_medium_narrow.png" alt="카카오로그인"></a>
                </div>
            </section>
            
        </div>
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        //d16c24decd0c24025e4473a953442aa0
        window.Kakao.init("d16c24decd0c24025e4473a953442aa0");
      
        function kakaoLogin(){
            window.Kakao.Auth.login({
                scope:'profile_nickname , account_email',
                success:function(authObj){
                    console.log(authObj);
                    window.Kakao.API.request({
                        url:'/v2/user/me',
                        success:res=>{
                            console.log(res)
                            const kakao_account=res.kakao_account;
                            console.log(kakao_account);

                            // 1) res에 담긴 로그인 정보를 로그인 Controller로 전달
                            // 2) 서비스 호출
                            // 3) 서비스에서 res에 담긴 정보 중 email이 DB에 있는지 확인 (select)
                            // 4) 없으면 insert 후 회원정보 return, 
                            //    있으면 조회한 회원정보 return
                            // 5) 컨트롤러에서 메인페이지(또는 원하는 페이지)로 리다이렉트
                            // + 메세지 전달하고 싶으면 RedirectAttributes 이용ㄴ
                        }
                    });
                }
            })
        }
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

</body>
</html>