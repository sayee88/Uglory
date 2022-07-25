
// 개별 차트
var ctx1 = document.getElementById("sales-per-day");
var myChart1 = new Chart(ctx1, {
    type: "line",
    data: {
        labels: chartDate,
        datasets: [{
                label: "개별 상품 결제",
                data: productPerDate,
                backgroundColor: "rgba(79, 134, 198, 0.8)"
            },
            {
                label: "구독 결제",
                data: subsPerDate,
                backgroundColor: "rgba(108, 73, 184, .8)"
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
                backgroundColor: "rgba(79, 176, 198, .3)",
                fill: true
            },
            {
                label: "개별 상품 매출",
                data: productPerMonth,
                backgroundColor: "rgba(79, 134, 198, 0.5)",
                fill: true

            },
            {
                label: "구독 매출",
                data: subsPerMonth,
                backgroundColor: "rgba(108, 73, 184, .5)",
                fill: true
            }
        ]
        },
    options: {
        responsive: true
    }
});


