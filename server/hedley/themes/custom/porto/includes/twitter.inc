<?php

/**
 * @file
 * Connect to Twitter API 1.1.
 * Slightly modified from http://stackoverflow.com/a/12939923/2704737
 */

function buildBaseString($baseURI, $method, $params) {
  $r = array();
  ksort($params);
  foreach($params as $key=>$value){
    $r[] = "$key=" . rawurlencode($value);
  }
  return $method."&" . rawurlencode($baseURI) . '&' . rawurlencode(implode('&', $r));
}

function buildAuthorizationHeader($oauth) {
  $r = 'Authorization: OAuth ';
  $values = array();
  foreach($oauth as $key=>$value)
    $values[] = "$key=\"" . rawurlencode($value) . "\"";
  $r .= implode(', ', $values);
  return $r;
}

function returnTweet($token, $token_secret, $key, $key_secret, $handle, $count){

  $oauth_access_token = $token;
  $oauth_access_token_secret = $token_secret;
  $consumer_key = $key;
  $consumer_secret = $key_secret;

  $twitter_timeline = "user_timeline";  //  mentions_timeline / user_timeline / home_timeline / retweets_of_me

  // Create request.
  $request = array(
  'screen_name' => $handle,
  'count' => $count // Can call multiple Tweets. 
  );

  $oauth = array(
	  'oauth_consumer_key' => $consumer_key,
	  'oauth_nonce' => time(),
	  'oauth_signature_method' => 'HMAC-SHA1',
	  'oauth_token' => $oauth_access_token,
	  'oauth_timestamp' => time(),
	  'oauth_version'  => '1.0'
  );

  //merge request and oauth to one array
  $oauth = array_merge($oauth, $request);

  //do some magic
  $base_info = buildBaseString("https://api.twitter.com/1.1/statuses/$twitter_timeline.json", 'GET', $oauth);
  $composite_key = rawurlencode($consumer_secret) . '&' . rawurlencode($oauth_access_token_secret);
  $oauth_signature = base64_encode(hash_hmac('sha1', $base_info, $composite_key, true));
  $oauth['oauth_signature'] = $oauth_signature;
  
  $url = "https://api.twitter.com/1.1/statuses/$twitter_timeline.json?". http_build_query($request);
  $url = str_replace("&amp;","&",$url);

  //make request
  $header = array(buildAuthorizationHeader($oauth), 'Expect:');
  $options = array( 
  	CURLOPT_HTTPHEADER => $header,
    CURLOPT_HEADER => false,
    CURLOPT_URL => $url,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_SSL_VERIFYPEER => false
  );

  $feed = curl_init();
  curl_setopt_array($feed, $options);
  $json = curl_exec($feed);
  curl_close($feed);

  return json_decode($json, true);
       
}