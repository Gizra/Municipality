describe('switchers block', () => {
  it('should see "user types" switcher block on edit pages', () => {
    browser.login('noam');
    browser.url('/tuba-zangariyye/node/1/edit?language=he');

    browser.waitForVisible('.container .user-types');
  });
});
