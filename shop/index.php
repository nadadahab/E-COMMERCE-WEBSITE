<?php
	ob_start();
	session_start();
	$pageTitle = 'Homepage';
	include 'init.php';
	echo"<h1 class='text-center'>". $pageTitle. "</h1>";
	$allItems = getAllFrom('*', 'items', 'where Approve = 1', '', 'Item_ID');
			foreach ($allItems as $item) {
				echo '<div class="col-sm-6 col-md-3">';
					echo '<div class="thumbnail item-box" style=" height: 600px">';
						echo '<span class="price-tag">$' . $item['Price'] . '</span>';
						echo '<img class="img-responsive" src='. $item['Image'] .' alt="" />';
						echo '<div class="caption">';
							echo '<h3><a href="items.php?itemid='. $item['Item_ID'] .'">' . $item['Name'] .'</a></h3>';
							echo '<p>' . substr($item['Description'], 0 ,100) . '</p>';
							echo '<div class="date">' . $item['Add_Date'] . '</div>';
							if (isset($_SESSION['user'])) {
							?>
							  <button class="add" value="<?= $item['Item_ID'] ?>">ADD to Cart</button>
							<?php
						}
						echo "<br>";
						echo '</div>';
					echo '</div>';
				echo '</div>';
			}
		?>
	

<?php
	include $tpl . 'footer.php'; 
	ob_end_flush();
?>