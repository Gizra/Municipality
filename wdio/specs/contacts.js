var assert = require('assert');

describe('Municipality contacts page', () => {
  before(() => {
    browser.url('/municipality-4/contacts?language=he');
  })

  it('should find contacts using the search input', () => {
    var input = $('#elm-app > div > div > div.ui.icon.input > input[type="search"]');
    input.setValue('נ');
    browser.waitForVisible('h3=ניר שמואלי');
    browser.waitForVisible('h3=נסר בו סריחאן');
    browser.waitForVisible('h3=סלאח אבו האני');

    input.setValue('ני');
    browser.waitForVisible('h3=ניר שמואלי');
    browser.waitForVisible('h3=סלאח אבו האני');

    // Make sure other contacts dissappear when searching.
    assert(!browser.isVisible('h3=נסר בו סריחאן'));

    input.setValue('ניר');
    browser.waitForVisible('h3=ניר שמואלי');

    // Make sure other contacts disappear when searching.
    assert(!browser.isVisible('h3=נסר בו סריחאן'));
    assert(!browser.isVisible('h3=סלאח אבו האני'));
  });

});

