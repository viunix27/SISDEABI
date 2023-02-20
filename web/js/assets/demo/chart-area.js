// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'line',
  data: {  
    datasets: [{
       
        backgroundColor: 'rgba(54, 162, 235, 0.2)', // Color de fondo
        borderColor: 'rgba(54, 162, 235, 1)', // Color del borde    
        borderWidth:3
    }]
        
  },
  options: { scales: {
                yAxes: [{ticks: {beginAtZero: true} }]},
                legend: {display: false} ,               
                title: {display: true}
                            
                
            
            }
});

let url4 = 'http://localhost:8080/WCONAGAN/rest/historialMes'
        fetch(url4)
            .then( response4 => response4.json() )
            .then( datos4 => mostrar4(datos4) )
            .catch( error4 => console.log(error4) )


        const mostrar4 = (articulos4) =>{
            articulos4.forEach(element4 => {                 
                myPieChart.data['labels'].push(element4.Mes)
                myPieChart.data['datasets'][0].data.push(element4.Denuncias)               
                myPieChart.update();
            });
            
        }  
