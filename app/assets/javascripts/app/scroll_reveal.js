$(document).ready(function() {
  window.sr = ScrollReveal();
  sr.reveal('.foo',{ duration: 1100, delay: 100, mobile: true });
  sr.reveal('.bar',{ duration: 2000, mobile: true, origin: 'bottom', distance: '100px', });
  sr.reveal('.up',{ duration: 2000, mobile: true, origin: 'bottom', distance: '50px', });
  sr.reveal('.sup',{ duration: 500, mobile: true, origin: 'bottom', distance: '30px', });
})


