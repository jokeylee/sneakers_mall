<?php 
    header('Content-Type:text/html; charset=UTF-8');
    $conn = mysqli_connect('localhost', 'root' ,'' , 'makeorder');
    if (mysqli_connect_errno() !== 0) {
        die(mysqli_connect_error());
    }
    mysqli_query($conn,"set names utf8");

    $result=mysqli_query($conn,"select * from class_list");
    $class_rows = [];
    while($class_row = mysqli_fetch_assoc($result)){
    $class_rows[] = $class_row;
}

    $file = $_FILES['myFile'];
    $pro_image =  '../upload/pro_image/'.$file['name'];

    if (move_uploaded_file($file['tmp_name'], $pro_image)) {
    
        /*$imagesize = getimagesize($pro_image);
        $srcwdith = $imagesize[0];
        $srcheight = $imagesize[1];
    
        $newwidth = 150;
        $newheight = $srcheight * 150 / $srcwdith;
    
        $avatar_thumb = '../upload/pro_image/default.jpg';
    
        $srcimage = imagecreatefromjpeg($pro_image);
    
        $dstimage = imagecreatetruecolor($newwidth, $newheight);
        $image = imagecopyresized($dstimage, $srcimage, 0, 0, 0, 0, $newwidth, $newheight,  $srcwdith, $srcheight);
    
        imagejpeg($dstimage, $avatar_thumb);*/
        $arr_dict = array();
        foreach($class_rows as $key=>$class_row){
            $arr_dict[$class_row['id']] = $_POST[$class_row['id']];
        $sql="INSERT INTO product(id,name,price,description,icon,category_id,class_id) values(null,'".$_POST['pName']."','".$_POST['priceB']."','".$_POST['pdescrib']."','".$pro_image."','".$_POST[$class_row['id']]."','".$class_row['id']."')";
        mysqli_query($conn,$sql);
        if(mysqli_errno($conn)!==0){
            die(mysqli_error($conn));
            break;
        }

        }
        echo '发布商品成功！';
        //     echo $class_row;
        // $jsons = json_encode($arr_dict);
        // echo $jsons;
        // $sql="INSERT INTO product(id,name,price,description,icon,category_name) values(null,'".$_POST['pName']."','".$_POST['priceB']."','".$_POST['pdescrib']."','".$pro_image."','".$_POST['pCateId']."')";
        // mysqli_query($conn,$sql);
        // if(mysqli_errno($conn)!==0){
        //     die(mysqli_error($conn));
        // }
        // echo '发布商品成功！';
    }
?>