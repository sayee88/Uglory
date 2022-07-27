(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner();
    
    
    // Initiate the wowjs
    new WOW().init();


    // Sticky Navbar//
    $(window).scroll(function () {
        if ($(this).scrollTop() > 45) {
            $('.navbar').addClass('sticky-top shadow-sm');
        } else {
            $('.navbar').removeClass('sticky-top shadow-sm');
        }
    });
    
    
    // Dropdown on mouse hover
    const $dropdown = $(".dropdown");
    const $dropdownToggle = $(".dropdown-toggle");
    const $dropdownMenu = $(".dropdown-menu");
    const showClass = "show";
    
    $(window).on("load resize", function() {
        if (this.matchMedia("(min-width: 992px)").matches) {
            $dropdown.hover(
            function() {
                const $this = $(this);
                $this.addClass(showClass);
                $this.find($dropdownToggle).attr("aria-expanded", "true");
                $this.find($dropdownMenu).addClass(showClass);
            },
            function() {
                const $this = $(this);
                $this.removeClass(showClass);
                $this.find($dropdownToggle).attr("aria-expanded", "false");
                $this.find($dropdownMenu).removeClass(showClass);
            }
            );
        } else {
            $dropdown.off("mouseenter mouseleave");
        }
    });
    
    
    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });


    // Facts counter
    $('[data-toggle="counter-up"]').counterUp({
        delay: 10,
        time: 2000
    });


    // Modal Video
    $(document).ready(function () {
        var $videoSrc;
        $('.btn-play').click(function () {
            $videoSrc = $(this).data("src");
        });
        console.log($videoSrc);

        $('#videoModal').on('shown.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc + "?autoplay=1&amp;modestbranding=1&amp;showinfo=0");
        })

        $('#videoModal').on('hide.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc);
        })
    });


    // Testimonials carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        center: true,
        margin: 24,
        dots: true,
        loop: true,
        nav : false,
        responsive: {
            0:{
                items:1
            },
            768:{
                items:2
            },
            992:{
                items:3
            }
        }
    });

    //배송 상품 목록 조회
    const thisWeekTab = document.getElementById("thisWeekTab");
    const nextWeekTab = document.getElementById("nextWeekTab");

    $.ajax({
        url : contextPath + "/delivery/product",
        dataType : "json",
        success : function(map){

            console.log(map.thisWeekList);
            console.log(map.nextWeekList);

            // 이번주 목록 만들기
            if(map.thisWeekList.length != 0){
                thisWeekTab.innerHTML = "";

                for(let items of map.thisWeekList){

                    const col = document.createElement("div");
                    col.classList.add("col-lg-6");

                    const dflex = document.createElement("div");
                    dflex.classList.add("d-flex");
                    dflex.classList.add("align-items-center");

                    const img = document.createElement("img");
                    img.classList.add("flex-shrink-0");
                    img.classList.add("img-fluid");
                    img.classList.add("rounded");
                    img.setAttribute("src", window.location.origin + '/ugloryA' + items.thumbnail);
                    img.style.width = '80px';

                    const flexCol = document.createElement("div");
                    flexCol.classList.add("w-100");
                    flexCol.classList.add("d-flex");
                    flexCol.classList.add("flex-column");
                    flexCol.classList.add("text-start");
                    flexCol.classList.add("ps-4");

                    const h5 = document.createElement("h5");
                    h5.classList.add("d-flex");
                    h5.classList.add("justify-content-between");
                    h5.classList.add("border-bottom");
                    h5.classList.add("pb-2");

                    const category = document.createElement("span");
                    category.innerText = items.productCategory;

                    const price = document.createElement("span");
                    price.classList.add("text-primary");
                    price.innerText = items.price + "원";

                    const small = document.createElement("small");
                    small.classList.add("fst-italic");
                    small.innerText = items.productName;

                    h5.append(category, price);
                    flexCol.append(h5, small);
                    dflex.append(img, flexCol);
                    col.append(dflex);

                    thisWeekTab.append(col);
                }
            } else {
                const col = document.createElement("div");
                col.classList.add("col-lg-12");
                col.classList.add("text-center");

                const h4 = document.createElement("h4");
                h4.innerText = '배송 예정인 상품이 없습니다.';

                col.append(h4);
                thisWeekTab.append(col);
            }

            //다음주 목록 만들기
            if(map.nextWeekList.length != 0){

                nextWeekTab.innerHTML = "";

                for(let items of map.nextWeekList){

                    const col = document.createElement("div");
                    col.classList.add("col-lg-6");

                    const dflex = document.createElement("div");
                    dflex.classList.add("d-flex");
                    dflex.classList.add("align-items-center");

                    const img = document.createElement("img");
                    img.classList.add("flex-shrink-0");
                    img.classList.add("img-fluid");
                    img.classList.add("rounded");
                    img.setAttribute("src", window.location.origin + '/ugloryA' + items.thumbnail);
                    img.style.width = '80px';

                    const flexCol = document.createElement("div");
                    flexCol.classList.add("w-100");
                    flexCol.classList.add("d-flex");
                    flexCol.classList.add("flex-column");
                    flexCol.classList.add("text-start");
                    flexCol.classList.add("ps-4");

                    const h5 = document.createElement("h5");
                    h5.classList.add("d-flex");
                    h5.classList.add("justify-content-between");
                    h5.classList.add("border-bottom");
                    h5.classList.add("pb-2");

                    const category = document.createElement("span");
                    category.innerText = items.productCategory;

                    const price = document.createElement("span");
                    price.classList.add("text-primary");
                    price.innerText = items.price + "원";

                    const small = document.createElement("small");
                    small.classList.add("fst-italic");
                    small.innerText = items.productName;

                    h5.append(category, price);
                    flexCol.append(h5, small);
                    dflex.append(img, flexCol);
                    col.append(dflex);

                    nextWeekTab.append(col);
                }

            } else {
                const col = document.createElement("div");
                col.classList.add("col-lg-12");
                col.classList.add("text-center");

                const h4 = document.createElement("h4");
                h4.innerText = '배송 예정인 상품이 없습니다.';

                col.append(h4);
                nextWeekTab.append(col);
            }

        },
        error : function(request, status, error){
            console.log("에러 발생");
            console.log("상태코드 : " + request.status);
        }
    });
    
})(jQuery);

