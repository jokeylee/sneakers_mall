<?php 
    header('Content-Type:text/html; charset=UTF-8');
    $conn = mysqli_connect('localhost', 'root' ,'' , 'makeorder');
    if (mysqli_connect_errno() !== 0) {
        die(mysqli_connect_error());
    }
    mysqli_query($conn,"set names utf8");
    $id=$_GET['id'];

    $result=mysqli_query($conn,"select * from class_list");
    $rows = [];
    while($row = mysqli_fetch_assoc($result)){
        $rows[] = $row;
    }

    $lists=mysqli_query($conn,"select * from product where id='".$id."'");
    $search=mysqli_fetch_assoc($lists);
    $result=mysqli_query($conn,"select * from class_list order by class_weight desc");
    $class_rows = [];
    while($row = mysqli_fetch_assoc($result)){
    $class_rows[] = $row;
}
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>-.-</title>
<link rel=stylesheet href="style/bootstrap-admin.css"> 
<link rel=stylesheet href="style/product.css">
</head>
<body>
<span class="main-title">商品列表 &gt; 编辑商品</span>
<div class="form-add">
<form action="handle_editPro.php?id=<?=$id?>" method="post" enctype="multipart/form-data">
<table class="table  table-bordered table-hover">

    <tr>
        <td align="right" width="15%"><span class="td-txt">商品编号</span></td>
        <td><input class="gray" type="text" disabled="true" readonly name="pSn" value="<?=$id?>"/></td>
    </tr>
	<tr>
		<td align="right"><span class="td-txt">商品名称</span></td>
		<td><input type="text" name="name"  value="<?php echo $search['name'];?>"/></td>
	</tr>
    <?php foreach($class_rows as $key=>$obj_row):

    $result=mysqli_query($conn,"select * from category where class_name = '".$obj_row['class_name']."'");
    $tag_rows = [];
    while($row = mysqli_fetch_assoc($result)){
    $tag_rows[] = $row;}?>
	<tr>
		<td align="right"><span class="td-txt"><?php echo $obj_row["class_name"];?>分类</span></td>
		<td>
		<select name="<?php echo $obj_row["class_name"];?>">
		<?php foreach($tag_rows as $key=>$row):
            $pro_tag=mysqli_query($conn,"select tag_name from product_tag where product_id='".$search['id']."' and class_name='".$obj_row['id']."'");
            $obj=mysqli_fetch_assoc($pro_tag);?>
            <option value="<?php echo $row['tag_name'];?>" <?php echo $row['tag_name']==$obj['tag_name']?"selected='selected'":null;?>><?php echo $row['tag_name'];?></option>
            <?php endforeach;?>
		</select>
		</td>
	</tr> 
    <?php endforeach;?>
	<tr>
		<td align="right"><span class="td-txt">商品价格</span></td>
		<td><input type="text" name="price"  value="<?php echo $search['price'];?>"/></td>
	</tr> 
    <tr>
        <td align="right"><span class="td-txt">商品描述</span></td>
        <td><input type="text" name="description"  value="<?php echo $search['description'];?>"/></td>
    </tr>
	<tr>
        <td align="right"><span class="td-txt">商品图像</span></td>
        <td> 
            <img style="margin:12px;width: 5rem;height: 5rem;" src="<?=$search['icon'];?>"/>
            <input class="btn btn-file" type="file" name="myFile"/>
        </td>
    </tr> 
</table>
<input class="btn btn-primary" type="submit"  value="编辑完成"/>
</form>
</div>
</body>
</html>