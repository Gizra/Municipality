var assert = require('assert');

describe('Municipality events page', () => {
  before(() => {
    browser.url('/tuba-zangariyye/events?language=he');
  });

  it('should show all events for the current municipality', () => {
    browser.waitForVisible('h4=הצגת ילדים: שבת בבוקר');
    browser.waitForVisible('h4=סיור קבלנים: אספקה והתקנה של מערכות מיזוג האוויר לבניין העירייה');
  });

  it('should find events using the search input', () => {
    const input = $('#search-events');
    input.setValue('ר');
    browser.waitForVisible('h4=הצגת ילדים: שבת בבוקר');
    browser.waitForVisible('h4=סיור קבלנים: אספקה והתקנה של מערכות מיזוג האוויר לבניין העירייה');

    browser.setValueSafe('#search-events','הצג');
    browser.waitForVisible('h4=הצגת ילדים: שבת בבוקר');

    // Make sure other events disappear when searching.
    assert(!browser.isVisible('h4=סיור קבלנים: אספקה והתקנה של מערכות מיזוג האוויר לבניין העירייה'));

    browser.setValueSafe('#search-events','סיור');
    browser.waitForVisible('h4=סיור קבלנים: אספקה והתקנה של מערכות מיזוג האוויר לבניין העירייה');

    // Make sure other events disappear when searching.
    assert(!browser.isVisible('h4=הצגת ילדים: שבת בבוקר'));

  });

  it('should not show add event link to anon users', () => {
    assert(!browser.isVisible('button=Add new event'));
  });

  it('should show "add event" link to group\'s editors', () => {
    browser.login('noam');
    browser.url('/tuba-zangariyye/events?language=en');

    browser.waitForVisible('button=Add new event');
  });

  it('should not show "add event" link to another group\'s editors', () => {
    // Logged in with noam from before.
    browser.url('/kiryat-malakhi/events?language=en');

    assert(!browser.isVisible('button=Add new event'));
  });

  after(() => {
    // Logout se we don't affect other tests.
    browser.logout();
  });

});

