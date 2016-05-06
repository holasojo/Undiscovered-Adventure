<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Undiscovered Adventure</title>
  <!-- css -->
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/footer.css">
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/navbar.css">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/upload.css">
  <!-- javascript -->
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js">
  </script>

  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABQlT55ZLiU7jOIhZAAU6EFhp4v219z7s&libraries=places">
  </script>

  <script src="<?= BASE_URL ?>/public/js/uploadLocation.js">
  </script>

  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>


  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 



</script>

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
          <li><a href="<?= BASE_URL ?>/feeds">Activity Feeds<span class="sr-only">(current)</span></a></li>
          <li><a href="<?= BASE_URL ?>/posts">Posts </a></li>
          <li><a href="<?= BASE_URL ?>/mapPage">Map</a></li>

          <li><a href="<?= BASE_URL ?>/visualization">Visualization</a></li>

        </ul>

        <div id="login">
          <?php include(dirname(__DIR__).'/view/sidebar.php'); ?>
        </div>



      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </nav>

  <!-- form for editing the post -->
  <div class="container center_div">
    <h2>Share your experience!</h2>

    <form class = "submitPost"  method="POST" action="<?= BASE_URL ?>/posts/<?= $postID ?>/submit" onsubmit="return confirm('Are you sure you want to submit?');">
      <!-- title -->
      <fieldset class="form-group">
        <label for="title_box">Title</label>
        <input type="text" class="form-control" name= "edit_title" id="title_box" value="<?php echo $post->get('title'); ?>">

      </fieldset>
      <!-- location -->
      <fieldset class="form-group">
        <label for="location">Location</label>
        <input type="text" class="form-control" id="location" placeholder="Where did you go?">
        <!-- hidden input type that is used for getting latitude and longitude -->
        <input type="hidden" id="city2" name="city2" />
        <input type="hidden" id="cityLat" name="cityLat" />
        <input type="hidden" id="cityLng" name="cityLng" />  
      </fieldset>

      <!-- content of post -->

      <fieldset class="form-group">
        <label for="content-box">Tell us more!</label>
        <textarea class="form-control" name="edit_content" id="content_box" rows="5"><?php echo $post->get('content'); ?></textarea>
      </fieldset>
<!-- submit button -->

      <button type="submit" class="btn btn-primary" name="submitButton">Submit</button>
    </form>



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