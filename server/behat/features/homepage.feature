Feature: Homepage
  In order to get information about the Municipality
  As an anonymous user
  We need to be able to see public content on the homepage

  @api
  Scenario Outline: Verify that the Municipality shows the default language and user type
    Given I am an anonymous user
     When I visit a "<municipality>" website homepage with no parameters in URL
     Then I should see the home page in the default "<language>" of the municipality and for "<citizens>" user type

    Examples:
      | municipality            | language | citizens     |
      | طوبا الزنغرية           | العربية  | Residents AR |
      | عرعرة                   | العربية  | Residents AR |
      | المجلس الإقليمي للالسحرية | العربية  | Residents AR |


  @api
  Scenario Outline: Verify that the Municipality shows the right links on the language switcher
    Given I am an anonymous user
    When I visit a "<municipality>" website homepage with no parameters in URL
    Then I should see "<languages>" menu only with languages with content for the current Municipality

    Examples:
      | municipality            | languages     |
      | طوبا الزنغرية           | العربية,עברית |
      | عرعرة                   | العربية,עברית |
      | المجلس الإقليمي للالسحرية | العربية,עברית |
      | קריית מלאכי              | English,עברית |
      | Tel-Aviv                |               |


  @api
  Scenario Outline: Verify that the Municipality shows the right links on the user type switcher
    Given I am an anonymous user
    When I visit a "<municipality>" website homepage with no parameters in URL
    Then I should see "<user types>" menu only for user types with content for the current Municipality

    Examples:
      | municipality            | user types                 |
      | طوبا الزنغرية           | Residents AR,Businesses AR |
      | عرعرة                   | Residents AR,Businesses AR |
      | المجلس الإقليمي للالسحرية | Residents AR,Businesses AR |
      | קריית מלאכי              |                            |


  @api
  Scenario Outline: Verify that the Municipality shows the content in the chosen language and user type
    Given I am an anonymous user
     When I visit a "<municipality>" website homepage with a specific "<language>" and a specific "<user type>"
     Then I should see page "<title>" and "<text>" in the chosen "<language>" and for the chosen "<user type>" only

    Examples:
      | municipality            | language | user type    | title                   | text                                                                                  |
      | طوبا الزنغرية           | ar       | residents    | طوبا الزنغرية           | سوف تبدأ التعقيم محايد القطط الضالة يوم الاحد 05/03/17                                 |
      | طوبا الزنغرية           | ar       | businesses   | طوبا الزنغرية           | عملية الإنتهاء الديون الضريبية الممتلكات التجارية                                      |
      | طوبا الزنغرية           | he       | residents    | טובא-זנגריה              | מבצע עיקור סירוס חתולי רחוב יתחיל ביום א 5.3.17                                         |
      | طوبا الزنغرية           | he       | businesses   | טובא-זנגריה              | מבצע סגירת חובות ארנונה לעסקים                                                        |
      | عرعرة                   | ar       | residents    | عرعرة                   | ​إعلان من الشرطة                                                                        |
      | المجلس الإقليمي للالسحرية | he       | residents    | אל-קסום                 | הצלחה למרכז המדעים בקריית מלאכי                                                      |


  @api
  Scenario Outline: Verify that the user can change the Municipality's language and user type and the page shows the right content
    Given I am an anonymous user
     When I visit a "<municipality>" website homepage with a specific "<language>" and a specific "<user type>"
      And I change user type to a "<new user type>"
     Then I should see the homepage in the current "<language>" and the "<new user type>"

    Examples:
      | municipality            | language | user type    | new user type |
      | طوبا الزنغرية           | ar       | residents    | Businesses AR |
      | طوبا الزنغرية           | ar       | businesses   | Residents AR  |
      | طوبا الزنغرية           | he       | residents    | עסקים         |
      | طوبا الزنغرية           | he       | businesses   | תושבים        |
      | عرعرة                   | ar       | residents    | Businesses AR |
      | المجلس الإقليمي للالسحرية | he       | residents    | עסקים         |
