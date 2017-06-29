const assert = require('assert');

describe('Municipality homepage', () => {
  before(() => {
    browser.url('/municipality-1/node/1?language=he');
  });

  const IvisitHomepage = (municipality, language = false, userType = false) => {
    const languageText = {
      'hebrew': 'he',
      'arabic': 'ar',
      'english':'en',
    };

    var url = '/municipality-'+ municipality + '/node/' + municipality + ((userType || language) ? '/?' : '') ;
    url = url + ((userType) ? ('user_type=' + userType) : '');
    url = url + ((userType && language) ? '&' : '');
    url = url + ((language) ? ('language=' + languageText[language]) : '');
    browser.url(url);
  };

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
    IvisitHomepage('1', 'hebrew', 'residents');
    browser.waitForVisible('.btn-group.user-types');
    const business = browser.getText('.btn-group.user-types a:nth-child(1)');
    assert.equal('עסקים', business);

    const residents = browser.getText('.btn-group.user-types a:nth-child(2)');
    assert.equal('תושבים', residents);
  });

  it('should show user types labels in the selected language: english', () => {
    IvisitHomepage('1', 'english', 'residents');
    business = browser.getText('.btn-group.user-types a:nth-child(1)');
    assert.equal('Businesses', business);

    residents = browser.getText('.btn-group.user-types a:nth-child(2)');
    assert.equal('Residents', residents);
  });

  it('Should show "english" language and "residents" chosen in the language and user type menus', () => {
    IvisitHomepage('1','english', 'residents');
    checkSelectedLanguage('english');
    checkSelectedUserType('residents', 'english');
  });

  it('should show "hebrew" language and "residents" chosen in the language and user type menus', () => {
    IvisitHomepage('1', 'hebrew', 'residents');
    checkSelectedLanguage('hebrew');
    checkSelectedUserType('residents', 'hebrew');
  });

  it('should show the "Do now" elements which fits the current user type and the hebrew language', () => {
    IvisitHomepage('1', 'hebrew', 'residents');
    browser.waitForVisible("h2=Do now");
    browser.waitForVisible('a=לקבל אישור תושב');
    browser.waitForVisible('a=לרשום חתונה');
  });

  it('Should show the "Do now" elements which fits the current user type and the arabic language', () => {
    IvisitHomepage('1', 'arabic', 'residents');
    browser.waitForVisible("h2=Do now");
    browser.waitForVisible('a=الحصول على الإقامة');
    browser.waitForVisible('a=السجل الزفاف');
  });

  it('Should not show the "Do now" elements which fits for "residents" when "businesses" user type is selected', () => {
    IvisitHomepage('1', 'hebrew', 'businesses');
    browser.waitForVisible("h2=Do now");
    assert(!browser.isVisible('a=לקבל אישור תושב'));
    assert(!browser.isVisible('a=לרשום חתונה'));
  });

  it('should show the internal action page when clicking on the action link in the same tab, in hebrew', () => {
    IvisitHomepage('1', 'hebrew');
    browser.click(".item.action.homepage-teaser:nth-child(1) .content .header a");
    browser.waitForVisible('h2=לקבל אישור תושב');
  });

  it('should show the internal action page when clicking on the action link in the same tab, in arabic', () => {
    IvisitHomepage('1', 'arabic');
    browser.click(".item.action.homepage-teaser:nth-child(1) .content .header a");
    browser.waitForVisible('h2=الحصول على الإقامة');
  });


  it('should open an external "action" link in a new tab', () => {
    IvisitHomepage('1', 'hebrew');
    const target = browser.getAttribute('.item.action.homepage-teaser:nth-child(4) .content .header a', 'target');
    assert(target == '_blank');
  });

  it('should show the municipality title for the news', () => {
    IvisitHomepage('1', 'hebrew', 'residents');
    browser.waitForVisible("h2=What's happening in טובא-זנגריה?");
  });

  it('should show only news for the selected user type "residents" on hebrew language', () => {
    IvisitHomepage('1', 'hebrew', 'residents');
    browser.waitForVisible('a=מבצע עיקור סירוס חתולי רחוב יתחיל ביום א 5.3.17');
  });

  it('should not show "businesses" news on "residents" homepage', () => {
    assert(!browser.isVisible('a=מבצע סגירת חובות ארנונה לעסקים'));
  });

  it('should show only news for the selected user type "businesses" on hebrew language', () => {
    IvisitHomepage('1', 'hebrew', 'businesses');
    browser.waitForVisible('a=מבצע סגירת חובות ארנונה לעסקים');
  });

  it('should not show "residents" news on "businesses" homepage', () => {
    assert(!browser.isVisible('a=מבצע עיקור סירוס חתולי רחוב יתחיל ביום א 5.3.17'));
  });

  it('should show FAQs only for the chosen user type "residents" and the hebrew language', () => {
    IvisitHomepage('1', 'hebrew', 'residents');
    browser.waitForVisible('label=כמה סייעות יש בגן ילדים?');
    browser.waitForVisible('label=באילו שעות מפנים את הזבל?');
  });

  it('should not show FAQs for "businesses" when "residents" are the chosen user type ', () => {
    assert(!browser.isVisible('label= האם גני ילדים זכאים לפטור מארנונה?'));
  });

  it('should show FAQs only for the chosen user type "businesses" and the hebrew language', () => {
    IvisitHomepage('1', 'hebrew', 'businesses');
    browser.waitForVisible('label=האם גני ילדים זכאים לפטור מארנונה?');
    browser.waitForVisible('label=באילו שעות מפנים את הזבל?');
  });

  it('should not show FAQs for "residents" when "businesses" are the chosen user type', () => {
    assert(!browser.isVisible('label=כמה סייעות יש בגן ילדים?'));
  });

  it('should open a news element in the same tab, with the hebrew language and residents user type', () => {
    IvisitHomepage('1', 'hebrew', 'residents');
    clickOnNewsItem('מבצע סגירת חובות ארנונה לתושבים');
    checkSelectedUserType('residents', 'hebrew');
    checkSelectedLanguage('hebrew');
  });

  it('should open a news element in the same tab, with the hebrew language and businesses user type', () => {
    IvisitHomepage('1', 'hebrew', 'businesses');
    clickOnNewsItem('מבצע סגירת חובות ארנונה לעסקים');
    checkSelectedUserType('businesses', 'hebrew');
    checkSelectedLanguage('hebrew');
  });

  it('should open a news element in the same tab, with the arabic language and residents user type', () => {
    IvisitHomepage('1', 'arabic', 'residents');
    clickOnNewsItem('عملية إغلاق ديون ضريبة الأملاك للسكان');
    checkSelectedUserType('residents', 'arabic');
    checkSelectedLanguage('arabic');
  });

  it('should open a news element in the same tab, with the arabic language and businesses user type', () => {
    IvisitHomepage('1', 'arabic', 'businesses');
    clickOnNewsItem('عملية الإنتهاء الديون الضريبية الممتلكات التجارية');
    checkSelectedUserType('businesses', 'arabic');
    checkSelectedLanguage('arabic');
  });

  it('should show topics list for the current municipality', () => {
    IvisitHomepage('1', 'hebrew', 'residents');
    browser.waitForVisible('button=איסוף אשפה');
    browser.waitForVisible('button=גני ילדים');
  });

  it('should show events for the municiality 1 with the default language: arabic and user type: residents', () => {
    IvisitHomepage('1');
    browser.waitForVisible('h4=المقاولون الجولة: توريد وتركيب أنظمة تكييف الهواء في قاعة المدينة');
    browser.waitForVisible('h4=مسرحية للأطفال: صباح السبت');
  });

  it('should show events for the municiality 2 with the default language: arabic and user type: residents', () => {
    IvisitHomepage('2');
    browser.waitForVisible('h4=مسرحية للأطفال: صباح السبت');
    assert(!browser.isVisible('h4=المقاولون الجولة: توريد وتركيب أنظمة تكييف الهواء في قاعة المدينة'));
  });

  it('should show events by the municiality 4 with the default language: hebrew', () => {
    IvisitHomepage('4');
    browser.waitForVisible('h4=הצגת ילדים: שבת בבוקר');
  });

  it('should show only events for residents user type in hebrew', () => {
    IvisitHomepage('2', 'hebrew', 'residents');
    browser.waitForVisible('h4=הצגת ילדים: שבת בבוקר');
    assert(!browser.isVisible('h4=סיור קבלנים: אספקה והתקנה של מערכות מיזוג האוויר לבניין העירייה'));
  });

  it('should show only events for residents user type in arabic', () => {
    IvisitHomepage('2', 'arabic', 'residents');
    browser.waitForVisible('h4=مسرحية للأطفال: صباح السبت');
    assert(!browser.isVisible('h4=المقاولون الجولة: توريد وتركيب أنظمة تكييف الهواء في قاعة المدينة'));
  });

  it('should show only events for businesses user type in hebrew', () => {
    IvisitHomepage('1', 'hebrew', 'businesses');
    browser.waitForVisible('h4=סיור קבלנים: אספקה והתקנה של מערכות מיזוג האוויר לבניין העירייה');
    assert(!browser.isVisible('h4=הצגת ילדים: שבת בבוקר'));
  });

  it('should show only events for businesses user type in arabic', () => {
    IvisitHomepage('1', 'arabic', 'businesses');
    browser.waitForVisible('h4=المقاولون الجولة: توريد وتركيب أنظمة تكييف الهواء في قاعة المدينة');
    assert(!browser.isVisible('h4=مسرحية للأطفال: صباح السبت'));
  });

  it('should show the events page with the hebrew language and residents user type, when clicking on see all events button', () => {
    IvisitHomepage('1', 'hebrew', 'residents');
    const eventsButton = $('.pane-elm .btn-show-all');
    eventsButton.click();
    browser.waitForVisible('div=סיור קבלנים: אספקה והתקנה של מערכות מיזוג האוויר לבניין העירייה');
    browser.waitForVisible('div=הצגת ילדים: שבת בבוקר');
    checkSelectedUserType('residents', 'hebrew');
    checkSelectedLanguage('hebrew');
  });

  it('should show the events page with the arabic language and residents user type, when clicking on see all events button', () => {
    IvisitHomepage('1', 'arabic', 'residents');
    const eventsButton = $('.pane-elm .btn-show-all');
    eventsButton.click();
    browser.waitForVisible('div=المقاولون الجولة: توريد وتركيب أنظمة تكييف الهواء في قاعة المدينة');
    browser.waitForVisible('div=مسرحية للأطفال: صباح السبت');
    checkSelectedUserType('residents', 'arabic');
    checkSelectedLanguage('arabic');
  });

  it('should show the events page with the hebrew language and businesses user type, when clicking on see all events button', () => {
    IvisitHomepage('1', 'hebrew', 'businesses');
    const eventsButton = $('.pane-elm .btn-show-all');
    eventsButton.click();
    browser.waitForVisible('div=סיור קבלנים: אספקה והתקנה של מערכות מיזוג האוויר לבניין העירייה');
    checkSelectedUserType('businesses', 'hebrew');
    checkSelectedLanguage('hebrew');
  });

  it('should show the events page with the arabic language and businesses user type, when clicking on see all events button', () => {
    IvisitHomepage('1', 'arabic', 'businesses');
    const eventsButton = $('.pane-elm .btn-show-all');
    eventsButton.click();
    browser.waitForVisible('div=المقاولون الجولة: توريد وتركيب أنظمة تكييف الهواء في قاعة المدينة');
    checkSelectedUserType('businesses', 'arabic');
    checkSelectedLanguage('arabic');
  });

  it('should redirect user to the group view page', () => {
    browser.url('/municipality-1');
    browser.waitForVisible('h2=Frequently asked questions');

    // Click on logo and expect to be on the same page.
    browser.click('#logo');
    browser.waitForVisible('h2=Frequently asked questions');
  });
});
