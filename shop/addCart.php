<?php

session_start();
$_SESSION['item'][]=$_POST['id'];
//print_r($_SESSION['item']);
$output = array(
    'success'  => true,
    
);
//print_r($output);
echo json_encode($output);

?>

