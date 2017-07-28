var assert = require('assert');

describe('Municipality contacts page', () => {
  before(() => {
    browser.url('/kiryat-malakhi/contacts?language=he');
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

});

