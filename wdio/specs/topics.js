const assert = require('assert');

describe('Municipality topics', () => {
  before(() => {
    browser.url('/tuba-zangariyye/taxonomy/term/13?user_type=residents&language=he');
  });

  it('should show the correct description', () => {
    browser.waitForVisible('div.pane-term-title');

    const topicDescription = browser.getText('div.pane-term-title .pane-content > h2 > p');
    assert.equal('תיאור גן הילדים', topicDescription);
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

    const faqAnswer = browser.getText('div.pane-faqs-accordion .box-content .panel-group div.panel:nth-child(1) .panel-body');
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

  it('should show the correct format for event\'s date', () => {
    browser.waitForVisible('h2=Upcoming events');

    const firstEventDate = browser.getText('div.featured-box .col-md-6:nth-child(1) .caption > div span');
    assert.equal('12/04/2017 14:00 - 17:00, רביעי', firstEventDate);

    const secondEventDate = browser.getText('div.featured-box .col-md-6:nth-child(2) .caption > div span');
    assert.equal('29/03/2017 11:00 - 13:00, רביעי', secondEventDate);
  });

  it('should show all the relevant contacts for this topic', () => {
    browser.waitForVisible('h2=People who can help you');

    const firstContactTitle = browser.getText('div.featured-box ul.list-primary > li:nth-child(1) p strong.name a');
    assert.equal('ויקטור סבן', firstContactTitle);

    const secondContactTitle = browser.getText('div.featured-box ul.list-primary > li:nth-child(2) p strong.name a');
    assert.equal('סמאהר סועאד', secondContactTitle);

    const thirdContactTitle = browser.getText('div.featured-box ul.list-primary > li:nth-child(3) p strong.name a');
    assert.equal('איאד סולימאן', thirdContactTitle);
  });

  it('should see default image for contacts without an image', () => {
    browser.waitForVisible('h2=People who can help you');

    // First contact entity doesn't have an image and should get the default
    // image.
    assert(browser.isVisible('.post-author:nth-child(1) .img-thumbnail img'));
  });


  it('Should not show the "Events" and "Contacts" boxes when they are empty', () => {
    browser.url('/al-kasom/taxonomy/term/18?language=en');
    browser.waitForVisible("h1=Culture");
    assert(!browser.isVisible('h2=Upcoming events'));
    assert(!browser.isVisible('a=People who can help you'));
  });

});
