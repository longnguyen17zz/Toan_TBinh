<?php
$pageTitleAmin = "Kết quả tìm kiếm";
include "./header.php";
include "./slide.php";
include '/xampp/htdocs/BTL/sever/modun/modelClass.php';
include '/xampp/htdocs/BTL/sever/modun/config/config2.php';
$urlSlie = "/BTL/sever/";
$search = isset($_GET["tim_kiem"]) ? $_GET["tim_kiem"] :"";
if($search){
    $where = "WHERE `spbanchay_name` LIKE '%".$search."%'";

}
$item_per_page = !empty( $_GET['per_page']) ?  $_GET['per_page'] :3 ;
$current_page = !empty( $_GET['page']) ?  $_GET['page'] :1;
$offet = ($current_page - 1) * $item_per_page;
if($search){
    $user =  mysqli_query($conn,"SELECT * FROM `tbl_user` WHERE `user_name` LIKE '%".$search."%'LIMIT ".$item_per_page." OFFSET  ".$offet."") ;
    $product = mysqli_query($conn,"SELECT * FROM `tbl_spbanchay` ".$where." LIMIT ".$item_per_page." OFFSET  ".$offet."") ;
    $totalRecords = mysqli_query( $conn,"SELECT * FROM tbl_spbanchay WHERE `spbanchay_name` LIKE '%".$search."%'") ;


}

$totalRecords = $totalRecords -> num_rows;
$totalPage = ceil($totalRecords / $item_per_page);
mysqli_close($conn);
?>
<div class="content-left">
<h1 style=" font-size: 22px;color:#2A2185;text-align: center;padding: 15px 0;">KẾT QUẢ TÌM KIẾM SẢN PHẨM </h1>
<p style="  font-size: 15px;color:#2A2185;text-align: center;padding: 10px 0;" id="textSearch"><?=isset($_GET["tim_kiem"]) ? $_GET["tim_kiem"] :"" ?></p> 



<div class="main" style="margin: 0 40px;background: #F8F9FA;">
<?php include './phantrangSearch.php' ?>
            <div class="content-left-cartelogy_add">
                        <div class="content">
                            <div class="content-left-right-cartelogy_list">
                                <table class="table">
                                <thead class="table-light">
                                <?php 
                                    if(isset($product)){$i=0;
                                ?>
                                    <?php
                                            while($result = mysqli_fetch_array($product)){$i++;
                                    ?>
                                    <tr>
                                        <td><?php echo $i ?></td>
                                        <td><a href="<?php echo $urlSlie ?>/modun/sanpham/chitietsp.php?spbanchay_id=<?php echo $result['spbanchay_id'] ?>" style="color:#000; cursor:pointer;" ><?php echo $result['spbanchay_name'] ?></a></td>
                                        <td><img style="width:50%; height: 215px;" src="<?php echo $urlSlie ?>uploading/<?php  echo $result['spbanchay_img']; ?>"></td>
                                        <td><?php echo $result['spbanchay_gia'] ?>.000đ</td>
                                        <td><?php echo $result['spbanchay_size'] ?></td>
                                        <td><?php echo $result['spbanchay_mau'] ?></td>
                                        <td><?php echo $result['spbanchay_msp'] ?></td>
                                        </tr>
                                    <?php }} ?>
                                    <?php 
                                    if(isset($user)){$i=0;
                                ?>
                                    <?php
                                            while($result = mysqli_fetch_array($user)){$i++;
                                    ?>
                                    <tr >
                                        <td><?php echo $i ?></td>
                                        <td><?php echo $result['user_name'] ?></td>
                                        <td><?php echo $result['user_email'] ?></td>
                                        <td><?php echo $result['user_phone'] ?></td>
                                        <td><?php echo $result['created_time'] ?></td>
                                        </tr>
                                    <?php }} ?>
                                </thead>
                                </table>
                            </div>
                        </div>
                    </div>
               </div>