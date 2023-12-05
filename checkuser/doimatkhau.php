<?php
session_start();
ob_start();
include '../sever/modun/modelClass.php';
include_once '../mail/index.php';

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đổi mật khẩu</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/BTL/client/css/main1.css">
</head>
<body>
        <div class="main">
            <div class="header" style=" background: url(/BTL/client/img/background-header.webp);">
                <div class="header_container container">
                    <div class="hearder-top">
                        <div class="hearder-top__left">
                            <div class="header_logo">
                                <a href="#">
                                    <img src="/BTL/client/img/logo.svg" alt="">
                                </a>
                            </div>
                            <div class="header_search">
                                <div class="theme-searchs">
                                    <form action="">
                                        <input type="text" placeholder="Tìm kiếm" class="search-auto auto-search" >
                                        <input type="hidden" name="" id="">
                                        <button type="submit" class=""><i class="fa-solid fa-magnifying-glass"></i></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="header-top_right">
                            <div class="header_contact">
                                <a href="#">
                                    <i class="fa-solid fa-location-dot"></i>
                                    Tìm cửa hàng
                                </a>
                                <a href="#">
                                    <i class="fa-solid fa-phone"></i>
                                    <b>0585016xxx</b>
                                </a>
                                <span class="text_free">FREE</span>
                                <span style="margin: 0 8px;">-</span>
                                <span class="text_order">Đặt hàng</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="header-bottom"></div>
                <div class="content container" style="display:flex;
                padding-right: 40px;
                justify-content:end;
                ">
                <i style="color: #11006F;
                    font-size: 24px;
                    padding:0 5px;" class="fa-regular fa-user"></i>
                <a style="color: #11006F;
                    font-size: 14px;
                    font-weight: 600;
                    padding:0 5px;
                " href="/BTL/checkuser/login.php">Đăng nhập</a>
                /
                <a style="color: #11006F;
                    font-size: 14px;
                    font-weight: 600;
                    padding:0 5px;
                " href="/BTL/checkuser/register.php">Đăng kí</a>
            </div>
            </div>
            <div class="page_content_account" style="background: url(/BTL/client/img/bg_login.webp) bottom center no-repeat;">
            <div class="container account">
                    <div class="grid">
                        <div class="row">
                            <section>
                                <div class="checkUsers">
                                <div class="checkUser">
                                    <h1 style="font-size: 26px; margin: 0;padding: 0;font-weight: bold;text-transform: unset;text-align: center;color: #fcaf17;line-height: 1;margin-bottom: 30px; ">ĐỔI MẬT KHẨU</h1>
                                    <form method="POST" class="postLogin">
                                        <div class="form-outline mb-4">
                                            <?php if(isset($_POST['submit'])){
                                                $error = array();
                                                if($_POST['repass'] != $_POST['newpass']){
                                                    $error['fail'] = 'Nhập lại mật khẩu không chính xác !';
                                                }else{
                                                      $cartegory = new cartegory;
                                                    $error['success'] = 'Đổi mật khẩu thành công ! Chuyển hướng sau 3s.';
                                                    if($_SERVER['REQUEST_METHOD']==='POST'){
    
                                                        $newpass = $_POST['newpass'];
                                                        $update_cartegory = $cartegory ->forgetPass($_POST['newpass'],$_SESSION['email']);
                                                    }
                                                    header('refresh:1;login.php');
                                                     exit;
                                                }
                                            } ?>
                                            <?php if(isset($error['fail'])) : ?>
                                                <span style="color:red;"><?=$error['fail']?></span>
                                            <?php elseif(!isset($error['fail'])): ?>
                                                <span style="color:red;">Đổi mật tại đây ! </span>
                                            <?php else :?>
                                                <span style="color:black;">Đổi mật khẩu tại đây ! </span>
                                            <?php endif; ?>
                                            <input name="newpass" placeholder="Nhập mật khẩu mới" value="<?php if(isset($_POST['newpass'])) echo $_POST['newpass'] ?>" type="text" id="text" class="form-control form-control-lg" /><br>
                                            <input name="repass" placeholder="Nhập lại khẩu mới" value="<?php if(isset($_POST['repass'])) echo $_POST['repass'] ?>" type="text" id="text" class="form-control form-control-lg" /><br>
                                        </div>
                                        <!-- Submit button -->
                                        <div style="display:flex; " class="">
                                            <button style="margin-right:10px; width:100%; background: #FEEEEA; border:none;" class="btn btn-primary btn-lg btn-block">
                                                <a style="color:#fcaf17;font-size: 18px;font-weight: bold;" href="../index.php">HỦY</a>
                                            </button>
                                            <button style="margin-right:10px; width:100%; background: #fcaf17; border:none;" type="submit" name="submit"  class="btn btn-primary btn-lg btn-block">TIẾP TỤC</button>
                                        </div>
                                    </form>
                                </div>
                                </div>

                                
                            </section>
                        </div>
                    </div>
</div>
</div>

<div class="footer">
            <div class="container">
                <div class="row footer-top">
                    <div class="col-xl-4 col-lg-4 col-md-12 col-12 col-foo-1">
                        <p class="sum">“Đặt sự hài lòng của khách hàng là ưu tiên số 1 trong mọi suy nghĩ hành động của mình” là sứ mệnh, là triết lý, chiến lược.. </p>
                        <div class="social">
                            <a href="https://facebook.com/yody.vn" class="social-button" title target="_blank" rel="nofollow">
                                <i class="fa-brands fa-facebook"></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-xl-2 col-lg-2 col-md-3 col-12 col-foo col-foo-2">
                        <h4 class="title-menu">Về Chúng tôi</h4>
                        <ul class="list-menu">
                            <li class="li_menu">
                                <a href="#" title="Giới thiệu">Giới thiệu</a>
                            </li>
                            <li class="li_menu">
                                <a href="#" title="Liên hệ">Liên hệ</a>
                            </li>
                            <li class="li_menu">
                                <a href="#" title="Tuyển dụng">Tuyển dụng</a>
                            </li>
                            <li class="li_menu">
                                <a href="#" title="Tin tức">Tin tức</a>
                            </li>
                            <li class="li_menu">
                                <a href="#" title="Hệ thống cửa hàng">Hệ thống cửa hàng</a>
                            </li>
                            <li class="li_menu">
                                <a href="#" title="Hàng mới về">Hàng mới về</a>
                            </li></ul>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-3 col-12 col-foo col-foo-2">
                        <h4 class="title-menu">Hỗ trợ khách hàng</h4>
                        <ul class="list-menu">
                            <li class="li_menu">
                                <a href="#" title="Hướng dẫn Chọn size">Hướng dẫn Chọn size</a>
                            </li>
                            <li class="li_menu">
                                <a href="#" title="Chính sách Khách hàng thân thiết">Chính sách Khách hàng thân thiết</a>
                            </li>
                            <li class="li_menu">
                                <a href="#" title="Chính sách Bảo hành, đổi/trả">Chính sách Bảo hành, đổi/trả</a>
                            </li>
                            <li class="li_menu">
                                <a href="#" title="Chính sách Thanh toán, giao nhận">Chính sách Thanh toán, giao nhận</a>
                            </li>
                            <li class="li_menu">
                                <a href="#" title="Chính sách Đồng phục">Chính sách Đồng phục</a>
                            </li>
                            <li class="li_menu">
                                <a href="#" title="Chính sách Bảo mật thông tin khách hàng">Chính sách Bảo mật thông tin khách hàng</a>
                            </li></ul>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6 col-12 col-foo-2 col-foo-contact">
                        <h4 class="title-menu">CÔNG TY CP THỜI TRANG </h4>
                        <ul class="list-menu">
                            <li class="fone">
                                <img src="/BTL/client/icons/map.svg" alt="">
                                    Công ty cổ phần Thời trang YODY<br>
                                    Mã số thuế: 0801206940<br>
                                    Địa chỉ: Trường Đại học Mỏ - Địa chất - Bắc Từ Liêm - Hà Nội
                            </li>
                            <li class="fone">
                                <img src="/BTL/client/icons/icon_address.webp" alt="">
                                <a href="#">Tìm cửa hàng gần bạn nhất</a>
                            </li>
                            <li class="fone">
                                <img src="/BTL/client/icons/phone.svg" alt="">
                                <a href="#">Liên hệ đặt hàng: 024 999 86 999.</a>
                            </li>
                            <li>
                                <img src="/BTL/client/icons/email.svg" alt="">
                                <a href="#">
                                    Email : tranhung6829@gmail.com
                                </a>
                            </li>
                        </ul>
                        <a href="http://online.gov.vn/Home/WebDetails/44085?AspxAutoDetectCookieSupport=1">
                            <img src="/BTL/client/icons/logo_bct.webp" alt="">
                        </a>
                        <a href="#">
                            <img src="/BTL/client/icons" alt="">
                        </a>
                    </div>
                </div>
                <div class="copyright">
                    <hr>
                    © YODY - Bản quyền thuộc về Công ty cổ phần thời trang YODY
                </div>
            </div>
        </div>
</body>
</html>
