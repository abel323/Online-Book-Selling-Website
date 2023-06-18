<?php
    session_start();
    include('partial/connection.inc.php');
    if(isset($_SESSION['cart']) && isset($_SESSION['user_name']) && isset($_SESSION['password'])){
        /*Fetch customer id using login session user name variable */
        $sql = "SELECT CustomerID FROM Customers WHERE EMail='".$_SESSION['user_name']."'";
        $result = mysqli_query($conn,$sql) or die(mysqli_error($conn));
        $final = mysqli_fetch_assoc($result);
        extract($final);
        $customer_id = $CustomerID;
        foreach($_SESSION['cart'] as $key=>$value){
            $isbn = $value['item_id'];
            
        }
    }
?>