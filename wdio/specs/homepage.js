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
    browser.waitForVisible('div#elm-app a.btn-show-all');

    // Assert the page have the expected title.
    const showAllLink = browser.getText('div#elm-app a.btn-show-all');
    assert.equal('הצג הכל', showAllLink);
  });

  it('should show user types labels in the selected language: hebrew', () => {
    browser.url('/municipality-1/node/1?language=he&user_type=residents');
    browser.waitForVisible('.btn-group.user-types');
    const business = browser.getText('.btn-group.user-types a:nth-child(1)');
    assert.equal('עסקים', business);

    const residents = browser.getText('.btn-group.user-types a:nth-child(2)');
    assert.equal('תושבים', residents);
  });

  it('should show user types labels in the selected language: english', () => {
    browser.url('/municipality-1/node/1?language=en&user_type=residents');
    business = browser.getText('.btn-group.user-types a:nth-child(1)');
    assert.equal('Businesses', business);

    residents = browser.getText('.btn-group.user-types a:nth-child(2)');
    assert.equal('Residents', residents);
  });

  it('Should show "english" language and "residents" chosen in the language and user type menus', () => {
    browser.url('/municipality-1/node/1?language=en&user_type=residents');
    browser.waitForVisible('.btn-group.user-types');
    browser.waitForVisible('.btn-group.languages');
    const userType = browser.getText('.btn-group.user-types .btn.btn-default.active');
    assert.equal('Residents', userType);

    const languague = browser.getText('.btn-group.languages .btn.btn-default.active');
    assert.equal('English', languague);
  });

  it('should show "hebrew" language and "residents" chosen in the language and user type menus', () => {
    browser.url('/municipality-1/node/1?language=he&user_type=residents');
    browser.waitForVisible('.btn-group.user-types');
    browser.waitForVisible('.btn-group.languages');

    const userType = browser.getText('.btn-group.user-types .btn.btn-default.active');
    assert.equal('תושבים', userType);

    const languague = browser.getText('.btn-group.languages .btn.btn-default.active');
    assert.equal('עברית', languague);
  });

  it('should show the "Do now" elements which fits the current user type and the hebrew language', () => {
    browser.url('/municipality-1/node/1?language=he&user_type=residents');
    browser.waitForVisible("h2=Do now");
    browser.waitForVisible('a=לקבל אישור תושב');
    browser.waitForVisible('a=לרשום חתונה');
  });

  it('Should show the "Do now" elements which fits the current user type and the arabic language', () => {
    browser.url('/municipality-1/node/1?language=ar&user_type=residents');
    browser.waitForVisible("h2=Do now");
    browser.waitForVisible('a=الحصول على الإقامة');
    browser.waitForVisible('a=السجل الزفاف');
  });

  it('Should not show the "Do now" elements which fits for "residents" when "businesses" user type is selected', () => {
    browser.url('/municipality-1/node/1?user_type=businesses&language=he');
    browser.waitForVisible("h2=Do now");
    assert(!browser.isVisible('a=לקבל אישור תושב'));
    assert(!browser.isVisible('a=לרשום חתונה'));
  });

  it('should show the action page for action with content in the body field', () => {
    browser.url('/municipality-1/node/1?language=he');
    browser.click(".item.action.homepage-teaser:nth-child(1) .content .header a");
    browser.waitForVisible('h2=לקבל אישור תושב');
  });

  it('should show only news for the selected user type "residents" on hebrew language', () => {
    browser.url('/municipality-1/node/1?user_type=residents&language=he');
    browser.waitForVisible('a=מבצע עיקור סירוס חתולי רחוב יתחיל ביום א 5.3.17');
  });

  it('should not show "businesses" news on "residents" homepage', () => {
    assert(!browser.isVisible('a=מבצע סגירת חובות ארנונה לעסקים'));
  });

  it('should show only news for the selected user type "businesses" on hebrew language', () => {
    browser.url('/municipality-1/node/1?user_type=businesses&language=he');
    browser.waitForVisible('a=מבצע סגירת חובות ארנונה לעסקים');
  });

  it('should not show "residents" news on "businesses" homepage', () => {
    assert(!browser.isVisible('a=מבצע עיקור סירוס חתולי רחוב יתחיל ביום א 5.3.17'));
  });

  it('should open an external "action" link in a new tab', () => {
    browser.url('/municipality-1/node/1?language=he');
    const target = browser.getAttribute('.item.action.homepage-teaser:nth-child(4) .content .header a', 'target');
    assert(target == '_blank');
  });

  it('should show FAQs only for the chosen user type "residents" and the hebrew language', () => {
    browser.url('/municipality-1/node/1?user_type=residents&language=he');
    browser.waitForVisible('label=כמה סייעות יש בגן ילדים?');
    browser.waitForVisible('label=באילו שעות מפנים את הזבל?');
  });

  it('should not show FAQs for "businesses" when "residents" are the chosen user type ', () => {
    assert(!browser.isVisible('label= האם גני ילדים זכאים לפטור מארנונה?'));
  });

  it('should show FAQs only for the chosen user type "businesses" and the hebrew language', () => {
    browser.url('/municipality-1/node/1?user_type=businesses&language=he');
    browser.waitForVisible('label=האם גני ילדים זכאים לפטור מארנונה?');
    browser.waitForVisible('label=באילו שעות מפנים את הזבל?');
  });

  it('should not show FAQs for "residents" when "businesses" are the chosen user type', () => {
    assert(!browser.isVisible('label=כמה סייעות יש בגן ילדים?'));
  });

  it('should open a news element in the same tab, with the hebrew language and residents user type', () => {
    browser.url('/municipality-1/node/1?user_type=residents&language=he');
    const news = $('#block-system-main .news-box > div > div > div:nth-child(2) > div:nth-child(1) > div > h3 > a');
    assert.equal('מבצע סגירת חובות ארנונה לתושבים', news.getText());
    news.click();
    browser.checkselectedcheckSelectedUserType('תושבים');
    browser.checkSelectedLanguage('עברית');
    browser.waitForVisible('h3=מבצע סגירת חובות ארנונה לתושבים');
  });

  it('should open a news element in the same tab, with the hebrew language and businesses user type', () => {
    browser.url('/municipality-1/node/1?user_type=businesses&language=he');
    const news = $('#block-system-main .news-box > div > div > div:nth-child(2) > div:nth-child(1) > div > h3 > a');
    assert.equal('מבצע סגירת חובות ארנונה לעסקים', news.getText());
    news.click();
    browser.checkselectedcheckSelectedUserType('עסקים');
    browser.checkSelectedLanguage('עברית');
    browser.waitForVisible('h3=מבצע סגירת חובות ארנונה לעסקים');
  });

  it('should open a news element in the same tab, with the arabic language and residents user type', () => {
    browser.url('/municipality-1/node/1?user_type=residents&language=ar');
    const news = $('#block-system-main .news-box > div > div > div:nth-child(2) > div:nth-child(1) > div > h3 > a');
    assert.equal('عملية إغلاق ديون ضريبة الأملاك للسكان', news.getText());
    news.click();
    browser.checkselectedcheckSelectedUserType('Residents AR');
    browser.checkSelectedLanguage('العربية');
    browser.waitForVisible('h3=عملية إغلاق ديون ضريبة الأملاك للسكان');
  });

  it('should open a news element in the same tab, with the arabic language and businesses user type', () => {
    browser.url('/municipality-1/node/1?user_type=businesses&language=ar');
    const news = $('#block-system-main .news-box > div > div > div:nth-child(2) > div:nth-child(1) > div > h3 > a');
    assert.equal('عملية الإنتهاء الديون الضريبية الممتلكات التجارية', news.getText());
    news.click();
    browser.checkselectedcheckSelectedUserType('Businesses AR');
    browser.checkSelectedLanguage('العربية');
    browser.waitForVisible('h3=عملية الإنتهاء الديون الضريبية الممتلكات التجارية');
  });
});
