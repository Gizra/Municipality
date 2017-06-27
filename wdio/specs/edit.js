const assert = require('assert');

describe('edit page', () => {
  it('should be able to use ajax on the edit page', () => {
    browser.url('/user/login');

    browser.waitForVisible('#edit-name');
    browser.setValueSafe('#edit-name', 'noam');
    browser.setValueSafe('#edit-pass', 'noam');
    browser.submitForm('#user-login');

    browser.url('/municipality-1/node/1/edit?language=he');

    browser.waitForVisible('#edit-purl-value');

    // Click on "Add another item" button (Social links).
    $('#edit-field-social-links-und-add-more').click();

    // Make sure the new field has been added.
    browser.waitForVisible('#edit-field-social-links-und-3-title');
  });
});
