<?php
require_once '../global.php';

$username = $_GET['logged_user'];
$followname = $_GET['followThisUser'];

$user = AppUser::loadByUsername($username);
$follow = AppUser::loadByUsername($followname);

$row = new FollowingUser();
$row->set('user_id', $user->getId());
$row->set('following_id', $follow->getID());
$row->save();

	
$message = "hi";
echo "<script type='text/javascript'>alert('$message');</script>";
echo "hola";
?>