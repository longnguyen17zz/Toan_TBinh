<?php
session_start();

include '/xampp/htdocs/BTL/sever/modun/config/config2.php';
if (isset($_POST['login'])) {
    // Kết nối đến cơ sở dữ liệu
    $db = new mysqli('localhost', 'root', '', 'shopquanao');

    // Kiểm tra kết nối
    if ($db->connect_error) {
        die("Kết nối thất bại: " . $db->connect_error);
    }

    // Lấy dữ liệu từ form đăng nhập
    $useremail = $_POST['useremail'];
    $password = $_POST['password'];

    // Truy vấn kiểm tra thông tin đăng nhập
    $sql = "SELECT * FROM tbl_user WHERE user_email = '$useremail' AND user_pass = '$password'";
    $result = $db->query($sql);

    if ($result->num_rows == 1 ) {
        $error = array();
        // Đăng nhập thành công, lưu thông tin người dùng vào session
        $user = $result->fetch_assoc();
        $_SESSION['user_name'] = $user['user_name'];
        $_SESSION['user_id'] = $user['user_id'];
        $_SESSION['role'] = $user['role'];
        if($user['role'] === 'user'){
        $error['success'] = 'Đăng nhập thành công !';
            header('Location:/BTL/client/html/index.php'); // Chuyển hướng đến trang dashboard sau khi đăng nhập
        }
        else {
            $error['nopass'] = "Tên đăng nhập hoặc mật khẩu không đúng.";
        }
           
        }
        

   
}
?>
<?php include './header.php' ?>


<div class="page_content_account" style="background: url(/BTL/client/img/bg_login.webp) bottom center no-repeat;">
<div class="container account">
                    <div class="grid">
                        <div class="row">
                            <section>
                                <div class="checkUsers">
                                <div class="checkUser">
                                    <h1 style="
                                            font-size: 26px;
                                            margin: 0;
                                            padding: 0;
                                            font-weight: bold;
                                            text-transform: unset;
                                            text-align: center;
                                            color: #fcaf17;
                                            line-height: 1;
                                            margin-bottom: 30px;    "><span style="color: #131382;">ĐĂNG</span> NHẬP</h1>
                                            <?php if(isset($error['nopass'])) {   echo 'sai';?>
                                               
                                                <!-- <span style="margin-bottom: 30px; color: red;display: flex;text-align: center;justify-content: center;"><?=$error['nopass']?></span> -->
                                            <?php } else { ?>
                                    <form method="post" class="postLogin">
                                        <div class="form-outline mb-4">
                                            <input name="useremail" placeholder="Email" type="text" id="form1Example13" class="form-control form-control-lg" />
                                            <label class="form-label" for="form1Example13" for="username"> </label>
                                        </div>
            
                                        <!-- Password input -->
                                        <div class="form-outline mb-4">
                                            <input name="password" placeholder="Mật khẩu" type="Password" id="form1Example23" class="form-control form-control-lg" />
                                            <label class="form-label" for="form1Example23" for="password"></label>
                                        </div>
                                        <!-- Submit button -->
                                        <div style="display:flex; " class="">
                                            <button style="margin-right:10px; width:100%; background: #fcaf17; border:none;" type="submit" name="login"  class="btn btn-primary btn-lg btn-block">Đăng nhập</button>
                                        </div>
                                        <div class="d-flex justify-content-around align-items-center mb-4">
                                            <a href="./rePass.php" style="
                                                margin-top: 12px;
                                                font-size: 16px;
                                                font-weight: 600;
                                                color: #FCAF17;">Quên mật khẩu</a>
                                        </div>
                                        <div style="justify-content: center;" class="divider d-flex align-items-center my-4">
                                            <p class="text-center fw-bold mx-3 mb-0 text-muted">OR</p>
                                        </div>
                                        <div style="padding-bottom: 10px;" class="connect">
                                            <a class="btn btn-primary btn-lg btn-block" style="background-color: #3b5998 ; width: 100%;" href="#!"
                                            role="button">
                                            <i class="fab fa-facebook-f me-2"></i>Continue with Facebook
                                            </a>
                                        </div>
                                            <a class="btn btn-primary btn-lg btn-block" style="background-color: #55acee ; width: 100%;" href="#!"
                                                role="button">
                                            <i class="fab fa-twitter me-2"></i>Continue with Twitter</a>
                                    </form>
                                    <?php } ?>
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
