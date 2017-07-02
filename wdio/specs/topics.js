const assert = require('assert');

describe('Municipality topics', () => {
  before(() => {
    browser.url('/municipality-1/taxonomy/term/13?user_type=residents&language=he');
  });

  it('should show the correct news', () => {
    browser.waitForVisible('div.pane-topic-news .box-content');

    const newsTitle = browser.getText('div.pane-topic-news .call-to-action-content > h3');
    assert.equal('מבצע עיקור סירוס חתולי רחוב יתחיל ביום א 5.3.17', newsTitle);
  });

  it('should show the correct FAQs', () => {
    browser.waitForVisible('div.pane-faqs-accordion .box-content');

    const faqQuestion = browser.getText('div.pane-faqs-accordion .box-content .panel-group div.panel:nth-child(1) .panel-title > a');
    assert.equal('כמה סייעות יש בגן ילדים?', faqQuestion);
  });

  it('should hide the FAQs answer', () => {
    browser.waitForVisible('div.pane-faqs-accordion .box-content');

    const faqAnswer = browser.getText('div.pane-faqs-accordion .box-content .panel-group div.panel:nth-child(1) .panel-body > p');
    assert.equal('', faqAnswer);
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
    browser.waitForVisible('h2=Upcoming events');

    const firstEventTitle = browser.getText('div.featured-box .col-md-6:nth-child(1) h4.card-title');
    assert.equal('סיור קבלנים: אספקה והתקנה של מערכות מיזוג האוויר לבניין העירייה', firstEventTitle);

    const secondEventTitle = browser.getText('div.featured-box .col-md-6:nth-child(2) h4.card-title');
    assert.equal('הצגת ילדים: שבת בבוקר', secondEventTitle);
  });

  it('should show event image if exists', () => {
    browser.waitForVisible('.card-img-top img');
  });

});
