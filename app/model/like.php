<?php
require_once '../global.php';
if($_POST['action'] == 'like') {
    $db = Db::instance(); 
    $id = $_POST['idOption'];
	PostLikers::like($id, $_SESSION['user_id']);
    $sql = "UPDATE posts SET vote = vote + 1 WHERE id = '{$id}'";
    $db->execute($sql);
}
if($_POST['action'] == 'unlike') {
    $db = Db::instance(); 
    $id = $_POST['idOption'];
	PostLikers::unlike($id, $_SESSION['user_id']);
    $sql = "UPDATE posts SET vote = vote - 1 WHERE id = '{$id}'";
    $db->execute($sql);
}
