const assert = require('assert');

describe('Municipality homepage', () => {
  before(() => {
    browser.url('/municipality-1/node/1?language=he');
  })

  it('should show the correct name of the municipality', () => {
    browser.waitForVisible('header#header .header-container #site-name > h1');

    // Assert the page have the expected title.
    const muniTitle = browser.getText('header#header .header-container #site-name > h1');
    assert.equal('טובא-זנגריה', muniTitle);
  });

  it('should show the user types selector', () => {
    browser.waitForVisible('.row .col-md-3 > .btn-group.user-types');
  });

  it('should show the event\'s "show all" button', () => {
    browser.waitForVisible('div#elm-events-block a.btn-show-all');

    // Assert the page have the expected title.
    const showAllLink = browser.getText('div#elm-events-block a.btn-show-all');
    assert.equal('הצג הכל', showAllLink);
  });

  it('should show user types labels in the selected language', () => {
    browser.url('/municipality-1/node/1?language=he&user_type=residents');
    browser.waitForVisible('.btn-group.user-types');
    var business = browser.getText('.btn-group.user-types a:nth-child(1)');
    assert.equal('עסקים', business);
    var residents = browser.getText('.btn-group.user-types a:nth-child(2)');
    assert.equal('תושבים', residents);

    browser.url('/municipality-1/node/1?language=en&user_type=residents');
    business = browser.getText('.btn-group.user-types a:nth-child(1)');
    assert.equal('Businesses', business);
    residents = browser.getText('.btn-group.user-types a:nth-child(2)');
    assert.equal('Residents', residents);
  });

  it('Should show the user language and user type chosen in the language and user type menus', () => {
    var user_type = browser.getText('.btn-group.user-types .btn.btn-default.active');
    assert.equal('Residents', user_type);

    var languague = browser.getText('.btn-group.languages .btn.btn-default.active');
    assert.equal('English', languague);

    browser.url('/municipality-1/node/1?language=he&user_type=residents');
    browser.waitForVisible('.btn-group.user-types');
    browser.waitForVisible('.btn-group.languages');

    var user_type = browser.getText('.btn-group.user-types .btn.btn-default.active');
    assert.equal('תושבים', user_type);

    var languague = browser.getText('.btn-group.languages .btn.btn-default.active');
    assert.equal('עברית', languague);
  });

  it('Should show the "do now" for the elements which fits the current user type and the current language', () => {
    browser.waitForVisible("h2=Do now");
    browser.isVisible('a=לקבל אישור תושב');
    browser.isVisible('a=לרשום חתונה');

    browser.url('/municipality-1/node/1?language=ar&user_type=residents');
    browser.waitForVisible("h2=Do now");
    browser.isVisible('a=الحصول على الإقامة');
    browser.isVisible('a=السجل الزفاف');

    // Check that content for one user type doesn't appear on other user type.
    browser.url('/municipality-1/node/1?user_type=businesses&language=he');
    browser.waitForVisible("h2=Do now");
    assert(!browser.isVisible('a=לקבל אישור תושב'));
    assert(!browser.isVisible('a=לרשום חתונה'));
  });
});
