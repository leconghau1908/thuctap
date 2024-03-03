<?php

include '../lib/session.php';
include '../classes/product.php';
Session::checkSession('admin');


if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    
    if (isset($_POST['id'])) {
       
        $product_id = $_POST['id'];
        
        
        $product = new product();
        
        $result = $product->delete($product_id);
        
        // Check if deletion was successful
        if ($result) {
       
            header("Location: admin/productlist.php");
            exit(); // Stop further execution
        } else {
         
            echo '<script type="text/javascript">alert("Failed to delete the product!");</script>';
        }
    } else {
        
        echo '<script type="text/javascript">alert("Product ID not found!");</script>';
    }
} else {
    
    header("Location: productlist.php");
    exit(); 
}
?>
