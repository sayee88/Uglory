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

        <div class="login">
            <section class="login-area ">
                <div class="login-text d-flex justify-content-center" style="font-size:24px;">로그인</div>
                <div class="login-full d-flex justify-content-center">
                    <a href="javascript:kakaoLogin();">
                        <img class="kakao" src="${contextPath}/resources/img/login/kakaoFin.png" style="width:350px; height:60px; border-radius:10px;"alt="카카오로그인"></a>
                </div>
            </section>
            
        </div>
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
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

                            $.ajax({
                                url : "login",
                                type : "post",
                                data : { "memberEmail" : kakao_account.email,
                                         "memberName" : kakao_account.profile.nickname},
                                success : function(result){
                                    console.log("result-1 : " + result);
                                    if(result == 1) location.href = "${contextPath}/member/myPage";
                                    else if(result == 0) alert("카카오 로그인 실패");
                                    else if(result == -2) alert("탈퇴 후 24시간이 경과되지 않아 로그인할 수 없습니다.");
                                    else if(result == -1){

                                        if(confirm("탈퇴된 회원입니다. 다시 Uglory에 가입 하시겠습니까?")){
                                            $.ajax({
                                                url : "reSignUp",
                                                type : "post",
                                                data : { "memberEmail" : kakao_account.email,
                                                            "memberName" : kakao_account.profile.nickname},
                                                success : function(result){
                                                     console.log(kakao_account.email);
                                                     console.log("result-2 : " + result);
                                                    if(result == 1) location.href = "${contextPath}/member/myPage";
                                                    else{
                                                        alert("재가입 실패");
                                                    }
                                                },
                                                error : function(){
                                                      console.log("재가입 오류 발생");
                                                }
                                            });


                                        }
                                    }

                                },

                                error : function(){
                                    console.log("로그인 실패");
                                }
                            })

                          
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