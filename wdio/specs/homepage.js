const assert = require('assert');

describe('Municipality homepage', () => {
  before(() => {
    browser.url('/municipality-1/node/1?language=he');
  })

  it('should show the correct name of the municipality', () => {
    browser.waitForVisible('div.ui.eight.wide.center.aligned.middle.aligned.column > h2 > a');

    // Assert the page have the expected title.
    const muniTitle = browser.getText('div.ui.eight.wide.center.aligned.middle.aligned.column > h2 > a');
    assert.equal('טובא-זנגריה', muniTitle);
  });

  it('should show the user types selector', () => {
    browser.waitForVisible('.ui.row > .ui.user-types');
  });
});
