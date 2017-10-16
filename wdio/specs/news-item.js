const assert = require('assert');

describe('Municipality news item page', () => {

  it('should show the news item with titles, date and body content in hebrew', () => {
    browser.url('/tuba-zangariyye/node/54?language=he');
    browser.waitForVisible('h2=News and Updates');
    browser.waitForVisible('h3=מבצע סגירת חובות ארנונה לתושבים');
    // Check that the date HTML tag exists on the page.
    browser.waitForVisible('.pane-news-content .panel-body small');
    browser.waitForVisible('div=מחלקת הגבייה מודיעה: הזדמנות אחרונה לסגירת חובות הארנונה לתושבים. הזדרזו להסדיר את חובותיכם, והמנעו מקנסות. המבצע בתוקף עד ה-8.4.17.');
  });

  it('should show the news item with titles, date and body content in arabic', () => {
    browser.url('/tuba-zangariyye/node/54?language=ar');
    browser.waitForVisible('h2=News and Updates');
    browser.waitForVisible('h3=عملية إغلاق ديون ضريبة الأملاك للسكان');
    // Check that the date HTML tag exists on the page.
    browser.waitForVisible('.pane-news-content .panel-body small');
    browser.waitForVisible('div=إدارة مجموعات تعلن: الفرصة الأخيرة لإغلاق ديون ضريبة الأملاك للسكان. عجل تسوية الديون الخاصة بك وتجنب العقوبات. يسري هذا العرض حتى -8.4.17.');
  });

  it('should not show an expired news item', () => {
    browser.url('/tuba-zangariyye/node/1?language=he');

    // Check that the expired news item is not visible.
    browser.url('/tuba-zangariyye/node/1?language=he');
    browser.waitForVisible('.news-box');
    assert(!browser.isVisible('h3=Expired news entity'));
  });

});
