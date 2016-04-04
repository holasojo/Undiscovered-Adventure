<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Undiscovered Adventure</title>
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/browse.css">
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/header.css">
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/footer.css">
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/profile.css">
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js">
  </script>
  <script src="<?= BASE_URL ?>/public/js/follow.js"></script>






  <!--    <script src="/js/home.js"></script>-->
</head>

<body>

  <div class="header">
    <div class="header_content">
      <h1> Undiscovered Adventure </h1>
      <ul class="navbar">
        <li><a href="<?= BASE_URL ?>/browse">Browse</a></li>
        <li><a href="<?= BASE_URL ?>/posts">Posts</a></li>
        <li><a href="<?= BASE_URL ?>/mapPage">Map</a></li>
        <li><a href="#">Photos</a></li>
        <li>
          <form class="search">
            <input type="text" id="search_bar" placeholder="Seoul, Korea" required>
            <input type="button" id="search_button" value="Let's go!">
          </form>
        </li>
      </ul>
      <!-- login form -->
      <div id="login">
        <span id="error">
          <?php
          if(isset($_SESSION['error'])) {
          if($_SESSION['error'] != '') {
          echo $_SESSION['error'];
          $_SESSION['error'] = '';
        }
      }
      ?>
    </span>

    <?php
    if( !isset($_SESSION['username']) || $_SESSION['username'] == '') {
    ?>
    <!-- when not logged in -->
    <form class ="loginForm" method="POST" action="<?= BASE_URL ?>/login">
      <a name="pageName" >
        <label>Username: <input type="text" name="uname"></label>
        <label>Password: <input type="password" name="pw"></label>
        <input type="submit" name="submit" value="Log in">
      </form>
      <?php
    } else {
    $logged_name = $_SESSION['username'];
    echo '
    <p>Logged in as <a href="'.BASE_URL.'/profile/'.$logged_name.'">
      <strong>'. $logged_name .'</strong></a><br>
      <a href="'.BASE_URL.'/upload">Upload?</a> 
      <a href="'.BASE_URL.'/logout">Log out?</a></p>


      ';
    }
    ?>
  </div>

</div>
</div>

<div class="contents">
 <!-- if the user in session is in different person's profile, they can see the follow button
 else, if the user in his/hers own profile page, cannot see the follow button but can see edit button -->
 <div class = "follow_view">
   <?php

   if ($logged_name != $username){
   ?>
   <form id="follow" method="post">
   <input type="button" id="followButton" 
   onclick="followUser('<?php echo $logged_name ?>', '<?php echo $username ?>')" 
   value="Follow">
  </form>
  </div>
  <?php
}else{}
?>



<!-- the user follows other users -->
<div class ="followers">
  <ul class = "follower_list">
   <?php
   $follow_num = sizeof($followers);
   echo '<p> '. $follow_num .' followers</p>';
   if($follow_num != 0){
   foreach($followers as $follower) {
   $follow_id = $follower->get('user_id');
   $user = AppUser::loadByID($follow_id);
   $user_name = $user->get('user_name');

   echo '

   <li class ="follower_username">
    <a href="'.BASE_URL.'/profile/'.$user_name.'">
      <strong>'. $user_name .'</strong></a><br>
    </li>
    ';
  }
}


?>
</ul>

</div>
<!-- other users following the user -->
<div class= "follwing">

  <ul class = "following_list">
   <?php
   $num = sizeof($followings);
   echo '<p> '. $num .' following</p>';
   if($num != 0){
   foreach($followings as $following) {
   $follow_id = $following->get('following_id');
   $user = AppUser::loadByID($follow_id);
   $user_name = $user->get('user_name');

   echo '

   <li class ="following_username">
    <a href="'.BASE_URL.'/profile/'.$user_name.'">
      <strong>'. $user_name .'</strong></a><br>
    </li>
    ';
  }


}
?>
</ul>

</div>

</div>


</div>
<ul class="footer">
 <li><a href="<?= BASE_URL ?>">Index</a></li>
 <li><a href="#">About</a></li>
 <li><a href="#">Q&amp;A</a></li>
 <li><a href="#">Contact</a></li>

</ul>



</body>

</html>