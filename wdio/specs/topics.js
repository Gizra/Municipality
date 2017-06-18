var assert = require('assert');

describe('Municipality topics page', () => {
  before(() => {
    browser.url('/municipality-4/taxonomy/term/19?language=he');
  })

  it('should show the actions titles', () => {
    browser.waitForVisible('.ui.basic.primary.buttons');
    browser.getText("a=לשלם ארנונה");
    browser.getText("a=לרשום לגן");
    browser.getText("a=לפנות למוקד");
  });

});

