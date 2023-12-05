<?php 
    include '../modelClass.php';
?>
<?php
$cartegory = new cartegory;
if(!isset($_GET['slide_id']) || ( $_GET['slide_id'])==NULL ){
    echo "<script>window.location = 'slide.php'</script>";
}
else{
    $slide_id = $_GET['slide_id'];

}
    $delete_acc = $cartegory -> delete_slider($slide_id);

?>