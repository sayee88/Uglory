
// 개별 차트
var ctx1 = document.getElementById("sales-per-day");
var myChart1 = new Chart(ctx1, {
    type: "bar",
    data: {
        labels: ["2022-07-07", "2022-07-08", "2022-07-09", "2022-07-10"],
        datasets: [{
                label: "구독 결제",
                data: [90000, 168000, 176500, 125000],
                backgroundColor: "rgba(0, 156, 255, .7)"
            },
            {
                label: "개별 상품 결제",
                data: [170000, 138000, 276500, 75000],
                backgroundColor: "rgba(0, 156, 255, .3)"
            },
        ]
        },
    options: {
        responsive: true
    }
});


// 월별 차트
var ctx2 = document.getElementById("sales-per-month");
var myChart2 = new Chart(ctx2, {
    type: "line",
    data: {
        labels: ["JUL", "AUG", "SEP", "OCT", "NOV", "DEC"],
        datasets: [{
                label: "전체 매출(상품+구독)",
                data: [7800000, 7683000,6800000, 7160000, 6895000, 5790000],
                backgroundColor: "rgba(0, 156, 255, .5)",
                fill: true
            },
        ]
        },
    options: {
        responsive: true
    }
});
    