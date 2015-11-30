$(document).ready(function() {
  $('#countdown').countdown({
    until: new Date(2016, 01, 15), labels: ['Yr', 'Mo', 'Wk', 'Jours', 'Heures', 'Minutes', 'Secondes']});
});
