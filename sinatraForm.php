
<!DOCTYPE html>
<!--[if IEMobile 7]><html class="iem7"  lang="en" dir="ltr"><![endif]-->
<!--[if lte IE 6]><html class="lt-ie9 lt-ie8 lt-ie7"  lang="en" dir="ltr"><![endif]-->
<!--[if (IE 7)&(!IEMobile)]><html class="lt-ie9 lt-ie8"  lang="en" dir="ltr"><![endif]-->
<!--[if IE 8]><html class="lt-ie9"  lang="en" dir="ltr"><![endif]-->
<!--[if (gte IE 9)|(gt IEMobile 7)]><!--><html  lang="en" dir="ltr"><!--<![endif]-->

<head>
<meta charset="utf-8" />

<link rel="shortcut icon" href="http://localhost:8080/sinatra/drupal-7.38/sites/all/themes/theme/sinatra/favicon.ico" type="image/vnd.microsoft.icon" />

<meta name="Generator" content="Drupal 7 (http://drupal.org)" />
  
  <title>Sinatra.audio | Add/Edit songs</title>

    <meta name="MobileOptimized" content="width">
    <meta name="HandheldFriendly" content="true">
    <meta name="viewport" content="width=device-width">
    <meta http-equiv="cleartype" content="on">

<style>
@import url("http://localhost:8080/sinatra/drupal-7.38/modules/system/system.base.css?nryosc");
</style>

<style>
@import url("http://localhost:8080/sinatra/drupal-7.38/modules/field/theme/field.css?nryosc");
@import url("http://localhost:8080/sinatra/drupal-7.38/sites/all/modules/modules/google_cse/google_cse.css?nryosc");
@import url("http://localhost:8080/sinatra/drupal-7.38/modules/node/node.css?nryosc");
@import url("http://localhost:8080/sinatra/drupal-7.38/modules/search/search.css?nryosc");
@import url("http://localhost:8080/sinatra/drupal-7.38/modules/user/user.css?nryosc");
</style>

<style>
@import url("http://localhost:8080/sinatra/drupal-7.38/sites/all/modules/modules/nice_menus/css/nice_menus.css?nryosc");
@import url("http://localhost:8080/sinatra/drupal-7.38/sites/all/modules/modules/nice_menus/css/nice_menus_default.css?nryosc");
</style>

<style>
@import url("http://localhost:8080/sinatra/drupal-7.38/sites/all/themes/theme/sinatra/css/styles.css?nryosc");
</style>

<script src="http://localhost:8080/sinatra/drupal-7.38/misc/jquery.js?v=1.4.4"></script>
<script src="http://localhost:8080/sinatra/drupal-7.38/misc/jquery.once.js?v=1.2"></script>
<script src="http://localhost:8080/sinatra/drupal-7.38/misc/drupal.js?nryosc"></script>
<script src="http://localhost:8080/sinatra/drupal-7.38/sites/all/modules/modules/nice_menus/js/jquery.bgiframe.js?v=2.1"></script>
<script src="http://localhost:8080/sinatra/drupal-7.38/sites/all/modules/modules/nice_menus/js/jquery.hoverIntent.js?v=0.5"></script>
<script src="http://localhost:8080/sinatra/drupal-7.38/sites/all/modules/modules/nice_menus/js/superfish.js?v=1.4.8"></script>
<script src="http://localhost:8080/sinatra/drupal-7.38/sites/all/modules/modules/nice_menus/js/nice_menus.js?v=1.0"></script>
<script src="http://localhost:8080/sinatra/drupal-7.38/sites/all/modules/modules/google_cse/google_cse.js?nryosc"></script>
<script>jQuery.extend(Drupal.settings, {"basePath":"\/sinatra\/drupal-7.38\/","pathPrefix":"","ajaxPageState":{"theme":"sinatra","theme_token":"XQ8z_QqXlMgDFGSFw8W0bJ-j-slamyRWLU5Igu9snWg","js":{"misc\/jquery.js":1,"misc\/jquery.once.js":1,"misc\/drupal.js":1,"sites\/all\/modules\/modules\/nice_menus\/js\/jquery.bgiframe.js":1,"sites\/all\/modules\/modules\/nice_menus\/js\/jquery.hoverIntent.js":1,"sites\/all\/modules\/modules\/nice_menus\/js\/superfish.js":1,"sites\/all\/modules\/modules\/nice_menus\/js\/nice_menus.js":1,"sites\/all\/modules\/modules\/google_cse\/google_cse.js":1},"css":{"modules\/system\/system.base.css":1,"modules\/system\/system.menus.css":1,"modules\/system\/system.messages.css":1,"modules\/system\/system.theme.css":1,"modules\/field\/theme\/field.css":1,"sites\/all\/modules\/modules\/google_cse\/google_cse.css":1,"modules\/node\/node.css":1,"modules\/search\/search.css":1,"modules\/user\/user.css":1,"sites\/all\/modules\/modules\/nice_menus\/css\/nice_menus.css":1,"sites\/all\/modules\/modules\/nice_menus\/css\/nice_menus_default.css":1,"sites\/all\/themes\/theme\/sinatra\/system.menus.css":1,"sites\/all\/themes\/theme\/sinatra\/system.messages.css":1,"sites\/all\/themes\/theme\/sinatra\/system.theme.css":1,"sites\/all\/themes\/theme\/sinatra\/css\/styles.css":1}},"googleCSE":{"cx":"","language":"","resultsWidth":600,"domain":"www.google.com"},"nice_menus_options":{"delay":800,"speed":"slow"}});</script>
      <!--[if lt IE 9]>
    <script src="/sinatra/drupal-7.38/sites/all/themes/theme/zen/js/html5-respond.js"></script>
    <![endif]-->
 </head>

<body>

<?php

//Grab the string and display it
/*
if(isset($_GET['name'])) {
	print '<h2>Your string was '. $_GET['name'] . '</h2>';
}
*/
//define variables to be empty
$nameErr = $yearErr = $artistErr = $albumErr = "";
$name = $year = $artist = $album = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (empty($_POST["name"])) {
		$nameErr = "Name of the song is required!";
	} else {
		$name = $_POST["name"];
		// check if name only contains letters and whitespace
    	if (!preg_match("/^[a-zA-Z ]*$/",$name)) {
       		$nameErr = "Only letters and white space allowed"; 
     	}
	}
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (empty($_POST["year"])) {
		$yearErr = "Year of the song is needed!";
	} else {
		$year = $_POST["year"];
		//check if only numbers have been entered
		if(!is_numeric($year)) {
			$yearErr = "Only year date values allowed!";
		}
	}
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if(empty($_POST["artist"])) {
		$artistErr = "Artist name needed!";
	} else {
		$artist = $_POST["artist"];
		//check if only letters and whitespace is present
		if (!preg_match("/^[a-zA-Z ]*$/",$name)) {
       		$artistErr = "Only letters and white space allowed"; 
     	}
	}
}

if($_SERVER["REQUEST_METHOD"] == "POST") {
	if (empty($_POST["album"])) {
		$albumErr = "Album name required";
	} else {
		$album = $_POST["album"];
		//check if only letters and whitespace present
		if (!preg_match("/^[a-zA-Z ]*$/",$name)) {
       		$albumErr = "Only letters and white space allowed"; 
     	}
	}
}

/*fucntion test_input($data) {
	$data = trim($data);
	$data = stripslashes($data);
   	$data = htmlspecialchars($data);
   	return $data;
}*/
?>


<div>
	<form style="padding-left: 30px;" method="POST"; action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
		<h2>Add songs</h2>
		<p>You can add new songs or edit existing songs</p>

		<table>
			<tr>
				<td>
					<label class="label" for="Sname">Name of the song</label>
					<input type="text" class="input_details" name="name" value="<?php echo $name;?>">
					<span class="error" color="red;"> * <?php echo $nameErr?></span><br>
				</td>
			</tr>

			<tr>
				<td>
					<label class="label" for="year">Year of the song</label>
					<input type="text" class="input_details" name="year" value="<?php echo $year;?>">
					<span class="error" color="red;"> * <?php echo $yearErr?></span><br>
				</td>
			</tr>

			<tr>
				<td>
					<label class="label" for="artist">Artists</label>
					<input type="text" class="input_details" name="artist" value="<?php echo $artist;?>">
					<span class="error" color="red;"> * <?php echo $artistErr?></span><br>
				</td>
			</tr>

			<tr>
				<td>
					<label class="label" for="album">Album</label>
					<input type="text" class="input_details" name="album" value="<?php echo $album; ?>">
					<span class="error" color="red;">* <?php echo $albumErr?></span><br>
				</td>
			</tr>
		</table>

		<input type="submit" value="Submit">

	</form>
</div>

<div>
	<?php
		echo "Input given";
		echo "<br>";
		echo $name;
		echo "<br>";
		echo $year;
		echo "<br>";
		echo $artist;
		echo "<br>";
		echo $album;
	?>
</div>

<!-- Database code yet to be added as I mentioned !--> 

</body>

</html>



