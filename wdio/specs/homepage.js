var assert = require('assert');

describe('Municipality homepage', () => {
  before(() => {
    browser.url('/municipality-1/node/1?language=he');
  })

  it('should show the correct name of the municipality', () => {
    browser.waitForVisible('header#header .header-container #site-name > h1');

    // Assert the page have the expected title.
    var muniTitle = browser.getText('header#header .header-container #site-name > h1');
    assert.equal('טובא-זנגריה', muniTitle);
  });

  it('should show the user types selector', () => {
    browser.waitForVisible('.row .col-md-3 > .btn-group.user-types');
  });
});
