<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Undiscovered Adventure</title>

 <!-- css -->
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/footer.css">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/navbar.css">

  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/upload.css">
  <!-- script -->
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js">
  </script>

  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js">
  </script>
  <script src="<?= BASE_URL ?>/public/js/follow.js"></script>


  
  <script type="text/javascript">

    $(document).ready(function(){
      $('.unfollow').click(function(){
    // follow the current user

    // get the ID of the user to be followed
    var userID = $(this).data('user-id');

    // send Ajax request to follow
    $.post(
      '<?= BASE_URL ?>/users/unfollow',
      { "userID": userID } )
    .done(function(data){
      if(data.success == 'success') {
          // successfully followed the user
          // now hide the Follow button for that user
          $('.unfollow').each(function(){
            // if this is a Follow button for a followed user ID...
            if($(this).data('user-id') == userID)
              $(this).text('Follow').addClass('followUser').removeClass('unfollow'); // remove the Follow button
          });
        } else if(data.error != '') {
          alert(data.error); // show error message as modal dialog box
        } })
    .fail(function(){
      alert("Ajax error: could not reach server.");
    });
    location.reload();
  });

  // event handler for clicking "Follow" button by username
  $('.followUser').click(function(){
    // follow the current user

    // get the ID of the user to be followed
    var userID = $(this).data('user-id');

    // send Ajax request to follow
    $.post(
      '<?= BASE_URL ?>/users/follow',
      { "userID": userID } )
    .done(function(data){
      if(data.success == 'success') {
          // successfully followed the user
          // now hide the Follow button for that user
          $('.followUser').each(function(){
            // if this is a Follow button for a followed user ID...
            if($(this).data('user-id') == userID)
              $(this).text('Unfollow').addClass('unfollow').removeClass('followUser'); // remove the Follow button
          });
        } else if(data.error != '') {
          alert(data.error); // show error message as modal dialog box
        } })
    .fail(function(){
      alert("Ajax error: could not reach server.");
    });
    location.reload();
  });

});

</script>

</head>

<body>

<!-- navbar -->
  <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="<?= BASE_URL ?>/">Undiscovered Adventure</a>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
          <li><a href="<?= BASE_URL ?>/feeds">Activity Feeds</a></li>
          <li><a href="<?= BASE_URL ?>/posts">Posts </a></li>
          <li><a href="<?= BASE_URL ?>/mapPage">Map</a></li>

          <li><a href="<?= BASE_URL ?>/visualization">Visualization</a></li>

        </ul>

        <div id="login">
          <?php include(dirname(__DIR__).'/view/sidebar.php'); ?>
        </div>



      </div>
    </div>
  </nav>

  <!-- actual profile page -->
  <div id="container center_div">
    <div class ="row">
    <!-- feeds related to the user on profile. left half of screen-->
      <div id="feed">
        <div class="col-lg-6">
          <h3>Activity Feed</h3>
          <?php

          if(count($events) > 0) {
          echo '<ul>';

          foreach($events as $e) {
          echo '<li>'.formatEvent($e).'</li>';
        }

        echo '</ul>';
      }

      ?>
    </div>
  </div>

<!-- the right half of page -->
<!-- follow. Follows and unfollow if already followed. -->
  <div class="col-lg-6">
    <?php

    // first and foremost, is user logged in?
    if(isset($_SESSION['username'])) {
    // don't allow users to follow themselves
    if($user->get('user_name') != $_SESSION['username']) {
    // is user already followed?
    $currentUser = AppUser::loadByUsername($_SESSION['username']);
    if(!$currentUser->isFollowing($user->get('id'))) {
    echo ' <button class="followUser" data-user-id="'.$user->get('id').'">Follow</button>';
  } else {
  echo ' <button class="unfollow" data-user-id="'.$user->get('id').'">Unfollow</button>';
}
}
}

?>
<!-- getting posts from the database and display as list view using a loop -->
<ul id="profile_info">
  <?php
  $email = $user->get('email');
  $admin = "no";
  if ($user->get('usergroup') == 5) {
  $admin = "yes";
}
$my_page = FALSE;
if (isset($_SESSION['username'])) {
if ($_SESSION['username'] == $user->get('user_name')) {
$my_page = TRUE;
}
} 


echo '


<h4>
  Username: '.$user->get('user_name').'
</h4>
<h4>
  Email: '.$email.'
</h4>
<h4>
  First name: '.$user->get('firstname').'
</h4>
<h4>
  Last name: '.$user->get('lastname').'
</h4>
<h4>
  Gender: '.$user->get('gender').'
</h4>

<h4>
  Admin: '.$admin.'
</h4>
';?>
<?php
if ($my_page) { ?>

<!-- go to editProfile if clicked -->
<form name="editForm" id="editform" method="POST" action="<?= BASE_URL ?>/users/<?= $username ?>/editProfile">
  <!-- submit after done editing -->
  <input type="submit" class="Buttons" name ="editButton" value="Edit">
</form>
<?php } ?>
</ul>
</div>

</div>
</div>

<!-- footer -->
<footer>
  <div class="navbar navbar-default navbar-fixed-bottom">
    <div class="container">
      <div class="col-lg-4"></div>
      <div class="col-lg-4">
        <div class="navbar-collapse collapse" id="footer-body">
          <ul class="nav navbar-nav">
            <li><a href="<?= BASE_URL ?>">Index</a></li>
            <li>  <a href="<?= BASE_URL ?>/about">About</a></li>
            <li>  <a href="<?= BASE_URL ?>/contact">Contact</a></li>
          </ul>
        </div>
      </div>
      <div class="col-lg-4"></div>
    </div>
  </div>
</footer>

</body>

</html>