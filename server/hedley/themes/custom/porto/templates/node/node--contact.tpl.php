<?php if (isset($content['field_map_address']) && isset($content['field_map_latitude']) && isset($content['field_map_longitude'])): ?>
<!-- Google Maps -->
<div id="googlemaps" class="google-map"></div>
<?php endif; ?>

<div id="contact-us" class="container">

	<div class="row">
	
		<div class="col-md-6">
          <h2 class="mb-sm mt-sm"><strong><?php print $title;?></strong> <?php print t('Us');?></h2>
		  <?php
		  require_once drupal_get_path('module', 'contact') .'/contact.pages.inc';
	      $contact_form = drupal_get_form('contact_site_form');
	      print drupal_render($contact_form); 
			?>  
		</div>

		<div class="col-md-6">
			<?php
	      // We hide the comments and links now so that we can render them later.
	      hide($content['comments']);
	      hide($content['links']);
	      hide($content['field_map_address']);
	      hide($content['field_map_html']);
	      hide($content['field_map_latitude']);
	      hide($content['field_map_longitude']);
	      print render($content);
	    ?>
		</div>

	</div>

</div>
<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC7Pjsikj52mFixaUDjcMvd0pV3khU8qDo"></script>

<script>
  jQuery(document).ready(function ($) {
	/*
	Map Settings

		Find the Latitude and Longitude of your address:
			- http://universimmedia.pagesperso-orange.fr/geo/loc.htm
			- http://www.findlatitudeandlongitude.com/find-address-from-latitude-and-longitude/

	*/

	// Map Markers
	var mapMarkers = [{
		address: "<?php print strip_tags(render($content['field_map_address'])); ?>",
		html: "<?php print render($content['field_map_html']); ?>",
		icon: {
			image: "<?php print base_path() . drupal_get_path('theme', 'porto'); ?>/img/pin.png",
			iconsize: [26, 46],
			iconanchor: [12, 46]
		},
		popup: true
	}];

	// Map Initial Location
	var initLatitude = <?php print strip_tags(render($content['field_map_latitude'])); ?>;
	var initLongitude = <?php print strip_tags(render($content['field_map_longitude'])); ?>;

	// Map Extended Settings
	var mapSettings = {
		controls: {
			panControl: true,
			zoomControl: true,
			mapTypeControl: true,
			scaleControl: true,
			streetViewControl: true,
			draggable: false,
			overviewMapControl: true
		},
		scrollwheel: false,
		markers: mapMarkers,
		latitude: initLatitude,
		longitude: initLongitude,
		zoom: 16
	};

	var map = $("#googlemaps").gMap(mapSettings);

	// Map Center At
	var mapCenterAt = function(options, e) {
		e.preventDefault();
		$("#googlemaps").gMap("centerAt", options);
	}
});
</script>