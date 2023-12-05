<?php
$conn = mysqli_connect("localhost" , "root" , "" , "shopquanao");
if(!$conn){
    die("Connection failed: " . mysqli_connect_error());
}
?>