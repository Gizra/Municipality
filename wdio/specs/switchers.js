const assert = require('assert');

describe('switchers block', () => {
  before(() => {
    browser.url('/tuba-zangariyye/node/1/edit?language=he');
  });

  it('should see "user types" switcher block on edit pages', () => {
    browser.waitForVisible('.container .user-types');
  });

  it('should be able to switch to high contrast mode', () => {
    const accessibleButton = $('.municipality-accessible');
    accessibleButton.click();

    // Check the body has the required class for high contrast.
    const bodyClass = browser.getAttribute('body', 'class');
    assert(bodyClass.includes('municipality-is-accessible'));
  });

  it('should stay on contrast mode with a page switch', () => {
    browser.url('/tuba-zangariyye/events?language=he');
    browser.waitForVisible('body');

    // Check the body has the required class for high contrast.
    const bodyClass = browser.getAttribute('body', 'class');
    assert(bodyClass.includes('municipality-is-accessible'));
  });
});
