const assert = require('assert');

describe('Municipality news item page', () => {

  it('should show the news item with titles, date and body content in hebrew', () => {
    browser.url('/tuba-zangariyye/node/55?language=he');
    browser.waitForVisible('h2=News and Updates');
    browser.waitForVisible('h3=מבצע סגירת חובות ארנונה לתושבים');
    // Check that the date HTML tag exists on the page.
    browser.waitForVisible('.pane-news-content .panel-body small');
    browser.waitForVisible('div=מחלקת הגבייה מודיעה: הזדמנות אחרונה לסגירת חובות הארנונה לתושבים. הזדרזו להסדיר את חובותיכם, והמנעו מקנסות. המבצע בתוקף עד ה-8.4.17.');
  });

  it('should show the news item with titles, date and body content in arabic', () => {
    browser.url('/tuba-zangariyye/node/55?language=ar');
    browser.waitForVisible('h2=News and Updates');
    browser.waitForVisible('h3=عملية إغلاق ديون ضريبة الأملاك للسكان');
    // Check that the date HTML tag exists on the page.
    browser.waitForVisible('.pane-news-content .panel-body small');
    browser.waitForVisible('div=إدارة مجموعات تعلن: الفرصة الأخيرة لإغلاق ديون ضريبة الأملاك للسكان. عجل تسوية الديون الخاصة بك وتجنب العقوبات. يسري هذا العرض حتى -8.4.17.');
  });

  it('should not show an expired news item', () => {
    browser.url('/tuba-zangariyye/node/1?language=he');

    // Check that the expired news item is not visible.
    browser.waitForVisible('.news-box');
    assert(!browser.isVisible('h3=Expired news entity'));
  });

  it('should show the correct list of news on the news page', () => {
    browser.url('/tuba-zangariyye/news?language=he');
    browser.waitForVisible('h1=News and Updates');

    // Check that we have the expected news items.
    const firstNewsItemTitle = browser.getText('.featured-box-primary .row section:nth-child(1) .call-to-action-content h3');
    assert.equal(firstNewsItemTitle, 'מבצע סגירת חובות ארנונה לתושבים');

    const secondNewsItemTitle = browser.getText('.featured-box-primary .row section:nth-child(2) .call-to-action-content h3');
    assert.equal(secondNewsItemTitle, 'מבצע סגירת חובות ארנונה לעסקים');
  });

});
