var myChart = document.getElementById("line-chart");

var myLineChart = new Chart(myChart, {
    type: 'line',
    data: {
        labels:[
            'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'
        ],
        datasets:[
            {
                label:'2021',
                data:[10,48,54,13,39,27,17,5,9,45,6,46],
                borderColor: 'rgb(37,0,0)',
                backgroundColor: 'rgba(17,0,0,0.3)',
                borderWidth:1,
                lineTension:0.4,
                fill:true,
                pointBackgroundColor: 'rgb(37,0,0)'
            },
            {
                label:'2022',
                data:[46,18,24,53,69,21,57,56,19,34,56,46],
                borderColor: 'rgb(200,0,0)',
                backgroundColor: 'rgba(255,0,0,0.3)',
                borderWidth:1,
                lineTension:0.4,
                fill:true,
                pointBackgroundColor: 'rgb(200,0,0)',

            }
        ]
    },
    options:{
        maintainAspectRatio : false
    }
});


var barChart = document.getElementById("bar-chart");

var myBarChart = new Chart(barChart, {
    type: 'bar',
    data: {
        labels:[
            'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'
        ],
        datasets:[
            {
                label:'2021',
                data:[10,48,54,13,39,27,17,5,9,45,6,46],
                borderColor: 'rgb(37,0,0)',
                backgroundColor: 'rgba(17,0,0,0.7)',
                borderWidth:1,
                lineTension:0.4,
                fill:true,
                pointBackgroundColor: 'rgb(37,0,0)'
            },
            {
                label:'2022',
                data:[46,18,24,53,69,21,57,56,19,34,56,46],
                borderColor: 'rgb(200,0,0)',
                backgroundColor: 'rgba(255,0,0,0.7)',
                borderWidth:1,
                lineTension:0.4,
                fill:true,
                pointBackgroundColor: 'rgb(200,0,0)',
            }
        ]
    },
    options:{
        maintainAspectRatio : false // 그래프 비율 설정
    }
});