<?php
session_start();
include 'init.php';
?>

<div class="container">
<h1 class="text-center">Show Category Items</h1>
<div class="row">
<?php
if (isset($_GET['pageid']) && is_numeric($_GET['pageid'])) {
$category = intval($_GET['pageid']);
$allItems = getAllFrom("*", "items", "where Cat_ID = {$category}", "AND Approve = 1", "Item_ID");
foreach ($allItems as $item) {
echo '<div class="col-sm-6 col-md-3">';
echo '<div class="thumbnail item-box">';
echo '<span class="price-tag">' . $item['Price'] . '</span>';
echo '<img class="img-responsive" src='. $item['Image'] .' alt="" />';
echo '<div class="caption">';
echo '<h3><a href="items.php?itemid='. $item['Item_ID'] .'">' . $item['Name'] .'</a></h3>';
echo '<p>' . substr($item['Description'], 0 ,60) . '</p>';
echo '<div class="date">' . $item['Add_Date'] . '</div>';
if (isset($_SESSION['user'])) {
 echo '<button class="add" value="'. $item['Item_ID'] .'">ADD to Cart</button>';
  }
echo '</div>';
echo '</div>';
echo '</div>';
}
} else {
echo 'You Must Add Page ID';
}
?>
</div>
</div>

<?php include $tpl . 'footer.php'; ?>