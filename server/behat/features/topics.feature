Feature: Topics page
  In order to get information about the Municipality's topic
  As an anonymous user
  We need to be able to see public content on the topic page

  @javascript @test
  Scenario Outline: Verify that the Municipality's topic shows the correct action
    Given I am an anonymous user
    When I visit the topic "<topic>" under the municipality "<municipality>"
    Then I should see the action "<action>" in the topic page

    Examples:
      | municipality            | topic               | action       |
      | طوبا الزنغرية           | Garbage collection  | السجل الزفاف |
      | عرعرة                   | Arnona              | الاتصال على   |
      | קריית מלאכי              | Tenders             | לפנות למוקד   |