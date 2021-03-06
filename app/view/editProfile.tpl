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


</head>

<body>
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

  <!-- for editing profile. Form. -->
  <div class="container center_div">
    <h2>Profile Edit</h2>
    <ul id="profile_info">
      <!-- getting all the data of user. Each will be displayed in form as value -->
      <?php
      $email = $user->get('email');
      $pw = $user->get('pw');
      $lname = $user->get('lastname');
      $fname = $user->get('firstname');
      $gen = $user->get('gender');
      ?>  

      <form class = "editPost"  method="POST" action="<?= BASE_URL ?>/users/<?= $username ?>/updateProfile" onsubmit="return confirm('Are you sure you want to submit?');">
       <?php echo '


     </br>
     <!-- display user name. cannot be changed. -->
     <h3>Username: '.$username.'</h3></br>


     <!-- password -->
     <fieldset class="form-group">
      <label for="pw_box">Password</label>

      <input type="password" class="form-control" name="pw_box" id="edit_pw" value="'.$pw.'" required>

    </fieldset>
    <!-- email -->

    <fieldset class="form-group">
      <label for="email_box">Email</label>

      <input type="text" class="form-control" name="email_box" id="edit_email" value="'.$email.'" required>



    </fieldset>

    <!-- firstname -->
    <fieldset class="form-group">
      <label for="fname_box">First name</label>

      <input type="text" class="form-control" name="fname_box" id="edit_fname" value="'.$fname.'" required>



    </fieldset>

    <!-- last name -->
    <fieldset class="form-group">
      <label for="lname_box">Last name</label>

      <input type="text" class="form-control" name="lname_box" id="edit_lname" value="'.$lname.'" required>



    </fieldset>

    <!-- gender -->
    <p>Please select your gender. </p>
    <label class="radio-inline"><input type="radio" name="gender" value="male" checked>Male</label>
    <label class="radio-inline"><input type="radio" name="gender" value ="female">Female</label>
    <label class="radio-inline"><input type="radio" name="gender" value="other">Other</label></br></br></br>


    <!-- submit button -->

    <button type="submit" class="btn btn-primary" name="submitButton">Update</button>
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