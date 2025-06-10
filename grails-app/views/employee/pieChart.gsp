<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Department Employee Chart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&family=Poppins:wght@700;800&display=swap" rel="stylesheet"/>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <style>
    body {
        background: linear-gradient(120deg, #e3e9fc 0%, #f4f8ff 100%);
        font-family: 'Inter', sans-serif;
        min-height: 100vh;
        margin: 0;
    }
    .header-bar {
        background: linear-gradient(93deg, #4e5bf2 40%, #5a8dee 100%);
        color: #fff;
        border-radius: 20px;
        margin: 44px auto 54px auto;
        box-shadow: 0 12px 32px 0 #a2b6ee4d;
        padding: 30px 38px;
        max-width: 640px;
        text-align: center;
    }
    .header-bar h2 {
        font-family: 'Poppins', sans-serif;
        font-size: 2.1rem;
        font-weight: 800;
        margin: 0;
        letter-spacing: 0.5px;
    }
    .chart-card {
        max-width: 650px;
        margin: 0 auto;
        border-radius: 18px;
        box-shadow: 0 3px 20px #b5c2db3c;
        background: #fff;
        padding: 2.3rem 2.3rem 1.7rem 2.3rem;
        border: none;
        position: relative;
        overflow: hidden;
    }
    .back-btn {
        position: absolute;
        left: 32px; top: 32px;
        font-size: 1.08rem;
        font-family: 'Poppins', sans-serif;
        font-weight: 700;
        padding: 10px 24px 10px 16px;
        background: linear-gradient(93deg, #4e5bf2 80%, #ff7f50 100%);
        color: #fff !important;
        border-radius: 22px;
        border: none;
        text-decoration: none;
        box-shadow: 0 2px 8px #5a8dee2d;
        transition: background 0.18s, box-shadow 0.17s, transform 0.13s;
        display: flex;
        align-items: center;
    }
    .back-btn:hover {
        background: linear-gradient(93deg, #ff7f50 65%, #4e5bf2 100%);
        transform: scale(1.06);
        color: #fff !important;
    }
    @media (max-width: 700px) {
        .header-bar, .chart-card { max-width: 97vw; padding: 16px 7vw 20px 7vw; }
        .back-btn { left: 10px; top: 10px; padding: 8px 16px 8px 12px; }
    }
    </style>
</head>
<body>
<div class="header-bar">
    <h2>Employees by Department</h2>
</div>
<div class="chart-card position-relative">
    <a href="${createLink(controller:'employee', action:'index')}" class="back-btn">
        &#8592; Back to Employees
    </a>
    <div id="deptPieChart" style="height: 370px; margin-top: 32px;"></div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        Highcharts.chart('deptPieChart', {
            chart: {
                type: 'pie',
                backgroundColor: 'transparent'
            },
            title: { text: null },
            tooltip: { pointFormat: '<b>{point.y} Employees</b> ({point.percentage:.1f}%)' },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    borderRadius: 10,
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.y}',
                        style: { fontFamily: 'Poppins,sans-serif', fontWeight: '700', fontSize: '1.04em' }
                    }
                }
            },
            colors: ['#5a8dee','#4e5bf2','#ff7f50','#f8b739','#20c997','#f84646','#a084e8'],
            series: [{
                name: 'Employees',
                colorByPoint: true,
                data: [
                    <g:each in="${deptCountMap}" var="entry" status="i">
                    { name: "${entry.key}", y: ${entry.value} }<g:if test="${i < deptCountMap.size()-1}">,</g:if>
                    </g:each>
                ]
            }]
        });
    });
</script>
</body>
</html>
