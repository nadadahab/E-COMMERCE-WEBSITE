<?php
session_start();
include 'init.php';
if (isset($_SESSION['user'])) {

$totalprice=0;

?>
<html>
    <head>
    </head>
    <body>

			<h1 class="text-center">CheckOut Products</h1>
			<?php		
           if(isset($_SESSION['item'])){
           	foreach ($_SESSION['item'] as $item ) {
           global $con;
		$getAll = $con->prepare("SELECT * FROM items WHERE Item_ID = :itemid");

		$getAll->execute(array(":itemid" => $item ));

		$all = $getAll->fetchAll();
			foreach ($all  as $item) {
				echo '<div class="col-sm-6 col-md-3">';
					echo '<div class="thumbnail item-box">';
						echo '<span class="price-tag">$' . $item['Price'] . '</span>';
						echo '<img class="img-responsive" src='. $item['Image'] .' alt="" />';
						echo '<div class="caption">';
							echo '<h3><a href="items.php?itemid='. $item['Item_ID'] .'">' . $item['Name'] .'</a></h3>';
							echo '<p>' . substr($item['Description'], 0 ,40) . '</p>';
							echo '<div class="date">' . $item['Add_Date'] . '</div>';
							?>
							<button class="deletebtn" value="<?= $item['Item_ID']?>" price="<?= $item['Price']?>">Remove</button>
							<?php
						echo '</div>';
					echo '</div>';
				echo '</div>';
              $totalprice +=$item['Price'];
			}
							
							
           }
          
           echo'<div class="totalprice" value="' . $totalprice. '">' . 'Total Price = '  .$totalprice . '</div>';
           }

include $tpl . 'footer.php'; 
}
?>
</body>
</html>

