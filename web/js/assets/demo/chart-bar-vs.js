

/* global Chart */

// Set new default font family and font color to mimic Bootstrap's default styling

Chart.defaults.global.defaultFontColor = '#292b2c';

// Bar Chart Example

var ctx2 = document.getElementById('myBarChar2')
        var myChart = new Chart(ctx2, {
            type:'bar',
            data:{
                    datasets: [{
                    
                    
                    backgroundColor: [ 'rgba(255, 99, 132, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 205, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(201, 203, 207, 0.2)'],
                    borderColor: [
                    'rgb(255, 99, 132)',
                    'rgb(255, 159, 64)',
                    'rgb(255, 205, 86)',
                    'rgb(75, 192, 192)',
                    'rgb(54, 162, 235)',
                    'rgb(153, 102, 255)',
                    'rgb(201, 203, 207)'
                            ],
                    borderWidth:4
                    
                }]
            },
            options:{ scales: {
                yAxes: [{ticks: {beginAtZero: true} }]},
                legend: {display: false},
                 title: {display: true}
                    }
        });

        let url2 = 'http://localhost:8080/WCONAGAN/rest/historialFecha'
        fetch(url2)
            .then( response => response.json() )
            .then( datos => mostrar(datos) )
            .catch( error => console.log(error) )


        const mostrar = (articulos) =>{
            articulos.forEach(element => {
                myChart.data['labels'].push(element.fecha);
                myChart.data['datasets'][0].data.push(element.Denuncias);
                myChart.update();
            });
            
        }    


