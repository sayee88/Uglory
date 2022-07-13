<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${contextPath}/resources/css/member/member.css" rel="stylesheet">
    
    <title>privacyPolicy</title>

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
    <main>
    <jsp:include page="/WEB-INF/views/common/header-1.jsp" />

        <div class="temsConditionArea"  style=margin:145px;>
            <h3 style=margin-left:120px;>개인 정보 처리 방침</h3> 
        
            <pre>
               (주)Uglory는 개인 정보 보호 관련 법령에 따라 고객의 개인 정보를 보호하고 이와 관련한 고충을 처리할 수 있도록
               하기 위하여 다음과 같이 개인 정보 처리 방침을 수립, 공개합니다.
            </pre>
            <hr>
         
            <pre>
                제1장 개인 정보의 수집 및 이용 목적
                
                회사는 다음의 목적을 위하여 개인 정보 처리합니다. 처리하고 있는 개인 정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 
                이용 목적이 변경되는 경우에는 법률에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
                
               1. 회원 가입 
                회원 가입 의사 확인 , 이용자 식벌 및 본인 여부, 회원 자격 유지 , 관리 , 계약 이행 및 약관 변경 등의 고지를 위한 연락,
                본인의사 확인 및 민원등의 고객 고충 처리, 부정 이용 방지, 비인가 사용 방지 및 서비스 제공 및 계약의 이행, 서비스 이용 및 상담, 
                문의, 후기 등 원할한 의사소통 경로 확보, 맟춤형 회원 서비스 제공, 거점 기반 서비스 제공 등
                
                2. 재화 또는 서비스 이용 및 제공 
                물품 배송, 상품 및 주문, 선물하기 등 서비스 제공, 서비스 만족도 조사, 계약서 발송, 콘텐츠 제공 맞춤서비스 제공, 본인 인증,
                연령인증, 요금결제 / 정산 / 환불 등
                
                3. 마케팅 및 광고 
                 웹 페이지 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계 
                 이벤트 등 광고성 정보 전달
            </pre>
    
        <hr>
            <pre>

                제2장 개인 정보 수집 항목 및 방법
                회사는 다음의 개인 정보 항목을 수집하여 처리하고 있습니다.

                [회원 가입 - SNS가입]
                    개인정보 항목(필수) : 이름 , 이메일 

                [서비스 이용 및 제공 - 회원 주문]
                    결제 정보, 수취인 이름, 수취인 휴대폰 번호, 수취인 주소 

                *회사의 서비스 이용과정에서 서비스 이용 기록, 방문 기록, 불량 이용 기록, IP주소, 쿠키, MAC주소, 모바일 기기정보(앱버전, OS버전),
                ADID/IDFA(광고 식별자)등의 정보가 자동으로 생성되어 수집될 수 있습니다.
                
                *성인인증은 본인 인증 기관을 통해 처리하고 있으며, 동의 받은 수집 항목 외 개인정보는 저장하지 않습니다.

            </pre>
        <hr>
            <pre>
               
               제3장  개인 정보의 보유 및 이용기간

               1. 회사는 법령에 따른 개인정보 보유/이용 기간 또는 이용자로부터 개인정보 수집 시에 동의 받은 개인정보 보유 / 이용기간내에 
               개인정보를 처리/보유합니다.

               2. 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.
               홈페이지 회원 가입 및 관리 : 회원 탈퇴 시 부정 이용 방지를 위하여 30일동안 보관(아이디,휴대번호) 후 파기하며,
               재화 또는 서비스 제공에 해당하는 경우는 관련 법령에 의거하여 보유 기간 동안 보관 후 파기합니다.

            </pre>
        <hr>
            <pre>
              
               제4장  개인 정보의 파기 절차 및 방법
               1. 회사는 개인 정보 보유 기간의 경과, 처리 목적 달성 등 개인 정보가 불필요하게 되었을때에는 지체없이 해당 개인 정보를 파기합니다.

               2. 개인 정보 파기의 절차 및 방법은 다음과 같습니다.

               1> 파기 절차
               - 회사는 파기 사유가 발생한 개인 정보를 선정하고, 회사의 개인 정보 보호 책임자의 승인을 받아 개인 정보를 파기합니다.

               2> 파기 방법
               - 호사는 전자적 파일 현태로 기록/저장된 개인 정보는 기록을 재생할 수 없도록 로우 레밸포멧등의 방법을 이용하여 파기하며, 종이 문서에 
               기록 저장된 개인 정보는 분쇄기로 분쇄하거나 소각하여 파기합니다.

            </pre>
        
    </div>


        <jsp:include page="/WEB-INF/views/common/footer.jsp" />


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

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
    <script src="js/main.js"></script>
</body>
</html>