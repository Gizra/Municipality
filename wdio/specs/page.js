const assert = require('assert');

describe('Municipality basic page', () => {
  before(() => {
    browser.url('/municipality-1/node/66');
  });

  it('should show the basic page title and body with the default language: arabic', () => {
    browser.waitForVisible('h2=Terms page arabic');
    browser.waitForVisible('p=Terms page body arabic');
  });

  it('should show the base page title and body with the selected language: english', () => {
    browser.url('/municipality-1/node/66?language=en');
    browser.waitForVisible('h2=Terms page english');
    browser.waitForVisible('p=Terms page body english');
  });

  it('should show the base page title and body with the selected language: hebrew', () => {
    browser.url('/municipality-1/node/66?language=he');
    browser.waitForVisible('h2=תנאי שימוש');
    browser.waitForVisible('p=תנאי שימוש עברית');
  });
});
