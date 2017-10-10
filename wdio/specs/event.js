const assert = require('assert');

describe('Municipality event page', () => {
  before(() => {
    browser.url('/tuba-zangariyye/node/29?language=he');
  });

  it('should show all elements of the event', () => {
    browser.waitForVisible('.event-page');

    // Page title.
    assert(browser.isVisible('h2.page-title'));
    assert.equal($('h2.page-title').getText(), 'אירועים');

    // Event title.
    assert(browser.isVisible('h1.heading-primary'));
    assert.equal($('h1.heading-primary').getText(), 'הצגת ילדים: שבת בבוקר');

    // Event date.
    assert(browser.isVisible('.event-date'));

    // Event location.
    assert(browser.isVisible('.location-wrapper a'));
    assert.equal($('.location-wrapper a').getText(), 'איפה: Gizra');

    // Event ticket price.
    assert(browser.isVisible('.ticket-price'));
    assert.equal($('.ticket-price').getText(), 'מחיר: 23 ש״ח');

    // Event image.
    assert(browser.isVisible('.img-thumbnail'));

    // Event description.
    assert(browser.isVisible('.description'));
  });

});

