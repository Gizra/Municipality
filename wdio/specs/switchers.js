const assert = require('assert');

describe('switchers block', () => {
  it('should see "user types" switcher block on edit pages', () => {
    browser.url('/user/login');

    browser.waitForVisible('#edit-name');
    browser.setValueSafe('#edit-name', 'noam');
    browser.setValueSafe('#edit-pass', 'noam');
    browser.submitForm('#user-login');

    browser.url('/municipality-1/node/1/edit?language=he');

    browser.waitForVisible('.container .user-types');
  });
});
