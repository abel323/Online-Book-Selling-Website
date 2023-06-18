<!DOCTYPE html>
<html lang="en">
    <?php include('partial/head.php'); ?>
<body>
    <?php include('partial/header.php'); ?>
    <main>
        <div class="details_view">
            <?php 
                include('partial/connection.inc.php');
                if(isset($_GET['id'])){
                    $isbn = $_GET['id'];
                    $sql = "SELECT * FROM books WHERE ISBN='$isbn';";
                    $result = mysqli_query($conn,$sql) or die(mysqli_error($conn));
                    $final = mysqli_fetch_assoc($result);
                    extract($final);
                }
            ?>
            <div class="img_view_detail">
                <image src="<?php echo $Book_Cover; ?>" alt="<?php echo $Title; ?>" height="400" width="300"/>
            </div>
            <div class="details">
                <h3><b>Title: </b><?php echo $Title; ?></h3>
                <p><b>ISBN: </b><?php echo $isbn; ?></p>
                <p><b>Autor: </b><?php echo $Author; ?></p>
                <p><b>Price: </b>$<?php echo $Price; ?></p>
                <div class="action">
                    <button class="btn btn-primary" onclick="location.href='handler/cart handler.php?cart_id=<?php echo $ISBN?>&cart_name=<?php echo $Title;?>&cart_price=<?php echo $Price; ?>'">Add To Cart</button>
                </div>
            </div>
        </div>
    </main>
    <?php include('partial/footer.php'); ?>
</body>
</html>