Feature: Verify that content is accessible.

  @api
  Scenario Outline: Verify that all content types are accessible to anonymous users.
    Given I am an anonymous user
    When  I visit "<Title>" node of type "<Type>"
    Then  I should get a "200" HTTP response

    Examples:
      | Title                                         | Type           |
      | طوبا الزنغرية                                 | municipality   |
      | مسرحية للأطفال: صباح السبت                     | event          |
      | כמה סייעות יש בגן ילדים?                        | faq            |
      | לשלם ארנונה                                   | action         |
      | מבצע עיקור סירוס חתולי רחוב יתחיל ביום א 5.3.17 | news           |

  @api
    Scenario: Verify that taxonomy terms are NOT accessible without group context.
    Given I am an anonymous user
    When  I visit "Budget" taxonomy of type "departments"
    Then  I should get a "403" HTTP response


  @api
  Scenario: Verify that taxonomy terms are accessible with group context.
    Given I am an anonymous user
    When  I visit "Tenders" taxonomy of the group "קריית מלאכי"
    Then  I should get a "200" HTTP response