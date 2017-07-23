const assert = require('assert');

describe('login page', () => {
  it('should not allow an anonymous user with wrong credentials to login', () => {
    browser.login('wrong-name');

    browser.waitForVisible('.alert.alert-danger');
    });
});
