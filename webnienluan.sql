-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 03, 2022 lúc 03:03 AM
-- Phiên bản máy phục vụ: 10.4.20-MariaDB
-- Phiên bản PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webnienluan`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `admin_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_email`, `admin_password`, `admin_name`, `admin_phone`, `created_at`, `updated_at`) VALUES
(1, 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Admin', '0123456789', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brand_id` int(10) UNSIGNED NOT NULL,
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_brand`
--

INSERT INTO `tbl_brand` (`brand_id`, `brand_name`, `brand_desc`, `brand_status`, `created_at`, `updated_at`) VALUES
(1, 'LG', 'Tất cả các sản phẩm thuộc hãng LG', 0, NULL, NULL),
(2, 'Samsung', 'Tất cả các sản phẩm thuộc hãng Samsung', 0, NULL, NULL),
(3, 'AQUA', 'Tất cả các sản phẩm thuộc hãng AQUA', 0, NULL, NULL),
(4, 'Apple', 'Tất cả các sản phẩm thuộc hãng Apple', 0, NULL, NULL),
(5, 'Sony', 'Tất cả các sản phẩm thuộc hãng Sony', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_category_product`
--

CREATE TABLE `tbl_category_product` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_category_product`
--

INSERT INTO `tbl_category_product` (`category_id`, `category_name`, `category_desc`, `category_status`, `created_at`, `updated_at`) VALUES
(1, 'Dàn Karaoke', 'Tất cả sản phẩm karaoke', 0, NULL, NULL),
(2, 'Tablet', 'Tất cả sản phẩm Tablet', 0, NULL, NULL),
(3, 'Tủ lạnh', 'Tất cả các sản phẩm tủ lạnh', 0, NULL, NULL),
(4, 'Máy giặt', 'Tất cả các sản phẩm máy giặt', 0, NULL, NULL),
(5, 'Điện thoại', 'Tất cả các sản phẩm điện thoại', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_contact`
--

CREATE TABLE `tbl_contact` (
  `contact_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(11) UNSIGNED NOT NULL,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_contact`
--

INSERT INTO `tbl_contact` (`contact_id`, `customer_id`, `contact_name`, `contact_phone`, `contact_email`, `contact_desc`, `created_at`, `updated_at`) VALUES
(1, 1, 'Nguyễn Tỉnh', '0818480336', 'nnqtinh1612@gmail.com', 'Tủ lạnh Samsung giá nhiêu', '2022-03-25 11:00:27', NULL),
(2, 1, 'Nguyễn Tỉnh', '088888888888', 'nguyentinh@gmail.com', 'Có bán máy lạnh không ạ', '2022-03-25 11:02:01', NULL),
(3, 2, 'Nguyễn Văn Em', '0917252816', 'vanem@gmail.com', 'Cửa hàng có sữa laptop không ạ', '2022-03-25 13:36:50', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `customer_id` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_customer`
--

INSERT INTO `tbl_customer` (`customer_id`, `customer_name`, `customer_user`, `customer_password`, `customer_phone`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Tỉnh', 'nguyentinh', 'e10adc3949ba59abbe56e057f20f883e', '0818480336', '2022-03-25 10:54:56', NULL),
(2, 'Trần Văn Em', 'vanem', 'e10adc3949ba59abbe56e057f20f883e', '09172525816', '2022-03-25 11:03:33', NULL),
(3, 'Quốc Tỉnh', 'quoctinh', 'e10adc3949ba59abbe56e057f20f883e', '0818480336', '2022-05-03 01:01:01', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(11) UNSIGNED NOT NULL,
  `shipping_id` int(11) UNSIGNED NOT NULL,
  `order_total` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `customer_id`, `shipping_id`, `order_total`, `order_status`, `order_code`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '20,820,000.00', '1', '34f87', '2022-03-25 10:56:36', NULL),
(2, 2, 2, '72,680,000.00', '1', 'dea4b', '2022-03-25 11:05:40', NULL),
(3, 1, 3, '13,680,000.00', '1', '6e9fc', '2022-03-25 11:06:36', NULL),
(4, 3, 4, '7,290,000.00', '1', '4788e', '2022-05-03 01:02:26', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order_detail`
--

CREATE TABLE `tbl_order_detail` (
  `order_detail_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) UNSIGNED NOT NULL,
  `order_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_sale_quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order_detail`
--

INSERT INTO `tbl_order_detail` (`order_detail_id`, `order_id`, `order_code`, `product_id`, `product_name`, `product_price`, `product_sale_quantity`, `created_at`, `updated_at`) VALUES
(1, 1, '34f87', 22, 'Dàn âm thanh Sony HT-S20R', '6940000', 3, NULL, NULL),
(2, 2, 'dea4b', 8, 'Máy tính bảng iPad Pro M1 11 inch WiFi Cellular', '44590000', 1, NULL, NULL),
(3, 2, 'dea4b', 7, 'Máy tính bảng iPad Pro M1 12.9 inch WiFi Cellular', '28090000', 1, NULL, NULL),
(4, 3, '6e9fc', 9, 'Máy giặt Aqua Inverter', '7690000', 1, NULL, NULL),
(5, 3, '6e9fc', 16, 'Tủ lạnh Aqua Inverter 212 lít AQR-T239FA(HB)', '5990000', 1, NULL, NULL),
(6, 4, '4788e', 21, 'Loa Bluetooth Sony Extra Bass SRS-XB23', '2430000', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) UNSIGNED NOT NULL,
  `brand_id` int(11) UNSIGNED NOT NULL,
  `product_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_sold` int(11) DEFAULT NULL,
  `product_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `category_id`, `brand_id`, `product_name`, `product_quantity`, `product_sold`, `product_desc`, `product_content`, `product_price`, `product_image`, `product_status`, `created_at`, `updated_at`) VALUES
(1, 5, 2, 'Điện thoại Samsung Galaxy S21 Ultra', 30, NULL, '<p>Sự đẳng cấp được&nbsp;Samsung&nbsp;gửi gắm th&ocirc;ng qua chiếc&nbsp;smartphone&nbsp;Galaxy S21 Ultra 5G với h&agrave;ng loạt sự n&acirc;ng cấp v&agrave; cải tiến kh&ocirc;ng chỉ ngoại h&igrave;nh b&ecirc;n ngo&agrave;i m&agrave; c&ograve;n sức mạnh b&ecirc;n trong, hứa hẹn đ&aacute;p ứng trọn vẹn nhu cầu ng&agrave;y c&agrave;ng cao của người d&ugrave;ng.</p>\r\n\r\n<p>Đột ph&aacute; trong thiết kế thời thượng</p>\r\n\r\n<p>Kh&ocirc;ng chỉ đơn thuần phục vụ giao tiếp v&agrave; giải tr&iacute;,&nbsp;Samsung Galaxy S21 Ultra 5G&nbsp;c&ograve;n ch&iacute;nh l&agrave; m&oacute;n phụ kiện thời trang khẳng định vị thế của người sở hữu. Vẻ ngo&agrave;i mảnh mai v&agrave; thon gọn đến bất ngờ chỉ 165.1 x 75.6 x 8.9 mm v&agrave; trọng lượng 228 g d&ugrave; phải &ldquo;v&aacute;c&rdquo; một vi&ecirc;n pin lớn.</p>', '<p>M&agrave;n h&igrave;nh:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Dynamic AMOLED 2X6.8&quot;Quad HD+ (2K+)</p>\r\n\r\n<p>Hệ điều h&agrave;nh:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Android 11</p>\r\n\r\n<p>Camera sau:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Ch&iacute;nh 108 MP &amp; Phụ 12 MP, 10 MP, 10 MP</p>\r\n\r\n<p>Camera trước:&nbsp; &nbsp; &nbsp; &nbsp;40 MP</p>\r\n\r\n<p>Chip:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Exynos 2100</p>\r\n\r\n<p>RAM:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;12 GB</p>\r\n\r\n<p>Bộ nhớ trong:&nbsp; &nbsp; &nbsp; &nbsp; 128 GB</p>\r\n\r\n<p>SIM:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2 Nano SIM hoặc 1 Nano SIM + 1 eSIMHỗ trợ 5G</p>\r\n\r\n<p>Pin, Sạc:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 5000 mAh25 W</p>', '25990000', 'samsung215.jpg', 0, NULL, NULL),
(2, 5, 2, 'Điện thoại Samsung Galaxy S22 Ultra', 30, NULL, '<p>Galaxy S22 Ultra 5G&nbsp;chiếc smartphone cao cấp nhất trong bộ 3 Galaxy S22 series m&agrave; Samsung&nbsp;đ&atilde; cho ra mắt. T&iacute;ch hợp b&uacute;t S Pen ho&agrave;n hảo trong th&acirc;n m&aacute;y, trang bị vi xử l&yacute; mạnh mẽ cho c&aacute;c t&aacute;c vụ sử dụng v&ocirc; c&ugrave;ng mượt m&agrave; v&agrave; nổi bật hơn với cụm camera kh&ocirc;ng viền độc đ&aacute;o mang đậm dấu ấn ri&ecirc;ng.</p>\r\n\r\n<p>Sở hữu một diện mạo đầy nổi bật</p>\r\n\r\n<p>Galaxy S22 Ultra 5G được kế thừa form thiết kế từ những d&ograve;ng Note trước đ&acirc;y của h&atilde;ng đem đến cho bạn c&oacute; cảm gi&aacute;c vừa mới lạ vừa ho&agrave;i niệm. Trọng lượng của m&aacute;y khoảng 228 g cho cảm gi&aacute;c cầm nắm đầm tay, khi cầm m&aacute;y trần th&igrave; hơi c&oacute; cảm gi&aacute;c dễ trượt.</p>', '<p>M&agrave;n h&igrave;nh:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Dynamic AMOLED 2X6.8&quot;Quad HD+ (2K+)</p>\r\n\r\n<p>Hệ điều h&agrave;nh:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Android 12</p>\r\n\r\n<p>Camera sau:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Ch&iacute;nh 108 MP &amp; Phụ 12 MP, 10 MP, 10 MP</p>\r\n\r\n<p>Camera trước:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;40 MP</p>\r\n\r\n<p>Chip:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Snapdragon 8 Gen 1 8 nh&acirc;n</p>\r\n\r\n<p>RAM:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 8 GB</p>\r\n\r\n<p>Bộ nhớ trong:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;128 GB</p>\r\n\r\n<p>SIM:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2 Nano SIM hoặc 1 Nano SIM + 1 eSIMHỗ trợ 5G</p>\r\n\r\n<p>Pin, Sạc:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 5000 mAh45 W</p>', '30990000', 'samsung146.jpg', 0, NULL, NULL),
(3, 5, 4, 'Điện thoại iPhone SE', 30, NULL, '<p>Như vậy l&agrave; sau bao ng&agrave;y chờ đợi th&igrave;&nbsp;iPhone SE 64 GB (2022)&nbsp;cũng đ&atilde; được giới thiệu tại sự kiện Apple Peek Performance. Thiết bị nổi bật với cấu h&igrave;nh mạnh mẽ, chạy chip hiện đại nhất của Apple&nbsp;hiện tại nhưng gi&aacute; b&aacute;n lại rất phải chăng.</p>\r\n\r\n<p>Thiết kế ho&agrave;i niệm</p>', '<p>M&agrave;n h&igrave;nh:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;IPS LCD4.7&quot;</p>\r\n\r\n<p>Hệ điều h&agrave;nh:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;iOS 15</p>\r\n\r\n<p>Camera sau:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;12 MP</p>\r\n\r\n<p>Camera trước:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;7 MP</p>\r\n\r\n<p>Chip:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Apple A15 Bionic</p>\r\n\r\n<p>RAM:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 3 GB</p>\r\n\r\n<p>Bộ nhớ trong:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 64 GB</p>\r\n\r\n<p>SIM:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1 Nano SIM &amp; 1 eSIMHỗ trợ 5G</p>\r\n\r\n<p>Pin, Sạc:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 20 W</p>', '12990000', 'iphone251.jpg', 0, NULL, NULL),
(4, 5, 4, 'Điện thoại iPhone 13 Pro Max', 30, NULL, '<p>iPhone 13 Pro Max 128 GB&nbsp;- si&ecirc;u phẩm được mong chờ nhất ở nửa cuối năm 2021 đến từ Apple. M&aacute;y c&oacute; thiết kế kh&ocirc;ng mấy đột ph&aacute; khi so với người tiền nhiệm, b&ecirc;n trong đ&acirc;y vẫn l&agrave; một sản phẩm c&oacute; m&agrave;n h&igrave;nh si&ecirc;u đẹp, tần số qu&eacute;t được n&acirc;ng cấp l&ecirc;n 120 Hz mượt m&agrave;, cảm biến camera c&oacute; k&iacute;ch thước lớn hơn, c&ugrave;ng hiệu năng mạnh mẽ với sức mạnh đến từ Apple A15 Bionic, sẵn s&agrave;ng c&ugrave;ng bạn chinh phục mọi thử th&aacute;ch.</p>\r\n\r\n<p>Thi&ecirc;́t k&ecirc;́ đẳng cấp h&agrave;ng đầu</p>\r\n\r\n<p>iPhone mới kế thừa thiết kế đặc trưng từ&nbsp;iPhone 12 Pro Max&nbsp;khi sở hữu khung viền vu&ocirc;ng vức, mặt lưng k&iacute;nh c&ugrave;ng m&agrave;n h&igrave;nh tai thỏ tr&agrave;n viền nằm ở ph&iacute;a trước.</p>', '<p>M&agrave;n h&igrave;nh:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; OLED6.7&quot;Super Retina XDR</p>\r\n\r\n<p>Hệ điều h&agrave;nh:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; iOS 15</p>\r\n\r\n<p>Camera sau:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;3 camera 12 MP</p>\r\n\r\n<p>Camera trước:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 12 MP</p>\r\n\r\n<p>Chip:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Apple A15 Bionic</p>\r\n\r\n<p>RAM:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;6 GB</p>\r\n\r\n<p>Bộ nhớ trong:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 128 GB</p>\r\n\r\n<p>SIM:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1 Nano SIM &amp; 1 eSIMHỗ trợ 5G</p>\r\n\r\n<p>Pin, Sạc:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 4352 mAh20 W</p>', '33990000', 'iphone119.jpg', 0, NULL, NULL),
(5, 2, 2, 'Máy tính bảng Samsung Galaxy Tab S7 FE 4G', 30, NULL, '<p>&nbsp;</p>\r\n\r\n<p>Samsung ch&iacute;nh thức cho ra mắt chiếc m&aacute;y t&iacute;nh bảng&nbsp;Galaxy Tab S7 FE, đ&acirc;y được xem l&agrave; phi&ecirc;n bản r&uacute;t gọn của d&ograve;ng&nbsp;Galaxy Tab S7, l&agrave; sản phẩm c&oacute; mức gi&aacute; rẻ hơn nhưng vẫn đảm bảo đầy đủ c&aacute;c t&iacute;nh năng cao cấp, mở ra một thế giới giải tr&iacute; mượt m&agrave; hứa hẹn sẽ đ&aacute;p ứng tốt nhu cầu sử dụng từ học tập giải tr&iacute; hay l&agrave;m việc hằng ng&agrave;y của mọi người d&ugrave;ng.</p>\r\n\r\n<p>Hiệu năng mạnh mẽ</p>\r\n\r\n<p>Cung cấp sức mạnh cho Tab S7 FE l&agrave; con chip Snapdragon 750G 8 nh&acirc;n, sản xuất tr&ecirc;n tiến tr&igrave;nh 8 nm với l&otilde;i Kryo 570 thế hệ mới, mang đến hiệu năng v&ocirc; c&ugrave;ng ổn định, đ&aacute;p ứng nhiều nhu cầu sử dụng kh&aacute;c nhau của người như chơi game, chỉnh sửa video, l&agrave;m việc, đọc b&aacute;o,... tất cả đều mượt m&agrave;.</p>', '<p>M&agrave;n h&igrave;nh:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 12.4&quot;TFT LCD</p>\r\n\r\n<p>Hệ điều h&agrave;nh:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Android 11</p>\r\n\r\n<p>Chip:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Snapdragon 750G</p>\r\n\r\n<p>RAM:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;4 GB</p>\r\n\r\n<p>Bộ nhớ trong:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 64 GB</p>\r\n\r\n<p>Kết nối:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Hỗ trợ 4GC&oacute; nghe gọi</p>\r\n\r\n<p>SIM:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1 Nano SIM</p>\r\n\r\n<p>Camera sau:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;8 MP</p>\r\n\r\n<p>Camera trước:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 5 MP</p>\r\n\r\n<p>Pin, Sạc:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;10090 mAh45 W</p>\r\n\r\n<p>H&atilde;ng:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Samsung</p>', '13390000', 'samsung836.jpg', 0, NULL, NULL),
(6, 2, 2, 'Máy tính bảng Samsung Galaxy Tab S8', 30, NULL, '<p>Hiệu năng mạnh mẽ với Snapdragon 888 Gen 1, GPU Adreno 730 c&ugrave;ng 8 GB RAM.</p>\r\n\r\n<p>M&agrave;n h&igrave;nh 11 inch, tần số qu&eacute;t 120 Hz cho trải nghiệm giải tr&iacute; th&ecirc;m mượt m&agrave;.</p>\r\n\r\n<p>Hỗ trợ &acirc;m thanh v&ograve;m Dolby Atmos.</p>\r\n\r\n<p>Hỗ trợ kết nối mạng wifi 6, mạng dữ liệu 5G ti&ecirc;n tiến.</p>\r\n\r\n<p>Pin 8000 mAh, sạc nhanh 45 W qua cổng Type-C.</p>', '<p>M&agrave;n h&igrave;nh:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 11&quot;LTPS</p>\r\n\r\n<p>Hệ điều h&agrave;nh:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Android 12</p>\r\n\r\n<p>Chip:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Snapdragon 8 Gen 1 8 nh&acirc;n</p>\r\n\r\n<p>RAM:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;8 GB</p>\r\n\r\n<p>Bộ nhớ trong:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 128 GB</p>\r\n\r\n<p>Kết nối:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 5G</p>\r\n\r\n<p>SIM:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1 Nano SIM</p>\r\n\r\n<p>Camera sau:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Ch&iacute;nh 13 MP &amp; Phụ 6 MP</p>\r\n\r\n<p>Camera trước:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 12 MP</p>\r\n\r\n<p>Pin, Sạc:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;8000 mAh45 W</p>\r\n\r\n<p>H&atilde;ng:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Samsung</p>', '29990000', 'samsung79.jpg', 0, NULL, NULL),
(7, 2, 4, 'Máy tính bảng iPad Pro M1 12.9 inch WiFi Cellular', 30, NULL, '<p>Apple đ&atilde; l&agrave;m cho c&aacute;c fan của m&igrave;nh đứng ngồi kh&ocirc;ng y&ecirc;n trước chiếc m&aacute;y t&iacute;nh bảng&nbsp;iPad Pro M1 12.9 inch Wifi Cellular 128GB (2021)&nbsp;mới toanh. C&aacute;c t&iacute;nh năng m&agrave; sản phẩm n&agrave;y sở hữu đều l&agrave; những c&ocirc;ng nghệ h&agrave;ng đầu từ nh&agrave; T&aacute;o rất đ&aacute;ng để bạn đầu tư sở hữu.&nbsp;</p>\r\n\r\n<p>Con chip chiến binh Apple M1 8 nh&acirc;n</p>\r\n\r\n<p>Một sản phẩm đẳng cấp thường được đ&aacute;nh gi&aacute; từ b&ecirc;n trong v&agrave; ở&nbsp;iPad Pro M1&nbsp;12.9 inch 2021 bạn ho&agrave;n to&agrave;n c&oacute; thể tin tưởng con chip Apple M1 đ&atilde; từng được trang bị tr&ecirc;n những chiếc&nbsp;MacBook M1. Chipset mạnh mẽ gần như quyết định cho mọi hoạt động của m&aacute;y trở n&ecirc;n nhịp nh&agrave;ng, nhanh nhạy hơn.</p>', '<p>M&agrave;n h&igrave;nh:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 12.9&quot;Liquid Retina XDR mini-LED LCD</p>\r\n\r\n<p>Hệ điều h&agrave;nh:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; iPadOS 15</p>\r\n\r\n<p>Chip:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Apple M1 8 nh&acirc;n</p>\r\n\r\n<p>RAM:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 8 GB</p>\r\n\r\n<p>Bộ nhớ trong:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;128 GB</p>\r\n\r\n<p>Kết nối:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;5G,Nghe gọi qua FaceTime</p>\r\n\r\n<p>SIM:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1 Nano SIM hoặc 1 eSIM</p>\r\n\r\n<p>Camera sau:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Ch&iacute;nh 12 MP &amp; Phụ 10 MP, TOF 3D LiDAR</p>\r\n\r\n<p>Camera trước:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 12 MP</p>\r\n\r\n<p>Pin, Sạc:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 40.88 Wh (~ 10.835 mAh)20 W</p>', '28090000', 'iphone426.jpg', 0, NULL, NULL),
(8, 2, 4, 'Máy tính bảng iPad Pro M1 11 inch WiFi Cellular', 30, NULL, '<p>Sự đẳng cấp to&aacute;t l&ecirc;n từ vẻ ngo&agrave;i thời thượng</p>\r\n\r\n<p>iPad Pro M1 11 inch WiFi Cellular 1TB (2021)​ được chế t&aacute;c gọn đẹp, chất liệu nh&ocirc;m nguy&ecirc;n khối bền chắc, tản nhiệt tốt gi&uacute;p đảm bảo hiệu suất hoạt động v&agrave; k&eacute;o d&agrave;i tuổi thọ cho m&aacute;y t&iacute;nh bảng.&nbsp;</p>', '<p>M&agrave;n h&igrave;nh:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;11&quot;Liquid Retina</p>\r\n\r\n<p>Hệ điều h&agrave;nh:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;iPadOS 15</p>\r\n\r\n<p>Chip:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Apple M1 8 nh&acirc;n</p>\r\n\r\n<p>RAM:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 16 GB</p>\r\n\r\n<p>Bộ nhớ trong:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1 TB</p>\r\n\r\n<p>Kết nối:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;5GNghe gọi qua FaceTime</p>\r\n\r\n<p>SIM:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1 Nano SIM hoặc 1 eSIM</p>\r\n\r\n<p>Camera sau:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Ch&iacute;nh 12 MP &amp; Phụ 10 MP, TOF 3D LiDAR</p>\r\n\r\n<p>Camera trước:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 12 MP</p>\r\n\r\n<p>Pin, Sạc:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;28.65 Wh (~ 7538 mAh)20 W</p>', '44590000', 'iphone354.jpg', 0, NULL, NULL),
(9, 4, 3, 'Máy giặt Aqua Inverter', 30, NULL, '<p>Thiết kế sang trọng, tinh tế với bảng điều khiển n&uacute;t xoay dễ thao t&aacute;c</p>\r\n\r\n<p>M&aacute;y giặt Aqua Inverter 8 KG AQD-A800F W&nbsp;c&oacute; kiểu thiết kế lồng ngang - mang phong c&aacute;ch vừa cổ điển vừa hiện đại, k&egrave;m với gam m&agrave;u trắng sang trọng, ắt hẳn sẽ l&agrave;m cho kh&ocirc;ng gian sinh hoạt của bạn trở n&ecirc;n tinh tế hơn.&nbsp;</p>\r\n\r\n<p>Bảng điều khiển tiếng Việt được trang bị n&uacute;t xoay dễ thao t&aacute;c c&ugrave;ng m&agrave;n h&igrave;nh Led hiển thị r&otilde; n&eacute;t, hỗ trợ bạn sử dụng&nbsp;m&aacute;y giặt&nbsp;nhanh ch&oacute;ng.</p>', '<p>Loại m&aacute;y:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Cửa trướcLồng ngangC&oacute; Inverter</p>\r\n\r\n<p>Khối lượng giặt:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 8 KgTừ 3 - 5 người</p>\r\n\r\n<p>Kiểu động cơ:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Truyền động gi&aacute;n tiếp (d&acirc;y Curoa)</p>\r\nC&ocirc;ng nghệ giặt:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;C&ocirc;ng nghệ c&acirc;n bằng AI DBTC&ocirc;ng nghệ giặt hơi nước Steam<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; CyclesLồng giặt PillowSmart Dual Spray tự l&agrave;m sạch mặt trong<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cửaV&ograve;ng đệm cửa kh&aacute;ng khuẩn ABT\r\n<p>Tiện &iacute;ch:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Hẹn giờ giặtKh&oacute;a trẻ emL&agrave;m mới, loại bỏ nếp nhăn v&agrave; m&ugrave;i kh&oacute;<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;chịu của quần &aacute;oTuỳ chỉnh nhiệt độ nước n&oacute;ngTự khởi động lại<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;khi c&oacute; điệnVệ sinh lồng giặt</p>\r\n\r\n<p>Bảng điều khiển:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Tiếng Việt n&uacute;t xoay c&oacute; m&agrave;n h&igrave;nh hiển thị</p>\r\n\r\n<p>Chất liệu lồng giặt:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Th&eacute;p kh&ocirc;ng gỉ</p>\r\n\r\n<p>K&iacute;ch thước - Khối lượng:&nbsp; &nbsp;Cao 84 cm - Ngang 59.5 cm - S&acirc;u 46.8 cm - Nặng 53.5 Kg</p>\r\n\r\n<p>H&atilde;ng:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Aqua</p>', '7690000', 'aqua357.jpg', 0, NULL, NULL),
(10, 4, 3, 'Máy giặt Aqua Inverter', 30, NULL, '<p>Hiệu quả giặt sạch vượt trội với m&acirc;m giặt k&eacute;p Twin Pulsator</p>\r\n\r\n<p>M&acirc;m giặt k&eacute;p Twin Pulsator&nbsp;gồm 2 m&acirc;m giặt trong ngo&agrave;i v&agrave; c&aacute;nh quạt dưới cực lớn kết hợp với 3 luồng nước chuyển động linh hoạt, tạo n&ecirc;n xo&aacute;y nước mạnh mẽ, gi&uacute;p quần &aacute;o dễ đảo trộn, mang lại hiệu quả giặt sạch tối ưu.</p>', '<p>Loại m&aacute;y:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Cửa tr&ecirc;nLồng đứngC&oacute; Inverter</p>\r\n\r\n<p>Khối lượng giặt:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 10.5 KgTr&ecirc;n 7 người</p>\r\n\r\n<p>Kiểu động cơ:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Truyền động trực tiếp bền &amp; &ecirc;m</p>\r\n\r\n<p>C&ocirc;ng nghệ giặt:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Lồng giặt PillowM&acirc;m giặt kh&aacute;ng khuẩn ABTM&acirc;m giặt k&eacute;p Twin<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;PulsatorTh&aacute;c nước 360&deg;</p>\r\n\r\n<p>Tiện &iacute;ch:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Hẹn giờ giặt, Kh&oacute;a trẻ emVan sử dụng mực nước thấp, Vắt cực<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; kh&ocirc;</p>\r\n\r\n<p>Bảng điều khiển:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Tiếng Việt c&oacute; n&uacute;t nhấn + n&uacute;t xoay</p>\r\n\r\n<p>Chất liệu lồng giặt:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Th&eacute;p kh&ocirc;ng gỉ</p>\r\n\r\n<p>K&iacute;ch thước - Khối lượng:&nbsp; Cao 102 cm - Ngang 58 cm - S&acirc;u 62 cm - Nặng 40.5 kg</p>\r\n\r\n<p>H&atilde;ng:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Aqua</p>', '9390000', 'aqua442.jpg', 0, NULL, NULL),
(11, 4, 1, 'Máy giặt LG Inverter', 30, NULL, '<p>Tiết kiệm điện năng hiệu quả, vận h&agrave;nh &ecirc;m &aacute;i với c&ocirc;ng nghệ Inverter</p>\r\n\r\n<p>M&aacute;y giặt Inverter sở hữu khả năng tự động điều chỉnh số v&ograve;ng quay ph&ugrave; hợp với từng điều kiện gi&uacute;p tăng hiệu quả khi giặt giũ, hoạt động &ecirc;m &aacute;i, tiết kiệm điện năng v&agrave; nước nhưng vẫn đảm bảo chất lượng giặt giũ sạch sẽ.</p>', '<p>Loại m&aacute;y giặt:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Cửa trước</p>\r\n\r\n<p>Lồng giặt:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Lồng ngang</p>\r\n\r\n<p>Khối lượng giặt:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 10 Kg</p>\r\n\r\n<p>Số người sử dụng:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Từ 5 - 7 người</p>\r\n\r\n<p>Loại Inverter:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DD Inverter</p>\r\n\r\n<p>Kiểu động cơ:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Truyền động trực tiếp - sử dụng tr&iacute; tuệ nh&acirc;n tạo</p>\r\n\r\n<p>Hiệu suất sử dụng điện:&nbsp; &nbsp;26.5 Wh/kg</p>\r\n\r\n<p>Tốc độ quay vắt tối đa:&nbsp; &nbsp; &nbsp;1400 v&ograve;ng/ph&uacute;t</p>\r\n\r\n<p>Chất liệu lồng giặt:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Th&eacute;p kh&ocirc;ng gỉ</p>\r\n\r\n<p>Chất liệu vỏ m&aacute;y:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Kim loại sơn tĩnh điện</p>\r\n\r\n<p>Chất liệu nắp m&aacute;y:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; K&iacute;nh chịu lực</p>\r\n\r\n<p>Bảng điều khiển:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Song ngữ Anh - Việt, c&oacute; n&uacute;t xoay, m&agrave;n h&igrave;nh hiển thị</p>\r\n\r\n<p>K&iacute;ch thước, khối lượng:&nbsp; &nbsp; Cao 85 cm - Ngang 60 cm - S&acirc;u 57 cm - Nặng 80 kg</p>\r\n\r\n<p>H&atilde;ng:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;LG</p>', '15290000', 'lg384.jpg', 0, NULL, NULL),
(12, 4, 1, 'Máy giặt LG Inverter', 30, NULL, '<p style=\"text-align:justify\">Nh&atilde; nhặn v&agrave; sang trọng với gam m&agrave;u trắng c&ugrave;ng kiểu d&aacute;ng vu&ocirc;ng vức</p>\r\n\r\n<p style=\"text-align:justify\">Mang tr&ecirc;n m&igrave;nh t&ocirc;ng m&agrave;u trắng chủ đạo kết hợp với phần lồng giặt m&agrave;u đen tạo điểm nhấn,&nbsp;m&aacute;y giặt LG c&oacute;&nbsp;diện mạo sang trọng v&agrave; tinh tế, l&agrave;m tăng th&ecirc;m vẻ hiện đại cho gian nh&agrave;.&nbsp;D&ugrave; lượng khối lớn nhưng m&aacute;y c&oacute; k&iacute;ch thước vừa phải, kh&ocirc;ng qu&aacute; cồng kềnh v&agrave; kh&ocirc;ng sử dụng nhiều diện t&iacute;ch.</p>', '<p>Loại m&aacute;y giặt:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Cửa trước</p>\r\n\r\n<p>Lồng giặt:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Lồng ngang</p>\r\n\r\n<p>Khối lượng giặt:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 10 Kg</p>\r\n\r\n<p>Số người sử dụng:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Từ 5 - 7 người</p>\r\n\r\n<p>Loại Inverter:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DD Inverter</p>\r\n\r\n<p>Kiểu động cơ:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Truyền động trực tiếp - sử dụng tr&iacute; tuệ nh&acirc;n tạo</p>\r\n\r\n<p>Hiệu suất sử dụng điện:&nbsp; &nbsp;26.5 Wh/kg</p>\r\n\r\n<p>Tốc độ quay vắt tối đa:&nbsp; &nbsp; &nbsp;1400 v&ograve;ng/ph&uacute;t</p>\r\n\r\n<p>Chất liệu lồng giặt:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Th&eacute;p kh&ocirc;ng gỉ</p>\r\n\r\n<p>Chất liệu vỏ m&aacute;y:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Kim loại sơn tĩnh điện</p>\r\n\r\n<p>Chất liệu nắp m&aacute;y:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; K&iacute;nh chịu lực</p>\r\n\r\n<p>Bảng điều khiển:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Song ngữ Anh - Việt, c&oacute; n&uacute;t xoay, m&agrave;n h&igrave;nh hiển thị</p>\r\n\r\n<p>K&iacute;ch thước, khối lượng:&nbsp; &nbsp; Cao 85 cm - Ngang 60 cm - S&acirc;u 57 cm - Nặng 80 kg</p>\r\n\r\n<p>H&atilde;ng:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;LG</p>', '12690000', 'lg448.jpg', 0, NULL, NULL),
(13, 4, 2, 'Máy giặt Samsung Inverter', 30, NULL, '<p>Tăng hiệu quả giặt sạch, tối ưu việc giặt giũ với c&ocirc;ng nghệ AI Wash</p>\r\n\r\n<p>Với&nbsp;AI Wash, 4 cảm biến (khối lượng quần &aacute;o, độ bẩn, lượng nước, lượng nước giặt/nước xả). C&ocirc;ng nghệ n&agrave;y nhận biết khối lượng &aacute;o quần, tự động điều c&aacute;c th&ocirc;ng số như chế độ giặt, lượng nước, lượng nước giặt/xả, thời gian,... cho ph&ugrave; hợp.&nbsp;</p>\r\n\r\n<p>Trong qu&aacute; tr&igrave;nh giặt, AI Wash sử dụng c&ocirc;ng nghệ tia s&aacute;ng theo d&otilde;i v&agrave; đ&aacute;nh gi&aacute; độ bẩn của &aacute;o quần dựa v&agrave;o độ đục/trong của nước.</p>', '<p>Loại m&aacute;y:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Cửa trướcLồng ngangC&oacute; Inverter</p>\r\n\r\n<p>Khối lượng giặt:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 10 KgTừ 5 - 7 người</p>\r\n\r\n<p>Kiểu động cơ:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Truyền động gi&aacute;n tiếp (d&acirc;y Curoa)</p>\r\n\r\n<p>Tiện &iacute;ch:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Chế độ giặt Bubble SoakHẹn giờ giặtKh&oacute;a trẻ emTự động vệ sinh<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;lồng giặt Drum Clean+</p>\r\n\r\n<p>Bảng điều khiển:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Tiếng Việt n&uacute;t xoay + Cảm ứng c&oacute; m&agrave;n h&igrave;nh hiển thị</p>\r\n\r\n<p>Chất liệu lồng giặt:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Th&eacute;p kh&ocirc;ng gỉ</p>\r\n\r\n<p>K&iacute;ch thước - Khối lượng:&nbsp; Cao 85 cm - Ngang 60 cm - S&acirc;u 59.5 cm - Nặng 67 Kg</p>\r\n\r\n<p>H&atilde;ng:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Samsung</p>', '14690000', 'samsung575.jpg', 0, NULL, NULL),
(14, 4, 2, 'Máy giặt Samsung AI Inverter', 30, NULL, '<p>Giặt cảm biến th&ocirc;ng minh AI Wash tự động tối ưu lượng nước giặt xả, lượng nước v&agrave; thời gian giặt</p>\r\n\r\n<p>M&aacute;y giặt Samsung AI Inverter 9 kg WW90TP44DSB/SV&nbsp;ứng dụng c&ocirc;ng nghệ AI Wash hiện đại với 4 cảm biến c&oacute; thể cảm nhận khối lượng v&agrave; độ bẩn &aacute;o quần, từ đ&oacute; tối ưu lượng nước, lượng nước giặt, nước xả, v&agrave; thời gian giặt sao cho giặt sạch hiệu quả m&agrave; kh&ocirc;ng tốn nhiều c&ocirc;ng sức.</p>\r\n\r\n<p>Khi giặt, c&ocirc;ng nghệ tia s&aacute;ng sẽ theo d&otilde;i, đ&aacute;nh gi&aacute; độ bẩn &aacute;o quần dựa v&agrave;o độ đục/trong của nước, tự động th&ecirc;m bớt nước giặt v&agrave; tăng giảm thời gian giặt ph&ugrave; hợp.</p>', '<p>Loại m&aacute;y:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Cửa trướcLồng ngangC&oacute; Inverter</p>\r\n\r\n<p>Khối lượng giặt:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;9 KgTừ 3 - 5 người</p>\r\n\r\n<p>Kiểu động cơ:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Truyền động gi&aacute;n tiếp (d&acirc;y Curoa)</p>\r\n\r\n<p>Tiện &iacute;ch:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Bảng điều khiển th&ocirc;ng minh AI ControlCho ph&eacute;p điều khiển từ xa<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qua ứng dụng SmartThings. Hẹn giờ giặtKh&oacute;a trẻ emVệ sinh lồng&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;giặt</p>\r\n\r\n<p>Bảng điều khiển:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Tiếng Việt n&uacute;t xoay + Cảm ứng c&oacute; m&agrave;n h&igrave;nh hiển thị</p>\r\n\r\n<p>Chất liệu lồng giặt:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Th&eacute;p kh&ocirc;ng gỉ</p>\r\n\r\n<p>K&iacute;ch thước - Khối lượng: Cao 85 cm - Ngang 60 cm - S&acirc;u 55 cm - Nặng 67 kg</p>\r\n\r\n<p>H&atilde;ng:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Samsung</p>', '14690000', 'samsung693.jpg', 0, NULL, NULL),
(15, 3, 3, 'Tủ lạnh Aqua 130 lít AQR-T150FA(BS)', 30, NULL, '<p>Diệt khuẩn, khử m&ugrave;i hiệu quả c&ugrave;ng c&ocirc;ng nghệ&nbsp;Nano Fresh Ag+</p>\r\n\r\n<p>C&ocirc;ng nghệ Nano Fresh Ag+&nbsp; ứng dụng t&iacute;nh chất của c&aacute;c ion Ag+,&nbsp;gi&uacute;p diệt khuẩn v&agrave;&nbsp;ngăn ngừa sự ph&aacute;t triển của vi khuẩn nấm mốc, giữ bầu kh&ocirc;ng kh&iacute; lu&ocirc;n sạch khuẩn v&agrave; tho&aacute;ng m&aacute;t. Với sự hỗ trợ n&agrave;y, ch&uacute;ng ta c&oacute; thể thoải m&aacute;i lưu trữ thực phẩm cho gia đ&igrave;nh nhiều ng&agrave;y m&agrave; kh&ocirc;ng phải lo đến việc &aacute;m m&ugrave;i.&nbsp;</p>', '<p>Kiểu tủ:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Ngăn đ&aacute; tr&ecirc;n</p>\r\n\r\n<p>Dung t&iacute;ch sử dụng:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;130 l&iacute;t</p>\r\n\r\n<p>C&ocirc;ng nghệ l&agrave;m lạnh:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Gi&aacute;n tiếp</p>\r\n\r\n<p>C&ocirc;ng nghệ khử m&ugrave;i:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Nano Fresh Ag+</p>\r\n\r\n<p>C&ocirc;ng nghệ bảo quản:&nbsp; &nbsp; &nbsp; &nbsp; Ngăn rau quả giữ ẩm</p>\r\n\r\n<p>K&iacute;ch thước - Khối lượng:&nbsp; &nbsp;Cao 124 cm - Rộng 48 cm - S&acirc;u 60 cm - Nặng 33 kg</p>\r\n\r\n<p>Nơi sản xuất:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Việt Nam</p>\r\n\r\n<p>Năm ra mắt:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2019</p>\r\n\r\n<p>H&atilde;ng:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Aqua</p>', '4390000', 'aqua121.jpg', 0, NULL, NULL),
(16, 3, 3, 'Tủ lạnh Aqua Inverter 212 lít AQR-T239FA(HB)', 30, NULL, '<p>C&ocirc;ng nghệ&nbsp;Nano Fresh Ag+&nbsp;diệt khuẩn, khử m&ugrave;i hiệu quả gi&uacute;p kh&ocirc;ng kh&iacute; lu&ocirc;n sạch khuẩn</p>\r\n\r\n<p>C&ocirc;ng nghệ n&agrave;y c&oacute; khả năng t&aacute;ch tinh thể&nbsp; Ag+ th&agrave;nh những ion c&oacute; k&iacute;ch thước si&ecirc;u nhỏ đi nhanh trong kh&ocirc;ng gian tủ để&nbsp;diệt khuẩn v&agrave; khử m&ugrave;i h&ocirc;i kh&oacute; chịu do thực phẩm l&acirc;u ng&agrave;y g&acirc;y ra, đảm bảo vệ sinh thực phẩm cho cả gia đ&igrave;nh.</p>', '<p>Kiểu tủ:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Ngăn đ&aacute; tr&ecirc;n</p>\r\n\r\n<p>Dung t&iacute;ch sử dụng:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 212 l&iacute;t&nbsp;</p>\r\n\r\n<p>C&ocirc;ng nghệ tiết kiệm điện:&nbsp; Twin Inverter</p>\r\n\r\n<p>C&ocirc;ng nghệ l&agrave;m lạnh:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; L&agrave;m lạnh đa chiều</p>\r\n\r\n<p>C&ocirc;ng nghệ khử m&ugrave;i:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Nano Fresh Ag+</p>\r\n\r\n<p>C&ocirc;ng nghệ bảo quản:&nbsp; &nbsp; &nbsp; &nbsp; L&agrave;m lạnh đa chiều gi&uacute;p thực phẩm tươi ngonNgăn rau củ quả<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Fresh Box</p>\r\n\r\n<p>K&iacute;ch thước - Khối lượng:&nbsp; &nbsp;Cao 146.5 cm - Rộng 54.8 cm - S&acirc;u 57.5 cm - Nặng 41 kg</p>\r\n\r\n<p>Nơi sản xuất:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Việt Nam</p>\r\n\r\n<p>Năm ra mắt:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2021</p>\r\n\r\n<p>H&atilde;ng:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Aqua</p>', '5990000', 'aqua252.jpg', 0, NULL, NULL),
(17, 3, 1, 'Tủ lạnh LG Inverter 255 lít GN-M255BL', 30, NULL, '<h3>Thiết kế hiện đại v&agrave; đẳng cấp</h3>\r\n\r\n<p>Tủ lạnh LG Inverter 255 l&iacute;t GN-D255BL&nbsp;mang kiểu d&aacute;ng thon gọn, gam m&agrave;u đen c&aacute; t&iacute;nh sang trọng sẽ l&agrave; điểm nhấn tuyệt vời, mang lại vẻ đẹp hiện đại cho kh&ocirc;ng gian nội thất của bạn.</p>', '<p>Kiểu tủ:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Ngăn đ&aacute; tr&ecirc;n</p>\r\n\r\n<p>Dung t&iacute;ch sử dụng:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 255 l&iacute;t&nbsp;</p>\r\n\r\n<p>C&ocirc;ng nghệ tiết kiệm điện:&nbsp; Smart Inverter</p>\r\n\r\n<p>C&ocirc;ng nghệ l&agrave;m lạnh:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; DoorCooling+ l&agrave;m lạnh từ c&aacute;nh cửa tủL&agrave;m lạnh đa chiều</p>\r\n\r\n<p>C&ocirc;ng nghệ khử m&ugrave;i:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Khử m&ugrave;i Nano Carbon</p>\r\n\r\n<p>C&ocirc;ng nghệ bảo quản:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Ngăn rau củ Fresh Zone</p>\r\n\r\n<p>Tiện &iacute;ch:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Chẩn đo&aacute;n lỗi th&ocirc;ng minh Smart DiagnosisKhay đ&aacute; di độngNgăn<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;k&eacute;o linh hoạt</p>\r\n\r\n<p>K&iacute;ch thước - Khối lượng:&nbsp; &nbsp; Cao 167 cm - Rộng 55.5 cm - S&acirc;u 63 cm - Nặng 47 kg</p>\r\n\r\n<p>Nơi sản xuất:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Indonesia</p>\r\n\r\n<p>Năm ra mắt:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2019</p>\r\n\r\n<p>H&atilde;ng:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;LG</p>', '7790000', 'lg194.jpg', 0, NULL, NULL),
(18, 3, 1, 'Tủ lạnh LG Inverter 649 Lít GR-B257JDS', 30, NULL, '<p>Tủ lạnh LG Inverter 649 L&iacute;t GR-B257JDS&nbsp;l&agrave; mẫu tủ lạnh Side by side được trang bị động cơ Smart Inverter&nbsp;gi&uacute;p tiết kiệm điện năng. T&iacute;ch hợp khả năng l&agrave;m lạnh đa chiều gi&uacute;p hơi lạnh lan toả đều đến c&aacute;c ngăn.</p>', '<p>Kiểu tủ:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Tủ lớn - Side by side</p>\r\n\r\n<p>Dung t&iacute;ch sử dụng:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;649 l&iacute;t&nbsp;</p>\r\n\r\n<p>C&ocirc;ng nghệ tiết kiệm điện:&nbsp; &nbsp;Smart Inverter</p>\r\n\r\n<p>C&ocirc;ng nghệ l&agrave;m lạnh:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;L&agrave;m lạnh đa chiều</p>\r\n\r\n<p>K&iacute;ch thước - Khối lượng:&nbsp; &nbsp; Cao 178.3 cm - Rộng 91.3 cm - S&acirc;u 72.2 cm - Nặng 103 kg</p>\r\n\r\n<p>Nơi sản xuất:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Trung Quốc</p>\r\n\r\n<p>Năm ra mắt:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2022</p>\r\n\r\n<p>H&atilde;ng:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;LG</p>', '19990000', 'lg292.jpg', 0, NULL, NULL),
(19, 3, 2, 'Tủ lạnh Samsung Inverter 236 lít RT22M4032BY/SV', 30, NULL, '<p>Thịt c&aacute; tươi ngon, ăn trong ng&agrave;y kh&ocirc;ng cần r&atilde; đ&ocirc;ng với&nbsp;ngăn đ&ocirc;ng mềm -1 độ C Optimal Fresh Zone</p>\r\n\r\n<p>Ngăn đ&ocirc;ng mềm thực phẩm ở nhiệt độ -1&deg;C của tủ lạnh&nbsp;gi&uacute;p thịt c&aacute; lu&ocirc;n tươi ngon, trọn vẹn dinh dưỡng do ch&uacute;ng kh&ocirc;ng bị đ&ocirc;ng đ&aacute;, gi&uacute;p bạn c&oacute; thể chế biến thực phẩm nhanh ch&oacute;ng kh&ocirc;ng cần r&atilde; đ&ocirc;ng.</p>\r\n\r\n<p>Bạn n&ecirc;n sử dụng ngăn n&agrave;y đối với thực phẩm sẽ chế biến trong ng&agrave;y, nếu muốn trữ l&acirc;u hơn, bạn h&atilde;y d&ugrave;ng ngăn đ&ocirc;ng để bảo quản được tốt nhất.</p>', '<p>Kiểu tủ:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Ngăn đ&aacute; tr&ecirc;n</p>\r\n\r\n<p>Dung t&iacute;ch sử dụng:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 236 l&iacute;t</p>\r\n\r\n<p>C&ocirc;ng nghệ tiết kiệm điện:&nbsp; Digital Inverter</p>\r\n\r\n<p>C&ocirc;ng nghệ l&agrave;m lạnh:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; C&ocirc;ng nghệ l&agrave;m lạnh v&ograve;m</p>\r\n\r\n<p>C&ocirc;ng nghệ khử m&ugrave;i:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Bộ lọc than hoạt t&iacute;nh Deodorizer</p>\r\n\r\n<p>C&ocirc;ng nghệ bảo quản:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Ngăn rau củ lớn giữ ẩm Big BoxNgăn đ&ocirc;ng mềm -1 độ C Optimal<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;Fresh Zone</p>\r\n\r\n<p>K&iacute;ch thước - Khối lượng:&nbsp; &nbsp; Cao 154.5 cm - Rộng 55.5 cm - S&acirc;u 63.7 cm - Nặng 46.5 kg</p>\r\n\r\n<p>Nơi sản xuất:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Việt Nam</p>\r\n\r\n<p>Năm ra mắt:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2020</p>\r\n\r\n<p>H&atilde;ng:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Samsung</p>', '7490000', 'samsung356.jpg', 0, NULL, NULL),
(20, 3, 2, 'Tủ lạnh Samsung Inverter 488 lít RF48A4010M9/SV', 30, NULL, '<p>Sử dụng&nbsp;2 d&agrave;n lạnh độc lập Twin Cooling Plus&nbsp;gi&uacute;p lạnh đồng đều</p>\r\n\r\n<p>Tủ lạnh n&agrave;y sử dụng c&ocirc;ng nghệ hiện đại n&ecirc;n trong qu&aacute; tr&igrave;nh hoạt động mọi ng&oacute;c ng&aacute;ch của tủ được l&agrave;m lạnh nhanh ch&oacute;ng, n&ecirc;n thực phẩm được bảo quản tốt hơn.</p>', '<p>Kiểu tủ:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Multi Door</p>\r\n\r\n<p>Dung t&iacute;ch sử dụng:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;488 l&iacute;t&nbsp;</p>\r\n\r\n<p>C&ocirc;ng nghệ tiết kiệm điện: Digital Inverter</p>\r\n\r\n<p>C&ocirc;ng nghệ l&agrave;m lạnh:&nbsp; &nbsp; &nbsp; &nbsp; 2 d&agrave;n lạnh độc lập Twin Cooling Plus&trade;C&ocirc;ng nghệ l&agrave;m lạnh No<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Frost</p>\r\n\r\n<p>C&ocirc;ng nghệ khử m&ugrave;i:&nbsp; &nbsp; &nbsp; &nbsp; Bộ lọc than hoạt t&iacute;nh Deodorizer</p>\r\n\r\n<p>C&ocirc;ng nghệ bảo quản:&nbsp; &nbsp; &nbsp; Ngăn rau quả giữ ẩm</p>\r\n\r\n<p>Tiện &iacute;ch:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Bảng điều khiển b&ecirc;n ngo&agrave;iChế độ kỳ nghỉLấy nước b&ecirc;n ngo&agrave;i</p>\r\n\r\n<p>K&iacute;ch thước - Khối lượng: Cao 179.3 cm - Rộng 83.3 cm - S&acirc;u 74 cm - Nặng 99 kg</p>\r\n\r\n<p>Nơi sản xuất:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Trung Quốc</p>\r\n\r\n<p>Năm ra mắt:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2021</p>\r\n\r\n<p>H&atilde;ng:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Samsung</p>', '22480000', 'samsung496.jpg', 0, NULL, NULL),
(21, 1, 5, 'Loa Bluetooth Sony Extra Bass SRS-XB23', 30, NULL, '<p>Loa bluetooth&nbsp;thiết kế h&igrave;nh trụ tr&ograve;n tối giản, s&agrave;nh điệu, cầm gọn tay</p>\r\n\r\n<p>C&oacute; 3 gam m&agrave;u l&agrave; đen, xanh dương v&agrave; xanh r&ecirc;u c&aacute; t&iacute;nh cho bạn dễ lựa chọn theo nhu cầu, sở th&iacute;ch. Kết cấu chắc chắn, gọn đẹp, kh&ocirc;ng chiếm diện t&iacute;ch, tiện cho v&agrave;o balo, t&uacute;i x&aacute;ch.</p>', '<p>Nguồn:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Pin</p>\r\n\r\n<p>Thời gian sử dụng:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Khoảng 12 tiếngKhoảng 4 tiếng</p>\r\n\r\n<p>Kết nối kh&ocirc;ng d&acirc;y:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Bluetooth 5.0</p>\r\n\r\n<p>Tiện &iacute;ch:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Chống nước, chống bụi IP67</p>\r\n\r\n<p>Ph&iacute;m điều khiển:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Bật/tắt bluetooth, Chuyển b&agrave;i h&aacute;t, N&uacute;t BATT kiểm tra pin, N&uacute;t Party<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;ConnectN&uacute;t ST PAIR, Ph&aacute;t/dừng chơi nhạc, Tăng/giảm &acirc;m lượng</p>\r\n\r\n<p>Thương hiệu của:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Nhật Bản</p>\r\n\r\n<p>H&atilde;ng:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Sony</p>', '2430000', 'sony327.jpg', 0, NULL, NULL),
(22, 1, 5, 'Dàn âm thanh Sony HT-S20R', 30, NULL, '<p>Đường n&eacute;t tinh tế, m&agrave;u đen qu&yacute; ph&aacute;i</p>\r\n\r\n<p>D&agrave;n &acirc;m thanh Sony 5.1 HT-S20R 400W&nbsp;thiết kế hiện đại, c&aacute;c chi tiết được ho&agrave;n thiện tỉ mỉ, g&oacute;p phần t&ocirc; điểm cho kh&ocirc;ng gian nội thất th&ecirc;m phần sang trọng, đẳng cấp.</p>', '<p>Tổng c&ocirc;ng suất:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 400 W</p>\r\n\r\n<p>Số lượng k&ecirc;nh:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;5.1 k&ecirc;nh</p>\r\n\r\n<p>C&ocirc;ng nghệ &acirc;m thanh:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Adaptive SoundC&ocirc;ng nghệ Sound ModeC&ocirc;ng nghệ &acirc;m thanh<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;chuẩn Dolby Atmos/DTS:XDolby Digital</p>\r\n\r\n<p>Kết nối kh&ocirc;ng d&acirc;y:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Bluetooth 5.0</p>\r\n\r\n<p>Kết nối kh&aacute;c:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Cổng Analog inHDMINg&otilde; v&agrave;o &acirc;m thanh 3.5 mmOptical</p>\r\n\r\n<p>Thương hiệu của:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Nhật Bản</p>\r\n\r\n<p>H&atilde;ng:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Sony</p>', '6940000', 'sony491.jpg', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_shipping`
--

CREATE TABLE `tbl_shipping` (
  `shipping_id` int(10) UNSIGNED NOT NULL,
  `shipping_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_shipping`
--

INSERT INTO `tbl_shipping` (`shipping_id`, `shipping_name`, `shipping_address`, `shipping_phone`, `shipping_email`, `shipping_note`, `shipping_method`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Tỉnh', 'An Giang', '0818480336', 'nnqtinh1612@gmail.com', 'Hàng dễ vỡ', 2, NULL, NULL),
(2, 'Nguyễn Tỉnh', 'Châu Phú', '0818480336', 'nnqtinh1612@gmail.com', 'Giao nhanh dùm ạ', 1, NULL, NULL),
(3, 'Nguyễn Tỉnh', 'Châu Phú', '0818480336', 'nnqtinh1612@gmail.com', 'Giao nhanh dùm ạ', 1, NULL, NULL),
(4, 'Quốc Tỉnh', 'Châu Phú', '0818480336', 'quoctinh@gmail.com', 'Giao nhanh dùm', 1, NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Chỉ mục cho bảng `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `tbl_contact`
--
ALTER TABLE `tbl_contact`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Chỉ mục cho bảng `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Chỉ mục cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`,`shipping_id`),
  ADD KEY `tbl_order_ibfk_2` (`shipping_id`);

--
-- Chỉ mục cho bảng `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`,`brand_id`),
  ADD KEY `tbl_product_ibfk_1` (`brand_id`);

--
-- Chỉ mục cho bảng `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  ADD PRIMARY KEY (`shipping_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brand_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tbl_contact`
--
ALTER TABLE `tbl_contact`
  MODIFY `contact_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  MODIFY `order_detail_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  MODIFY `shipping_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `tbl_contact`
--
ALTER TABLE `tbl_contact`
  ADD CONSTRAINT `tbl_contact_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`shipping_id`) REFERENCES `tbl_shipping` (`shipping_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_order_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  ADD CONSTRAINT `tbl_order_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_order_detail_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `tbl_product_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `tbl_brand` (`brand_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_product_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `tbl_category_product` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
