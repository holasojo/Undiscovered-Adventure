<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Undiscovered Adventure</title>

  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js">
  </script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABQlT55ZLiU7jOIhZAAU6EFhp4v219z7s&libraries=places">
  </script>

  <script src="<?= BASE_URL ?>/public/js/uploadLocation.js">
  </script>
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/navbar.css">
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 

  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/upload.css">


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
      <a class="navbar-brand" href="#">Undiscovered Adventure</a>
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
  <h2>Share your experience!</h2>
 <form class = "submitPost"  method="POST" action="<?= BASE_URL ?>/create" onsubmit="return confirm('Are you sure you want to submit?');">
    <fieldset class="form-group">
      <label for="title_box">Title</label>
      <input type="text" class="form-control" name= "title" id="title_box" placeholder="What's your title for the post?">
    
    </fieldset>
    <fieldset class="form-group">
      <label for="location">Location</label>
      <input type="text" class="form-control" id="location" placeholder="Where did you go?">
      <input type="hidden" id="city2" name="city2" />
    <input type="hidden" id="cityLat" name="cityLat" />
    <input type="hidden" id="cityLng" name="cityLng" />  
    </fieldset>


    <fieldset class="form-group">
      <label for="content-box">Tell us more!</label>
      <textarea class="form-control" name="content" id="content_box" rows="5"></textarea>
    </fieldset>


    <button type="submit" class="btn btn-primary" name="submitButton">Submit</button>
  </form>



</div>



</body>

</html>