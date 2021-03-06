import Chart from "chart.js"


const chartDo = () => {
  const budget_tot = document.querySelector('#budget-tot').dataset.budgetTot
  const budget_act = document.querySelector('#budget-activities').dataset.budgetActivities
  const budget_rem = document.querySelector('#budget-remaining').dataset.budgetRemaining


  var CHART = document.getElementById("doughnut-chart");

  if ((budget_tot == 0) || (budget_tot == undefined)) {
    let myChart = new Chart(CHART, {
      type: 'doughnut',
      data: {
        datasets: [
          { label: "Population (millions)",
            backgroundColor: ["#EDEDED", "#8e5ea2","#3cba9f", "#E59B43"],
            data: [100,0,0,0]
          },
        ]
      },
      options: {
        name: {
          display: true,
          // text: 'Predicted world population (millions) in 2050'
        },
        // animation:{
        //   // animateRotate: true,
        //   animateScale: true,
        //   // animateRotate: true,
        // },
      }
    });
  } else {
    let myChart = new Chart(CHART, {
      type: 'doughnut',
      data: {
        datasets: [
          { label: "Population (millions)",
            backgroundColor: ["#99B4C2", "#5CE0D8","#3cba9f", "#488FD1"],
            data: [budget_rem,budget_act,0,0]
          },
        ]
      },
      options: {
        name: {
          display: true,
          // text: 'Predicted world population (millions) in 2050'
        },
        // animation:{
        //   // animateRotate: true,
        //   animateScale: true,
        //   // animateRotate: true,
        // },
      }
    });
  }
}

export { chartDo };
