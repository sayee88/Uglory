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
            <div class="container" style="margin-top: 150px;">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">FAQ</h5>
                    <h1 class="mb-5">자주 묻는 질문</h1>
                </div>
            </div>
        </div>
        <!-- Contact End -->


        <!-- 자주 묻는 질문 목록 -->
        <div class="faq-container" style="padding-left: 50px;">
            <div class="d-flex align-items-start">
                <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                <button class="nav-link active mb-2" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true" style="width: 100px">구독/배송</button>
                <button class="nav-link my-3" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">결제</button>
                <button class="nav-link my-3" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-messages" type="button" role="tab" aria-controls="v-pills-messages" aria-selected="false">정보변경</button>
                <button class="nav-link my-3" id="v-pills-settings-tab" data-bs-toggle="pill" data-bs-target="#v-pills-settings" type="button" role="tab" aria-controls="v-pills-settings" aria-selected="false">해지</button>
            </div>
            <div class="tab-content" id="v-pills-tabContent" style="margin-left: 30px;">
                <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                    <div class="faq-content-list">
                        <div>
                            <span style="font-size: 24px; color: rgb(113, 214, 199);">Q</span>
                            <button class="faq-list" data-bs-toggle="collapse" data-bs-target="#collapse-1">어떤 채소들을 받게 되나요?</button>
                            <div class="faq-content collapse" id="collapse-1" 
                                style="color: rgb(150, 150, 150);">
                                모양이나 중량으로 버려질 위기의 못난이 채소, 급식 중단으로 판로를 잃은 채소 등
                                구출이 긴급한 채소들이 우선 구성됩니다. <br>
                                모든 채소들은 무농약/유기농 인증을 받은 제철 친환경 채소들이에요.<br> 
                                사연은 제각각이지만, 꼼꼼하게 선별해 맛과 신선도에는 문제가 없는 채소들로만 꾸려집니다. <br>
                                불필요한 유통 과정을 줄여 발송 직전 수확해 가장 신선하게 보내드려요!
                            </div>
                        </div>
                    </div>
                        
                    
                    <div class="faq-content-list">
                        <div>
                            <span>Q</span>
                            <button class="faq-list" data-bs-toggle="collapse" data-bs-target="#collapse-2" 
                                style="font-w">어떤 채소들이 올 지 미리 알 수 있나요?</button>
                            <div class="faq-content collapse" id="collapse-2">
                                발송 전 "매주 월요일 4시" 이번주의 채소 구성과 추천 레시피를 카톡 알림으로 보내드려요.<br>
                                미리 다음 주의 식단을 구상해보실 수 있습니다.
                            </div>
                        </div>
                    </div>

                    <div class="faq-content-list">
                        <div>
                            <span>Q</span>
                            <button class="faq-list" data-bs-toggle="collapse" data-bs-target="#collapse-3">인증된 친환경 농산물이 맞나요?</button>
                            <div class="faq-content collapse" id="collapse-3">
                                어글리어스 마켓은 친환경 취급자 인증(인증번호 10600899번)을 받은 업체입니다.<br>
                                모든 농산물은 입고부터 출고까지 '친환경' 제품으로만 관리/추적됩니다.
                            </div>
                        </div>
                    </div>
    
                    <div class="faq-content-list">
                        <div>
                            <span>Q</span>
                            <button class="faq-list" data-bs-toggle="collapse" data-bs-target="#collapse-4">못 먹는 채소가 있다면 어떻게 하나요?</button>
                            <div class="faq-content collapse" id="collapse-4">
                                구독 정보에서 알러지 품목으로 최대 5가지까지 등록이 가능해요. <br>
                                알러지 채소로 인해 특정 채소가 제외된다면,
                                해당 주간 구성 품목 중 금액에 합당한 채소를 더 넣어드려요!
                            </div>
                        </div>
                    </div>
    
                    <div class="faq-content-list">
                        <div>
                            <span>Q</span>
                            <button class="faq-list" data-bs-toggle="collapse" data-bs-target="#collapse-5">못난이 채소라 품질이 나쁘진 않나요?</button>
                            <div class="faq-content collapse" id="collapse-5">
                                그렇지 않아요! 크기나 중량, 과잉 생산 등의 사유로 남겨졌을 뿐 배송 직전 수확해 가장 신선한 채소들을 보내드려요.<br>
                                같은 땅에서 자라 맛도 영양도 다름 없는 채소들입니다.
                            </div>
                        </div>
                    </div>
    
                    <div class="faq-content-list">
                        <div>
                            <span>Q</span>
                            <button class="faq-list" data-bs-toggle="collapse" data-bs-target="#collapse-6">배송 직후 채소의 상태가 좋지 않으면 어떻게 하나요?</button>
                            <div class="faq-content collapse" id="collapse-6">
                                배송 받으신 직후 사진과 함께 5일 이내에 채팅 상담을 통해 문의주세요.<br>
                                품질/파손 사고에 대한 접수를 도와드리고 책임 보상을 해드립니다.
                            </div>
                        </div>
                    </div>
    
                    <div class="faq-content-list">
                        <div>
                            <span>Q</span>
                            <button class="faq-list" data-bs-toggle="collapse" data-bs-target="#collapse-7">구독 박스 양은 어느 정도 되나요?</button>
                            <div class="faq-content collapse" id="collapse-7">
                                스탠다드 박스는 *1-2인 가구가 소비하기 좋은 양으로 구성됩니다.<br>
                                ex. 오이 1개, 양파 2개, 방울토마토 한 팩, 가지 1개, 단호박 1개,
                                청경채 한 줌, 시금치 한 줌, 고구마 한 팩, 버섯 한 줌 3-4인 가구라면
                                스탠다드 박스는 양이 부족할 수 있어요.<br>
                                스탠다드 박스의 약 1.5배 ~2배로 구성되는 점보박스를 선택해 보다 저렴하게 즐기실 수 있습니다.<br>
                                *구독 선택 TIP💡<br>
                                1) 1-2인 가구, 주 2-3회 요리한다면? → 스탠다드 박스/격주<br>
                                2) 1-2인 가구, 주 4회 이상 요리한다면? →스탠다드 박스/매주<br>
                                3) 3-4인 가구, 주 2-3회 요리한다면? → 점보박스/격주<br>
                                4) 3-4인 가구, 주 4회 이상 요리한다면? → 점보박스/매주<br>
                                5) 5인 가구 대가족이라면? → 점보박스/매주
                            </div>
                        </div>
                    </div>
    
                    <div class="faq-content-list">
                        <div>
                            <span>Q</span>
                            <button class="faq-list" data-bs-toggle="collapse" data-bs-target="#collapse-8">알러지 채소를 변경할 수 있나요?</button>
                            <div class="faq-content collapse" id="collapse-8">
                                네, 물론입니다. 마이페이지에서 아래 경로를 통해 변경해주세요.<br>
                                *로그인 후 마이페이지 > 구독정보변경 > [수정]클릭 > 알러지 채소 변경
                            </div>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                    <div class="faq-content-list">
                        <div>
                            <span>Q</span>
                            <button class="faq-list" data-bs-toggle="collapse" data-bs-target="#collapse-9">정기 구독 시 결제는 어떻게 되나요?</button>
                            <div class="faq-content collapse" id="collapse-9">
                                구독 신청 후 배송이 진행되는 주 수요일 오후 4시경 결제가 진행됩니다.  <br>
                                매번 채소박스를 주문하거나 신청하지 않으셔도 구독 주기에 맞춰 매주/격주 단위로 자동결제가 진행되고, 채소박스를 배송해드립니다
                            </div>
                        </div>
                    </div>
                    <div class="faq-content-list">
                        <div>
                            <span>Q</span>
                            <button class="faq-list" data-bs-toggle="collapse" data-bs-target="#collapse-10">결제에 실패하면 어떻게 하나요?</button>
                            <div class="faq-content collapse" id="collapse-10">
                                안심하세요! 수요일 결제 실패건에 한해 다음날(목요일) 오전 11시에 한 번 더 결제를 시도합니다. <br>
                                만약 목요일에도 결제에 실패할 경우 해당 주간 박스는 출고되지 않고 다음 주차에 다시 결제가 진행됩니다.
                            </div>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                    <div class="faq-content-list">
                        <div>
                            <span>Q</span>
                            <button class="faq-list" data-bs-toggle="collapse" data-bs-target="#collapse-11">알림을 받지 못했어요!</button>
                            <div class="faq-content collapse" id="collapse-11">
                                품목 안내, 배송 안내, 어글리어스 공지 안내 등 꼭 받아야 하는 알림톡(or문자)를 수신하지 못하셨나요?<br>
                                알림톡을 받지 못하셨다면, 등록된 마이페이지에서 연락처 정보를 한 번 확인해주세요!<br>
                                번호가 맞게 등록되어 있는데도 알림 수신이 안되어 불편하셨다면, 주저 말고 고객센터로 도움을 요청해주세요.<br>
                                시스템 발송 내역과 수신 거부 등록 여부를 확인하여 안내를 도와드릴게요!
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                    <div class="faq-content-list">
                        <div>
                            <span>Q</span>
                            <button class="faq-list" data-bs-toggle="collapse" data-bs-target="#collapse-12">구독 중지 or 해지는 어떻게 하나요?</button>
                            <div class="faq-content collapse" id="collapse-12">
                                구독 중지 및 해지는 마이페이지에서 아래 경로를 통해 가능합니다. <br>
                                *로그인 후 마이페이지 > 구독정보 변경 > 하단의 [구독 일시 정지] 또는 [구독 해지]를 선택해 주세요.
                            </div>
                        </div>
                    </div>
                    <div class="faq-content-list">
                        <div>
                            <span>Q</span>
                            <button class="faq-list" data-bs-toggle="collapse" data-bs-target="#collapse-13">구독 중지를 해제하고 다시 받을 수 있나요?</button>
                            <div class="faq-content collapse" id="collapse-13">
                                네, 물론입니다. 언제든 원하실 때 마이페이지에서 [구독 중지 해제]를 눌러 다시 배송을 받을 수 있습니다. <br>
                                *로그인 후 마이페이지 > 구독 > [구독 중지 해제]
                            </div>
                        </div>
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