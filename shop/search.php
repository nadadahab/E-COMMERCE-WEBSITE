<?php
try {
    $dsn = 'mysql:host=localhost;dbname=shop';
    $user = 'root';
    $pass = '';
    $option = array(
        PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
    );
$con = new PDO($dsn, $user, $pass, $option);
        $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
echo 'Connection failed: ' . $e->getMessage();
}


if(isset($_GET['term']) && $_GET['term']){
$var1 = $_GET['term'];


$query = "SELECT * FROM items WHERE Name LIKE :search OR Description LIKE :search";
$stmt = $con->prepare($query);
$stmt->bindValue(':search', '%' . $var1 . '%', PDO::PARAM_INT);
$stmt->execute();
if ($stmt->rowCount() > 0) { 
$result = $stmt->fetchAll();

foreach( $result as $row ) {
$return[]=array('label'=> $row["Name"],'value' =>$row["Item_ID"]);
}

echo json_encode($return);
}
}
?>


