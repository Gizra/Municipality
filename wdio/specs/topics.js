const assert = require('assert');

describe('Municipality topics', () => {
  before(() => {
    browser.url('/municipality-1/taxonomy/term/13?user_type=residents&language=he');
  });

  it('should show the correct news', () => {
    browser.waitForVisible('div.pane-topic-news .box-content');

    const news_title = browser.getText('div.pane-topic-news .call-to-action-content > h3');
    assert.equal('מבצע עיקור סירוס חתולי רחוב יתחיל ביום א 5.3.17', news_title);
  });

  it('should show the correct FAQs', () => {
    browser.waitForVisible('div.pane-faqs-accordion .box-content');

    const faq_answer = browser.getText('div.pane-faqs-accordion .box-content section.toggle:nth-child(1) > p');
    assert.equal('בכל גן של עד 30 ילדים, גננת אחת ושתי סייעות', faq_answer);
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

    const first_event_title = browser.getText('div.featured-box .col-md-5:nth-child(1) h4.card-title');
    assert.equal('סיור קבלנים: אספקה והתקנה של מערכות מיזוג האוויר לבניין העירייה', first_event_title);

    const second_event_title = browser.getText('div.featured-box .col-md-5:nth-child(2) h4.card-title');
    assert.equal('הצגת ילדים: שבת בבוקר', second_event_title);
  });

  it('should show event image if exists', () => {
    browser.waitForVisible('.card-img-top img');
  });

});
