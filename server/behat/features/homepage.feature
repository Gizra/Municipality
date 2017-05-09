Feature: Homepage
  In order to be make sure homepage content is accurate
  As an anonymous user
  We need to be able to see elements on the homepage

  @api
  Scenario Outline: Verify that the Municipality shows the default language and profile
    Given I am an anonymous user
     When I visit a "<municipality>" website homepage with no parameters in URL
     Then I should see the home page in the default "<language>" of the municipality and for citizens user profile

    Examples:
      | municipality            | language |
      | طوبا الزنغرية           | ar       |
      | عرعرة                   | ar       |
      | المجلس الإقليمي للالسحرية | ar       |
      | קריית מלאכי              | he       |
