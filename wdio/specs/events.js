var assert = require('assert');

describe('Municipality events page', () => {
  before(() => {
    browser.url('/tuba-zangariyye/events?language=he');
  })

  it('should show all events for the current municipality', () => {
    browser.waitForVisible('div=הצגת ילדים: שבת בבוקר');
    browser.waitForVisible('div=סיור קבלנים: אספקה והתקנה של מערכות מיזוג האוויר לבניין העירייה');
  });

  it('should find events using the search input', () => {
    const input = $('#search-events');
    input.setValue('ר');
    browser.waitForVisible('div=הצגת ילדים: שבת בבוקר');
    browser.waitForVisible('div=סיור קבלנים: אספקה והתקנה של מערכות מיזוג האוויר לבניין העירייה');

    input.setValue('הצג');
    browser.waitForVisible('div=הצגת ילדים: שבת בבוקר');

    // Make sure other events disappear when searching.
    assert(!browser.isVisible('div=סיור קבלנים: אספקה והתקנה של מערכות מיזוג האוויר לבניין העירייה'));

    input.setValue('סיור');
    browser.waitForVisible('div=סיור קבלנים: אספקה והתקנה של מערכות מיזוג האוויר לבניין העירייה');

    // Make sure other events disappear when searching.
    assert(!browser.isVisible('div=הצגת ילדים: שבת בבוקר'));

  });

});

