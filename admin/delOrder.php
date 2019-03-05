<?php 
    header('Content-Type:text/html; charset=UTF-8');
    $conn = mysqli_connect('localhost', 'root' ,'' , 'makeorder');
    if (mysqli_connect_errno() !== 0) {
        die(mysqli_connect_error());
    }
    mysqli_query($conn,"set names utf8");
    $id=$_GET['id'];

    $sql="DELETE FROM order_detail WHERE order_id='".$id."'";
    mysqli_query($conn,$sql);
    if(mysqli_errno($conn)!==0){
        die(mysqli_error($conn));
    }
    $sql2="DELETE FROM orderlist WHERE order_id='".$id."'";
    mysqli_query($conn,$sql2);
    if(mysqli_errno($conn)!==0){
        die(mysqli_error($conn));
    }
    echo '删除该订单成功！';
?>