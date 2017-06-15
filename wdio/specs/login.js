const assert = require('assert');

describe('login page', () => {
  it('should not allow an anonymous user with wrong credentials to login', () => {
    browser.url('/user/login');

    browser.waitForVisible('#edit-name');
    browser.setValueSafe('#edit-name', 'wrong-name');
    browser.setValueSafe('#edit-pass', 'wrong-pass');
    browser.submitForm('#user-login');

    browser.waitForVisible('.ui.message.error');
  });
});
