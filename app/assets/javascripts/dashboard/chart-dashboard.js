// Chart Line
const labels = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
];
const data = {
    labels: labels,
    datasets: [{
        fill: true,
        label: 'My First dataset',
        backgroundColor: 'rgba(27, 95, 205,0.5)',
        borderColor: 'rgb(27, 95, 205)',
        data: [30000000, 31000000, 30200000, 29200000, 28000000, 26500000, 28000000],
    }],
};
const config = {
    type: 'line',
    data: data,
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    max: 32000000,
                    min: 26000000,
                    stepSize: 1000000
                }
            }]
        },
        maintainAspectRatio: false,
        legend: {
            display: false
        }
    }
};

var myChart = new Chart(
    document.getElementById('myChart'),
    config
);

// Chart Bar Horizontal

const labels1 = [
    '', '', ''
];
const data1 = {
    labels: labels1,
    datasets: [{
        label: 'My First dataset',
        backgroundColor: ['rgba(255, 99, 132,0.5)', 'rgba(231, 158, 69,0.5)', 'rgba(224, 64, 82,0.5)'],
        data: [30, 40, 25],
    }]
};
const config1 = {
    type: 'doughnut',
    data: data1,
    options: {
        legend: {
            display: true,
            position: 'bottom'
        },
        title: {
            display: true,
            text: 'Lorem Ipsum'
        }
    }
};

const myChart1 = new Chart(
    document.getElementById('myChart1'),
    config1
);