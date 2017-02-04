var quriesResults = [
  { title: 'איך משלמים ארנונה'},
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
  { title: 'איך מוציאים רישיון עסק' },
  { title: 'מה עשתה העיריה השנה' },
  // etc
];


$('.ui.search').search({
    source: quriesResults
    });

/* expected Json on server API:
{ question: 'איך משלמים ארנונה', link: 'services/arnona/pay', category: "לתושב", item: "תשלום ארנונה" },
{ question: 'עד מתי אפשר להירשם לגנים', link:'services/education/register',category: "לתושב" },
{ question: 'להגיש תלונה', link:'services/contact/moked',category: "לתושב"},
{ question: 'למלא טופס פטור מארנונה', link: 'services/arnona/ptor',category: "לתושב" },
{ question: 'לתאם פגישה', link: 'information/contacts', category: "לתושב" },
{ question: 'לדווח על מפגע', link: 'services/contact/moked',category: "לתושב" },
{ question: 'תלונה על רעש', link: 'services/contact/moked', category: "לתושב" },
{ question: 'הרשמה לגנים', link: 'services/education/register',category: "לתושב" },
{ question: 'דו"ח כספי', link: 'information/reports/budget', category: "לתושב" },
{ question: 'תקלה בכביש', link: 'services/contact/moked', category: "לתושב" },
{ question: 'בעיה בגן השעשועים', link: 'services/contact/moked', category: "לתושב" },
{ question: 'הצפה של ביוב', link: 'services/contact/moked', category: "לתושב" },
{ question: 'איך מוציאים רישיון עסק', link: 'services/buisness/license', category: "עסקים" },
{ question: 'מה עשתה העיריה השנה',link: 'information/reports/annual_report' category: "הרשות" },
*/
