<?php session_start(); ?>

<?php
include '/xampp1/htdocs/BTL_Toan/sever/modun/config/config2.php'
?>
<?php 
    if(!isset($_SESSION["cart"])){
        $_SESSION["cart"] = array();
    }
    if (isset($_GET['action']) ) {
    $error = false;
    $discount =false;
        $suscess = "Cảm ơn quý khách đã đặt hàng thành công ! Chuyển hướng sau 1s .";
        function update_cart($add = false) {
            foreach ($_POST['quantity'] as $spbanchay_id => $quantity) {
                if($quantity == 0){
                    unset($_SESSION['cart']['spbanchay_id']);
                }else{
                    if ($add) {
                        $_SESSION["cart"][$spbanchay_id] += $quantity;
                    }else{
                        $_SESSION["cart"][$spbanchay_id] = $quantity;
    
                    }
                }
               
            }
        }
        switch ($_GET['action']) {
            case'submit':
                if(isset($_POST['order_submit'])){
                   if(empty($_POST['Name'])){
                    $error = 'Bạn chưa nhập đủ thông tin';
                   }elseif(empty($_POST['Phone'])){
                    $error = 'Bạn chưa nhập đủ thông tin';
                   }elseif(empty($_POST['Address'])){
                    $error = 'Bạn chưa nhập đủ thông tin';
                   }
                  
                // Kiểm tra thông tin đặt hàng và thực hiện đặt hàng
                   if($error == false && !empty($_POST['quantity'])){
                        $product = mysqli_query($conn , "SELECT * FROM `tbl_spbanchay` WHERE `spbanchay_id` IN (".implode(",", array_keys($_POST["quantity"])).")");
                        $total =0;
                        $orderProduct = array();
                        while($row= mysqli_fetch_assoc($product)){
                            $orderProduct[] = $row;
                           
                        }
                        $total = $_POST['totleCuoi'];
                        $inserOrder = mysqli_query($conn ," 
                        INSERT INTO `tbl_orders` (`order_id`, `order_name`, `order_phone`, `order_address`, `order_note`, `order_total`)
                         VALUES (NULL, '".$_POST['Name']."', '".$_POST['Phone']."', '".$_POST['Address']."', '".$_POST['note']."', '".$total."')
                        ");
                        $orderId= $conn->insert_id;
                        $insertString = "";
                        foreach($orderProduct as $key => $product){
                            $insertString .= "( NULL, '".$orderId."', '".$product['spbanchay_id']."', '".$_POST['quantity'][$product['spbanchay_id']]."', '".$product['spbanchay_gia']."')" ;
                            if($key != count($orderProduct) -1 ){
                                $insertString .= ",";
                            }
                        }
                        $insertOrderId = mysqli_query($conn ," 
                        INSERT INTO `tbl_order_detail` (`order_detail_id`, `order_id`, `spbanchay_id`, `order_detai_quantity`, `order_detai_price`)
                         VALUES ".$insertString."
                        ");
                        unset($_SESSION["cart"]);
                    }
                }
                break;
            default:
                # code...
                break;
        }
    }
    if(!empty($_SESSION["cart"])){
        
        $product = mysqli_query($conn , "SELECT * FROM `tbl_spbanchay` WHERE `spbanchay_id` IN (".implode(",", array_keys($_SESSION["cart"])).")");
        $cartItemCount = count( $_SESSION["cart"]) - 1;
    }else {
        // Nếu không có giỏ hàng, số lượng mục là 0
        $cartItemCount = 0;
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/BTL/client/css/checkout.css">
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<style>
    .checkhistory,.checkhistory a{
        position: relative;
        color: #fcaf17;
    }
    .payment-due__price{
        border: none;
        outline: none;
        background: transparent;
        padding: 0 22px;
        text-align: end;
    }
    .error-message {
        width: 246px;
    border-radius: 5px;
    position: absolute;
    top: 10%;
    transform: translate(-50%, -50%);
    background-color: #fcaf17;
    padding: 15px;
    text-align: center;
    right: -85px;
    box-shadow: 0px 5px 0px 0px #CA8C12;
    display: none;
    transition: .3s linear;
}

.block{
    display: block;
}
.error-message p{
    font-size: 15px;
    font-weight: 700;
    color: white;
}
    .checkoutCod{
        gap: 12px;
        display: flex;
        flex-direction: column;
        padding-left: 15px;
    }
    .thanhtoan{
        display: flex;
    }
    .thanhtoan_title{
        background-color: #fcaf17;
        box-shadow: 0px 2px 0px 0px #CA8C12;
        font-size: 16px;
        color: white;
        font-weight: 600;
    }
    .thanhtoan_title:hover{
        color: white;
    }

</style>
<body>
    <div>
    <form action="checkout.php?action=submit" method="POST"  class="wrap">
        <main class="main">
            <header class="main__header">
                <div class="logo logo--center">
                    <a href="/BTL_Toan/client/html/index.php">
                        <img src="/BTL_Toan/client/img/logo.svg" alt="">
                    </a>
                </div>
            </header>
            <?php if(!empty($error)) { ?>
                <div style="font-size: 20px;font-weight: 600;"><?=$error?></div><button class="btn" style="width: 10%;"><a style="padding: 10px 22px" href="javascript:history.back()">Quay lại</a></button>
            <?php } elseif(!empty($suscess)) { ?>
                <div style="font-size: 20px;font-weight: 600;"><?=$suscess?></div><a href="<?php header('refresh:1;./index.php'); ?>">
                                <?php include './recheck.php' ?>
            </a>
            <?php } else { ?>
            <div class="main__content">
                <article class="animate-floating-labels row">
                    <div class="col col--two">
                        <section class="section">
                            <div class="section__header">
                                <div class="layout-flex">
                                    <h2 class="section__title layout-flex__item layout-flex__item--stretch">
                                        Thông tin giao hàng</h2>
                                <a href="/account/login?returnUrl=/checkout/18e31222aac5468597606f23bbc3804d"></a>
                                </div>
                            </div>
                            <div class="section__content">
                            <?php
                                if(isset($_SESSION["user_name"])){
                                    ?>
                                <div class="fieldset">
                                    <div class="field">
                                        <div class="field__input-wrapper">
                                            <input name="Name" placeholder="Họ và tên" type="text" class="field__input" value="<?=$_SESSION['user_name']?>">
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="field__input-wrapper">
                                            <input name="Phone" placeholder="Số điện thoại" type="text" class="field__input" value>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="field__input-wrapper">
                                            <input name="Address" placeholder="Địa chỉ" type="text" class="field__input" value>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="field__input-wrapper">
                                            <textarea name="note" id="note" placeholder="Ghi chú" class="field__input" data-bind="note"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <?php } ?>
                            </div>
                        </section>
                    </div>
                    <div class="col col--two">
                        <section class="section">
                            <div class="section__header">
                                <div class="layout-flex">
                                    <h2 class="section__title layout-flex__item layout-flex__item--stretch">Vận chuyển</h2>
                                </div>
                                <div class="vanchuyen">Vui lòng nhập thông tin giao hàng</div>
                            </div>
                        </section>
                        <section class="section">
                            <div class="section__header">
                                <div class="layout-flex">
                                    <h2 class="section__title layout-flex__item layout-flex__item--stretch">Thanh toán</h2>
                                </div>
                                <!-- thanh toan qua vn pay -->
                                <div class="error-message" id="error-message">
                                    <p class="">Tính năng đang phát triển</p>
                                </div>
                                <div class="checkoutCod">
                                    <div class="vnpay thanhtoan">
                                        <a href="#"  onclick="error()" class="btn thanhtoan_title">Thanh toán qua VNPAY</a>
                                    </div>
                                    <div class="momo thanhtoan">
                                        <a href="#"  onclick="error()"  class="btn thanhtoan_title">Thanh toán qua Momo</a>
                                    </div>
                                </div>
                                <script>
                                    function error(){
                                        document.getElementById("error-message").classList.add('block');
                                    }
                                    function remove(){
                                        document.getElementById("error-message").classList.remove('block');
                                    }
                                    setInterval(remove,5000)
                                </script>
                            </div>
                        </section>
                    </div>
                </article>
            </div>
        </main>
        <aside class="sidebar">
            <div class="sidebar__header">
                <h2 class="sidebar__title"> Đơn hàng ( <span class="count_item_pr"><?php echo $cartItemCount ?></span> ) sản phẩm</h2>
            </div>
            <div class="sidebar__content">
                <div id="order-summary" class="order-summary order-summary--is-collapsed">
                    <div class="order-summary__sections">
                        <div class="order-summary__section order-summary__section--product-list order-summary__section--is-scrollable order-summary--collapse-element">
                            <table class="product-table" style="display: flex;flex-direction: column;gap: 25px;">
                            <?php
                                                    if(!empty($product)){
                                                    $total = 0;
                                                    $num = 1;
                                                    while($row= mysqli_fetch_array($product)){
                                                    ?>
                                <tbody>
                                    <tr class="product" style>
                                        <td class="product__image">
                                            <div class="product-thumbnail">
                                                <div class="product-thumbnail__wrapper" data-tg-static>
                                                <img src="/BTL_Toan/sever/uploading/<?=$row['spbanchay_img']?>" alt="">
                                                </div>
                                            </div>
                                        </td>
                                        <th class="product__description">
                                            <span  class="product__description__name"><?=$row['spbanchay_name']?></span><br>
                                            <span style="opacity:0.8;" class="product__description__property"><?=$row['spbanchay_mau']?></span>
                                        </th >
                                        <td class="product__price"  style="padding: 0 22px;font-weight: 600;font-size: 18px;"><?=number_format($row['spbanchay_gia'] * $_SESSION["cart"][$row["spbanchay_id"]] , 0 , "," , "." )?>.000đ</td>
                                        <td style="text-align:center; display:none;">
                                                        <div class="grid grid-qty">
                                                                <div class="grid__item one-half cart_select">
                                                                    <div class="ajaxcart__qty input-group-btn" style="display: flex;">
                                                                        <button type="button" class="ajaxcart__qty-adjust ajaxcart__qty--minus items-count decrease" data-id data-qty="0" data-line="1" aria-label="-"> - </button>
                                                                        <input type="text" value="<?=$_SESSION["cart"][$row["spbanchay_id"]] ?>" name="quantity[<?=$row['spbanchay_id']?>]">
                                                                        <button type="button" class="increase ajaxcart__qty-adjust ajaxcart__qty--plus items-count" data-id data-line="1" data-qty="2" aria-label="+"> + </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                    </tr>
                                <?php
                                    
                                    $total += $row['spbanchay_gia'] * $_SESSION["cart"][$row["spbanchay_id"]];
                                    $discountTotal =0;
                                    if(isset($_POST["applyDiscount"]) && $discountTotal = true){
                                        $discount_code = $_POST["discountCode"];
                                        if(!empty($discount_code)){
                                    $discountTotal = mysqli_query($conn , "SELECT discount_sotien FROM tbl_discount WHERE discount_code = '$discount_code'");
                                    if ($discountTotal && mysqli_num_rows($discountTotal) > 0) {
                                        $row = mysqli_fetch_assoc($discountTotal);
                                        $sotiengiam = $row["discount_sotien"];
                                        $totals = $total * $sotiengiam / 100;
                                        $totalS =  $total - $totals;
                                    }else{
                                        $discount = "Mã giảm giá không hợp lệ.";
                                    }}}
                                    $num++;
                                    }?>
                                </tbody>
                            </table>
                        </div>
                        
                        <div class="order-summary__section order-summary__section--total-lines order-summary--collapse-element"  id="orderSummary">
                            <table class="total-line-table">
                                <tbody class="total-line-table__tbody">
                                    <tr class="total-line total-line--subtotal">
                                        <th class="total-line__name"> Tạm tính :</th>
                                        <td class="total-line__price"   style="padding: 0 22px;font-weight: 600;font-size: 18px;text-align: end;"><?=number_format($total , 0 , "," , ".")?>.000đ</td>
                                    </tr>
                                    <tr class="total-line total-line--shipping-fee">
                                        
                                        <?php 
                                           if ($discountTotal && (mysqli_num_rows($discountTotal) > 0))  { ?>
                                        <th class="total-line__name">Số tiền được giảm</th>
                                        <td class="total-line__price"  style="padding: 0 22px;font-weight: 600;font-size: 18px;text-align: end;"><?=number_format($totals , 0 , "," , ".")?>.000Đ</td>
                                        <?php } ?>
                                    </tr>
                                </tbody>
                                <tfoot class="total-line-table__footer">
                                    <tr class="total-line payment-due">
                                        <th class="total-line__name"><span class="payment-due__label-total"> Tổng cộng </span></th>
                                    <td class="total-line__price" >
                                         <?php  if ($discountTotal && mysqli_num_rows($discountTotal) > 0){ ?>
                                            <input class="payment-due__price" value="<?=number_format($totalS , 0 , "," , ".")?>.000đ" name="totleCuoi" readonly>
                                        <?php } else { ?>
                                            <input class="payment-due__price" value="<?=number_format($total , 0 , "," , ".")?>.000đ"  name="totleCuoi" readonly>
                                        <?php } ?>
                                    </td>
                                        </tr>

                                </tfoot>
                                <?php }?>   
                            </table>
                        </div>
                        <?php
                        if($total >= 200) {?>
                            <div style="display:flex;justify-content: space-between;color: #000;font-size: 16px;">
                                <p>Phí ship : </p>
                                <span style="padding-right: 25px;">Miễn phí ship</span>
                            </div>
                        <?php } else { ?>
                            <div style="display:flex;justify-content: space-between;color: #000;font-size: 16px;">
                                <p>Phí ship : </p>
                                <span style="padding-right: 25px;">30.000đ</span>
                            </div>
                        <?php } ?>
                        <div class="order-summary__nav field__input-btn-wrapper hide-on-mobile layout-flex--row-reverse">
                            <div class="checkhistory">
                                <span class="icon">
                                    <ion-icon name="chevron-back-outline"></ion-icon>
                                </span>
                                <a href="./cart.php">Quay lại giỏ hàng</a>
                            </div>
                            <div class="items-md" style="padding:4px 0">
                                <input style="background-color: #fcaf17;box-shadow: 0px 2px 0px 0px #CA8C12;font-size: 16px;color: white; font-weight: 600; " class="btn" type="submit" name="order_submit" value="Đặt hàng" id="">
                            </div>
                        </div>
                    </div>
        </form>
                </div>
                <form method="POST" >
                                <?php if(isset($discount)) {  ?>
                                            <p style="color:red;"><?=$discount?></p>
                                        <?php } ?>
                                <div class="order-summary__section order-summary__section--discount-code"  id="discountCode">
                                <div class="field" style="display: flex;">
                                    <div class="field__input-btn-wrapper">
                                        <input oninput="checkInput()" name="discountCode" placeholder="Nhập mã giảm giá" type="text" id="userInput" class="field__input">
                                    </div>
                                    <input type="submit" class="field__input-btn btn spinner" name="applyDiscount" id="submitButton" value="Áp dụng" disabled>
                                    <!-- <button class="field__input-btn btn spinner" id="submitButton" disabled >
                                        <span class="spinner-label">Áp dụng</span>
                                    </button> -->
                                </div>
                                <script>
                                    function checkInput() {
                                            var userInput = document.getElementById("userInput");
                                            var submitButton = document.getElementById("submitButton");

                                            if (userInput.value.trim() !== "") {
                                                submitButton.removeAttribute("disabled");
                                            } else {
                                                submitButton.setAttribute("disabled", "disabled");
                                            }
                                            }
                                </script>                         
                                </div>
                            </form>
            </div>
        
        </aside>
       
    </div>
    <?php } ?>
</body>
</html>