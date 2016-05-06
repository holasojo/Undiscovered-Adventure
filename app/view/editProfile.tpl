<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Undiscovered Adventure</title>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js">
  </script>


  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/navbar.css">
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 

  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/upload.css">

  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js">
  </script>
  <script src="<?= BASE_URL ?>/public/js/follow.js"></script>






  <!--    <script src="/js/home.js"></script>-->
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
        <a class="navbar-brand" href="<?= BASE_URL ?>/posts">Undiscovered Adventure</a>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
          <li><a href="<?= BASE_URL ?>/feeds">Activity Feeds</a></li>
          <li><a href="<?= BASE_URL ?>/posts">Posts </a></li>
          <li><a href="<?= BASE_URL ?>/mapPage">Map</a></li>

          <li><a href="<?= BASE_URL ?>/visualization">Visualization</a></li>

        </ul>
        <form class="navbar-form navbar-left" role="search">
          <div class="form-group">
            <input type="text" class="form-control" placeholder="Search">
          </div>
          <button type="submit" class="btn btn-default">Submit</button>
        </form>

        <div id="login">
          <?php include(dirname(__DIR__).'/view/sidebar.php'); ?>
        </div>



      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </nav>
  <div class="container center_div">
    <h2>Profile Edit</h2>
    <ul id="profile_info">
      <?php
      $email = $user->get('email');
      $pw = $user->get('pw');
      ?>  

      <form class = "editPost"  method="POST" action="<?= BASE_URL ?>/users/<?= $username ?>/updateProfile" onsubmit="return confirm('Are you sure you want to submit?');">
       <?php echo '

  
       </br>
       <h3>Username: '.$username.'</h3></br>



       <fieldset class="form-group">
        <label for="pw_box">Password</label>

        <input type="password" class="form-control" name="pw_box" id="edit_pw" value="'.$pw.'" >

      </fieldset>


      <fieldset class="form-group">
        <label for="email_box">Email</label>

        <input type="text" class="form-control" name="email_box" id="edit_email" value="'.$email.'">



      </fieldset>




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
  
<!-- 
<ul class="footer">
 <li><a href="<?= BASE_URL ?>">Index</a></li>
 <li><a href="#">About</a></li>
 <li><a href="#">Q&amp;A</a></li>
 <li><a href="#">Contact</a></li>

</ul> -->



</body>

</html>