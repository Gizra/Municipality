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
      | Tuba-Zangariyye         | العربية  | Residents AR |
      | Ar'ara                  | العربية  | Residents AR |
      | Al-Kasom                | العربية  | Residents AR |


  @api
  Scenario Outline: Verify that the Municipality shows the right links on the language switcher
    Given I am an anonymous user
    When I visit a "<municipality>" website homepage with no parameters in URL
    Then I should see "<languages>" menu only with languages with content for the current Municipality

    Examples:
      | municipality            | languages     |
      | Tuba-Zangariyye         | العربية,עברית |
      | Ar'ara                  | العربية,עברית |
      | Al-Kasom                | العربية,עברית |
      | Kiryat Malakhi          | English,עברית |
      | Tel-Aviv                |               |


  @api
  Scenario Outline: Verify that the Municipality shows the right links on the user type switcher
    Given I am an anonymous user
    When I visit a "<municipality>" website homepage with no parameters in URL
    Then I should see "<user types>" menu only for user types with content for the current Municipality

    Examples:
      | municipality    | user types                 |
      | Tuba-Zangariyye | Residents AR,Businesses AR |
      | Ar'ara          | Residents AR,Businesses AR |
      | Al-Kasom        | Residents AR,Businesses AR |
      | Kiryat Malakhi  |                            |


  @api
  Scenario Outline: Verify that the Municipality shows the content in the chosen language and user type
    Given I am an anonymous user
     When I visit a "<municipality>" website homepage with a specific "<language>" and a specific "<user type>"
     Then I should see page "<title>" and "<text>" in the chosen "<language>" and for the chosen "<user type>" only

    Examples:
      | municipality    | language | user type    | title                   | text                                                                                  |
      | Tuba-Zangariyye | ar       | residents    | طوبا الزنغرية           | سوف تبدأ التعقيم محايد القطط الضالة يوم الاحد 05/03/17                                 |
      | Tuba-Zangariyye | ar       | businesses   | طوبا الزنغرية           | عملية الإنتهاء الديون الضريبية الممتلكات التجارية                                      |
      | Tuba-Zangariyye | he       | residents    | טובא-זנגריה              | מבצע עיקור סירוס חתולי רחוב יתחיל ביום א 5.3.17                                         |
      | Tuba-Zangariyye | he       | businesses   | טובא-זנגריה              | מבצע סגירת חובות ארנונה לעסקים                                                        |
      | Ar'ara          | ar       | residents    | عرعرة                   | ​إعلان من الشرطة                                                                        |
      | Al-Kasom        | he       | residents    | אל-קסום                 | הצלחה למרכז המדעים בקריית מלאכי                                                      |


  @api
  Scenario Outline: Verify that the user can change the Municipality's language and user type and the page shows the right content
    Given I am an anonymous user
     When I visit a "<municipality>" website homepage with a specific "<language>" and a specific "<user type>"
      And I change user type to a "<new user type>"
     Then I should see the homepage in the current "<language>" and the "<new user type>"

    Examples:
      | municipality    | language | user type    | new user type |
      | Tuba-Zangariyye | ar       | residents    | Businesses AR |
      | Tuba-Zangariyye | ar       | businesses   | Residents AR  |
      | Tuba-Zangariyye | he       | residents    | עסקים         |
      | Tuba-Zangariyye | he       | businesses   | תושבים        |
      | Ar'ara          | ar       | residents    | Businesses AR |
      | Al-Kasom        | he       | residents    | עסקים         |

  @api
  Scenario: Verify that if admin adds a user type, the menu will be displayed on homepage
    Given I login with user "liat"
    When I "add" "Residents" user type to municipality "Kiryat Malakhi"
    And I am an anonymous user
    Then the user type menu should "appear" on municipality "Kiryat Malakhi" homepage for user types "עסקים,תושבים"

  @api
  Scenario: Verify that if admin removes a user type, when there are two, the menu will not be displayed on homepage
    Given I login with user "liat"
    When I "remove" "Residents" user type to municipality "Kiryat Malakhi"
    And I am an anonymous user
    Then the user type menu should "not appear" on municipality "Kiryat Malakhi" homepage for user types "none"

  @api
  Scenario: Verify that site name is Municipality
    Given I login with user "liat"
    When I visit the page "Homepage"
    Then I should see the "Municipality" header
