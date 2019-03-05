<?php 
    header('Content-Type:text/html; charset=UTF-8');
    $conn = mysqli_connect('localhost', 'root' ,'' , 'makeorder');
    if (mysqli_connect_errno() !== 0) {
        die(mysqli_connect_error());
    }
    mysqli_query($conn,"set names utf8");   

    $query="select * from product where id in (select product_id from product_tag where class_name='".$_POST["class_name"]."' and tag_name='".$_POST["tag_name"]."')";
    $arry=mysqli_query($conn,$query);
    $searches=[];
    while ($search=mysqli_fetch_assoc($arry)) {
        $searches[]=$search;
    }

    $json = json_encode((object)$searches,JSON_FORCE_OBJECT);
    print_r($json);
?>