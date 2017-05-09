Feature: Homepage
  In order to be make sure homepage content is accurate
  As an anonymous user
  We need to be able to see elements on the homepage

  @api
  Scenario Outline: Verify that the Municipality shows the default language and profile
    Given I am an anonymous user
     When I visit a "<municipality>" website homepage with no parameters in URL
     Then I should see the home page in the default "<language>" of the municipality and for "<citizens>" user profile

    Examples:
      | municipality            | language | citizens     |
      | طوبا الزنغرية           | العربية  | Residents AR |
      | عرعرة                   | العربية  | Residents AR |
      | المجلس الإقليمي للالسحرية | العربية  | Residents AR |
      | קריית מלאכי              | עברית    | תושבים       |


  @api @test
  Scenario Outline: Verify that the Municipality shows the content in the chosen language and profile
    Given I am an anonymous user
    When I visit a "<municipality>" website homepage with a specific "<language>" and a specific user "<profile>"
    Then I should see page "<title>" and "<text>" in the chosen "<language>" and for the chosen user "<profile>" only

    Examples:
      | municipality            | language | profile      | title                   | text                           |
      | طوبا الزنغرية           | ar       | residents    | طوبا الزنغرية           | وقت ما يسلب القمامة؟           |
      | طوبا الزنغرية           | he       | businesses   | טובא-זנגריה              | מבצע סגירת חובות ארנונה לעסקים  |
      | عرعرة                   | ar       | residents    | عرعرة                   | وقت ما يسلب القمامة؟           |
      | المجلس الإقليمي للالسحرية | ar       | residents    | المجلس الإقليمي للالسحرية | وقت ما يسلب القمامة؟           |
      | קריית מלאכי              | he       | residents    | קריית מלאכי              | באילו שעות מפנים את הזבל?      |
