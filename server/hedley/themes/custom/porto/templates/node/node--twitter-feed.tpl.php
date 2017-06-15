<?php
// Initialize oAuth helper functions.
require_once(drupal_get_path('theme', 'porto').'/includes/twitter.inc');

// Store all the node field data needed to authorize feed.
$token = strip_tags(render($content['field_twitter_user_token']));
$token_secret = strip_tags(render($content['field_twitter_user_secret']));
$key = strip_tags(render($content['field_twitter_consumer_key']));
$key_secret = strip_tags(render($content['field_twitter_consumer_secret']));
$count = strip_tags(render($content['field_tweet_count']));
$handle = strip_tags(render($content['field_twitter_handle']));

// Output the handle and link at the top of the feed.
$output = '<a class="twitter-account" href="http://www.twitter.com/'. strip_tags(render($content['field_twitter_handle'])). '" target="_blank">@ '.strip_tags(render($content['field_twitter_handle'])). '</a>';

if ( (!empty($token)) && (!empty($token_secret)) && (!empty($key)) && (!empty($key_secret)) ){ 
  // Call the returnTweet() function passing field data variables as arguments.
  $tweet_data = returnTweet($token, $token_secret, $key, $key_secret, $handle, $count);
  // Start counter and loop through Tweets until count is reached.
  $i = '0';
  while ($i < $count) {
  // Grab the raw text from the Tweet.
  $tweet_text = $tweet_data[$i]["text"];
	// Grab the Tweet date/time and trim to just the date.
	$tweet_created = explode(" ", $tweet_data[$i]['created_at']);
	$tweet_created_trimmed = implode(" ",array_splice($tweet_created,1,2));
	
	// Get the links and add the markup.
	$links = preg_match_all('/https?\:\/\/[^\" ]+/i',$tweet_text,$link);
	if($link[0]) {
	  foreach($link[0] as $url) {
	    $tweet_text = str_replace($url, "<a href='$url'>$url</a>", $tweet_text);
	  }
	}
	
	// Get the hashtags and add the markup.
	$hashtags = preg_match_all('/#\w+/',$tweet_text,$hashtag);
	if($hashtag[0]) {
	  foreach($hashtag[0] as $tag) {
	    $tweet_text = str_replace($tag, "<a href='http://twitter.com/$tag'>$tag</a>", $tweet_text);
	  }
	}
	
	// Get the handles and add the markup.
	$usernames = preg_match_all('/@\w+/',$tweet_text,$username);
	if($username[0]) {
	  foreach($username[0] as $name) {
	    $tweet_text = str_replace($name, "<a href='http://twitter.com/$name'>$name</a>", $tweet_text);
	  }
	}

  $output .= '<div class="tweet-box">';
  $output .= '<i class="icon icon-twitter"></i>';
  $output .= $tweet_text;
  $output .= '<div class="tweet-time">';
  $output .= '<a href="http://twitter.com/'.strip_tags(render($content['field_twitter_handle'])).'/status/'.$tweet_data[$i]["id"].'">'. $tweet_created_trimmed.'</a>';
  $output .= '</div>';
	$output .= '</div>';
	
	$i++;
	
	}
	
	print $output;
}

else {
	print "No Tweets to display, check your settings.";
}

?>