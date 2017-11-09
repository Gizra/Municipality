const assert = require('assert');

describe('add/edit content for editors', () => {
  before(() => {
    browser.login('noam');
    browser.url('/tuba-zangariyye/node/1/edit?language=he');
  });

  it('should be able to use ajax on the edit page', () => {
    browser.waitForVisible('#edit-purl-value');

    // Click on "Add another item" button (Social links).
    $('#edit-field-social-links-und-add-more').click();

    // Make sure the new field has been added.
    browser.waitForVisible('#edit-field-social-links-und-3-title');
  });

  it('should see the content inside the WYSIWYG editor', () => {
    browser.waitForVisible('#edit-purl-value');

    // Change HTML format to get the WYSIWYG editor.
    const htmlFormatSelectBox = $('#edit-field-footer-text-und-0-format--2');
    htmlFormatSelectBox.selectByValue('filtered_html');

    // Wait for the editor to be visible.
    browser.waitForVisible('.cke');

    // Check that we have the content inside the editor.
    browser.element('iframe', (err, el) => {
      browser.frame(el.value.ELEMENT, () => {
        browser.getText('.cke_wysiwyg_frame body.cke_editable > p', (err2, text) => {
          assert.equal('Footer text', text);
        });
      });
    });
  });

  it('should see an error message when adding content outside the group context', () => {
    browser.url('/node/add/action?language=en');

    browser.waitForVisible('label=Title');
    // Assert there's an error messages.
    assert(browser.isVisible('.alert-danger'));
  });

  it('should not see the group audience field when adding content with group context', () => {
    browser.url('/tuba-zangariyye/node/add/action?language=en');

    browser.waitForVisible('label=Title');
    // Assert there's no error messages.
    assert(!browser.isVisible('.alert-danger'));
    // Assert audience field is not visible.
    assert(!browser.isVisible('label=Groups audience'));
  });

  after(() => {
    browser.logout();
  });
});
