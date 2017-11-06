const assert = require('assert');

describe('Municipality action page', () => {
  before(() => {
    browser.login('noam');
    browser.url('/tuba-zangariyye/node/12?user_type=residents&language=he');
  });

  it('should show the action page with content in the body field, in hebrew', () => {
    browser.waitForVisible('h2=לקבל אישור תושב');
    browser.waitForVisible('h3=קבלת אישור תושבות');
    browser.waitForVisible('div=יש למלא את הטופס ולהגישו במשרדי המועצה');
  });

  it('should show the action page with content in the body field, in arabic', () => {
    browser.url('/tuba-zangariyye/node/12?user_type=residents&language=ar');
    browser.waitForVisible('h2=الحصول على الإقامة');
    browser.waitForVisible('h3=الحصول على تصريح الإقامة');
    browser.waitForVisible('div=ملء النموذج وتقديمه إلى مكاتب المجلس');
  });

  it('should not be able to add action without a link or a section', () => {
    // Go to the add new action page.
    browser.url('/node/add/action?language=en');
    browser.waitForVisible('label=Title');

    const titleInput = $('#edit-title-field-en-0-value');
    titleInput.setValue('Test');

    // Click the save button.
    $('#edit-submit').click();

    // Should see the error message.
    browser.waitForVisible('.alert-danger');
  });

  it('should be able to add action with a link', () => {
    // Go to the add new action page.
    browser.url('/node/add/action?language=en');
    browser.waitForVisible('label=Title');

    const titleInput = $('#edit-title-field-en-0-value');
    titleInput.setValue('Test action');

    const linkInput = $('#edit-field-link-und-0-title');
    linkInput.setValue('Test link');

    const urlInput = $('#edit-field-link-und-0-url');
    urlInput.setValue('http://e.com');

    // Click the save button.
    $('#edit-submit').click();

    // Should not see the error message.
    assert(!browser.isVisible('.alert-danger'));

    // Should see the node's title.
    browser.waitForVisible('h2=Test action');
  });

  after(() => {
    browser.logout();
  });
});
