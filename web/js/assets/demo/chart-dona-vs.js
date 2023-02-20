// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Area Chart Example
var ctx = document.getElementById("myDonaChart2");
var myLineChart1 = new Chart(ctx, {
  type: 'doughnut',
  data: {
      
      datasets: [{
      lineTension: 0.3,
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
      pointRadius: 5,
      pointBackgroundColor: "rgba(2,117,216,1)",
      pointBorderColor: "rgba(255,255,255,0.8)",
      pointHoverRadius: 5,
      pointHoverBackgroundColor: "rgba(2,117,216,1)",
      pointHitRadius: 50,
      pointBorderWidth: 2,
    }],
  },

});

let url3 = 'http://localhost:8080/WCONAGAN/rest/historialDepar'
        fetch(url3)
            .then( response3 => response3.json() )
            .then( datos3 => mostrar3(datos3) )
            .catch( error3 => console.log(error3) )


        const mostrar3 = (articulos3) =>{
            articulos3.forEach(element3 => {                 
                myLineChart1.data['labels'].push(element3.Departamento)
                myLineChart1.data['datasets'][0].data.push(element3.Denuncias)               
                myLineChart1.update();
            });
            
        }  


