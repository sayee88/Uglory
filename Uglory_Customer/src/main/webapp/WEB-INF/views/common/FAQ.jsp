<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>FAQ</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

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
    <link href="${contextPath}/resources/css/faq-style.css" rel="stylesheet">

</head>

<body>
    <div class="container-xxl bg-white p-0">
        
        <%-- FAQ Header --%>
        <jsp:include page="/WEB-INF/views/common/header-1.jsp" />


        <!-- Contact Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">FAQ</h5>
                    <h1 class="mb-5">자주 묻는 질문</h1>
                </div>
            </div>
        </div>
        <!-- Contact End -->


        <!-- 자주 묻는 질문 목록 -->
        <div class="faq-container">

            <div class="faq-button">
                <div style="background-color: rgb(113, 214, 199); color:white; font-weight: bold;">구독/배송</div>
                <div>결제</div>
                <div>정보변경</div>
                <div>해지</div>
            </div>

            
            <div class="faq-content">

             
                <div class="faq-content-list">
                    <div>
                        <span>Q</span>
                        <button class="faq-list" data-bs-toggle="collapse" data-bs-target="#collapse-1">어떤 채소들을 받게 되나요?</button>
                        <div class="faq-content collapse" id="collapse-1">
                            모양이나 중량으로 버려질 위기의 못난이 채소, 급식 중단으로 판로를 잃은 채소 등
                            구출이 긴급한 채소들이 우선 구성됩니다. 모든 채소들은 무농약/유기농 인증을 받은
                            제철 친환경 채소들이에요. 사연은 제각각이지만, 꼼꼼하게 선별해 맛과 신선도에는
                            문제가 없는 채소들로만 꾸려집니다. 불필요한 유통 과정을 줄여 발송 직전 수확해
                            가장 신선하게 보내드려요!
                        </div>
                    </div>
                </div>

                <div class="faq-content-list">
                    <div>
                        <span>Q</span>
                        <button class="faq-list" data-bs-toggle="collapse" data-bs-target="#collapse-2">어떤 채소들이 올 지 미리 알 수 있나요?</button>
                        <div class="faq-content collapse" id="collapse-2">
                            발송 전 "매주 월요일 4시" 이번주의 채소 구성과 추천 레시피를 카톡 알림으로 보내드려요.
                            미리 다음 주의 식단을 구상해보실 수 있습니다.
                        </div>
                    </div>
                </div>

                <div class="faq-content-list">
                    <div>
                        <span>Q</span>
                        <button class="faq-list" data-bs-toggle="collapse" data-bs-target="#collapse-3">인증된 친환경 농산물이 맞나요?</button>
                        <div class="faq-content collapse" id="collapse-3">
                            어글리어스 마켓은 친환경 취급자 인증(인증번호 10600899번)을 받은 업체입니다.
                            모든 농산물은 입고부터 출고까지 '친환경' 제품으로만 관리/추적됩니다.
                        </div>
                    </div>
                </div>

                <div class="faq-content-list">
                    <div>
                        <span>Q</span>
                        <button class="faq-list" data-bs-toggle="collapse" data-bs-target="#collapse-4">못 먹는 채소가 있다면 어떻게 하나요?</button>
                        <div class="faq-content collapse" id="collapse-4">
                            구독 정보에서 알러지 품목으로 최대 5가지까지 등록이 가능해요. 알러지 채소로 인해 특정 채소가 제외된다면,
                            해당 주간 구성 품목 중 금액에 합당한 채소를 더 넣어드려요!
                        </div>
                    </div>
                </div>

                <div class="faq-content-list">
                    <div>
                        <span>Q</span>
                        <button class="faq-list" data-bs-toggle="collapse" data-bs-target="#collapse-5">못난이 채소라 품질이 나쁘진 않나요?</button>
                        <div class="faq-content collapse" id="collapse-5">
                            그렇지 않아요! 크기나 중량, 과잉 생산 등의 사유로 남겨졌을 뿐 배송 직전 수확해
                            가장 신선한 채소들을 보내드려요.
                            같은 땅에서 자라 맛도 영양도 다름 없는 채소들입니다.
                        </div>
                    </div>
                </div>

                <div class="faq-content-list">
                    <div>
                        <span>Q</span>
                        <button class="faq-list" data-bs-toggle="collapse" data-bs-target="#collapse-6">배송 직후 채소의 상태가 좋지 않으면 어떻게 하나요?</button>
                        <div class="faq-content collapse" id="collapse-6">
                            배송 받으신 직후 사진과 함께 5일 이내에 채팅 상담을 통해 문의주세요.
                            품질/파손 사고에 대한 접수를 도와드리고 책임 보상을 해드립니다.
                        </div>
                    </div>
                </div>

                <div class="faq-content-list">
                    <div>
                        <span>Q</span>
                        <button class="faq-list" data-bs-toggle="collapse" data-bs-target="#collapse-7">구독 박스 양은 어느 정도 되나요?</button>
                        <div class="faq-content collapse" id="collapse-7">
                            스탠다드 박스는 *1-2인 가구가 소비하기 좋은 양으로 구성됩니다.
                            ex. 오이 1개, 양파 2개, 방울토마토 한 팩, 가지 1개, 단호박 1개,
                            청경채 한 줌, 시금치 한 줌, 고구마 한 팩, 버섯 한 줌 3-4인 가구라면
                            스탠다드 박스는 양이 부족할 수 있어요.
                            스탠다드 박스의 약 1.5배 ~2배로 구성되는 점보박스를 선택해 보다 저렴하게 즐기실 수 있습니다.
                            *구독 선택 TIP💡
                            1) 1-2인 가구, 주 2-3회 요리한다면? → 스탠다드 박스/격주
                            2) 1-2인 가구, 주 4회 이상 요리한다면? →스탠다드 박스/매주
                            3) 3-4인 가구, 주 2-3회 요리한다면? → 점보박스/격주
                            4) 3-4인 가구, 주 4회 이상 요리한다면? → 점보박스/매주
                            5) 5인 가구 대가족이라면? → 점보박스/매주
                        </div>
                    </div>
                </div>

                <div class="faq-content-list">
                    <div>
                        <span>Q</span>
                        <button class="faq-list" data-bs-toggle="collapse" data-bs-target="#collapse-8">알러지 채소를 변경할 수 있나요?</button>
                        <div class="faq-content collapse" id="collapse-8">
                            네, 물론입니다. 마이페이지에서 아래 경로를 통해 변경해주세요.
                            *로그인 후 마이페이지 > 구독정보변경 > [수정]클릭 > 알러지 채소 변경
                        </div>
                    </div>
                </div>
            </div>
        
         
        </div>


    <%-- footer --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />


     <%-- <!— jQuery 추가 —> --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

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


        <%-- Template Javascript --%>
        <script src="${contextPath}/resources/js/main.js"></script>
</body>

</html>