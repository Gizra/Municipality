const assert = require('assert');

describe('Municipality news item page', () => {
  before(() => {
  });

  it('should show the news item with titles, date and body content in hebrew', () => {
    browser.url('/municipality-1/node/54?language=he');
    browser.waitForVisible('h2=News and Updates');
    browser.waitForVisible('h3=מבצע סגירת חובות ארנונה לתושבים');
    browser.waitForVisible('small');
    browser.waitForVisible('p=מחלקת הגבייה מודיעה: הזדמנות אחרונה לסגירת חובות הארנונה לתושבים. הזדרזו להסדיר את חובותיכם, והמנעו מקנסות. המבצע בתוקף עד ה-8.4.17.');
  });

  it('should show the news item with titles, date and body content in arabic', () => {
    browser.url('/municipality-1/node/54?language=ar');
    browser.waitForVisible('h2=News and Updates');
    browser.waitForVisible('h3=عملية إغلاق ديون ضريبة الأملاك للسكان');
    browser.waitForVisible('small');
    browser.waitForVisible('p=إدارة مجموعات تعلن: الفرصة الأخيرة لإغلاق ديون ضريبة الأملاك للسكان. عجل تسوية الديون الخاصة بك وتجنب العقوبات. يسري هذا العرض حتى -8.4.17.');
  });

  it('should show the news item with titles, date and body content in the default language arabic, when english language is selected', () => {
    browser.url('/municipality-1/node/54?language=en');
    browser.waitForVisible('h2=News and Updates');
    browser.waitForVisible('h3=عملية إغلاق ديون ضريبة الأملاك للسكان');
    browser.waitForVisible('small');
    browser.waitForVisible('p=إدارة مجموعات تعلن: الفرصة الأخيرة لإغلاق ديون ضريبة الأملاك للسكان. عجل تسوية الديون الخاصة بك وتجنب العقوبات. يسري هذا العرض حتى -8.4.17.');
  });

});
