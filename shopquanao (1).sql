-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 13, 2023 lúc 01:47 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopquanao`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_img` varchar(255) NOT NULL,
  `admin_pass` varchar(20) NOT NULL,
  `role` varchar(11) NOT NULL,
  `admin_phone` varchar(255) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_update` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_name`, `admin_email`, `admin_img`, `admin_pass`, `role`, `admin_phone`, `created_time`, `last_update`) VALUES
(1, 'Hưng', 'hungdev1807@gmail.com', '', 'hung123', 'admin', '585016892', 1698988909, 1698988909),
(2, 'Bùi Khánh Toàn', 'toan@gmail.com', '', 'toan234', 'writer', '364023640', 1698988694, 1698988694);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_banner`
--

CREATE TABLE `tbl_banner` (
  `banner_id` int(11) NOT NULL,
  `banner_img` varchar(255) NOT NULL,
  `banner_name` varchar(255) NOT NULL,
  `banner_display` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_banner`
--

INSERT INTO `tbl_banner` (`banner_id`, `banner_img`, `banner_name`, `banner_display`) VALUES
(3, '1698167940_home_preivew_sanpham_3_image_desktop.webp', '', 'áp dụng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_danhmuc`
--

CREATE TABLE `tbl_danhmuc` (
  `danhmuc_id` int(11) NOT NULL,
  `danhmuc_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_danhmuc`
--

INSERT INTO `tbl_danhmuc` (`danhmuc_id`, `danhmuc_name`) VALUES
(1, 'Nam'),
(2, 'Nữ'),
(3, 'Trẻ Em'),
(5, 'Bộ sưu tập'),
(6, 'Đồng phục'),
(7, 'Về yody'),
(8, 'Blog');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_discount`
--

CREATE TABLE `tbl_discount` (
  `discount_id` int(11) NOT NULL,
  `discount_sotien` varchar(255) NOT NULL,
  `discount_code` varchar(255) NOT NULL,
  `discount_display` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_discount`
--

INSERT INTO `tbl_discount` (`discount_id`, `discount_sotien`, `discount_code`, `discount_display`) VALUES
(19, '25', 'ZUGFX', 'không áp dụng'),
(21, '60', 'FTACT', 'áp dụng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `order_id` int(11) NOT NULL,
  `order_name` varchar(255) NOT NULL,
  `order_phone` int(255) NOT NULL,
  `order_address` varchar(255) NOT NULL,
  `order_note` varchar(255) NOT NULL,
  `order_total` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_orders`
--

INSERT INTO `tbl_orders` (`order_id`, `order_name`, `order_phone`, `order_address`, `order_note`, `order_total`) VALUES
(78, 'Quyền Long', 585016892, 'vu an', 'nhanh', 356),
(79, 'Quyền Long', 585016892, 'Vũ an KX TB', 'fadaa', 2122);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order_detail`
--

CREATE TABLE `tbl_order_detail` (
  `order_detail_id` int(11) NOT NULL,
  `order_id` int(255) NOT NULL,
  `spbanchay_id` int(255) NOT NULL,
  `order_detai_quantity` int(255) NOT NULL,
  `order_detai_price` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order_detail`
--

INSERT INTO `tbl_order_detail` (`order_detail_id`, `order_id`, `spbanchay_id`, `order_detai_quantity`, `order_detai_price`) VALUES
(78, 78, 110, 10, 89),
(79, 79, 73, 14, 379);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_privilege`
--

CREATE TABLE `tbl_privilege` (
  `privilege_id` int(11) NOT NULL,
  `privileges_group_id` int(11) NOT NULL,
  `privilege_name` varchar(255) NOT NULL,
  `privilege_url_match` varchar(255) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_privilege`
--

INSERT INTO `tbl_privilege` (`privilege_id`, `privileges_group_id`, `privilege_name`, `privilege_url_match`, `created_time`, `last_updated`) VALUES
(1, 2, 'Danh sách sản phẩm', 'sanpham\\/spbanchay\\.php$', 1596502615, 1596502615),
(2, 2, 'Sửa sản phẩm', 'sanpham\\/spbanchayedit\\.php\\?spbanchay_id=\\d+$', 1596502615, 1596502615),
(3, 2, 'Quản trị', 'dashboard\\/dashboard\\.php$', 1596502615, 1596502615),
(4, 2, 'Xóa sản phẩm', 'sanpham\\/spbanchaydelete\\.php\\?spbanchay_id=\\d+$', 1596502615, 1596502615),
(5, 1, 'Danh mục', 'danhmuc\\/danhmuc\\.php$', 1596502615, 1596502615),
(6, 1, 'Sửa danh mục', 'danhmuc\\/danhmucedit\\.php\\?danhmuc_id=\\d+$', 1596502615, 1596502615),
(7, 1, 'Xóa danh mục', 'danhmuc\\/danhmucdelete\\.php\\?danhmuc_id=\\d+$', 1596502615, 1596502615),
(8, 3, 'Đơn hàng', 'donhang\\/donhang\\.php$', 1596502615, 1596502615),
(9, 4, 'Danh sách sile', 'slide\\/slide\\.php$', 1596502615, 1596502615),
(10, 4, 'Chức năng ẩn', 'slide\\/an\\.php\\?slide_id=\\d+$', 1596502615, 1596502615),
(11, 4, 'Chức năng hiện', 'slide\\/hien\\.php\\?slide_id=\\d+$', 1596502615, 1596502615),
(12, 4, 'Chức năng xóa', 'slide\\/slidedelete\\.php\\?slide_id=\\d+$', 1596502615, 1596502615),
(13, 5, 'Danh sách thành viên', 'thanhvien\\/thanhvien\\.php$', 1596502615, 1596502615),
(14, 5, 'Xóa thành viên', 'thanhviendelete\\.php\\?user_id=\\d+$', 1596502615, 1596502615),
(15, 7, 'Danh sách banner', 'banner\\/banner\\.php$', 1596502615, 1596502615),
(16, 7, 'Chức năng ẩn', 'banner\\/an\\.php\\?banner_id=\\d+$', 1596502615, 1596502615),
(17, 7, 'Chức năng hiện', 'banner\\/hien\\.php\\?banner_id=\\d+$', 1596502615, 1596502615),
(18, 7, 'Chức năng xóa', 'banner\\/bannerdelete\\.php\\?banner_id=\\d+$', 1596502615, 1596502615),
(19, 5, 'Phân quyền', 'privilege\\.php\\?user_id=\\d+$', 1596502615, 1596502615),
(20, 5, 'Lưu phân quyền', 'thanhvien\\/privilege\\.php\\?action\\=save+$', 1596502615, 1596502615),
(21, 2, 'Chi tiết sản phẩm', 'sanpham\\/chitietsp\\.php\\?spbanchay_id=\\d+$\r\n', 1596502615, 1596502615),
(22, 2, 'Phân trang sản phẩm', 'sanpham/spbanchay\\.php\\?per_page=\\d+$&page=\\d+$\n', 1596502615, 1596502615),
(23, 9, 'Mã giảm giá', 'magiamgia\\/magiamgia\\.php$', 1596502615, 1596502615),
(24, 9, 'Chỉnh sửa mã giảm giá', 'edit\\.php\\?discount_id=\\d+$', 1596502615, 1596502615);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_privileges_group`
--

CREATE TABLE `tbl_privileges_group` (
  `privileges_group_id` int(11) NOT NULL,
  `privileges_group_name` varchar(255) NOT NULL,
  `privileges_group_position` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_update` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_privileges_group`
--

INSERT INTO `tbl_privileges_group` (`privileges_group_id`, `privileges_group_name`, `privileges_group_position`, `created_time`, `last_update`) VALUES
(1, 'Danh mục', 1, 1596502615, 1596502615),
(2, 'Sản phẩm', 2, 1596502615, 1596502615),
(3, 'Đơn hàng', 3, 1596502615, 1596502615),
(4, 'Quảng cáo', 4, 1596502615, 1596502615),
(5, 'Thành viên', 5, 1596502615, 1596502615),
(6, 'Cấu hình', 6, 1596502615, 1596502615),
(7, 'Banner', 7, 1596502615, 1596502615),
(9, 'Mã giảm giá', 8, 1596502615, 1596502615);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_sale`
--

CREATE TABLE `tbl_sale` (
  `sale_id` int(11) NOT NULL,
  `sale_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_sale`
--

INSERT INTO `tbl_sale` (`sale_id`, `sale_name`) VALUES
(1, 'ban chay\r\n'),
(4, 'polo\r\n'),
(6, 'ao khoac\r\n'),
(9, 'quần\r\n');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_size`
--

CREATE TABLE `tbl_size` (
  `size_id` int(11) NOT NULL,
  `size_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_size`
--

INSERT INTO `tbl_size` (`size_id`, `size_name`) VALUES
(2, 'XS'),
(4, 'S'),
(6, 'M'),
(8, 'L'),
(10, 'XL');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_slider`
--

CREATE TABLE `tbl_slider` (
  `slide_id` int(11) NOT NULL,
  `slide_name` varchar(255) NOT NULL,
  `slide_img` varchar(255) NOT NULL,
  `slider_display` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_slider`
--

INSERT INTO `tbl_slider` (`slide_id`, `slide_name`, `slide_img`, `slider_display`) VALUES
(8, '', '1698166909_slider_2.webp', 'áp dụng'),
(9, '', '1698166914_slider_4.webp', 'áp dụng'),
(11, '', '1699155094_slider_2 (1).webp', 'áp dụng'),
(12, '', '1699155101_slider_5.webp', 'áp dụng'),
(13, '', '1699155106_slider_3.webp', 'áp dụng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_spbanchay`
--

CREATE TABLE `tbl_spbanchay` (
  `spbanchay_id` int(11) NOT NULL,
  `spbanchay_name` varchar(255) NOT NULL,
  `spbanchay_img` varchar(255) NOT NULL,
  `spbanchay_size` varchar(255) NOT NULL,
  `spbanchay_mau` varchar(255) NOT NULL,
  `spbanchay_msp` varchar(255) NOT NULL,
  `danhmuc_id` int(11) NOT NULL,
  `spbanchay_gia` int(255) NOT NULL,
  `characteristic` varchar(10000) NOT NULL,
  `sale_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_spbanchay`
--

INSERT INTO `tbl_spbanchay` (`spbanchay_id`, `spbanchay_name`, `spbanchay_img`, `spbanchay_size`, `spbanchay_mau`, `spbanchay_msp`, `danhmuc_id`, `spbanchay_gia`, `characteristic`, `sale_id`) VALUES
(69, 'Áo Polo Nam Mắt Chim Bo Hiệu Ứng Dệt Nổi', '1699160171_ao-polo-nam-apm6079-vag-1-yodyvn.webp', 'S', 'Vàng', 'APM6079-VAG', 1, 359, 'Lựa chọn hoàn hảo cho thiết kế polo basic mới!', 4),
(70, 'Polo Nam Cafe Dệt Tổ Ong Bo 3 Màu', '1699160286_ao-polo-nam-cafe-to-ong-yody-apm6387-xlo-qsm6037-nav-17.webp', 'L', ' Xanh lơ', 'APM6387-XLO', 1, 299, 'Thấm hút tốt, khô nhanh, hạn chế bám mùi', 4),
(71, 'Áo Polo Nam Vải Cafe Dệt Tổ Ong Thêu Hình Gấu', '1699160396_ao-polo-nam-apm6167-bee-2.webp', 'XL', 'Be', 'APM6167-BEE', 1, 349, 'Áo polo trơn, phom dáng cơ bản phù hợp với mọi đối tượng', 4),
(72, 'Áo Polo Nam Mắt Chim In Thuyền Phối Màu', '1699160481_ao-polo-nam-yody-apm6253-tra-2.webp', 'L', 'Trắng', 'APM6253-TRA', 1, 349, 'Bề mặt dệt được thiết kế óng ánh như mắt chim tinh anh, hiệu ứng trẻ trung mang lại đặc trưng riêng cho những chiếc polo tại YODY', 4),
(73, 'Áo Polo Nam Cafe Tổ Ong Phối 3 Màu', '1699160557_ao-polo-nam-apm5413-npt-4.webp', 'L', ' Navy phối Trắng', 'APM5413-NPT', 1, 379, 'Áo polo nam cafe dệt tổ ong phối 3 màu độc đáo', 4),
(74, 'Áo Polo Nam Mắt Chim In Phối Ngực', '1699160625_apm6171-nav-5.webp', 'm', 'Navy', 'APM6171-NAV', 1, 349, 'Chất liệu: Mắt chim', 4),
(75, 'Áo Polo Thể Thao Nam Trụ Áo Ép Sim', '1699160700_ao-polo-nam-sam6079-cam-qjm5021-xt2-8-yody.webp', 'L', 'Cam', 'SAM6079-CAM', 1, 379, 'Áo polo nam thể thao Airycool sử dụng Công nghệ Freezing tiên tiến giúp giải nhiệt cơ thể cho ngày hè mát mẻ', 4),
(76, 'Áo Polo Thể Thao Nam Airycool Nẹp Lệch In Chữ', '1699160761_sam6045-tra-sqm5015-den-3.webp', 'XL', 'Trắng', 'SAM6045-TRA', 1, 379, 'Chất liệu Airy cool thành phần 85% Nylon + 15% Spandex', 4),
(77, 'Áo Polo Nam Cafe Tổ Ong Basic', '1699160866_apm6325-tra.webp', 'L', 'Trắng', 'APM6325-TRA', 1, 299, 'Chất liệu cafe dệt tổ ong', 4),
(78, 'Áo Polo Nam Cafe Thêu Ngực', '1699160942_apm5329-xlo-3.webp', 'm', 'Xanh Lơ', 'APM5329-XLO', 1, 379, 'Áo polo cafe phối màu kiểu dáng trẻ trung năng động, tôn dáng người mặc', 4),
(79, 'Quần Short Thể Thao Nam In Sport Wear', '1699161050_sqm6045-den-sam6127-nav-1.webp', '31', 'Đen', 'SQM6045-DEN', 1, 399, 'Vải co giãn tuyệt vời, hạn chế nhăn nhàu tốt, vải dệt kim cho quần sooc đang dần dẫn đầu xư hướng quần sooc thể thao.', 9),
(80, 'Quần Âu Nam Nano Melange Thêu', '1699161121_qam6065-ghi-3.webp', '30', 'Ghi', 'QAM6065-GHI', 1, 549, 'Vải sử dụng công nghệ Nano xoắn nhiều sợi li ti thành một sợi.', 9),
(81, 'Quần Âu Nam Classic Phối Lé', '1699161207_qam6075-den-smm6087-xda-2.webp', '32', 'Đen', 'QAM6075-DEN', 1, 499, 'hoáng khí và thấm hút tốt từ sợi phẳng, có rãnh trong vải.', 9),
(82, 'Quần Jeans Nam Slim Fit Coolmax Mác Kẹp Yody Denim', '1699161274_quan-jean-nam-qjm6065-xnh-4.webp', '30', ' Xanh nhạt', 'QJM6065-XNH', 1, 599, 'Chất liệu: 76% Cotton + 22% Polyester by Coolmax all season + 2% Lycra', 9),
(83, 'Quần Short Nam Túi Cạnh Sườn', '1699161362_tsm6077-dn1-qsm6023-bee-14.webp', '30', 'Be', 'QSM6023-BEE', 1, 379, 'Thành phần :  60% Polyester + 40% nylon', 9),
(84, 'Áo Polo Nữ Mắt Chim In Quả Trám', '1699161491_ao-polo-nu-hoa-tiet-qua-tram-apn6210-xdm-7-yody.webp', 'm', ' Xanh đậm', 'APN6210-XDM', 2, 299, 'Áo polo hoạ tiết quả trám ấn tượng mới', 4),
(85, 'Polo Nữ Cafe Dệt Tổ Ong Bo 3 Màu', '1699161558_ao-polo-nu-cafe-to-ong-yody-apn6280-cba-2.webp', 'S', 'Xanh Coban', 'APN6280-CBA', 2, 299, 'Thấm hút nhanh, khô nhanh: các lỗ nhỏ trên cấu trúc xơ sợi cafe làm tăng diện tích tiếp xúc, làm cho hơi ẩm hoặc giọt nước', 4),
(86, 'Áo Polo Nữ Mắt Chim In Thuyền Phối Màu', '1699161627_ao-polo-nu-apn6178-tim-4.webp', 'S', 'Tím', 'APN6178-TIM', 2, 329, 'Áo polo nữ chất liệu mắt chim mềm mại, thấm hút tốt', 4),
(87, 'Áo Polo Nữ 100% Cotton Form Rộng Wonderful', '1699161700_ao-polo-nu-apn6216-xla-5.webp', 'm', 'Xanh Lá', 'APN6216-XLA', 2, 269, 'Áo polo nữ chất liệu 100% Cotton mềm mại, thấm hút và thoáng mát', 4),
(88, 'Áo Polo Nữ Cafe Họa Tiết Monogram', '1699161780_ao-polo-nu-apn6050-hog-6-yodyvn.webp', 'XL', 'Hồng', 'APN6050-HOG', 2, 329, 'Áo polo nữ vải Cafe mang lại trải nghiệm thời trang bên vững mới', 1),
(89, 'Áo Polo Nữ Bạc Hà Phối Tay Hoạ Tiết', '1699161848_apn6220-tpb-cvn5148-nan-4.webp', 'S', 'Trắng phối be', 'APN6220-TPB', 2, 369, 'Chất liệu vải:  89% Nylon, 11% Spandex', 1),
(90, 'Áo Polo Nữ Mắt Chim Kẻ Ngang', '1699161947_ao-polo-nu-mat-chim-ke-nagng-yody-apn6206-ken-8.webp', 'S', 'Kem kẻ nâu', 'APN6206-KEN', 2, 349, 'Chất vải mắt chim, thành phần: 49% Cotton + 47% Polyester + 4% Spandex', 1),
(91, 'Áo Polo Nữ Bạc Hà In Everyday Wear', '1699162010_ao-polo-nu-yody-apn6226-xlo-2-yody.webp', 'S', 'Xanh Lơ', 'APN6226-XLO', 2, 299, 'Chất liệu vải: 89% Nylon, 11% Spandex thoáng mát, thấm hút mồ hôi hiệu quả', 4),
(92, 'Áo Polo Nữ Mắt Chim Phối Bo', '1699162070_apn5390-hog-ao-polo-nu-yody-3.webp', 'S', 'Hồng', 'APN5390-HOG', 2, 329, 'Áo polo nữ chất liệu mắt chim được yêu thích hàng đầu tại YODY', 4),
(93, 'Áo Polo Nữ Cafe Dệt Tổ Ong Mickey Phi Hành Gia', '1699162153_apn6432-tra-4-of-9.webp', 'S', 'Trắng', 'APN6432-TRA', 2, 329, 'Chất liệu Cafe tổ ong', 4),
(94, 'Áo Khoác Gió Nam 3C Plus Năng Động Chống Ngấm Nước, Cản Gió, Cản Bụi', '1699162263_akm5037-den-1.webp', 'L', 'Đen', 'AKM5037-DEN', 1, 499, 'Áo khoác nam 3C PLUS - Cản gió, Chống thấm nước vào mặt trong, Cản bụi', 6),
(95, 'Áo Phao Nam 3S Siêu Nhẹ Tay Raglan', '1699162341_ao-phao-nam-yody-phm6005-xbi-qkm6005-bee-1-3.webp', 'S', 'Xanh Biển', 'PHM6005-XBI', 1, 599, 'Áo phao 3S siêu nhẹ dành cho nam giới', 6),
(96, 'Áo Khoác Nam Bomber Bổ Ngực', '1699162409_akm5047-ddo-4.webp', 'L', 'Đỏ', 'AKM5047-DDO', 1, 599, 'Áo khoác bomber nam vải gió giúp giữ ấm cơ thể tốt', 6),
(97, 'Áo Phao Nam Siêu Nhẹ Có Mũ Siêu Ấm', '1699162472_phm4001-reu-4.webp', 'XL', 'Rêu', 'PHM4001-REU', 1, 599, 'Thành phần:  100% NYLON', 6),
(98, 'Áo Khoác Gió Thông Minh Nam Trượt Nước', '1699162528_akm5041-ghs-4.webp', 'L', 'Ghi sáng', 'AKM5041-GHS', 1, 599, 'Chiếc áo có thể lộn ngược và gấp gọn thành 1 chiếc túi ngọn nhẹ, dễ dàng mang đi mọi nơi', 6),
(99, 'Áo Khoác Nữ Nỉ Cào Lông', '1699162613_ao-khoac-nu-akn6040-hog-6.webp', 'S', 'Hồng', 'AKN6040-HOG', 2, 399, 'Thiết kế basic dễ mặc dễ phối đồ, có mũ ấm áp', 6),
(100, 'Áo Măng Tô Nữ Dáng Suông Đai Eo', '1699162670_mtn6002-nau-5.webp', 'S', ' Nâu', 'MTN6002-NAU', 2, 999, 'Thành phần : 94% Polyester, 6% Spandex', 6),
(101, 'Áo Khoác Ngắn Cá Vai', '1699162734_ao-mang-to-nu-yody-mtn4008-den-1.webp', 'm', 'Đen', 'MTN4008-DEN', 2, 1199, 'Áo khoác măng tô dáng ngắn kèm đai cá tính', 6),
(102, 'Áo Khoác Gió Thông Minh Trẻ Em Trượt Nước Cản Gió Cản Bụi', '1699162798_akk5021-cam-11.webp', '2-3', 'Cam', 'AKK5021-CAM', 3, 499, 'Áo gió thông minh 2 lớp phiên bản áo khoác gió cao nhất của YODY', 6),
(103, 'Áo Khoác Trẻ Em Nhỏ 3C Pro', '1699162853_ao-khoac-tre-em-akk6030-vag-1.webp', '4-5', 'Vàng', 'AKK6030-VAG', 3, 399, 'Áo khoác cho bé từ 2-8 tuổi, chất liệu 100% Polyester', 6),
(104, 'Bộ Đồ Nữ Thể Thao Siêu Nhẹ', '1699162960_bo-do-nu-the-thao-sieu-nhe-yody-sbn6020-ttm-1.webp', 'S', 'Trắng tím', 'SBN6020-TTM', 5, 469, 'Bộ đồ thể thao nữ gồm: 1 áo thun thể thao, 1 quần short có túi & dây rút trong', 1),
(105, 'Bộ Đồ Thể Thao Nam Nỉ Double Face Áo Khoác Kéo Khóa', '1699163028_sdm5007-gsa-3.webp', 'L', 'Ghi sáng', 'SDM5007-GSA', 1, 899, 'Bộ đồ thể thao in hình trẻ trung năng động', 1),
(106, 'Bộ Đồ Nam Ba Lỗ', '1699163092_do-bo-nam-sbm6033-dee-7.webp', 'L', 'Đen', 'SBM6033-DEE', 5, 499, 'Chất liệu cafe dệt tổ ong', 1),
(107, 'Bộ Đồ Thể Thao Nữ Mùa Hè Năng Động', '1699163168_sbn5008-den-17.webp', 'm', 'Đen', 'SBN5008-DEN', 5, 449, 'Thành phần: 91% Polyester + 9% Spandex', 1),
(108, 'Đồ Bộ Nữ Cotton Usa Dáng Rộng In Nature', '1699163232_bo-do-nu-cotton-usa-dang-rong-in-nature-bdn6020-hog-1.webp', 'S', 'Hồng', 'BDN6020-HOG', 5, 399, 'Thấm hút tốt, mát và không gây kích ứng da', 1),
(109, 'Quần Lót Nam Boxer Dệt Liền Mềm Mịn', '1699163365_quan-lot-nam-qcm5045-tit-1-yodyvn.webp', 'm', 'Tím than', 'QCM5045-TIT', 1, 159, 'Quần lót nam chất liệu mềm mại, thấm hút tốt, thân thiện với da người mặc', 0),
(110, 'Quần Chip Nữ Collagen Mềm Mướt Cao Cấp', '1699163429_qcn5032-den-3.webp', 'S', 'Đen', 'QCN5032-DEN', 2, 89, 'Chất liệu Sen - Modal - Spandex mềm mại, thoáng mát', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_spbanchay_imgs`
--

CREATE TABLE `tbl_spbanchay_imgs` (
  `spbanchay_imgs_id` int(11) NOT NULL,
  `spbanchay_id` int(11) NOT NULL,
  `spbanchay_imgs_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_spbanchay_imgs`
--

INSERT INTO `tbl_spbanchay_imgs` (`spbanchay_imgs_id`, `spbanchay_id`, `spbanchay_imgs_name`) VALUES
(16, 68, 'ao-polo-nam-apm6079-vag-1-yodyvn.webp'),
(17, 68, 'ao-polo-nam-apm6079-vag-4-yodyvn.webp'),
(18, 68, 'ao-polo-nam-apm6079-vag-7-yodyvn.webp'),
(19, 68, 'ao-polo-nam-apm6079-vag-12-yodyvn.webp'),
(20, 69, 'ao-polo-nam-apm6079-vag-4-yodyvn.webp'),
(21, 69, 'ao-polo-nam-apm6079-vag-7-yodyvn.webp'),
(22, 69, 'ao-polo-nam-apm6079-vag-9-yodyvn.webp'),
(23, 69, 'ao-polo-nam-apm6079-vag-12-yodyvn.webp'),
(24, 70, 'ao-polo-nam-cafe-to-ong-yody-apm6387-xlo-11 - Copy.webp'),
(25, 70, 'ao-polo-nam-cafe-to-ong-yody-apm6387-xlo-qsm6037-nav-16 - Copy.webp'),
(26, 70, 'ao-polo-nam-cafe-to-ong-yody-apm6387-xlo-qsm6037-nav-18 - Copy.webp'),
(27, 70, 'ao-polo-nam-cafe-to-ong-yody-apm6387-xlo-qsm6037-nav-26 - Copy.webp'),
(28, 71, 'ao-polo-nam-apm6167-bee-3.webp'),
(29, 71, 'ao-polo-nam-apm6167-bee-4.webp'),
(30, 71, 'ao-polo-nam-apm6167-bee-5.webp'),
(31, 71, 'ao-polo-nam-apm6167-bee-6.webp'),
(32, 72, 'ao-polo-nam-yody-apm6253-tra-4.webp'),
(33, 72, 'ao-polo-nam-yody-apm6253-tra-5.webp'),
(34, 72, 'ao-polo-nam-yody-apm6253-tra-6.webp'),
(35, 72, 'ao-polo-nam-yody-apm6253-tra-qjm5043-xdm-9.webp'),
(36, 73, 'ao-polo-nam-apm5413-npt-5.webp'),
(37, 73, 'ao-polo-nam-apm5413-npt-6.webp'),
(38, 73, 'ao-polo-nam-apm5413-npt-7.webp'),
(39, 73, 'ao-polo-nam-apm5413-npt-9.webp'),
(40, 74, 'apm6171-nav-6.webp'),
(41, 74, 'apm6171-nav-7.webp'),
(42, 74, 'apm6171-nav-9.webp'),
(43, 74, 'apm6171-nav-qjm6033-xah-1.webp'),
(44, 75, 'ao-polo-nam-sam6079-cam-4-yody.webp'),
(45, 75, 'ao-polo-nam-sam6079-cam-qjm5021-xt2-4-yody.webp'),
(46, 75, 'ao-polo-nam-sam6079-cam-qjm5021-xt2-5-yody.webp'),
(47, 75, 'ao-polo-nam-sam6079-cam-qjm5021-xt2-6-yody.webp'),
(48, 76, 'sam6045-tra-sqm5015-den-6.webp'),
(49, 76, 'sam6045-tra-sqm5015-den-7.webp'),
(50, 76, 'sam6045-tra-sqm5015-den-9.webp'),
(51, 76, 'sam6045-tra-sqm5015-den-12.webp'),
(52, 77, 'apm6325-tra-21.webp'),
(53, 77, 'apm6325-tra-22.webp'),
(54, 77, 'apm6325-tra-24.webp'),
(55, 77, 'apm6325-tra-25.webp'),
(56, 78, 'apm5329-xlo-5.webp'),
(57, 78, 'apm5329-xlo-7.webp'),
(58, 78, 'apm5329-xlo-8.webp'),
(59, 78, 'apm5329-xlo-9.webp'),
(60, 79, 'sqm6045-den-sam6127-nav-3.webp'),
(61, 79, 'sqm6045-den-sam6127-nav-4.webp'),
(62, 79, 'sqm6045-den-sam6127-nav-5.webp'),
(63, 79, 'sqm6045-den-sam6127-nav-7.webp'),
(64, 80, 'qam6065-ghi-1.webp'),
(65, 80, 'qam6065-ghi-4.webp'),
(66, 80, 'qam6065-ghi-6.webp'),
(67, 80, 'qam6065-ghi-7.webp'),
(68, 81, 'qam6075-den-smm6087-xda-1.webp'),
(69, 81, 'qam6075-den-smm6087-xda-6.webp'),
(70, 81, 'qam6075-den-smm6087-xda-7.webp'),
(71, 81, 'qam6075-den-smm6087-xda-8.webp'),
(72, 82, 'quan-jean-nam-qjm6065-xnh-1.webp'),
(73, 82, 'quan-jean-nam-qjm6065-xnh-3.webp'),
(74, 82, 'quan-jean-nam-qjm6065-xnh-5.webp'),
(75, 82, 'quan-jean-nam-qjm6065-xnh-6.webp'),
(76, 83, 'tsm6077-dn1-qsm6023-bee.webp'),
(77, 83, 'tsm6077-dn1-qsm6023-bee-12.webp'),
(78, 83, 'tsm6077-dn1-qsm6023-bee-17.webp'),
(79, 83, 'tsm6077-dn1-qsm6023-bee-18 - Copy.webp'),
(80, 84, 'ao-polo-nu-hoa-tiet-qua-tram-apn6210-xdm-2-yody.webp'),
(81, 84, 'ao-polo-nu-hoa-tiet-qua-tram-apn6210-xdm-5-yody.webp'),
(82, 84, 'ao-polo-nu-hoa-tiet-qua-tram-apn6210-xdm-8-yody.webp'),
(83, 84, 'ao-polo-nu-hoa-tiet-qua-tram-apn6210-xdm-9-yody.webp'),
(84, 85, 'ao-polo-nu-cafe-to-ong-yody-apn6280-cba-4.webp'),
(85, 85, 'ao-polo-nu-cafe-to-ong-yody-apn6280-cba-5.webp'),
(86, 85, 'ao-polo-nu-cafe-to-ong-yody-apn6280-cba-6.webp'),
(87, 85, 'ao-polo-nu-cafe-to-ong-yody-apn6280-cba-cvn5090-den-11.webp'),
(88, 86, 'ao-polo-nu-apn6178-tim-1.webp'),
(89, 86, 'ao-polo-nu-apn6178-tim-2.webp'),
(90, 86, 'ao-polo-nu-apn6178-tim-5.webp'),
(91, 86, 'ao-polo-nu-apn6178-tim-6.webp'),
(92, 87, 'ao-polo-nu-apn6216-xla-6.webp'),
(93, 87, 'ao-polo-nu-apn6216-xla-7.webp'),
(94, 87, 'ao-polo-nu-apn6216-xla-8.webp'),
(95, 87, 'ao-polo-nu-apn6216-xla-10.webp'),
(96, 88, 'ao-polo-nu-apn6050-hog-9-yodyvn.webp'),
(97, 88, 'ao-polo-nu-apn6050-hog-10-yodyvn.webp'),
(98, 88, 'ao-polo-nu-apn6050-hog-11-yodyvn.webp'),
(99, 88, 'ao-polo-nu-apn6050-hog-qjn5056-xnh-10-yodyvn.webp'),
(100, 89, 'apn6220-tpb-cvn5148-nan-3.webp'),
(101, 89, 'apn6220-tpb-cvn5148-nan-5.webp'),
(102, 89, 'apn6220-tpb-cvn5148-nan-7.webp'),
(103, 89, 'apn6220-tpb-cvn5148-nan-9.webp'),
(104, 90, 'ao-polo-nu-mat-chim-ke-nagng-yody-apn6206-ken-6.webp'),
(105, 90, 'ao-polo-nu-mat-chim-ke-nagng-yody-apn6206-ken-7.webp'),
(106, 90, 'ao-polo-nu-mat-chim-ke-nagng-yody-apn6206-ken-12.webp'),
(107, 90, 'ao-polo-nu-mat-chim-ke-nagng-yody-apn6206-ken-qjn5052-bsa-11.webp'),
(108, 91, 'ao-polo-nu-yody-apn6226-xlo-4-yody.webp'),
(109, 91, 'ao-polo-nu-yody-apn6226-xlo-6-yody.webp'),
(110, 91, 'ao-polo-nu-yody-apn6226-xlo-7-yody.webp'),
(111, 91, 'ao-polo-nu-yody-apn6226-xlo-10-yody.webp'),
(112, 92, 'apn5390-hog-ao-polo-nu-yody-5.webp'),
(113, 92, 'apn5390-hog-ao-polo-nu-yody-6.webp'),
(114, 92, 'apn5390-hog-ao-polo-nu-yody-7.webp'),
(115, 92, 'apn5390-hog-ao-polo-nu-yody-10.webp'),
(116, 93, 'apn6432-tra-2-of-9.webp'),
(117, 93, 'apn6432-tra-5-of-9.webp'),
(118, 93, 'apn6432-tra-6-of-9.webp'),
(119, 93, 'apn6432-tra-8-of-9.webp'),
(120, 94, 'akm5037-den-12.webp'),
(121, 94, 'akm5037-den-13.webp'),
(122, 94, 'akm5037-den-14.webp'),
(123, 94, 'akm5037-den-16.webp'),
(124, 95, 'ao-phao-nam-yody-phm6005-xbi-qkm6005-bee-1-9.webp'),
(125, 95, 'ao-phao-nam-yody-phm6005-xbi-qkm6005-bee-1-10.webp'),
(126, 95, 'ao-phao-nam-yody-phm6005-xbi-qkm6005-bee-1-13.webp'),
(127, 95, 'ao-phao-nam-yody-phm6005-xbi-qkm6005-bee-1-14.webp'),
(128, 96, 'akm5047-ddo-5.webp'),
(129, 96, 'akm5047-ddo-7.webp'),
(130, 96, 'akm5047-ddo-8.webp'),
(131, 96, 'akm5047-ddo-10.webp'),
(132, 97, 'phm4001-reu-3-9202aac1-daad-4bd4-a849-2a3040f33c33.webp'),
(133, 97, 'phm4001-reu-3-bbaa6fea-9429-493d-9105-7d0f2bce9970.webp'),
(134, 97, 'phm4001-reu-4-b4880320-f80b-41dd-a0a4-89f487668fc8.webp'),
(135, 97, 'phm4001-reu-12.webp'),
(136, 98, 'akm5041-ghs-5.webp'),
(137, 98, 'akm5041-ghs-9.webp'),
(138, 98, 'akm5041-ghs-12.webp'),
(139, 98, 'akm5041-ghs-18.webp'),
(140, 99, 'ao-khoac-nu-akn6040-hog-2.webp'),
(141, 99, 'ao-khoac-nu-akn6040-hog-3.webp'),
(142, 99, 'ao-khoac-nu-akn6040-hog-4.webp'),
(143, 99, 'ao-khoac-nu-akn6040-hog-7.webp'),
(144, 100, 'mtn6002-nau-7.webp'),
(145, 100, 'mtn6002-nau-12.webp'),
(146, 100, 'mtn6002-nau-14.webp'),
(147, 100, 'mtn6002-nau-15.webp'),
(148, 101, 'ao-mang-to-nu-yody-mtn4008-den-4.webp'),
(149, 101, 'ao-mang-to-nu-yody-mtn4008-den-6.webp'),
(150, 101, 'ao-mang-to-nu-yody-mtn4008-den-7.webp'),
(151, 101, 'ao-mang-to-nu-yody-mtn4008-den-8.webp'),
(152, 102, 'akk5021-cam-2 - Copy.webp'),
(153, 102, 'akk5021-cam-3 - Copy.webp'),
(154, 102, 'akk5021-cam-4 - Copy.webp'),
(155, 102, 'akk5021-cam-13.webp'),
(156, 103, 'ao-khoac-tre-em-akk6030-vag-2.webp'),
(157, 103, 'ao-khoac-tre-em-akk6030-vag-4.webp'),
(158, 103, 'ao-khoac-tre-em-akk6030-vag-5.webp'),
(159, 103, 'ao-khoac-tre-em-akk6030-vag-6.webp'),
(160, 104, 'bo-do-nu-the-thao-sieu-nhe-yody-sbn6020-ttm-3.webp'),
(161, 104, 'bo-do-nu-the-thao-sieu-nhe-yody-sbn6020-ttm-6.webp'),
(162, 104, 'bo-do-nu-the-thao-sieu-nhe-yody-sbn6020-ttm-7.webp'),
(163, 104, 'bo-do-nu-the-thao-sieu-nhe-yody-sbn6020-ttm-8.webp'),
(164, 105, 'sdm5007-gsa-4.webp'),
(165, 105, 'sdm5007-gsa-5.webp'),
(166, 105, 'sdm5007-gsa-6.webp'),
(167, 105, 'sdm5007-gsa-7.webp'),
(168, 106, 'do-bo-nam-sbm6033-dee-1.webp'),
(169, 106, 'do-bo-nam-sbm6033-dee-4.webp'),
(170, 106, 'do-bo-nam-sbm6033-dee-5.webp'),
(171, 106, 'do-bo-nam-sbm6033-dee-6.webp'),
(172, 107, 'sbn5008-den.webp'),
(173, 107, 'sbn5008-den-11.webp'),
(174, 107, 'sbn5008-den-13.webp'),
(175, 107, 'sbn5008-den-20.webp'),
(176, 108, 'bo-do-nu-cotton-usa-dang-rong-in-nature-bdn6020-hog-4.webp'),
(177, 108, 'bo-do-nu-cotton-usa-dang-rong-in-nature-bdn6020-hog-5.webp'),
(178, 108, 'bo-do-nu-cotton-usa-dang-rong-in-nature-bdn6020-hog-6.webp'),
(179, 108, 'bo-do-nu-cotton-usa-dang-rong-in-nature-bdn6020-hog-7.webp'),
(180, 109, 'quan-lot-nam-qcm5045-tit-2-yodyvn.webp'),
(181, 109, 'quan-lot-nam-qcm5045-tit-3-yodyvn.webp'),
(182, 109, 'quan-lot-nam-qcm5045-tit-4-yodyvn.webp'),
(183, 109, 'quan-lot-nam-qcm5045-tit-6-yodyvn.webp'),
(184, 110, 'qcn5032-den-1.webp'),
(185, 110, 'qcn5032-den-5.webp'),
(186, 110, 'qcn5032-den-8.webp'),
(187, 110, 'qcn5032-den-9.webp'),
(188, 111, '1efd98cff5bc2de274ad.jpg'),
(189, 111, '72648610_2461011467506454_33587224075304960_n.jpg'),
(190, 111, '73253467_407912646570058_2896480417769062400_n.jpg'),
(191, 111, '73266691_383058019240234_1298291493148033024_n.jpg'),
(192, 112, '73266691_383058019240234_1298291493148033024_n.jpg'),
(193, 112, '73279050_655125098349354_1583613656749309952_n.jpg'),
(194, 112, '129588018_685145715533351_1838832190464754953_n.jpg'),
(195, 112, '293544593_575512087612928_2244051878078775942_n.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_img` varchar(255) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `user_count` int(11) NOT NULL,
  `role` varchar(255) NOT NULL,
  `active` int(11) NOT NULL,
  `user_phone` int(11) NOT NULL,
  `user_fullname` varchar(255) NOT NULL,
  `created_time` int(255) NOT NULL,
  `last_update` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `user_email`, `user_img`, `user_pass`, `user_count`, `role`, `active`, `user_phone`, `user_fullname`, `created_time`, `last_update`) VALUES
(8, 'Bùi Khánh Toàn', 'toan@gmail.com', '', 'toan234', 0, 'writer', 0, 364023640, '', 1698988694, 1698988694),
(11, 'Nguyễn Văn Khang', 'khang@gmail.com', '', 'khang123', 0, 'user', 0, 585015135, '', 1698988778, 1698988778),
(15, 'Quyền Long', 'long@gmail.com', '', 'long123', 0, 'user', 0, 364252948, '', 1698988886, 1698988886),
(16, 'Hưng', 'hungdev1807@gmail.com', '', 'hung123', 0, 'admin', 0, 585016892, '', 1698988909, 1698988909);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_user_privilege`
--

CREATE TABLE `tbl_user_privilege` (
  `user_privilege_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_update` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_user_privilege`
--

INSERT INTO `tbl_user_privilege` (`user_privilege_id`, `privilege_id`, `created_time`, `last_update`, `admin_id`) VALUES
(71, 3, 1596502615, 1596502615, 1),
(72, 5, 1596502615, 1596502615, 1),
(73, 1, 1596502615, 1596502615, 1),
(74, 2, 1596502615, 1596502615, 1),
(75, 4, 1596502615, 1596502615, 1),
(76, 6, 1596502615, 1596502615, 1),
(77, 7, 1596502615, 1596502615, 1),
(78, 8, 1596502615, 1596502615, 1),
(79, 9, 1596502615, 1596502615, 1),
(80, 10, 1596502615, 1596502615, 1),
(81, 11, 1596502615, 1596502615, 1),
(82, 12, 1596502615, 1596502615, 1),
(83, 13, 1596502615, 1596502615, 1),
(85, 15, 1596502615, 1596502615, 1),
(86, 16, 1596502615, 1596502615, 1),
(87, 17, 1596502615, 1596502615, 1),
(88, 18, 1596502615, 1596502615, 1),
(89, 19, 1596502615, 1596502615, 1),
(90, 20, 1596502615, 1596502615, 1),
(91, 21, 1596502615, 1596502615, 1),
(92, 22, 1596502615, 1596502615, 1),
(94, 23, 1596502615, 1596502615, 1),
(116, 24, 1596502615, 1596502615, 1),
(117, 14, 1596502615, 1596502615, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `tbl_banner`
--
ALTER TABLE `tbl_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Chỉ mục cho bảng `tbl_danhmuc`
--
ALTER TABLE `tbl_danhmuc`
  ADD PRIMARY KEY (`danhmuc_id`);

--
-- Chỉ mục cho bảng `tbl_discount`
--
ALTER TABLE `tbl_discount`
  ADD PRIMARY KEY (`discount_id`);

--
-- Chỉ mục cho bảng `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `order_detail_ibfk_1` (`order_id`),
  ADD KEY `order_detail_ibfk_2` (`spbanchay_id`);

--
-- Chỉ mục cho bảng `tbl_privilege`
--
ALTER TABLE `tbl_privilege`
  ADD PRIMARY KEY (`privilege_id`),
  ADD KEY `privileges_group_id` (`privileges_group_id`);

--
-- Chỉ mục cho bảng `tbl_privileges_group`
--
ALTER TABLE `tbl_privileges_group`
  ADD PRIMARY KEY (`privileges_group_id`);

--
-- Chỉ mục cho bảng `tbl_sale`
--
ALTER TABLE `tbl_sale`
  ADD PRIMARY KEY (`sale_id`);

--
-- Chỉ mục cho bảng `tbl_size`
--
ALTER TABLE `tbl_size`
  ADD PRIMARY KEY (`size_id`);

--
-- Chỉ mục cho bảng `tbl_slider`
--
ALTER TABLE `tbl_slider`
  ADD PRIMARY KEY (`slide_id`);

--
-- Chỉ mục cho bảng `tbl_spbanchay`
--
ALTER TABLE `tbl_spbanchay`
  ADD PRIMARY KEY (`spbanchay_id`);

--
-- Chỉ mục cho bảng `tbl_spbanchay_imgs`
--
ALTER TABLE `tbl_spbanchay_imgs`
  ADD PRIMARY KEY (`spbanchay_imgs_id`);

--
-- Chỉ mục cho bảng `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `tbl_user_privilege`
--
ALTER TABLE `tbl_user_privilege`
  ADD PRIMARY KEY (`user_privilege_id`),
  ADD KEY `privilege_id` (`privilege_id`),
  ADD KEY `user_id` (`admin_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tbl_banner`
--
ALTER TABLE `tbl_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `tbl_danhmuc`
--
ALTER TABLE `tbl_danhmuc`
  MODIFY `danhmuc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `tbl_discount`
--
ALTER TABLE `tbl_discount`
  MODIFY `discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT cho bảng `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT cho bảng `tbl_privilege`
--
ALTER TABLE `tbl_privilege`
  MODIFY `privilege_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `tbl_privileges_group`
--
ALTER TABLE `tbl_privileges_group`
  MODIFY `privileges_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `tbl_sale`
--
ALTER TABLE `tbl_sale`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `tbl_size`
--
ALTER TABLE `tbl_size`
  MODIFY `size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `tbl_slider`
--
ALTER TABLE `tbl_slider`
  MODIFY `slide_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `tbl_spbanchay`
--
ALTER TABLE `tbl_spbanchay`
  MODIFY `spbanchay_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT cho bảng `tbl_spbanchay_imgs`
--
ALTER TABLE `tbl_spbanchay_imgs`
  MODIFY `spbanchay_imgs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT cho bảng `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `tbl_user_privilege`
--
ALTER TABLE `tbl_user_privilege`
  MODIFY `user_privilege_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tbl_orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`spbanchay_id`) REFERENCES `tbl_spbanchay` (`spbanchay_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `tbl_privilege`
--
ALTER TABLE `tbl_privilege`
  ADD CONSTRAINT `tbl_privilege_ibfk_1` FOREIGN KEY (`privileges_group_id`) REFERENCES `tbl_privileges_group` (`privileges_group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `tbl_user_privilege`
--
ALTER TABLE `tbl_user_privilege`
  ADD CONSTRAINT `tbl_user_privilege_ibfk_1` FOREIGN KEY (`privilege_id`) REFERENCES `tbl_privilege` (`privilege_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
