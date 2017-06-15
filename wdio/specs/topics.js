var assert = require('assert');

describe('Municipality topics', () => {
  before(() => {
    browser.url('http://muni.local/municipality-1/taxonomy/term/13?language=he');
  })

  it('should show the correct topics', () => {
    browser.waitForVisible('div.pane-topic-actions .buttons');

    // Set expected topics on the page.
    var expectedTopics = ['לקבל אישור תושב', 'לשלם ארנונה', 'לפנות למוקד'];

    // Get the topics from the page.
    var topics = browser.getText('div.pane-topic-actions .buttons > a');

    // Assert the page have the expected topics.
    topics.forEach(function(topicTitle, index) {
      assert.equal(expectedTopics[index], topicTitle);
    });
});

});
