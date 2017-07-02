Feature: Edit entities pages.
  In order to check the edit pages
  As an admin user
  We need to be able to see the right content on the edit page

  @api
  Scenario: Verify that as an admin I can see the WYSIWYG content editor.
    Given I login with user "admin"
    When I edit "סיור קבלנים: אספקה והתקנה של מערכות מיזוג האוויר לבניין העירייה" node of type "Event"
    Then I should see "Bold"

  @api
  Scenario Outline: Verify that as an admin I don't see errors on the News' edit page.
    Given I login with user "admin"
    When I edit "<title>" node of type "<type>"
    Then I should not see "Warning:"
    And I should not see "Notice:"

    Examples:
    | title                                            | type                   |
    | לרשום לגן                                        | action                 |
    | איתי קורן                                         | contact                |
    | הצגת ילדים: שבת בבוקר                            | event                  |
    | באילו שעות מפנים את הזבל?                        | faq                    |
    | تقرير مراقب المدينة ومفوض الشكاوى العامة، رقم 3. | freedom_of_information |
    | طلب للحصول على تصريح الإقامة                      | hardcopy_form          |
    | Kiryat Malakhi                                   | municipality           |
    | ביקור שר התחבורה                                 | news                   |
    | Terms page english                               | page                   |
    | פינוי אשפה                                        | tender                 |
