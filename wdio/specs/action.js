const assert = require('assert');

describe('Municipality action page', () => {
  before(() => {
    browser.url('/tuba-zangariyye/node/12?user_type=residents&language=he');
  });

  it('should show the action page with content in the body field, in hebrew', () => {
    browser.waitForVisible('h2=לקבל אישור תושב');
    browser.waitForVisible('h3=קבלת אישור תושבות');
    browser.waitForVisible('p=יש למלא את הטופס ולהגישו במשרדי המועצה');
  });

  it('should show the action page with content in the body field, in arabic', () => {
    browser.url('/tuba-zangariyye/node/12?user_type=residents&language=ar');
    browser.waitForVisible('h2=الحصول على الإقامة');
    browser.waitForVisible('h3=الحصول على تصريح الإقامة');
    browser.waitForVisible('p=ملء النموذج وتقديمه إلى مكاتب المجلس');
  });
});
