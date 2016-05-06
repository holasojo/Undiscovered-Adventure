<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<title>Undiscovered Adventure</title>
	<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/navbar.css">
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

				<div id="login">
					<?php include(dirname(__DIR__).'/view/sidebar.php'); ?>
				</div>



			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</nav>


</div>


    <div class="container">

    	<!-- getting posts from the database and display as list view using a loop -->
    	<div class="row">
    		<div class ="col-lg-12">
         <div id="feedcontent">
          <h3>Activity Feed</h3>
          <div id="feeds">
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

  </div>
</div>
</div>




   <!-- <nav class="navbar navbar-default navbar-fixed-bottom">
<ul class="nav footer">
        <li><a href="<?= BASE_URL ?>">Index</a></li>
  <li><a href="#">About</a></li>
  <li><a href="#">Q&amp;A</a></li>
  <li><a href="#">Contact</a></li>
        
      </ul>
    </nav> -->

  <!-- <div class="navbar navbar-default navbar-fixed-bottom" role="navigation" id="footer">
  
  <div class="container" >
  	<div class="navbar-text pull-right">
  		<div id="footers">
  			<a href="<?= BASE_URL ?>">Index</a>
  			<a href="#">About</a>
  			<a href="#">Q&amp;A</a>
  			<a href="#">Contact</a>
  		</div>
  	</div>
  </div>
</div> -->

</body>

</html>
