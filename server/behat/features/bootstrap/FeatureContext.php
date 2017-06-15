<?php

use Drupal\DrupalExtension\Context\DrupalContext;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\Behat\Tester\Exception\PendingException;

class FeatureContext extends DrupalContext implements SnippetAcceptingContext {

  /**
   * @When /^I login with user "([^"]*)"$/
   */
  public function iLoginWithUser($name) {
    // $password = $this->drupal_users[$name];
    $password = $name;
    $this->loginUser($name, $password);
  }

  /**
   * Login a user to the site.
   *
   * @param $name
   *   The user name.
   * @param $password
   *   The use password.
   */
  protected function loginUser($name, $password) {
    $this->getSession()->visit($this->locatePath('/user'));
    $element = $this->getSession()->getPage();
    $element->fillField('name', $name);
    $element->fillField('pass', $password);
    $submit = $element->findButton('Log in');

    if (empty($submit)) {
      throw new \Exception(sprintf("No submit button at %s", $this->getSession()->getCurrentUrl()));
    }

    // Log in.
    $submit->click();

  }

  /**
   * @When /^I login with bad credentials$/
   */
  public function iLoginWithBadCredentials() {
    return $this->loginUser('wrong-foo', 'wrong-bar');
  }

  /**
   * @When I :add :type user type to municipality :municipality
   */
  public function iUserTypeToMunicipality($add, $type, $municipality) {
    $user_types_fields = [
      'Businesses' => 'edit-field-user-types-und-12',
      'Residents' => 'edit-field-user-types-und-11',
    ];

    $group = $this->loadGroupByTitleAndType($municipality, 'municipality');
    $uri = $this->createUriWithGroupContext($group, 'node/' . $group->nid . '/edit') ;
    $this->getSession()->visit($this->locatePath($uri));

    $form = $this->getSession()->getPage();
    $field = $form->findField($user_types_fields[$type]);
    if ($add == 'add') {
      $field->check();
    }
    else {
      $field->uncheck();
    }

    $submit = $this->getSession()->getPage()->find('css', '#edit-submit');
    $submit->click();
  }

  /**
   * @Then /^I should wait for the text "([^"]*)" to "([^"]*)"$/
   */
  public function iShouldWaitForTheTextTo($text, $appear) {
    $this->waitForXpathNode(".//*[contains(normalize-space(string(text())), \"$text\")]", $appear == 'appear');
  }

  /**
   * @Then /^I wait for css element "([^"]*)" to "([^"]*)"$/
   */
  public function iWaitForCssElement($element, $appear) {
    $xpath = $this->getSession()->getSelectorsHandler()->selectorToXpath('css', $element);
    $this->waitForXpathNode($xpath, $appear == 'appear');
  }

  /**
   * @Then the user type menu should :appear on municipality :municipality homepage for user types :user_types
   */
  public function theUserTypeMenuShouldOnMunicipalityHomepageForUsertypes($appear, $municipality, $user_types) {
    $group = $this->loadGroupByTitleAndType($municipality, 'municipality');
    $uri = $this->createUriWithGroupContext($group) ;
    $this->getSession()->visit($this->locatePath($uri));

    // Get the user types switcher.
    $user_type_element = $this->getSession()->getPage()->find('css', '.background .user-types');

    // Sometimes we want to check that the links are not displayed therefor
    // there will be an empty variable.
    $user_types_array = $appear == 'appear' ? explode(',', $user_types) : [] ;

    // Check if the user type menu appears on homepage
    $this->checkLinksExistInElement($user_type_element, 'user type', $user_types_array);
  }

  /**
   * @AfterStep
   *
   * Take a screen shot after failed steps for Selenium drivers (e.g.
   * PhantomJs).
   */
  public function takeScreenshotAfterFailedStep($event) {
    if ($event->getTestResult()->isPassed()) {
      // Not a failed step.
      return;
    }

    if ($this->getSession()->getDriver() instanceof \Behat\Mink\Driver\Selenium2Driver) {
      $file_name = sys_get_temp_dir() . DIRECTORY_SEPARATOR . 'behat-failed-step.png';
      $screenshot = $this->getSession()->getDriver()->getScreenshot();
      file_put_contents($file_name, $screenshot);
      print "Screenshot for failed step created in $file_name";
    }
  }
  /**
   * @BeforeScenario
   *
   * Delete the RESTful tokens before every scenario, so user starts as
   * anonymous.
   */
  public function deleteRestfulTokens($event) {
    if (!module_exists('restful_token_auth')) {
      // Module is disabled.
      return;
    }
    if (!$entities = entity_load('restful_token_auth')) {
      // No tokens found.
      return;
    }
    foreach ($entities as $entity) {
      $entity->delete();
    }
  }

  /**
   * @BeforeScenario
   *
   * Resize the view port.
   */
  public function resizeWindow() {
    if ($this->getSession()->getDriver() instanceof \Behat\Mink\Driver\Selenium2Driver) {
      $this->getSession()->resizeWindow(1440, 900, 'current');
    }
  }

  /**
   * Helper function; Execute a function until it return TRUE or timeouts.
   *
   * @param $fn
   *   A callable to invoke.
   * @param int $timeout
   *   The timeout period. Defaults to 10 seconds.
   *
   * @throws Exception
   */
  private function waitFor($fn, $timeout = 5000) {
    $start = microtime(true);
    $end = $start + $timeout / 1000.0;
    while (microtime(true) < $end) {
      if ($fn($this)) {
        return;
      }
    }
    throw new \Exception('waitFor timed out.');
  }

  /**
   * Wait for an element by its XPath to appear or disappear.
   *
   * @param string $xpath
   *   The XPath string.
   * @param bool $appear
   *   Determine if element should appear. Defaults to TRUE.
   *
   * @throws Exception
   */
  private function waitForXpathNode($xpath, $appear = TRUE) {
    $this->waitFor(function($context) use ($xpath, $appear) {
      try {
        $nodes = $context->getSession()->getDriver()->find($xpath);
        if (count($nodes) > 0) {
          $visible = $nodes[0]->isVisible();
          return $appear ? $visible : !$visible;
        }
        return !$appear;
      }
      catch (WebDriver\Exception $e) {
        if ($e->getCode() == WebDriver\Exception::NO_SUCH_ELEMENT) {
          return !$appear;
        }
        throw $e;
      }
    });
  }

  /**
   * @When /^I visit "(.*)" node of type "([^"]*)"$/
   */
  public function iVisitNodePageOfType($title, $type) {
    $query = new \entityFieldQuery();
    $result = $query
      ->entityCondition('entity_type', 'node')
      ->entityCondition('bundle', $type)
      ->fieldCondition('title_field', 'value', $title)
      ->propertyCondition('status', NODE_PUBLISHED)
      ->range(0, 1)
      ->execute();

    if (empty($result['node'])) {
      $params = [
        '@title' => $title,
        '@type' => $type,
      ];
      throw new \Exception(format_string('Node @title of @type not found.', $params));
    }
    $nid = key($result['node']);
    $this->getSession()->visit($this->locatePath('node/' . $nid));
  }

  /**
   * @When I visit the page :page_name
   */
  public function iVisitThePage($page_name) {

    $info = [
      'Homepage' => '/',
    ];

    $this->getSession()->visit($this->locatePath($info[$page_name]));
  }

  /**
   * @When I edit :title node of type :type
   */
  public function iEditNodeOfType($title, $type) {
    $query = new \entityFieldQuery();
    $result = $query
      ->entityCondition('entity_type', 'node')
      ->entityCondition('bundle', strtolower($type))
      ->propertyCondition('title', $title)
      ->propertyCondition('status', NODE_PUBLISHED)
      ->range(0, 1)
      ->execute();
    if (empty($result['node'])) {
      $params = array(
        '@title' => $title,
        '@type' => $type,
      );
      throw new \Exception(format_string("Node @title of @type not found.", $params));
    }
    $nid = key($result['node']);
    $this->getSession()->visit($this->locatePath('node/' . $nid . '/edit  '));
  }


  /**
   * @When I visit a :municipality website homepage with no parameters in URL
   */
  public function iVisitAWebsiteHomepageWithNoParametersInUrl($municipality) {
    $group = $this->loadGroupByTitleAndType($municipality, 'municipality');
    $uri = $this->createUriWithGroupContext($group);
    $this->getSession()->visit($this->locatePath($uri));
  }

  /**
   * @When I visit a :municipality website homepage with a specific :language and a specific :user_type
   */
  public function iVisitAWebsiteHomepageWithASpecificAndASpecificUser($municipality, $language, $user_type) {
    $group = $this->loadGroupByTitleAndType($municipality, 'municipality');
    $options = [
      'query' => [
        'language' => $language,
        'user_type' => $user_type,
      ]
    ];
    $uri = $this->createUriWithGroupContext($group, 'node/' . $group->nid, $options);
    $this->getSession()->visit($this->locatePath($uri));
  }

  /**
   * @When I change user type to a :new_user_type
   */
  public function iChangeUserTypeToA($new_user_type) {
    $page = $this->getSession()->getPage();

    $user_type_link = $page->findLink($new_user_type);
    if ($user_type_link === null) {
      throw new \Exception('Could not find the user type link.');
    }

    $user_type_link->click();
  }

  /**
   * @Then I should see the home page in the default :language of the municipality and for :citizens user type
   */
  public function iShouldSeeTheHomePageInTheDefaultOfTheMunicipalityAndForCitizensUserType($language, $citizens) {
    $page = $this->getSession()->getPage();

    // Check if the given language is the active one on the page.
    $this->checkActiveLanguage($language, $page, 'text');

    // Check if the given user type is the active one on the page.
    $this->checkActiveUserType($citizens, $page, 'text');
  }

  /**
   * @Then I should see :languages menu only with languages with content for the current Municipality
   */
  public function iShouldSeeMenuOnlyWithLanguagesWithContentForTheCurrentMunicipality($languages) {
    $page = $this->getSession()->getPage();

    // Get the languages switcher.
    $languages_element = $page->find('css', '.background .languages');

    // Sometimes we want to check that the links are not displayed therefor
    // there will be an empty variable.
    $languages_array = $languages ? explode(',', $languages) : [];

    // Check that the element has the correct links.
    $this->checkLinksExistInElement($languages_element, 'languages', $languages_array);
  }

  /**
   * @Then I should see :user_types menu only for user types with content for the current Municipality
   */
  public function iShouldSeeMenuOnlyForUserTypesWithContentForTheCurrentMunicipality($user_types) {
    $page = $this->getSession()->getPage();

    // Get the user types switcher.
    $user_type_element = $page->find('css', '.background .user-types');

    // Sometimes we want to check that the links are not displayed therefor
    // there will be an empty variable.
    $user_types_array = $user_types ? explode(',', $user_types) : [];

    // Check that the element has the correct links.
    $this->checkLinksExistInElement($user_type_element, 'user type', $user_types_array);
  }

  /**
   * @Then I should see page :title and :text in the chosen :language and for the chosen :user_type only
   */
  public function iShouldSeePageAndInTheChosenAndForTheChosenUserOnly($title, $text, $language, $user_type) {
    $page = $this->getSession()->getPage();

    // Check the title of the page.
    $title_element = $page->find('css', '.background .center h2.header');
    if ($title_element === null) {
      throw new \Exception('The title element is missing.');
    }
    if ($title_element->getText() !== $title) {
      throw new \Exception(format_string('The title is not "@title".', ['@title' => $title]));
    }

    // Check some text on the municipality page.
    $text_element = $page->find('css', '.pane-promoted-content .content h3.header a');
    if ($text_element === null) {
      throw new \Exception('The required text element is missing.');
    }

    // Check if the requested string is contained in this element's text,
    // checking it this way because of spaces.
    if (strpos($text_element->getText(), $text)) {
      throw new \Exception(format_string('There\'s no text matching "@text".', ['@text' => $text]));
    }

    // Check if the given language is the active one on the page.
    $this->checkActiveLanguage($language, $page, 'href');

    // Check if the given user type is the active one on the page.
    $this->checkActiveUserType($user_type, $page, 'href');

  }

  /**
   * @Then I should see the homepage in the current :language and the :new_user_type
   */
  public function iShouldSeeTheHomepageInTheCurrentAndThe($language, $new_user_type) {
    $page = $this->getSession()->getPage();

    // Check if the given language is the active one on the page.
    $this->checkActiveLanguage($language, $page, 'href');

    // Check if the given user type is the active one on the page.
    $this->checkActiveUserType($new_user_type, $page, 'text');
  }

  /**
   * @Then I should see the :header header
   */
  public function iShouldSeeTheMunicipalityHeader($header) {
    $sitename = $this->getSession()->getPage()->find('css', '.ui.header a')->getText();

    // Check if the site name is "Municipality".
    if ($sitename != $header) {
      $params = array(
        '@sitename' => $sitename,
      );
      throw new \Exception(format_string('The expected site name is not displayed on the page, instead we see @sitename', $params));
    }
  }


  /**
   * Get the group based on the title and type.
   *
   * @param string $title
   *   The group title.
   * @param string $type
   *   The group node type.
   *
   * @return object
   *   The group (if any) or NULL.
   * @throws \Exception
   */
  protected function loadGroupByTitleAndType($title, $type) {
    $query = new \entityFieldQuery();
    $result = $query
      ->entityCondition('entity_type', 'node')
      ->entityCondition('bundle', $type)
      ->propertyCondition('title', $title)
      ->propertyCondition('status', NODE_PUBLISHED)
      ->range(0, 1)
      ->execute();
    if (empty($result['node'])) {
      $params = [
        '@title' => $title,
        '@type' => $type,
      ];
      throw new \Exception(format_string('Group @title not found (type @type).', $params));
    }
    $gid = (int) key($result['node']);
    $group = node_load($gid);
    if (!$group) {
      $params = [
        '@title' => $title,
        '@type' => $type,
      ];
      throw new \Exception(format_string('Group @title not found (type @type).', $params));
    }
    return $group;
  }

  /**
   * Get the group based on the title and type.
   *
   * @param string $title
   *   The group title.
   * @param string $type
   *   The group node type.
   *
   * @return object
   *   The group (if any) or NULL.
   * @throws \Exception
   */
  protected function loadTaxonomyByTitleAndVocabulary($title, $type) {
    $query = new \entityFieldQuery();
    $result = $query
      ->entityCondition('entity_type', 'taxonomy_term')
      ->entityCondition('bundle', $type)
      ->propertyCondition('name', $title)
      ->range(0, 1)
      ->execute();
    if (empty($result['taxonomy_term'])) {
      $params = [
        '@title' => $title,
        '@type' => $type,
      ];
      throw new \Exception(format_string('Taxonomy term @title not found (type @type).', $params));
    }
    $tid = (int) key($result['taxonomy_term']);
    $term = taxonomy_term_load($tid);
    if (!$term) {
      $params = [
        '@title' => $title,
        '@type' => $type,
      ];
      throw new \Exception(format_string('Taxonomy term @title not found (type @type).', $params));
    }
    return $term;
  }

  /**
   * Create a uri within a group context.
   *
   * @param object $group
   *   The group context.
   * @param string $path
   *   The path part.
   * @param array $options
   *   Options to pass to url.
   *
   * @return string
   */
  protected function createUriWithGroupContext($group, $path = '<front>', $options = []) {
    $purl = [
      'provider' => 'og_purl|node',
      'id' => $group->nid,
    ];
    $options = array_merge($options, ['purl' => $purl, 'absolute' => TRUE]);
    $uri = ltrim(url($path, $options), '/');
    return $uri;
  }

  /**
   * Check that a list of links exist inside an element.
   *
   * @param object $element
   *   An element extracted from the current page.
   * @param string $element_name
   *   The name of the element.
   *   i.e. languages, user type, FAQ.
   * @param array $links
   *   An array of links' titles.
   *
   * @throws \Exception
   */
  protected function checkLinksExistInElement($element, $element_name, array $links) {
    if (empty($links)) {
      // There shouldn't be an element on the page at all.
      if ($element !== null) {
        throw new \Exception(format_string('The @element_name element is present on the page when it should be hidden.', ['@element_name' => $element_name]));
      }

      // If the element is not present then the test has passed.
      return;
    }

    foreach ($links as $link) {
      if (!strpos($element->getHtml(), $link)) {
        // Throw an error if one of the expected links is missing.
        throw new \Exception(format_string('The @element_name @link is NOT present on the page.', ['@element_name' => $element_name, '@link' => $link]));
      }
    }
  }

  /**
   * Checks if a given language is the active language in the switcher.
   *
   * @param $language
   *   The language the function needs to check.
   * @param $page
   *   The session's page.
   * @param $selector
   *   The type of search needs to be done on the language switcher.
   *   Options:
   *    1. text => Searches in the link's title.
   *    2. Any kind of attribute on the link itself, i.e. 'href','class', 'id'.
   *
   * @throws \Exception
   */
  protected function checkActiveLanguage($language, $page, $selector) {
    $language_active_link = $page->find('css', '.background .languages a.active');
    if ($language_active_link === null) {
      throw new \Exception('The languages has no active items.');
    }

    // Define on which condition to check.
    $condition = $selector == 'text' ? $language_active_link->getText() === $language : strpos($language_active_link->getAttribute($selector), $language);

    if (!$condition) {
      throw new \Exception(format_string('Active language is not "@language".', ['@language' => $language]));
    }
  }

  /**
   * Checks if a given user type is the active one in the switcher.
   *
   * @param $user_type
   *   The user type the function needs to check.
   * @param $page
   *   The session's page.
   * @param $selector
   *   The type of search needs to be done on the language switcher.
   *   Options:
   *    1. text => Searches in the link's title.
   *    2. Any kind of attribute on the link itself, i.e. 'href','class', 'id'.
   *
   * @throws \Exception
   */
  protected function checkActiveUserType($user_type, $page, $selector) {
    $user_type_active_link = $page->find('css', '.background .user-types a.active');
    if ($user_type_active_link === null) {
      throw new \Exception('The user type has no active items.');
    }

    // Define on which condition to check.
    $condition = $selector == 'text' ? $user_type_active_link->getText() === $user_type : strpos($user_type_active_link->getAttribute($selector), $user_type);

    if (!$condition) {
      throw new \Exception(format_string('Active user type is not "@user_type".', ['@user_type' => $user_type]));
    }
  }

}
