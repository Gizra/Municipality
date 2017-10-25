var assert = require('assert');

describe('Municipality events page', () => {
  before(() => {
    browser.url('Sat');
  });

  it('should show all events for the current municipality', () => {
    browser.waitForVisible('h4=הצגת ילדים: שבת בבוקר');
    browser.waitForVisible('h4=סיור קבלנים: אספקה והתקנה של מערכות מיזוג האוויר לבניין העירייה');
    browser.waitForVisible('h4=הופעה: עידן רייכל');
  });

  it('should find events using the search input', () => {
    const input = $('#search-events');
    input.setValue('ר');
    browser.waitForVisible('h4=הצגת ילדים: שבת בבוקר');
    browser.waitForVisible('h4=סיור קבלנים: אספקה והתקנה של מערכות מיזוג האוויר לבניין העירייה');
    browser.waitForVisible('h4=הופעה: עידן רייכל');

    browser.setValueSafe('#search-events','הצג');
    browser.waitForVisible('h4=הצגת ילדים: שבת בבוקר');

    // Make sure other events disappear when searching.
    assert(!browser.isVisible('h4=סיור קבלנים: אספקה והתקנה של מערכות מיזוג האוויר לבניין העירייה'));
    assert(!browser.isVisible('h4=הופעה: עידן רייכל'));

    browser.setValueSafe('#search-events','סיור');
    browser.waitForVisible('h4=סיור קבלנים: אספקה והתקנה של מערכות מיזוג האוויר לבניין העירייה');

    // Make sure other events disappear when searching.
    assert(!browser.isVisible('h4=הצגת ילדים: שבת בבוקר'));
    assert(!browser.isVisible('h4=הופעה: עידן רייכל'));

  });

  it('should not show add event link to anon users', () => {
    assert(!browser.isVisible('button=Add new event'));
  });

  it('should show add event link to editors', () => {
    browser.login('noam');
    browser.url('/tuba-zangariyye/events?language=en');

    browser.waitForVisible('button=Add new event');
  });

});

