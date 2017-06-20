const assert = require('assert');

describe('Municipality topics', () => {
  before(() => {
    browser.url('/municipality-1/taxonomy/term/13?language=he');
  });

  it('should show the correct topics', () => {
    browser.waitForVisible('div.pane-topic-actions .buttons');

    it('should show "contact customer service"', () => {
      const topic = browser.getText('div.pane-topic-actions .buttons > a:nth-child(1)');
      assert.equal('לפנות למוקד', topic);
    });

    it('should show "pay municipal rate"', () => {
      const topic = browser.getText('div.pane-topic-actions .buttons > a:nth-child(2)');
      assert.equal('לשלם ארנונה', topic);
    });

    it('should show "Obtain a resident\'s permit"', () => {
      const topic = browser.getText('div.pane-topic-actions .buttons > a:nth-child(3)');
      assert.equal('לקבל אישור תושב', topic);
    });
});

  it('should show all the relevant events for this topic', () => {
    browser.waitForVisible('div=הצגת ילדים: שבת בבוקר');
    browser.waitForVisible('div=סיור קבלנים: אספקה והתקנה של מערכות מיזוג האוויר לבניין העירייה');
  });

  it('should show event image if exists', () => {
    browser.waitForVisible('.card-img-top img');
  });

});
