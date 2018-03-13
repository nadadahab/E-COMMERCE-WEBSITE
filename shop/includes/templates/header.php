<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title><?php getTitle() ?></title>
		<link rel="stylesheet" href="<?php echo $css ?>bootstrap.min.css" />
		<link rel="stylesheet" href="<?php echo $css ?>font-awesome.min.css" />
		<link rel="stylesheet" href="<?php echo $css ?>jquery-ui.css" />
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
		<link rel="stylesheet" href="<?php echo $css ?>jquery.selectBoxIt.css" />
		<link rel="stylesheet" href="<?php echo $css ?>front.css" />
        
	</head>
	<body>
	<div class="upper-bar">
		<div class="container">
			<?php 
				if (isset($_SESSION['user'])) { 
                 	?>
				
				<div class="btn-group my-info">
					<span class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						<?php echo $sessionUser ?>
						<span class="caret"></span>
					</span>
					<ul class="dropdown-menu">
						<li><a href="profile.php">My Profile</a></li>
						<li><a href="checkout.php">Check out</a></li>
						<li><a href="newad.php">New Item</a></li>
						<li><a href="profile.php#my-ads">My Items</a></li>
						<li><a href="logout.php">Logout</a></li>
					</ul>
				</div>

				<?php

				} else {
			?>
			<a href="login.php">
				<span class="pull-right">Login/Signup</span>
			</a>
			<?php } ?>
		</div>
	</div>
	<nav class="navbar navbar-inverse bg-primary">
	  <div class="container">
	    <div class="navbar-header">
        <a class="navbar-brand" href="#"><i class="fa fa-cube fa-lg"></i>Shopping<b></a> 
	    </div>
       
	    <div class="collapse navbar-collapse" id="app-nav">
	      <ul class="nav navbar-nav ">
          <li><form method="GET"><input id="searchitem"  class="form-control mr-sm-2 searchform" type="text" name="search" placeholder="Search"/></form>  </li>
         <li> <a class="naul" href="index.php">Homepage</a></li>
	      <?php
	      	$allCats = getAllFrom("*", "categories", "where parent = 0", "", "ID", "ASC");
			foreach ($allCats as $cat) {
				echo 
				'<li>
					<a class="naul" href="categories.php?pageid=' . $cat['ID'] . '">
						' . $cat['Name'] . '
					</a>
				</li>';
			}
	      ?>
	      </ul>
	    </div>
	  </div>
	</nav>