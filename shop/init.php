<?php
 
  
	include 'admin/connect.php';

	$sessionUser = '';
	
	if (isset($_SESSION['user'])) {
		$sessionUser = $_SESSION['user'];
	}

	 

	$tpl 	= 'includes/templates/';  
	$func	= 'includes/functions/';  
	$css 	= 'layout/css/'; 
	$js 	= 'layout/js/';  

	 

	include $func . 'functions.php';
	include $tpl . 'header.php';
	

	