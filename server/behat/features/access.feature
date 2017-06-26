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


  @api
  Scenario: Verify that content editor can access their group edit.
    Given I login with user "noam"
    When  I edit "طوبا الزنغرية" node of type "municipality"
    Then  I should get a "200" HTTP response

  @api
  Scenario: Verify that authenticated user can't access their group edit.
    Given I login with user "itamar"
    When  I edit "المجلس الإقليمي للالسحرية" node of type "municipality"
    Then  I should get a "403" HTTP response

  @api
  Scenario: Verify that content editor can access their group content edit.
    Given I login with user "liat"
    When  I edit "לפנות למוקד" node of type "action"
    Then  I should get a "200" HTTP response

  @api
  Scenario: Verify that authenticated user can't access their group content edit.
    Given I login with user "itamar"
    When  I edit "באילו שעות מפנים את הזבל?" node of type "faq"
    Then  I should get a "403" HTTP response

  @api
  Scenario: Verify that content editor can't access another group edit.
    Given I login with user "noam"
    When  I edit "קריית מלאכי" node of type "municipality"
    Then  I should get a "403" HTTP response

  @api
  Scenario: Verify that content editor can't access another group content edit.
    Given I login with user "liat"
    When  I edit "مسرحية للأطفال: صباح السبت" node of type "event"
    Then  I should get a "403" HTTP response