<?php 
    header('Content-Type:text/html; charset=UTF-8');
    $conn = mysqli_connect('localhost', 'root' ,'' , 'makeorder');
    if (mysqli_connect_errno() !== 0) {
        die(mysqli_connect_error());
    }
    mysqli_query($conn,"set names utf8");   

    $query2="select * from product where class_id='".$_POST["class_id"]."' and category_id='".$_POST["cate_id"]."'";
    $arry2=mysqli_query($conn,$query2);
    $searches=[];
    while ($search=mysqli_fetch_assoc($arry2)) {
        $searches[]=$search;
    }

    $json = json_encode((object)$searches,JSON_FORCE_OBJECT);
    print_r($json);
?>