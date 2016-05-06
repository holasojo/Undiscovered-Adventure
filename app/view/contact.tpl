<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Undiscovered Adventure</title>
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/navbar.css">
      <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/footer.css">
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

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
          <li class="active" ><a href="<?= BASE_URL ?>/feeds">Activity Feeds<span class="sr-only">(current)</span></a></li>
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


</div>


    <div id="about" class="container">
    <h1>Contact</h1>
    <p>Questions or comments?
    Contact us at: undiscovered@adventure.com </p>
    </div>



  

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
