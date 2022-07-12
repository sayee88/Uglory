<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="resources/css/member/member.css" rel="stylesheet">
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

    <jsp:include page="/WEB-INF/views/common/header.jsp" />


        <div class="login">
            <section class="login-area">
                <div class="login-text">로그인</div>
                <div class="login-full">
                    <a href="javascript:kakaoLogin();">
                        <img class="kakao" src="/resources/img/PYJ/kakao-login.png>" alt="카카오로그인"></a>
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
                            const kakao_account=res.kakao_account;
                            console.log(kakao_account);
                        }
                    });
                }
            })
        }
    </script>
</body>
</html>