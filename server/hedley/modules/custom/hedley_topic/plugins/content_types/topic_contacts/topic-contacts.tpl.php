<?php

/**
 * @file
 * Topic contacts.
 */
?>
<div class="four width column">
  <h3 class="ui purple header"><?php print t('People who can help you'); ?></h3>

  <div class="ui items">
    <?php foreach ($contacts as $contact): ?>
      <div class="item">
        <?php if ($contact['image_url']): ?>
          <a class="ui tiny image">
            <img src="<?php print $contact['image_url']; ?>">
          </a>
        <?php endif; ?>

        <div class="content">
          <a class="header"><?php print $contact['title']; ?></a>
          <div class="description">

            <?php if ($contact['email']): ?>
              <p>
                <a href="mailto:<?php print $contact['email']; ?>">
                  <i class="mail icon"></i>
                  <?php print $contact['email']; ?>
                </a>
              </p>
            <?php endif; ?>

            <?php if ($contact['phone']): ?>
              <p>
                <a href="tel:<?php print $contact['phone']; ?>">
                  <i class="phone icon"></i>
                  <?php print $contact['phone']; ?>
                </a>
              </p>
            <?php endif; ?>

            <?php if ($contact['fax']): ?>
              <p>
                <i class="fax icon"></i>
                <?php print $contact['fax']; ?>
              </p>
            <?php endif; ?>

            <?php if ($contact['address']): ?>
              <p>
                <i class="home icon"></i>
                <?php print $contact['address']; ?>
              </p>
            <?php endif; ?>

          </div>
        </div>
      </div>
    <?php endforeach; ?>
  </div>
</div>
