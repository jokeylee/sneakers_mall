<?php 
    header('Content-Type:text/html; charset=UTF-8');
    $conn = mysqli_connect('localhost', 'root' ,'' , 'makeorder');
    if (mysqli_connect_errno() !== 0) {
        die(mysqli_connect_error());
    }
    mysqli_query($conn,"set names utf8");

    $result=mysqli_query($conn,"select * from class_list order by class_weight desc");
    $class_rows = [];
    while($class_row = mysqli_fetch_assoc($result)){
    $class_rows[] = $class_row;
}

    $file = $_FILES['myFile'];
    $pro_image =  '../upload/pro_image/'.$file['name'];
    // print_r($_POST);
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
        $sql="INSERT INTO product(name,price,description,icon) values('".$_POST['pName']."','".$_POST['priceB']."','".$_POST['pdescrib']."','".$pro_image."');";
        if (mysqli_query($conn, $sql)) {
          $last_id = mysqli_insert_id($conn);
        } else {
           die(mysqli_error($conn));
       }
       foreach($class_rows as $key=>$class_row){
        $sql2 = "INSERT INTO product_tag(product_id, class_name, tag_name) values('".$last_id."','".$class_row['class_name']."','".$_POST[$class_row['class_name']]."')";
        mysqli_query($conn,$sql2);
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