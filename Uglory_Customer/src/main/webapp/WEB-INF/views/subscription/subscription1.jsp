<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Restoran - Bootstrap Restaurant Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="${contextPath}/resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${contextPath}/resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">

    <link rel="stylesheet" href="${contextPath}/resources/css/subscription.css">

    <style>
        .row{
            margin:20px;
            padding: 10px 15px 10px 65px;
            font-size:25px;
        }

        .modal{
            max-height:1000px;
        }

    </style>
    
    
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header-1.jsp" />

    <form action="${contextPath}/subscription/order">

        <div id="box" style="padding-bottom: 200px;">
            <div style="width: 70%;">

                <div class="inner-box">
                    <div>
                        <h3 id="step-text">STEP 1</h3>
                        <h2>구독 상품을 선택해주세요.</h2>
                        <pre>매 주 나에게 맞는 6~10종의
다양한 채소/과일이 들어가요
                        </pre>
                    </div>
    
                    <div class="container" style="margin-top: 100px;">


                        <div class="row row-cols-2">
                            
                            <div class="col">
                                <div>
                                    <fieldset id="fieldset1">
                                        <input id="standard-check" type="radio" name="box">
                                        <label for="standard-check">
                                            <img src="${contextPath}/resources/img/BSH/standard.png" style="cursor: pointer;">
                                        </label>
                                    </fieldset>
                                    <div>
                                        <h5 id="box-name">스탠다드 박스</h5>
                                        <p id="box-intro">1-2인 가구에게 적합해요</p>
                                    </div>
                                </div>
                            </div>

                            <div class="col">
                                <fieldset id="fieldset2">
                                    <input id="jumbo-check" type="radio" name="box">
                                    <label for="jumbo-check">
                                        <img src="${contextPath}/resources/img/BSH/jumbo.png" style="cursor: pointer;">
                                    </label>
                                </fieldset>
                                <div>
                                    <h5 id="box-name">점보 박스</h5>
                                    <p id="box-intro">3-4인 가구에게 적합해요</p>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>


                <div class="step2">

                    <div class="step-text">
                        <h3 id="step-text">STEP 2</h3>
                        <h2>배송 주기를 선택해주세요</h2>
                    </div>
                    <div class="container" style="width: 89%; display: flex; justify-content: center;">
                        <input type="radio" class="btn-check" name="options-outlined" id="danger-outlined1" autocomplete="off">
                        <label class="btn btn-outline-danger week-btn" for="danger-outlined1">매주</label>  

                        <input type="radio" class="btn-check" name="options-outlined" id="danger-outlined2" autocomplete="off">
                        <label class="btn btn-outline-danger week-btn" for="danger-outlined2">격주</label>   
                    </div>
                </div>

                
                <div class="step3" style="padding: 120px 0;">

                    <div class="step-text">
                        <h3 id="step-text">STEP 3</h3>
                        <h2 style="margin-bottom: 100px;">제외할 채소를 골라주세요</h2>
                    </div>

                    <div class="step3-container">

                        <!-- Button trigger modal -->
                        <button type="button" id="exception-btn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            ⓧ 제외할 채소 고르기
                        </button>
                        
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                <div class="modal-content">
                                    <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">




                                        <div class="container">
                                        
                                            <div class="row">
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="potato" value="감자" disabled>
                                                    <label class="form-check-label" for="potato">감자</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="carrot" value="당근">
                                                    <label class="form-check-label" for="carrot">당근</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="sweetPotato" value="고구마"  >
                                                    <label class="form-check-label" for="sweetPotato">고구마</label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="burdock" value="우엉">
                                                    <label class="form-check-label" for="burdock">우엉</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="radish" value="무">
                                                    <label class="form-check-label" for="radish">무</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="lotusRoot" value="연근"  >
                                                    <label class="form-check-label" for="lotusRoot">연근</label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="bean" value="서리태">
                                                    <label class="form-check-label" for="bean">서리태</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="chestnut" value="밤">
                                                    <label class="form-check-label" for="chestnut">밤</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="pea" value="완두콩"  >
                                                    <label class="form-check-label" for="pea">완두콩</label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="onion" value="양파">
                                                    <label class="form-check-label" for="onion">양파</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="springOnion" value="대파">
                                                    <label class="form-check-label" for="springOnion">대파</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="greenOnion" value="쪽파"  >
                                                    <label class="form-check-label" for="greenOnion">쪽파</label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="chives" value="부추">
                                                    <label class="form-check-label" for="chives">부추</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="garlic" value="마늘">
                                                    <label class="form-check-label" for="garlic">마늘</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="redPepper" value="고추"  >
                                                    <label class="form-check-label" for="redPepper">고추</label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="spinach" value="시금치">
                                                    <label class="form-check-label" for="spinach">시금치</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="Ccabbage" value="배추">
                                                    <label class="form-check-label" for="Ccabbage">배추</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="peakChoi" value="청경채"  >
                                                    <label class="form-check-label" for="peakChoi">청경채</label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="cabbage" value="양배추">
                                                    <label class="form-check-label" for="cabbage">양배추</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="Clettuce" value="양상추">
                                                    <label class="form-check-label" for="Clettuce">양상추</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="broccoli" value="브로콜리"  >
                                                    <label class="form-check-label" for="broccoli">브로콜리</label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="lettuce" value="상추">
                                                    <label class="form-check-label" for="lettuce">상추</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="perillaLeaf" value="깻잎">
                                                    <label class="form-check-label" for="perillaLeaf">꺳잎</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="sweetPumpkin" value="단호박"  >
                                                    <label class="form-check-label" for="sweetPumpkin">단호박</label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="tomato" value="토마토">
                                                    <label class="form-check-label" for="tomato">토마토</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="paprika" value="파프리카">
                                                    <label class="form-check-label" for="paprika">파프리카</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="cucumber" value="오이"  >
                                                    <label class="form-check-label" for="cucumber">오이</label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="greenPumpkin" value="애호박">
                                                    <label class="form-check-label" for="greenPumpkin">애호박</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="eggplant" value="가지">
                                                    <label class="form-check-label" for="eggplant">가지</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="wildChive" value="달래"  >
                                                    <label class="form-check-label" for="wildChive">달래</label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="greenSprouts" value="숙주나물">
                                                    <label class="form-check-label" for="greenSprouts">숙주나물</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="beanSprouts" value="콩나물">
                                                    <label class="form-check-label" for="beanSprouts">콩나물</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="fatsia" value="두릅"  >
                                                    <label class="form-check-label" for="fatsia">두릅</label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="waterParsley" value="미나리">
                                                    <label class="form-check-label" for="waterParsley">미나리</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="apple" value="사과">
                                                    <label class="form-check-label" for="apple">사과</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="orange" value="감귤"  >
                                                    <label class="form-check-label" for="orange">감귤</label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="kiwi" value="키위">
                                                    <label class="form-check-label" for="kiwi">키위</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="cherry" value="체리">
                                                    <label class="form-check-label" for="cherry">체리</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="pear" value="배"  >
                                                    <label class="form-check-label" for="pear">배</label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="peach" value="복숭아">
                                                    <label class="form-check-label" for="peach">복숭아</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="blueberry" value="블루베리">
                                                    <label class="form-check-label" for="blueberry">블루베리</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="lemon" value="레몬"  >
                                                    <label class="form-check-label" for="lemon">레몬</label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="plum" value="자두">
                                                    <label class="form-check-label" for="plum">자두</label>
                                                </div>
                                                <div class="col">
                                                    <input class="form-check-input" type="checkbox" id="banana" value="바나나">
                                                    <label class="form-check-label" for="banana">바나나</label>
                                                </div>
                                                <div class="col">
                                                </div>
                                            </div>

                                            
                                        
                                            <div style="background-color:#eee;">
                                                <div class="row">
                                                    <div class="col">
                                                        <input class="form-check-input" type="checkbox" id="mush1" value="버섯전체">
                                                        <label class="form-check-label" for="mush1">버섯 전체</label>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col">
                                                        <input class="form-check-input" type="checkbox" id="mush2" name="mushroom" value="새송이버섯">
                                                        <label class="form-check-label" for="mush2">새송이버섯</label>
                                                    </div>
                                                    <div class="col">
                                                        <input class="form-check-input" type="checkbox" id="mush3" name="mushroom" value="양송이버섯">
                                                        <label class="form-check-label" for="mush3">양송이버섯</label>
                                                    </div>
                                                    <div class="col">
                                                        <input class="form-check-input" type="checkbox" id="mush4" name="mushroom" value="표고버섯">
                                                        <label class="form-check-label" for="mush4">표고버섯</label>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col">
                                                        <input class="form-check-input" type="checkbox" id="mush5" name="mushroom" value="느타리버섯">
                                                        <label class="form-check-label" for="mush5">느타리버섯</label>
                                                    </div>
                                                    <div class="col">
                                                        <input class="form-check-input" type="checkbox" id="mush6" name="mushroom" value="팽이버섯">
                                                        <label class="form-check-label" for="mush6">팽이버섯</label>
                                                    </div>
                                                    <div class="col">
                                                </div>
                                            </div>
                                            
                                            </div>
                                            

                                            

                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                    <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                    <button type="button" class="btn btn-primary" style="background-color: #ff4444;">확인</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div style="text-align: center; margin: 100px 0">
                            <button class="submit-btn" onclick="location.href='${contextPath}/subscription/order'"> 다음</button>
                        </div>

                    </div>

                </div>
                
            </div>

        </div>

    </form>

        


    <%-- fotter --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <%-- jQuery --%>
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

    <!-- Template Javascript -->
    <script src="${contextPath}/resources/js/main.js"></script>

    <!-- bootstrap Javascript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <script src="${contextPath}/resources/js/subscription.js"></script>

</body>

</html>