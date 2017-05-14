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
      | קריית מלאכי              | עברית    | תושבים       |


  @api @test
  Scenario Outline: Verify that the Municipality shows the content in the chosen language and user type
    Given I am an anonymous user
    When I visit a "<municipality>" website homepage with a specific "<language>" and a specific "<user_type>"
    Then I should see page "<title>" and "<text>" in the chosen "<language>" and for the chosen "<user_type>" only

    Examples:
      | municipality            | language | user_type    | title                   | text                                                                                  |
      | طوبا الزنغرية           | ar       | residents    | طوبا الزنغرية           | سوف تبدأ التعقيم محايد القطط الضالة يوم الاحد 05/03/17                                 |
      | طوبا الزنغرية           | ar       | businesses   | طوبا الزنغرية           | عملية الإنتهاء الديون الضريبية الممتلكات التجارية                                      |
      | طوبا الزنغرية           | he       | residents    | טובא-זנגריה              | מבצע עיקור סירוס חתולי רחוב יתחיל ביום א 5.3.17                                         |
      | طوبا الزنغرية           | he       | businesses   | טובא-זנגריה              | מבצע סגירת חובות ארנונה לעסקים                                                        |
      | عرعرة                   | ar       | residents    | عرعرة                   | ​إعلان من الشرطة                                                                        |
      | المجلس الإقليمي للالسحرية | he       | residents    | אל-קסום                 | הצלחה למרכז המדעים בקריית מלאכי                                                      |
      | קריית מלאכי              | he       | residents    | קריית מלאכי             | פתיחת שלוחות הרווחה במרכזים הקהילתיים הרב -תכליתיים במועצת אל-קסום                    |
      | קריית מלאכי              | he       | businesses   | קריית מלאכי             | היסטוריה במועצה אזורית אל-קסום: חוברו מוסדות החינוך לרשת החשמל של היישוב הבדואי אל-סייד |
