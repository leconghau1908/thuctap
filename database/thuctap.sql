-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 30, 2022 lúc 07:10 AM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `instrumentstore`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`) VALUES
(2, 'Bánh Kẹo', 1),
(4, 'Thức Uống', 1),
(5, 'Thực Phẩm Ăn Liền', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `receivedDate` date DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `userId`, `createdDate`, `receivedDate`, `status`) VALUES
(41, 34, '2022-11-26', '2022-11-26', 'Complete'),
(42, 1, '2022-11-28', NULL, 'Processing');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `orderId`, `productId`, `qty`, `productPrice`, `productName`, `productImage`) VALUES
(41, 41, 4, 1, '28000', 'ĐÙI GÀ NƯỚNG VỊ TERIYAKI', '5cd639f281.png'),
(42, 41, 3, 1, '0', 'CƠM NẮM CÁ HỒI MAYONE', 'cdad8264fe.png'),
(43, 42, 9, 1, '9000', 'Nước tăng lực Sting hương dâu tây đỏ chai 330ml - Chai', '0188b6ede2.jpg'),
(44, 42, 7, 1, '15000', 'BÁNH MÌ ỐP LA', '11c74500a8.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `originalPrice` decimal(10,0) NOT NULL,
  `promotionPrice` decimal(10,0) NOT NULL,
  `image` varchar(50) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `cateId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `des` varchar(1000) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `soldCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `originalPrice`, `promotionPrice`, `image`, `createdBy`, `createdDate`, `cateId`, `qty`, `des`, `status`, `soldCount`) VALUES
(2, 'XÚC XÍCH (CAY/ PHÔ MAI/ HEO/ XÔNG KHÓI)', '20000', '20000', 'e8df9fda61.png', 1, '0000-00-00', 5, 30, 'Xúc Xích tại Circle K sử dụng nguồn nguyên liệu từ các nhà cung cấp uy tín trong nước và ngoài nước. Xúc Xích với lõi béo mềm bên trong, được bao bọc bên ngoài bởi một lớp bì giòn dai, chắc chắn sẽ là sự lựa chọn hoàn hảo để xoa dịu cơn đói của bạn.\r\n(Có bán tại hầu hết các cửa hàng Circle K)', 1, 4),
(3, 'CƠM NẮM CÁ HỒI MAYONE', '15000', '15000', 'cdad8264fe.png', 1, '0000-00-00', 5, 14, 'Onigiri - món cơm nắm hình tam giác hoặc bầu dục đặc trưng của Nhật Bản hiện đã có tại Circle K. Cơm Nắm Cá Hồi Mayonaise được khoác áo ngoài bằng một lớp rong biển, với nhân bên trong được làm từ cá hồi, bổ sung thêm các loại sốt đặc biệt chắn chắn sẽ là sự lựa chọn thơm ngon và giàu dinh dưỡng cho bạn.\r\n\r\n(Chỉ phục vụ tại một số cửa hàng)', 1, 2),
(4, 'ĐÙI GÀ NƯỚNG VỊ TERIYAKI', '30000', '28000', '5cd639f281.png', 1, '0000-00-00', 5, 19, 'Đùi gà nướng vị Teriyaki mang một hương vị rất đặc biệt, với nước sốt đậm đà và hấp dẫn. Món ăn được chế biến sẵn và đóng gói trong bao bì hút chân không đảm bảo vệ sinh an toàn thực phẩm, thuận tiện cho việc sử dụng ngay tại cửa hàng.', 1, 2),
(5, 'DIMSUM', '15000', '15000', '2f572bbef9.png', 1, '0000-00-00', 2, 20, 'Dimsum 1 món ăn hấp dẫn luôn có mặt tại Circle K.\r\nVỏ bánh mỏng, mịn bao trọn phần nhân thịt đầy đặn bên trong. Đảm bảo giữ trọn hương vị tươi mới và ngon lành của món ăn.\r\n\r\n(Có bán tại hầu hết các cửa hàng Circle K)', 1, 2),
(6, 'MÌ TRỘN XÚC XÍCH TRỨNG CHIÊN', '20000', '20000', '7859c4eead.png', 1, '0000-00-00', 2, 50, 'Mì Trộn thoạt nhìn có vẻ đơn giản nhưng lại mang một hương vị đặc trưng riêng. Một tô Mì Trộn hấp dẫn với giá cả rất phải chăng, thêm một chút giá, một chút hẹ, có thể dùng thêm sa tế cay cũng làm ấm lòng bạn vào bất kì giờ nào trong ngày. Sẽ tuyệt hơn nếu bạn kết hợp dùng Mì Trộn với một phần trứng chiên và xúc xích nướng để làm tăng hương vị món ăn.\r\n\r\n(Có bán tại hầu hết các cửa hàng Circle K)', 1, 4),
(7, 'BÁNH MÌ ỐP LA', '15000', '15000', '11c74500a8.png', 1, '2021-12-07', 5, 19, 'Bánh mì ốp la là món ăn quen thuộc với hầu hết người Việt Nam bởi nó không chỉ ngon mà còn cung cấp đủ năng lượng để khởi đầu ngày mới. Sự chế biến hoàn hảo của quả trứng với mặt dưới giòn nhẹ, phần lòng trắng và lòng đỏ hơi chín vừa kết hợp với dưa leo, cà chua, một chút muối tiêu, nước tương, tương ớt cùng với bánh mỳ Việt Nam giòn tan chắc chắn mang đến cho bạn sự ngon miệng.\r\n\r\n(Có bán tại hầu hết các cửa hàng Circle K)', 1, 3),
(8, 'BÁNH BAO TRỨNG CÚT', '10000', '10000', 'f18352cd35.png', 1, '2021-12-07', 5, 50, 'Bánh Bao Trứng Cút có nhân được làm từ thịt heo, củ hành, trứng cút, và nấm. Sản phẩm luôn được giữ nóng trong tủ hâm riêng cho Bánh Bao, luôn được đảm bảo là bánh mới, chất lượng và an toàn để phục vụ bạn bất cứ lúc nào trong ngày.\r\n(Chỉ phục vụ tại một số cửa hàng)', 1, 3),
(9, 'Nước tăng lực Sting hương dâu tây đỏ chai 330ml - Chai', '9000', '9000', '0188b6ede2.jpg', 1, '2021-12-07', 4, 59, 'Nước tăng lực Sting hương dâu tây đỏ chai 330ml là loại nước tăng lực có gas hương dâu rất được ưa chuộng trên thị trường. Nước tăng lực Sting giúp cơ thể bù đắp nước, bổ sung năng lượng, vitamin C và E, giúp xua tan cơn khát và cảm giác mệt mỏi. Thức uống là giải pháp rất tốt sau những giờ học tập và làm việc căng thẳng. Bạn nên sử dụng nước uống Sting để giải tỏa stress, khơi dậy lại những năng lượng tích cực.', 1, 5),
(10, 'Nước đào Vfresh Vinamilkhộp 1 lít', '24000', '22500', '8b4044da66.jpg', 1, '2021-12-07', 4, 50, 'Nước đào Vfresh Vinamilk hộp 1L của thương hiệu Vinamilk được sản xuất trên quy trình công nghệ hiện đại, mang đến chất lượng tốt chất cho người tiêu dùng. Sản phẩm chứa đến 42% nước đào ép, giữ nguyên được hương vị tự nhiên, thơm ngon vốn có trong quả đào.', 1, 0),
(11, 'Nước cam có tép Teppy Minute Maid chai 1 lít', '24000', '22500', 'de8d5b3d2f.jpg', 1, '2021-12-07', 4, 35, 'Nước cam có tép Teppy Minute Maid được làm từ những thành phần tự nhiên, không chứa các hóa chất tạo mùi độc hại, đảm bảo mang lại chất lượng sản phẩm tốt cho người tiêu dùng. Ngoài ra, với công nghệ sản xuất hiện đại, sản phẩm đạt tiêu chuẩn vệ sinh an toàn thực phẩm, không gây ảnh hưởng đến sức khỏe của bạn. ', 1, 0),
(12, 'Bánh que nhân socola Toppo gói 132g', '20000', '20000', 'c1e5f6e381.jpg', 1, '2021-12-07', 2, 40, 'Bánh que nhân sô cô la Toppo là lựa chọn hoàn hảo để thưởng thức ẩm thực Thái Lan. Hương vị ngọt ngào, giòn tan này luôn là thứ quà khiến con trẻ thích mê, “mồi ngon” đi picnic.', 1, 0),
(13, 'Bánh cracker dinh dưỡng AFC vị lúa mì hộp 200g', '25000', '25000', '6c44c3e6da.jpg', 1, '2021-12-07', 2, 50, 'Bánh cracker dinh dưỡng AFC vị lúa mì giòn, xốp, hương thơm dịu nhẹ trong vị đậm đà của bánh sẽ đánh thức vị giác của bạn ngay từ lần đầu thưởng thức.\r\n\r\n', 1, 0),
(14, 'Bánh Chocopie Orion vị cacao 360g', '34000', '34000', '462aefcb2b.png', 1, '2021-12-07', 2, 30, 'Bánh Chocopie Orion vị cacao hộp 360g có hương vị thơm ngon đậm đà cacao đặc biệt. Là một trong những món ăn hấp dẫn đã và luôn là sự lựa chọn tuyệt vời cho bữa ăn phụ cũng như ăn sáng giúp bổ sung năng lượng cho ngày dài năng động.', 1, 0),
(15, 'Mực tẩm gia vị Thái Bento gói 24g', '13000', '11500', 'a3abdb9b53.jpg', 1, '2021-12-07', 2, 100, 'Mực tẩm gia vị Thái Bento được chế biến theo công nghệ sấy tiên tiến, giữ nguyên hương vị thơm ngon của mực khi thành phẩm. Vị cay Thái và mùi thơm hấp dẫn của mực tẩm sẽ kích thích vị giác người dùng. Sản phẩm được chế biến từ những con mực tươi ngon, đảm bảo chất lượng và cung cấp năng lượng cho cơ thể sau thời gian làm việc dài.', 1, 0),
(16, 'Bánh trứng Tipo Hữu Nghị gói 220g', '42800', '40000', '83fc9c5f4c.jpg', 1, '2021-12-07', 2, 60, 'Bánh trứng Tipo là một sản phẩm của Công ty Cổ phẩn Thực phẩm Hữu Nghị - thương hiệu được nhiều người tiêu dùng lựa chọn. Bánh có thành phần chính gồm trứng, đường, bột mì, sữa bột, chất nhũ hóa… không chứa chất bảo quản gây hại cho sức khỏe. Quy trình công nghệ hiện đại, mang đến cho người dùng những sản phẩm thơm ngon, chất lượng tốt nhất.', 1, 0),
(17, 'Kẹo dẻo Cola Chupa Chups gói 90g', '22600', '20000', '0d62eff712.jpg', 1, '2021-12-07', 2, 50, 'Kẹo dẻo Cola Chupa Chups với hình dáng chai Cola ngộ nghĩnh kết hợp cùng hương vị Cola hấp dẫn chắc chắn sẽ mang đến cảm giác sảng khoái và thú vị khi thưởng thức. Kẹo còn có độ mềm, dai, là món ăn vặt không chỉ cho các em nhỏ mà còn thích hợp cho cả người lớn trong những bữa tiệc nhẹ hay giờ nghỉ giải lao.', 1, 0),
(18, 'Bánh quy bơ Leibniz gói 100g', '38000', '30000', '07c1e0bf65.jpg', 1, '2021-12-07', 2, 60, 'Bánh quy bơ Leibniz gói 100g là sản phẩm của Bahlsen, công ty thực phẩm của Đức. Nguồn gốc của Bahlsen bắt nguồn từ tinh thần kinh doanh của người sáng lập Hermann Bahlsen, người đã thành lập doanh nghiệp của mình vào năm 1889 tại Hannover, Đức, nơi con cháu của ông tiếp tục công việc cho tới ngày nay.', 1, 0),
(19, 'dui ga', '10000', '10000', '2609c93288.png', 1, '2022-11-28', 5, 20, 'ddddd', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Normal');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `address` varchar(500) NOT NULL,
  `isConfirmed` tinyint(4) NOT NULL DEFAULT 0,
  `captcha` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `fullname`, `dob`, `password`, `role_id`, `status`, `address`, `isConfirmed`, `captcha`) VALUES
(1, 'admin@gmail.com', 'Nguyễn Việt Trung', '2021-11-01', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, '', 1, ''),
(31, 'lapankhuongnguyen@gmail.com', 'khuong nguyen', '2021-12-06', 'c4ca4238a0b923820dcc509a6f75849b', 2, 1, 'CanTho', 1, '56661'),
(32, 'meocon02002@gmail.com', 'Nguyễn Việt Trung', '2002-08-31', 'e13dd027be0f2152ce387ac0ea83d863', 2, 1, 'Hà Nội', 0, '24042'),
(33, 'leducanh0887@gmail.com', 'leducanh', '2000-08-30', '8f562a872c4a1ee488c27a3c40215e57', 2, 1, 'Hà Nam', 0, '31857'),
(34, 'nguyenviettrung3108@gmail.com', 'trungtrangtreo', '2000-08-30', 'e10adc3949ba59abbe56e057f20f883e', 2, 1, 'Hà Nam', 0, '21814');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`),
  ADD KEY `product_id` (`productId`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`orderId`),
  ADD KEY `product_id` (`productId`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate_id` (`cateId`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cateId`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
