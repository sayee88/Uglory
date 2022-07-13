<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${contextPath}/resources/css/member/member.css" rel="stylesheet">
    <title>about</title>

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

        <div>
            <div class="about1">
                <p class="about1-title">
                    맞춤 박스를<br>
                    선택하세요.
                </p>
                <div class="empty1"></div>
                    <div class="about1-content">
                    
                        <div>
                            <div class="about1-item">
                                <p class="about1-num">1.</p>
                                <div class="about1-line"></div>
                            </div>
                            
                            <div class="empty2"></div>
                            <div class="about1-box">
                                <p class="about1-boxContent">박스 크기를 선택해요</p>
                                <p class="about1-subContext">1-2인 가구용, 3-4인 가구용</p>
                                <div class="about1-image1"></div>
                            </div>
                        </div>

                        
                        <div>
                            <div class="about1-item">
                                <p class="about1-num">2.</p>
                                <div class="about1-line"></div>
                            </div>
                            
                            <div class="empty2"></div>

                            <div class="about1-box">
                                <p class="about1-boxContent">배송 주기를 선택해요.</p>
                                <p class="about1-subContext">매주, 격주</p>
                                <div class="about1-image2"></div>
                            </div>
                        </div>


                        <div>
                            <div class="about1-item">
                                <p class="about1-num">3.</p>
                                <div class="about1-line"></div>
                            </div>
                            
                            <div class="empty2"></div>
                            <div class="about1-box">
                                <p class="about1-boxContent">먹지 않는 채소를 제외하면 끝!</p>
                                <p class="about1-subContext">구독 후에도 변경 가능</p>
                                <div class="about1-image3"></div>
                            </div>
                        </div>
                        
                   
                    </div>
                </div>
        </div>
    
        <div class="empty"></div> 
        <div class="about2">
            <div class="about2-content">
                                
                <div class="about2-text">
                    <p class="about2-title">이렇게<br>진행돼요.</p>
                    
                    <p class="about2-Explanation">이번 주 구출한 채소 목록을 문자로 미리 알려드려요. </p>
                    <button class="btn"></button>
                </div>

                <div class="about2-items">
                    <div class="about2-item1">
                        <div class="about2-image1">
                            <div class="empty4"></div>
                            <p class="about2-text1">품목알림</p>
                            <div class="empty5"></div>
                            <p class="about2-text2">월요일</p>
                        </div>
                    </div>
          
                </div>
                <div class="about2-items">
                    <div class="about2-item1">
                        <div class="about2-image2">
                            <div class="empty4"></div>
                            <p class="about2-text1">결제일</p>
                            <div class="empty5"></div>
                            <p class="about2-text2">수요일</p>
                        </div>
                    </div>
          
                </div>
                <div class="about2-items">
                    <div class="about2-item1">
                        <div class="about2-image3">
                            <div class="empty4"></div>
                            <p class="about2-text1">도착일</p>
                            <div class="empty5"></div>
                            <p class="about2-text2">금요일</p>
                        </div>
                    </div>
          
                </div>


            </div>

            <div></div>
            
        </div>
        
        <div class="empty"></div>
        <div class="about3">
            <div class="about3-content">
                <div class="about3-imagePlace">
                    <div>
                        <div class="about3-image"></div>
                    </div>
                </div>
                <div class="about3-text">
                    <span class="about3-textTitle">
                        설렘 같은 설렘 어떤 채소들이 올까요?
                    </span>
                    <p class="about3-textSubTitle">친환경 채소</p>
                    <p class="about3-Explanation">무농약,유기농 인증을 받은 친환경 채소로만 구성돼요.</p>
                    <p class="about3-textSubTitle">사연있는 채소</p>
                    <p class="about3-Explanation">모양이 고르지 않거나 판로가 부족해 남겨졌지만 같은 땅에서 자란 신선한 농산물들이에요.</p>
                    <p class="about3-textSubTitle">제철 채소</p>
                    <p class="about3-Explanation">지금, 가장 맛있는 제철 채소를 수확 직후 보내드려요.</p>
                    
                    <div class="vegetable-area">
                        <a class="vegetable">어글로리 채소 전체보기👀🥬</a>
                     

                    </div>

                </div>
             
            </div>
        </div>

    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <!-- 모달 -->
    <div class="madal-area">
        <div class="modal">
            <button class="madal-close">
                <img class="xMark" src="${contextPath}/resources/img/xmark.svg">
            </button>
            <div class="vegList">
                <img class="modal-image" src="${contextPath}/resources/img/PYJ/vegetable.webp">
            </div>

        </div>
    </div>


</body>
</html>