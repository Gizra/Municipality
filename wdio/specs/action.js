const assert = require('assert');

describe('Municipality action page', () => {
  before(() => {
    browser.url('municipality-1/node/12?user_type=residents&language=he');
  })

  it('should show the action page with content in the body field', () => {
    browser.waitForVisible('h2=לקבל אישור תושב');
    browser.waitForVisible('p=יש למלא את הטופס ולהגישו במשרדי המועצה');
  });
});
