<?php
$connect = mysql_connect("localhost","root","root");

//SQLをUTF8形式で書くよ、という意味
mysql_query("SET NAMES utf8",$connect);


if(!empty($_POST['name'])){
	$name = $_POST['name'];
}else{
	$name = "名無しさん";
}

if(!empty($_POST['content'])){
	$content = $_POST['content'];
}else{
	echo"本文を入力して下さい";
	exit();
}


mysql_db_query("prokate", "insert comments(commenter,body,created)
  values('$name','$content',sysdate())");

$result = mysql_db_query("prokate","select * from comments");

$arr = array();

while(true){
    $row = mysql_fetch_assoc($result);
    if($row == null){
        break;
    }else{
    	$param = array('name' => $row['commenter'],
    		'content' => $row['body'],
    		'time' => $row['created']);
        array_push($arr,$param);
    }
}

$rs =  array(
	"comments" => $arr
	);

 header('Content-type: application/json');  
 $josn = json_encode($rs);

 echo $josn;

?>