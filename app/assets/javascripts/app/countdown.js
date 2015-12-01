$(document).ready(function() {
  $('#countdown').countdown({
    until: new Date(2016, 1 - 1, 15), format: 'D', labels: ['Yr', 'Mo', 'Wk', 'Jours', 'Heures', 'Minutes', 'Secondes'], labels1: ['Yr1', 'Mo1', 'Wk1', 'Jour', 'Heure', 'Minute', 'Seconde'], });
});
