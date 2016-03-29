<?php
require_once '../global.php';
if($_POST['action'] == 'like') {
  $db = Db::instance(); 
      $id = $_POST['idOption'];
	

           $sql = "UPDATE posts SET vote = vote + 1 WHERE id = '{$id}'";
           $db->execute($sql);

       
}