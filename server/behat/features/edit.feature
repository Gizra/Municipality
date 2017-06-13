Feature: Edit entities pages.
  In order to check the edit pages
  As an admin user
  We need to be able to see the right content on the edit page

  @api
  Scenario: Verify that as an admin I can see the WYSIWYG content editor.
    Given I login with user "admin"
    When I edit "סיור קבלנים: אספקה והתקנה של מערכות מיזוג האוויר לבניין העירייה" node of type "Event"
    Then I should see "Bold"