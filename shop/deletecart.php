<?php
session_start();

if(isset($_SESSION['item'])){
	print_r($_SESSION['item']);

	$productId=$_POST['id'];
	$key=array_search($productId,$_SESSION['item']);
    if($key!==false)
    unset($_SESSION['item'][$key]);
    $_SESSION["item"] = array_values($_SESSION["item"]);
}

$output = array(
    'success'  => true,
);
echo json_encode($output);

?>