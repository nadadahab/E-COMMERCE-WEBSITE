
<?php
	ob_start();  

	session_start();

	$pageTitle = 'Edit Profile';

	if (isset($_SESSION['user'])) {

		include 'init.php';

	$do = isset($_GET['do']) ? $_GET['do'] : 'Manage';
	if ($do === 'Edit') {

			 

			$userid = isset($_GET['userid']) && is_numeric($_GET['userid']) ? intval($_GET['userid']) : 0;

			 

			$stmt = $con->prepare("SELECT * FROM users WHERE UserID = ? LIMIT 1");

			 
			$stmt->execute(array($userid));

			 

			$row = $stmt->fetch();

			 

			$count = $stmt->rowCount();

		 

			if ($count > 0) { ?>

				<h1 class="text-center">Edit Member</h1>
				<div class="container">
					<form class="form-horizontal" action="?do=Update" method="POST" enctype="multipart/form-data">
						<input type="hidden" name="userid" value="<?php echo $userid ?>" />
					 
						<div class="form-group form-group-lg">
							<label class="col-sm-2 control-label">Username</label>
							<div class="col-sm-10 col-md-6">
								<input type="text" name="username" class="form-control" value="<?php echo $row['Username'] ?>" autocomplete="off" required="required" />
							</div>
						</div>
					 
						<div class="form-group form-group-lg">
							<label class="col-sm-2 control-label">Password</label>
							<div class="col-sm-10 col-md-6">
								<input type="hidden" name="oldpassword" value="<?php echo $row['Password'] ?>" />
								<input type="password" name="newpassword" class="form-control" autocomplete="new-password" placeholder="Leave Blank If You Dont Want To Change" />
							</div>
						</div>
					 
						<div class="form-group form-group-lg">
							<label class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10 col-md-6">
								<input type="email" name="email" value="<?php echo $row['Email'] ?>" class="form-control" required="required" />
							</div>
						</div>
						 
						<div class="form-group form-group-lg">
							<label class="col-sm-2 control-label">Full Name</label>
							<div class="col-sm-10 col-md-6">
								<input type="text" name="full" value="<?php echo $row['FullName'] ?>" class="form-control" required="required" />
							</div>
						</div>
              <div class="form-group form-group-lg">
						<label class="col-sm-2 control-label">User Avatar</label>
						<div class="col-sm-10 col-md-6">
							<input type="file" name="avatar" class="form-control required" />
						</div>
					</div>          	
					</div>
					 
						<div class="form-group form-group-lg">
							<div class="col-sm-offset-2 col-sm-10">
								<input type="submit" value="Save" class="btn btn-primary btn-lg" />
							</div>
						</div>
					 
					</form>
				</div>

			<?php


		

			} else {

				echo "<div class='container'>";

				$theMsg = '<div class="alert alert-danger">There is No Such ID</div>';

				redirectHome($theMsg);

				echo "</div>";

			}

		} elseif ($do == 'Update') {  

			
			if ($_SERVER['REQUEST_METHOD'] == 'POST') {

			 echo "<h1 class='text-center'>Update Member</h1>";
			echo "<div class='container'>";


				$avatarName = $_FILES["avatar"]["name"];
				$avatarSize = $_FILES["avatar"]["size"];
				$avatarTmp	= $_FILES["avatar"]["tmp_name"];
				$avatarType = $_FILES["avatar"]["type"];

			 

				$avatarAllowedExtension = array("jpeg", "jpg", "png", "gif");

				 
				$avatarExtension = strtolower(end(explode('.', $avatarName)));

				$id 	= $_POST['userid'];
				$user 	= $_POST['username'];
				$email 	= $_POST['email'];
				$name 	= $_POST['full'];

				 
				$pass = empty($_POST['newpassword']) ? $_POST['oldpassword'] : sha1($_POST['newpassword']);

			 
				$formErrors = array();

				if (strlen($user) < 4) {
					$formErrors[] = 'Username Cant Be Less Than <strong>4 Characters</strong>';
				}

				if (strlen($user) > 20) {
					$formErrors[] = 'Username Cant Be More Than <strong>20 Characters</strong>';
				}

				if (empty($user)) {
					$formErrors[] = 'Username Cant Be <strong>Empty</strong>';
				}

				if (empty($name)) {
					$formErrors[] = 'Full Name Cant Be <strong>Empty</strong>';
				}

				if (empty($email)) {
					$formErrors[] = 'Email Cant Be <strong>Empty</strong>';
				}
               if (! empty($avatarName) && ! in_array($avatarExtension, $avatarAllowedExtension)) {
					$formErrors[] = 'This Extension Is Not <strong>Allowed</strong>';
				}

				if (empty($avatarName)) {
					$formErrors[] = 'Avatar Is <strong>Required</strong>';
				}

				if ($avatarSize > 4194304) {
					$formErrors[] = 'Avatar Cant Be Larger Than <strong>4MB</strong>';
				}


			 

				foreach($formErrors as $error) {
					echo '<div class="alert alert-danger">' . $error . '</div>';
				}

				 
				if (empty($formErrors)) {

				    	$avatar = rand(0, 10000000000) . '_' . $avatarName;

					move_uploaded_file($avatarTmp, "uploads\avatars\\" . $avatar);

				 
					$stmt2 = $con->prepare("SELECT 
												*
											FROM 
												users
											WHERE
												Username = ?
											AND 
												UserID != ?");

					$stmt2->execute(array($user, $id));

					$count = $stmt2->rowCount();

					if ($count == 1) {

						$theMsg = '<div class="alert alert-danger">Sorry This User Is Exist</div>';

						redirectHome($theMsg, 'back');

					} else { 

					 
						$stmt = $con->prepare("UPDATE users SET Username = ?, Email = ?, FullName = ?, Password = ?, avatar=? WHERE UserID = ?");

						$stmt->execute(array($user, $email, $name, $pass, $avatar, $id));

					 

						$theMsg = "<div class='alert alert-success'>" . $stmt->rowCount() . ' Record Updated</div>';

						redirectHome($theMsg, 'back');

					}

				}

			} else {

				$theMsg = '<div class="alert alert-danger">Sorry You Cant Browse This Page Directly</div>';

				redirectHome($theMsg);

			}

			echo "</div>";
		}

	include $tpl . 'footer.php';

	} else {

		header('Location: index.php');

		exit();
	}

	ob_end_flush(); 

?>