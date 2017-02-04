var quriesResults = [
  { title: 'איך משלמים ארנונה' },
  { title: 'עד מתי אפשר להירשם לגנים' },
  { title: 'להגיש תלונה' },
  { title: 'למלא טופס פטור מארנונה' },
  { title: 'לתאם פגישה' },
  { title: 'לדווח על מפגע' },
  { title: 'תלונה על רעש' },
  { title: 'הרשמה לגנים' },
  { title: 'דו"ח כספי' },
  { title: 'תקלה בכביש' },
  { title: 'בעיה בגן השעשועים' },
  { title: 'הצפה של ביוב' },
  // etc
];


$('.ui.search').search({
    source: quriesResults
    });
