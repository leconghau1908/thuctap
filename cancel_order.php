<?php
include_once 'lib/session.php';
Session::checkSession('client');
include_once 'classes/order.php';

if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['orderId'])) {
    $orderId = $_GET['orderId'];

    // Gọi hàm cancelOrderById trực tiếp từ order.php
    $cancelResult = cancelOrderById($orderId); // Hàm này xử lý việc hủy đơn hàng

    if ($cancelResult === true) {
        // Hủy đơn hàng thành công
        // Chuyển hướng người dùng về trang đơn hàng hoặc trang khác phù hợp
        header('Location: order.php');
        exit();
    } else {
        // Xử lý khi hủy đơn hàng thất bại, có thể hiển thị thông báo lỗi
        echo "Không thể hủy đơn hàng.";
    }
} else {
    // Chuyển hướng đến trang phù hợp nếu truy cập không hợp lệ
    header('Location: index.php');
    exit();
}
?>
