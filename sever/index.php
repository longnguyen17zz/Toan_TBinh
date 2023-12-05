<!DOCTYPE html>
<html lang="en" class="">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập vào trang quản trị</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="icon" href="https://id.yody.vn/resources/n2mvx/login/yody-phone/img/loginLogo.svg">
    <!-- ====== ionicons ======= -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script> 
    <link rel="stylesheet" href="./css/login1.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<?php
session_start();
include './modun/config/config2.php';
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
    $sql = "SELECT * FROM tbl_admin WHERE admin_email= '$useremail' AND admin_pass = '$password'";
    $result = $db->query($sql);

    if ($result->num_rows == 1 ) {
        $error = array();
        // Đăng nhập thành công, lưu thông tin người dùng vào session
        $user = $result->fetch_assoc();
        $_SESSION['admin_name'] = $user['admin_name'];
        $_SESSION['admin_id '] = $user['admin_id '];
        $_SESSION['role'] = $user['role'];
        if($user['role'] === 'admin' || $user['role'] === 'writer') {
            $userPrivileges = mysqli_query($db,'SELECT * FROM `tbl_user_privilege` 
            INNER JOIN `tbl_privilege`
             ON `tbl_user_privilege`.`privilege_id` = `tbl_privilege`.`privilege_id` 
             WHERE `tbl_user_privilege`.`admin_id` = '.$user['admin_id']);
             $userPrivileges = mysqli_fetch_all($userPrivileges , MYSQLI_ASSOC);
             
             if(isset($userPrivileges)){
                $user['privileges'] = array();
                foreach($userPrivileges as $privilege){
                    $user['privileges'][] = $privilege['privilege_url_match'];
                }
               
            }
            $_SESSION['user']['privileges'] = $user['privileges'];
            header('Location: ./modun/dashboard/dashboard.php'); // Chuyển hướng đến trang dành cho quản trị viên
        }
        else {
            $error['nopass'] = "Tên đăng nhập hoặc mật khẩu không đúng.";
        }
           
        }
}
?>

<body style="background: #181A1B;">
    <div class="login-pf-page login-pf">
        <div class="container-fluid">
            <div class="row">
                <div  class="col-6 hidden-xs">
                    <div class="background">
                        <img src="https://id.yody.vn/resources/n2mvx/login/yody-phone/img/loginBackground.png" alt="">
                        <!-- <div class="background__content">
                            <img src="https://id.yody.vn/resources/n2mvx/login/yody-phone/img/loginBanner.png" alt="">
                        </div> -->
                    </div>
                </div>
                <div class="col-6">
                    <div class="login__wrapper">
                        <div class="topBar">
                            <div class="topBar__inner">
                                <img src="./img/FaS.png" alt="">
                            </div>
                        </div>
                        <div class="login__content">
                            <div id="kc-header" class="login-pf-page-header">
                                <div id="kc-header-wrapper" class>
                                    <img src="https://id.yody.vn/resources/n2mvx/login/yody-phone/img/loginLogo.svg" alt="">
                                </div>
                                
                            </div>
                            <div class="card-pf">
                                <header class="login-pf-header">
                                    <h1 id="kc-page-title"> Điền thông tin đăng nhập </h1>
                                </header>
                              <div id="kc-content">
                                    <div id="kc-content-wrapper">
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
                                        </form>
                                    </div>
                              </div>
                            </div>
                        </div>
                        <div class="login__footer"> © 2023 Yody Fashion Tech </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
