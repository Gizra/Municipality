const assert = require('assert');

describe('Municipality news item page', () => {

  it('should show the news item with titles, date and body content in hebrew', () => {
    browser.url('/municipality-1/node/54?language=he');
    browser.waitForVisible('h2=News and Updates');
    browser.waitForVisible('h3=מבצע סגירת חובות ארנונה לתושבים');
    // Check that the date HTML tag exists on the page.
    browser.waitForVisible('.pane-news-content .panel-body small');
    browser.waitForVisible('p=מחלקת הגבייה מודיעה: הזדמנות אחרונה לסגירת חובות הארנונה לתושבים. הזדרזו להסדיר את חובותיכם, והמנעו מקנסות. המבצע בתוקף עד ה-8.4.17.');
  });

  it('should show the news item with titles, date and body content in arabic', () => {
    browser.url('/municipality-1/node/54?language=ar');
    browser.waitForVisible('h2=News and Updates');
    browser.waitForVisible('h3=عملية إغلاق ديون ضريبة الأملاك للسكان');
    // Check that the date HTML tag exists on the page.
    browser.waitForVisible('small');
    browser.waitForVisible('p=إدارة مجموعات تعلن: الفرصة الأخيرة لإغلاق ديون ضريبة الأملاك للسكان. عجل تسوية الديون الخاصة بك وتجنب العقوبات. يسري هذا العرض حتى -8.4.17.');
  });

});
