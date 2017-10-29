describe('Municipality basic page', () => {
  before(() => {
    browser.url('/tuba-zangariyye/node/68');
  });

  it('should show the basic page title and body with the default language: arabic', () => {
    browser.waitForVisible('h2=Terms page arabic');
    browser.waitForVisible('div=Terms page body arabic');
  });

  it('should show the base page title and body with the selected language: english', () => {
    browser.url('/tuba-zangariyye/node/68?language=en');
    browser.waitForVisible('h2=Terms page english');
    browser.waitForVisible('div=Terms page body english');
  });

  it('should show the base page title and body with the selected language: arabic', () => {
    browser.url('/tuba-zangariyye/node/68?language=ar');
    browser.waitForVisible('h2=Terms page arabic');
    browser.waitForVisible('div=Terms page body arabic');
  });

  it('should show the base page title and body with the selected language: hebrew', () => {
    browser.url('/tuba-zangariyye/node/68?language=he');
    browser.waitForVisible('h2=תנאי שימוש');
    browser.waitForVisible('div=תנאי שימוש עברית');
  });
});
