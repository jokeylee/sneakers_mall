<?php 
    header('Content-Type:text/html; charset=UTF-8');
    $conn = mysqli_connect('localhost', 'root' ,'' , 'makeorder');
    if (mysqli_connect_errno() !== 0) {
        die(mysqli_connect_error());
    }
    mysqli_query($conn,"set names utf8");
    $sql="select count(*) from class_list where class_name='".$_POST['class_name']."'";
    mysqli_query($conn,$sql);
    if(mysqli_errno($conn)!==0){
        echo '类目名已存在！';
        exit();
    }
    $sql="INSERT INTO class_list(class_name, class_weight) values('".$_POST['class_name']."','".$_POST['weight']."')";
    mysqli_query($conn,$sql);
    if(mysqli_errno($conn)!==0){
        die(mysqli_error($conn));
    }else {echo '添加类目成功！';}
?>