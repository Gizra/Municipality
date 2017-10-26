var assert = require('assert');

describe('Municipality contacts page', () => {
  before(() => {
    browser.url('/kiryat-malakhi/contacts?language=he');
  });

  it('should see the contacts static header', () => {
    browser.waitForVisible('h1=אנשי קשר ועובדי רשת');
  });

  it('should find contacts using the search input', () => {
    const input = $('#search-contacts');
    input.setValue('נ');
    browser.waitForVisible('h4=ניר שמואלי');
    browser.waitForVisible('h4=נסר בו סריחאן');
    browser.waitForVisible('h4=סלאח אבו האני');

    input.setValue('ני');
    browser.waitForVisible('h4=ניר שמואלי');
    browser.waitForVisible('h4=סלאח אבו האני');

    // Make sure other contacts disappear when searching.
    assert(!browser.isVisible('h4=נסר בו סריחאן'));

    input.setValue('ניר');
    browser.waitForVisible('h4=ניר שמואלי');

    // Make sure other contacts disappear when searching.
    assert(!browser.isVisible('h4=נסר בו סריחאן'));
    assert(!browser.isVisible('h4=סלאח אבו האני'));
  });

  it('should find contacts searching for department', () => {
    const input = $('#search-contacts');
    input.setValue('חינ');
    browser.waitForVisible('h4=ניר שמואלי');
    browser.waitForVisible('h4=סלאח אבו האני');

    // Make sure other contacts disappear when searching.
    assert(!browser.isVisible('h4=נסר בו סריחאן'));
  });

  it('should find contacts searching for job title', () => {
    const input = $('#search-contacts');
    input.setValue('תקצ');
    browser.waitForVisible('h4=נסר בו סריחאן');

    // Make sure other contacts disappear when searching.
    assert(!browser.isVisible('h4=ניר שמואלי'));
    assert(!browser.isVisible('h4=סלאח אבו האני'));
  });

  it('should be able to edit contacts in editor\'s municipality', () => {
    browser.login('liat');
    browser.url('/kiryat-malakhi/contacts?language=he');

    assert(browser.isVisible('.search-results:nth-child(1) a.btn-edit'));
  });

  it('should not be able to edit contacts in another municipality', () => {
    browser.url('/tuba-zangariyye/contacts?language=he');

    assert(!browser.isVisible('.search-results:nth-child(1) a.btn-edit'));
    browser.logout();
  });

  it('should be able to see contact info icons', () => {
    browser.url('/al-kasom/contacts?language=he');

    // Mail icon
    assert(browser.isVisible('.search-results:nth-child(1) .email-wrapper .fa-envelope'));

    // Phone icon
    assert(browser.isVisible('.search-results:nth-child(1) .phone-wrapper .fa-phone'));

    // Fax icon
    assert(browser.isVisible('.search-results:nth-child(1) .fax-wrapper .fa-fax'));
  });

  it('should not be able to see info icons when number is missing', () => {
    browser.url('/al-kasom/contacts?language=he');

    // Fax icon
    assert(!browser.isVisible('.search-results:nth-child(3) .fax-wrapper .fa-fax'));
  });

  it('should not show add contact link to anon users', () => {
    browser.url('/al-kasom/contacts?language=en');

    assert(!browser.isVisible('button=Add new contact'));
  });

  it('should show add contact link to editors', () => {
    browser.login('liat');
    browser.url('/al-kasom/contacts?language=en');

    browser.waitForVisible('button=Add new contact');
  });

});

