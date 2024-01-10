<?php
include_once 'lib/session.php';
Session::checkSession('client');
include_once 'classes/order.php';

$order = new order();

if (isset($_GET['id'])) {
    $result = $order->cancelOrder($_GET['id']);

    if (!$result) {
        echo '<script type="text/javascript">alert("Something went wrong!"); history.back();</script>';
        return;
    }

    echo '<script type="text/javascript">alert("Hủy đơn hàng thành công!"); history.back();</script>';
}
?>