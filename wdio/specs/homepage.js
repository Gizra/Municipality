const assert = require('assert');

describe('Municipality homepage', () => {
  before(() => {
    browser.login('noam');
    browser.url('/tuba-zangariyye/node/1?language=he');
  });

  const checkSelectedLanguage = (language) => {
    browser.waitForVisible('.btn-group.languages');
    const activeLanguage= browser.getText('.btn-group.languages .btn.btn-default.active');
    const languageText = {
      'hebrew': 'עברית',
      'arabic': 'العربية',
      'english':'English',
    };
    assert(languageText[language] == activeLanguage, `Expected page language is ${language}, but instead it's ${activeLanguage}`);
  };

  const checkSelectedUserType = (userType, language) => {
    browser.waitForVisible('.btn-group.user-types');
    const user = browser.getText('.btn-group.user-types .btn.btn-default.active');
    const userTypeText = {
      'residents': {
        'hebrew': 'תושבים',
        'english': 'Residents',
        'arabic': 'Residents AR',
      },
      'businesses': {
        'hebrew': 'עסקים',
        'english': 'Businesses',
        'arabic': 'Businesses AR',
      },
    };


    assert(user ==  userTypeText[userType][language], `Expected user type in the page is ${userTypeText[userType][language]}, but instead it's ${user}`);
  };

  const clickOnNewsItem = (item) => {
    const newsItem = $('.news-box .testimonial-primary:nth-child(1) a');
    assert.equal(item, newsItem.getText());
    assert((item == newsItem.getText()), `News item ${item} was not found in the page`);
    newsItem.click();
    browser.waitForVisible('h3=' + item);
  };

  it('should show the correct name of the municipality', () => {
    browser.waitForVisible('header#header .container #site-name > h1');

    // Assert the page have the expected title.
    const muniTitle = browser.getText('header#header .container #site-name > h1');
    assert.equal('טובא-זנגריה', muniTitle);
  });

  it('should show the user types selector', () => {
    browser.waitForVisible('.row .col-md-3 > .btn-group.user-types');
  });

  it('should show the event\'s "show all" button', () => {
    browser.waitForVisible('div#elm-app a.btn-show-all');

    // Assert the page have the expected title.
    const showAllLink = browser.getText('div#elm-app a.btn-show-all');
    assert.equal('כל האירועים', showAllLink);
  });

  it('should show user types labels in the selected language: hebrew', () => {
    browser.url('/tuba-zangariyye/node/1?language=he&user_type=residents');
    browser.waitForVisible('.btn-group.user-types');
    const business = browser.getText('.btn-group.user-types a:nth-child(1)');
    assert.equal('עסקים', business);

    const residents = browser.getText('.btn-group.user-types a:nth-child(2)');
    assert.equal('תושבים', residents);
  });

  it('should show user types labels in the selected language: english', () => {
    browser.url('/tuba-zangariyye/node/1?language=en&user_type=residents');
    business = browser.getText('.btn-group.user-types a:nth-child(1)');
    assert.equal('Businesses', business);

    residents = browser.getText('.btn-group.user-types a:nth-child(2)');
    assert.equal('Residents', residents);
  });

  it('Should show "english" language and "residents" chosen in the language and user type menus', () => {
    browser.url('/tuba-zangariyye/node/1?language=en&user_type=residents');
    checkSelectedLanguage('english');
    checkSelectedUserType('residents', 'english');
  });

  it('should show "hebrew" language and "residents" chosen in the language and user type menus', () => {
    browser.url('/tuba-zangariyye/node/1?language=he&user_type=residents');
    checkSelectedLanguage('hebrew');
    checkSelectedUserType('residents', 'hebrew');
  });

  it('should show the "Do now" elements which fits the current user type and the hebrew language', () => {
    browser.url('/tuba-zangariyye/node/1?language=he&user_type=residents');
    browser.waitForVisible("h2=Do now");
    browser.waitForVisible('a=לקבל אישור תושב');
    browser.waitForVisible('a=לרשום חתונה');
  });

  it('Should show the "Do now" elements which fits the current user type and the arabic language', () => {
    browser.url('/tuba-zangariyye/node/1?language=ar&user_type=residents');
    browser.waitForVisible("h2=Do now");
    browser.waitForVisible('a=الحصول على الإقامة');
    browser.waitForVisible('a=السجل الزفاف');
  });

  it('Should not show the "Do now" elements which fits for "residents" when "businesses" user type is selected', () => {
    browser.url('/tuba-zangariyye/node/1?user_type=businesses&language=he');
    browser.waitForVisible("h2=Do now");
    assert(!browser.isVisible('a=לקבל אישור תושב'));
    assert(!browser.isVisible('a=לרשום חתונה'));
  });

  it('should show the internal action page when clicking on the action link in the same tab, in hebrew', () => {
    browser.url('/tuba-zangariyye/node/1?language=he');
    browser.click(".item.action.homepage-teaser:nth-child(1) .content .header a");
    browser.waitForVisible('h2=לקבל אישור תושב');
  });

  it('should show the internal action page when clicking on the action link in the same tab, in arabic', () => {
    browser.url('/tuba-zangariyye/node/1?language=ar');
    browser.click(".item.action.homepage-teaser:nth-child(1) .content .header a");
    browser.waitForVisible('h2=الحصول على الإقامة');
  });


  it('should open an external "action" link in a new tab', () => {
    browser.url('/tuba-zangariyye/node/1?language=he');
    const target = browser.getAttribute('.item.action.homepage-teaser:nth-child(4) .content .header a', 'target');
    assert(target == '_blank');
  });

  it('should show the municipality title for the news', () => {
    browser.url('/tuba-zangariyye/node/1?user_type=residents&language=he');
    browser.waitForVisible("h2=What's happening in טובא-זנגריה?");
  });

  it('should show only news for the selected user type "residents" on hebrew language', () => {
    browser.url('/tuba-zangariyye/node/1?user_type=residents&language=he');
    browser.waitForVisible('a=מבצע עיקור סירוס חתולי רחוב יתחיל ביום א 5.3.17');
  });

  it('should not show "businesses" news on "residents" homepage', () => {
    assert(!browser.isVisible('a=מבצע סגירת חובות ארנונה לעסקים'));
  });

  it('should show only news for the selected user type "businesses" on hebrew language', () => {
    browser.url('/tuba-zangariyye/node/1?user_type=businesses&language=he');
    browser.waitForVisible('a=מבצע סגירת חובות ארנונה לעסקים');
  });

  it('should not show "residents" news on "businesses" homepage', () => {
    assert(!browser.isVisible('a=מבצע עיקור סירוס חתולי רחוב יתחיל ביום א 5.3.17'));
  });

  it('should show FAQs only for the chosen user type "residents" and the hebrew language', () => {
    browser.url('/tuba-zangariyye/node/1?user_type=residents&language=he');
    browser.waitForVisible('a=כמה סייעות יש בגן ילדים?');
    browser.waitForVisible('a=באילו שעות מפנים את הזבל?');
  });

  it('should not show FAQs for "businesses" when "residents" are the chosen user type ', () => {
    assert(!browser.isVisible('a= האם גני ילדים זכאים לפטור מארנונה?'));
  });

  it('should show FAQs only for the chosen user type "businesses" and the hebrew language', () => {
    browser.url('/tuba-zangariyye/node/1?user_type=businesses&language=he');
    browser.waitForVisible('a=האם גני ילדים זכאים לפטור מארנונה?');
    browser.waitForVisible('a=באילו שעות מפנים את הזבל?');
  });

  it('should not show FAQs for "residents" when "businesses" are the chosen user type', () => {
    assert(!browser.isVisible('a=כמה סייעות יש בגן ילדים?'));
  });

  it('should open a news element in the same tab, with the hebrew language and residents user type', () => {
    browser.url('/tuba-zangariyye/node/1?user_type=residents&language=he');
    clickOnNewsItem('מבצע סגירת חובות ארנונה לתושבים');
    checkSelectedUserType('residents', 'hebrew');
    checkSelectedLanguage('hebrew');
  });

  it('should open a news element in the same tab, with the hebrew language and businesses user type', () => {
    browser.url('/tuba-zangariyye/node/1?user_type=businesses&language=he');
    clickOnNewsItem('מבצע סגירת חובות ארנונה לעסקים');
    checkSelectedUserType('businesses', 'hebrew');
    checkSelectedLanguage('hebrew');
  });

  it('should open a news element in the same tab, with the arabic language and residents user type', () => {
    browser.url('/tuba-zangariyye/node/1?user_type=residents&language=ar');
    clickOnNewsItem('عملية إغلاق ديون ضريبة الأملاك للسكان');
    checkSelectedUserType('residents', 'arabic');
    checkSelectedLanguage('arabic');
  });

  it('should open a news element in the same tab, with the arabic language and businesses user type', () => {
    browser.url('/tuba-zangariyye/node/1?user_type=businesses&language=ar');
    clickOnNewsItem('عملية الإنتهاء الديون الضريبية الممتلكات التجارية');
    checkSelectedUserType('businesses', 'arabic');
    checkSelectedLanguage('arabic');
  });

  it('should show topics list for the current municipality', () => {
    browser.url('/tuba-zangariyye/node/1?user_type=residents&language=he');
    browser.waitForVisible('a=איסוף אשפה');
    browser.waitForVisible('a=גני ילדים');
  });

  it('should show events for the municiality 1 with the default language: arabic and user type: residents', () => {
    browser.url('/tuba-zangariyye/node/1');
    browser.waitForVisible('h4=المقاولون الجولة: توريد وتركيب أنظمة تكييف الهواء في قاعة المدينة');
    browser.waitForVisible('h4=مسرحية للأطفال: صباح السبت');
    browser.waitForVisible('h4=الأداء: ايدان رايشل');
  });

  it('should show events for the municiality 2 with the default language: arabic and user type: residents', () => {
    browser.url('/ar-ara/node/2');
    browser.waitForVisible('h4=مسرحية للأطفال: صباح السبت');
    assert(!browser.isVisible('h4=المقاولون الجولة: توريد وتركيب أنظمة تكييف الهواء في قاعة المدينة'));
  });

  it('should show events by the municiality 4 with the default language: hebrew', () => {
    browser.url('/kiryat-malakhi/node/4');
    browser.waitForVisible('h4=הצגת ילדים: שבת בבוקר');
  });

  it('should show only events for residents user type in hebrew', () => {
    browser.url('/ar-ara/node/2?user_type=residents&language=he');
    browser.waitForVisible('h4=הצגת ילדים: שבת בבוקר');
    assert(!browser.isVisible('h4=סיור קבלנים: אספקה והתקנה של מערכות מיזוג האוויר לבניין העירייה'));
  });

  it('should show only events for residents user type in arabic', () => {
    browser.url('/ar-ara/node/2?user_type=residents&language=ar');
    browser.waitForVisible('h4=مسرحية للأطفال: صباح السبت');
    assert(!browser.isVisible('h4=المقاولون الجولة: توريد وتركيب أنظمة تكييف الهواء في قاعة المدينة'));
  });

  it('should show only events for businesses user type in hebrew', () => {
    browser.url('/tuba-zangariyye/?user_type=businesses&language=he');
    browser.waitForVisible('h4=סיור קבלנים: אספקה והתקנה של מערכות מיזוג האוויר לבניין העירייה');
    assert(!browser.isVisible('h4=הצגת ילדים: שבת בבוקר'));
  });

  it('should show only events for businesses user type in arabic', () => {
    browser.url('/tuba-zangariyye/?user_type=businesses&language=ar');
    browser.waitForVisible('h4=المقاولون الجولة: توريد وتركيب أنظمة تكييف الهواء في قاعة المدينة');
    assert(!browser.isVisible('h4=مسرحية للأطفال: صباح السبت'));
  });

  it('should show the events page with the hebrew language and residents user type, when clicking on see all events button', () => {
    browser.url('/tuba-zangariyye/?user_type=residents&language=he');
    const eventsButton = $('.pane-elm .btn-show-all');
    eventsButton.click();
    browser.waitForVisible('h4=סיור קבלנים: אספקה והתקנה של מערכות מיזוג האוויר לבניין העירייה');
    browser.waitForVisible('h4=הצגת ילדים: שבת בבוקר');
    browser.waitForVisible('h4=הופעה: עידן רייכל');
    checkSelectedUserType('residents', 'hebrew');
    checkSelectedLanguage('hebrew');
  });

  it('should show the events page with the arabic language and residents user type, when clicking on see all events button', () => {
    browser.url('/tuba-zangariyye/?user_type=residents&language=ar');
    const eventsButton = $('.pane-elm .btn-show-all');
    eventsButton.click();
    browser.waitForVisible('h4=المقاولون الجولة: توريد وتركيب أنظمة تكييف الهواء في قاعة المدينة');
    browser.waitForVisible('h4=مسرحية للأطفال: صباح السبت');
    browser.waitForVisible('h4=الأداء: ايدان رايشل');
    checkSelectedUserType('residents', 'arabic');
    checkSelectedLanguage('arabic');
  });

  it('should show the events page with the hebrew language and businesses user type, when clicking on see all events button', () => {
    browser.url('/tuba-zangariyye/?user_type=businesses&language=he');
    const eventsButton = $('.pane-elm .btn-show-all');
    eventsButton.click();
    browser.waitForVisible('h4=סיור קבלנים: אספקה והתקנה של מערכות מיזוג האוויר לבניין העירייה');
    checkSelectedUserType('businesses', 'hebrew');
    checkSelectedLanguage('hebrew');
  });

  it('should show the events page with the arabic language and businesses user type, when clicking on see all events button', () => {
    browser.url('/tuba-zangariyye/node/1?user_type=businesses&language=ar');
    const eventsButton = $('.pane-elm .btn-show-all');
    eventsButton.click();
    browser.waitForVisible('h4=المقاولون الجولة: توريد وتركيب أنظمة تكييف الهواء في قاعة المدينة');
    checkSelectedUserType('businesses', 'arabic');
    checkSelectedLanguage('arabic');
  });

  it('should see default image for events without an image', () => {
    browser.url('/tuba-zangariyye');
    browser.waitForVisible('h2=Upcoming events');

    // Second event entity doesn't have an image and should get the default
    // image.
    assert(browser.isVisible('#elm-app .row div:nth-child(2) .card-img-top img'));
  });

  it('should redirect user to the group view page', () => {
    browser.url('/tuba-zangariyye');
    browser.waitForVisible('h2=Frequently asked questions');

    // Click on logo and expect to be on the same page.
    browser.click('#logo');
    browser.waitForVisible('h2=Frequently asked questions');
  });

  it('should see the social link icons after saving the municipality', () => {
    browser.url('/tuba-zangariyye');
    browser.waitForVisible('.social-icons');

    const fbClass = browser.getAttribute('ul.social-icons li:nth-child(1)', 'class');
    assert.equal('social-icons-facebook', fbClass);

    // Save the municipality and expect to see the same class.
    browser.url('/tuba-zangariyye/node/1/edit');
    browser.click('#edit-submit');

    browser.waitForVisible('.social-icons');

    const fbClassAfterSave = browser.getAttribute('ul.social-icons li:nth-child(1)', 'class');
    assert.equal('social-icons-facebook', fbClassAfterSave);
  });

  it('should have sticky header on scroll', () => {
    browser.url('/tuba-zangariyye?language=he');
    browser.waitForVisible('h1=טובא-זנגריה');

    // Scroll a bit into the page.
    browser.scroll('.panel-pane.pane-faqs-accordion');

    // We should see this class added to the "html" tag.
    browser.waitForVisible('html.sticky-header-active');
  });

  it('should have about page link', () => {
    browser.url('/tuba-zangariyye?language=he');
    browser.waitForVisible('h5=My Municipality');
  });

  it('should not see image borders when the "news" entity does not have an image', () => {
    browser.url('/ar-ara/node/2?language=he');
    browser.waitForVisible('h2=What\'s happening in ערערה?');

    assert(!browser.isVisible('.news-box .testimonial:nth-child(1) .testimonial-author .testimonial-author-thumbnail'));
  });

  it('should have two default buttons for Events and Contacts pages in the topics list', () => {
    browser.url('/kiryat-malakhi?language=en');
    browser.waitForVisible('h2=Topics in the site');

    const contactsButton = browser.getText('.pane-topics-list p a:nth-child(1)');
    assert.equal('Contacts', contactsButton);

    const eventsButton = browser.getText('.pane-topics-list p a:nth-child(2)');
    assert.equal('Events', eventsButton);
  });

  it('should not see "add a new topic" as Municipality\'s editor.', () => {
    browser.url('/tuba-zangariyye/node/1?language=en');
    browser.waitForVisible('h2=Topics in the site');

    assert(browser.isVisible('a=Add a new topic'));
  });

  it('should not see "add a new topic" as a normal user', () => {
    browser.url('/kiryat-malakhi/node/4?language=en');
    browser.waitForVisible('h2=Topics in the site');

    assert(!browser.isVisible('a=Add a new topic'));
  });

  after(() => {
    browser.logout();
  });
});
