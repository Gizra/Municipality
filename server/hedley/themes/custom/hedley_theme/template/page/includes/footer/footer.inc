<footer class="label-dark">
  <div class="container">
      <?php if (!empty($footer_text)): ?>
        <div class="row">
          <div class="col-xs-12">
            <?php print $footer_text; ?>
          </div>
        </div>
      <?php endif; ?>

      <?php if (!empty($last_updated)): ?>
        <div class="row">
          <div class="col-xs-12">
            <p class="text-center">
              <small>
                <?php print t('Site last update: @date', ['@date' => $last_updated]); ?>
              </small>
            </p>
          </div>
        </div>
      <?php endif; ?>
  </div>
</footer>
