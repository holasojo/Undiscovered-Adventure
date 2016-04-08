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
    <p>Logged in as <a href="'.BASE_URL.'/users/'.$logged_name.'">
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
  <!-- getting posts from the database and display as list view using a loop -->
    <ul id="profile_info">
        <?php
        $email = $user->get('email');
    ?>    
    <form class = "editPost"  method="POST" action="<?= BASE_URL ?>/users/<?= $username ?>/updateProfile" onsubmit="return confirm('Are you sure you want to submit?');">
    <?php echo '
    <li>
        Username: <input type="text" name="edit_username" id ="username_box"  value="'.$username.'">
    </li>
    <li>
        Email: <input type="text" name="edit_email" id ="email_box"  value="'.$email.'">
    </li>
    <input type="submit" class="Buttons" name ="updateButton" value="Update">
    </form>
    ';?>
    <span class="error">
    <?php
      if(isset($_SESSION['updateError'])) {
        if($_SESSION['updateError'] != '') {
          echo $_SESSION['updateError'];
        $_SESSION['updateError'] = '';
        }
      }
    ?>
  </span>
</ul>
</div>

<ul class="footer">
 <li><a href="<?= BASE_URL ?>">Index</a></li>
 <li><a href="#">About</a></li>
 <li><a href="#">Q&amp;A</a></li>
 <li><a href="#">Contact</a></li>

</ul>



</body>

</html>