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
    $password = 'admin';
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
    $this->getSession()->visit($this->locatePath('/#/login'));
    $element = $this->getSession()->getPage();
    $element->fillField('username', $name);
    $element->fillField('password', $password);
    $submit = $element->findButton('Log in');

    if (empty($submit)) {
      throw new \Exception(sprintf("No submit button at %s", $this->getSession()->getCurrentUrl()));
    }

    // Log in.
    $submit->click();

    // Wait for the dashboard's menu to load.
    $this->iWaitForCssElement('.navbar-brand', 'appear');
  }

  /**
   * @When /^I login with bad credentials$/
   */
  public function iLoginWithBadCredentials() {
    return $this->loginUser('wrong-foo', 'wrong-bar');
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
   * @When I visit a :municipality website homepage with no parameters in URL
   */
  public function iVisitAWebsiteHomepageWithNoParametersInUrl($municipality) {
    $group = $this->loadGroupByTitleAndType($municipality, 'municipality');
    $uri = $this->createUriWithGroupContext($group);
    $this->getSession()->visit($this->locatePath($uri));
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
      $params = array('@title' => $title);
      throw new \Exception(format_string('The title is not "@title".', $params));
    }

    // Check some text on the municipality page.
    $text_element = $page->find('css', '.news .content .header h3');
    if ($text_element === null) {
      throw new \Exception('The required text element is missing.');
    }
    if ($text_element->getText() !== $text) {
      $params = array('@text' => $text);
      throw new \Exception(format_string('There\'s no text matching "@text".', $params));
    }

    // Check if the given language is the active one on the page.
    $this->checkActiveLanguage($language, $page, 'href');

    // Check if the given user type is the active one on the page.
    $this->checkActiveUserType($user_type, $page, 'href');

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
    $language_element = $page->find('css', '.background .languages a.active');
    if ($language_element === null) {
      throw new \Exception('The languages has no active items.');
    }

    // Define on which condition to check.
    $condition = $selector == 'text' ? $language_element->getText() === $language : strpos($language_element->getAttribute($selector), $language);

    if (!$condition) {
      $params = array('@language' => $language);
      throw new \Exception(format_string('Active language is not "@language".', $params));
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
    $user_type_element = $page->find('css', '.background .user-types a.active');
    if ($user_type_element === null) {
      throw new \Exception('The user type has no active items.');
    }

    // Define on which condition to check.
    $condition = $selector == 'text' ? $user_type_element->getText() === $user_type : strpos($user_type_element->getAttribute($selector), $user_type);

    if (!$condition) {
      $params = array('@user_type' => $user_type);
      throw new \Exception(format_string('Active user type is not "@user_type".', $params));
    }
  }

}
