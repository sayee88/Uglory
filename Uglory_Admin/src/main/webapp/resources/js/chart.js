
// 개별 차트
var ctx1 = document.getElementById("sales-per-day");
var myChart1 = new Chart(ctx1, {
    type: "line",
    data: {
        labels: chartDate,
        datasets: [{
                label: "구독 결제",
                data: subsPerDate,
                backgroundColor: "rgba(0, 156, 255, .7)"
            },
            {
                label: "개별 상품 결제",
                data: productPerDate,
                backgroundColor: "rgba(0, 156, 255, .3)"    
            },
        ]
        },
    options: {
        responsive: true
    }
});


// 월별 차트
// line 그래프로 했더니... 6월이나 8월 데이터가 없어서 볼품 없음... 다른 차트 형식도 고민해봐야 할 듯!
var ctx2 = document.getElementById("sales-per-month");
var myChart2 = new Chart(ctx2, {
    type: "bar",
    data: {
        labels: period,
        datasets: [{
                label: "전체 매출",
                data: totalPerMonth,
                backgroundColor: "rgba(0, 156, 255, .3)",
                fill: true
            },
            {
                label: "개별 상품 매출",
                data: productPerMonth,
                backgroundColor: "rgba(0, 0, 204, 0.3)",
                fill: true

            },
            {
                label: "구독 매출",
                data: subsPerMonth,
                backgroundColor: "rgba(204, 0, 0, 0.5)",
                fill: true
            }
        ]
        },
    options: {
        responsive: true
    }
});


