var assert = require('assert');

describe('Municipality homepage', () => {
  before(() => {
    browser.url('/municipality-1/node/1?language=he');
  })

  it('should show the name of the municipality', () => {
    browser.waitForVisible('div.ui.eight.wide.center.aligned.middle.aligned.column > h2 > a');
    var title = browser.getText('div.ui.eight.wide.center.aligned.middle.aligned.column > h2 > a');
    console.log(title.isEqual("טובא-זנגריה"));
  });

  it('should show the user types selector', () => {
    browser.waitForVisible('.ui.row > .ui.user-types');
  });
});
