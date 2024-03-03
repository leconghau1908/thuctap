<?php
include_once 'lib/session.php';
include_once 'classes/product.php';


$searchResults = array(); // Initialize empty array for search results

// Check if search query parameter is present
if(isset($_GET['search'])) {
    $search = $_GET['search'];
    
    $product = new product();
    $searchResults = $product->searchProductsByName($search);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kết quả tìm kiếm</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://use.fontawesome.com/2145adbb48.js"></script>
    <script src="https://kit.fontawesome.com/a42aeb5b72.js" crossorigin="anonymous"></script>
</head>
<body>
    <nav>
        <label class="logo">CircleK</label>
        <ul>
            <li><a href="index.php" class="active">Trang chủ</a></li>
            <li><a href="productList.php">Sản phẩm</a></li>
            <?php if (isset($_SESSION['user']) && $_SESSION['user']) { ?>
                <li><a href="logout.php" id="signin">Đăng xuất</a></li>
            <?php } else { ?>
                <li><a href="register.php" id="signup">Đăng ký</a></li>
                <li><a href="login.php" id="signin">Đăng nhập</a></li>
            <?php } ?>
            <li><a href="order.php" id="order">Đơn hàng</a></li>
            <li>
                <a href="checkout.php">
                    <i class="fa fa-shopping-bag"></i>
                    <span class="sumItem">
                        <!-- Here you can add PHP code to display the total quantity -->
                    </span>
                </a>
            </li>
            <div class="search" style="display:inline-block;">
                <form action="search.php" method="GET">
                    <input type="text" name="search" id="search" placeholder="Nhập tên sản phẩm..." style="width:150px;height:30px;">
                    <button class="search-btn" type="submit" name="submit" style="height: 30px;border:none;width:70px;">Tìm kiếm</button>
                </form>
            </div>
        </ul>
    </nav>
    <section class="banner"></section>
    <div class="featuredProducts">
        <h1>Sản phẩm nổi bật</h1>
        <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </div>
    <script type="text/javascript" src="js/modal.js"></script>
</html>
    <div class="main">
    <div class="silder">
    <div class="sildes">
        <input type="radio" name="radio_btn" id="radio1">
        <input type="radio" name="radio_btn" id="radio2">
        <input type="radio" name="radio_btn" id="radio3">
        <input type="radio" name="radio_btn" id="radio4">
        <div class="silde first">
<img src="images/1.jpg" alt="">
        </div>
        <div class="silde">
            <img src="images/2.jpg" alt="">
        </div>
        <div class="silde">
            <img src="images/3.jpg" alt="">
        </div>
        <div class="silde">
            <img src="images/4.jpg" alt="">
        </div>
        <div class="silde">
            <img src="#" alt="">
        </div>
        <div class="silde">
            <img src="#" alt="">
        </div>
        <div class="silde">
            <img src="#" alt="">
        </div>
        <div class="silde">
            <img src="#" alt="">
        </div>


        <div class="navigation-auto">
            <div class="auto-btn1"></div>
            <div class="auto-btn2"></div>
            <div class="auto-btn3"></div>
            <div class="auto-btn4"></div>

        </div>
    </div>
    <div class="navigation-manual">
        <!-- <label for="radio1" class="manual-btn"></label>
        <label for="radio2" class="manual-btn"></label>
        <label for="radio3" class="manual-btn"></label>
        <label for="radio4" class="manual-btn"></label> -->
    </div>
</div>
    <div class="featuredProducts" style="background-color:blanchedalmond;">
        <?php if(isset($searchResults) && !empty($searchResults)) { ?>
            <h1 style="color:black;">Kết quả tìm kiếm cho "<?php echo htmlspecialchars($search); ?>"</h1>
            <div class="container">
                <?php foreach ($searchResults as $key => $value) { ?>
                    <div class="card">
                        <div class="imgBx">
                            <a href="detail.php?id=<?= $value['id'] ?>"><img src="admin/uploads/<?= $value['image'] ?>" alt=""></a>
                        </div>
                        <div class="content">
                    <div class="productName">
                        <a href="detail.php?id=<?= $value['id'] ?>">
                            <h3><?= $value['name'] ?></h3>
                        </a>
                    </div>
                    <div>
                        Đã bán: <?= $value['soldCount'] ?>
                    </div>
                            <div class="original-price">
                                <?php if ($value['promotionPrice'] < $value['originalPrice']) { ?>
                                    Giá gốc: <del><?= number_format($value['originalPrice'], 0, '', ',') ?>VND</del>
                                <?php } else { ?>
                                    <p>.</p>
                                <?php } ?>
                            </div>
                            <div class="price">
                                Giá bán: <?= number_format($value['promotionPrice'], 0, '', ',') ?>VND
                            </div>
                            <div class="action">
                                <a class="add-cart" href="add_cart.php?id=<?= $value['id'] ?>">Thêm vào giỏ</a>
                                <a class="detail" href="detail.php?id=<?= $value['id'] ?>">Xem chi tiết</a>
                            </div>
                        </div>
                    </div>
                <?php } ?>
            </div>
        <?php } else if(isset($_GET['search'])) { ?>
            <p>Không tìm thấy sản phẩm nào phù hợp.</p>
        <?php } ?>
    </div>
    <footer>
        <div class="social">
            <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
            <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
            <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
        </div>
        <ul class="list">
            <li><a href="./">Trang Chủ</a></li>
            <li><a href="productList.php">Sản Phẩm</a></li>
        </ul>
        <p class="copyright">Circle K @ 2022</p>
    </footer>
</body>
</html>
