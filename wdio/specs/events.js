var assert = require('assert');

describe('Municipality events page', () => {
  before(() => {
    browser.url('/tuba-zangariyye/events?language=he');
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

  it('should show "add event" link to group\'s editors', () => {
    browser.login('noam');
    browser.url('/tuba-zangariyye/events?language=en');

    browser.waitForVisible('button=Add new event');
  });

  it('should not show "add event" link to another group\'s editors', () => {
    // Logged in with noam from before.
    browser.url('/kiryat-malakhi/events?language=en');

    assert(!browser.isVisible('button=Add new event'));
    browser.logout();
  });

  it('should be able to edit events in editor\'s municipality', () => {
    browser.login('liat');
    browser.url('/kiryat-malakhi/events?language=he');
    browser.waitForVisible('h1=אירועים');
    browser.moveToObject('.search-results:nth-child(1)');

    assert(browser.isVisible('.search-results:nth-child(1) a.btn-edit'));
  });

  it('should not be able to edit events in another municipality', () => {
    browser.url('/tuba-zangariyye/events?language=he');
    browser.waitForVisible('h1=אירועים');
    browser.moveToObject('.search-results:nth-child(1)');

    assert(!browser.isVisible('.search-results:nth-child(1) a.btn-edit'));
  });

  after(() => {
    // Logout se we don't affect other tests.
    browser.logout();
  });

});

