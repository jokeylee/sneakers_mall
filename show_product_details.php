<?php 
    header('Content-Type:text/html; charset=UTF-8');
    $conn = mysqli_connect('localhost', 'root' ,'' , 'makeorder');
    if (mysqli_connect_errno() !== 0) {
        die(mysqli_connect_error());
    }
    mysqli_query($conn,"set names utf8");   
    $searches=[];
    $query="select * from product where id='".$_POST["pro_id"]."'";
    $product=mysqli_fetch_assoc(mysqli_query($conn,$query));
    $searches[]=$product;

    $query2="select * from product_tag where product_id='".$_POST["pro_id"]."'";
    $arry=mysqli_query($conn,$query2);
    $tags=[];
    while ($tag=mysqli_fetch_assoc($arry)) {
        $tags[]=$tag;
    }
    $searches[]=$tags;

    $json = json_encode((object)$searches,JSON_FORCE_OBJECT);
    print_r($json);
?>