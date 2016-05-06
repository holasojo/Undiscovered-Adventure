<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Undiscovered Adventure</title>
  

  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABQlT55ZLiU7jOIhZAAU6EFhp4v219z7s&libraries=places"></script>
  <script type="text/javascript" src="https://www.google.com/jsapi"></script>
  <script src="<?= BASE_URL ?>/public/js/uploadLocation.js"></script>
  <script type="text/javascript" src="//d3js.org/d3.v3.min.js"></script>
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/visual.js"></script>
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/navbar.css">
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

   <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    $(document).ready(function(){
      drawCollapsibleTree("<?= BASE_URL ?>/visualization/json/");
    });
  </script>

  <style type="text/css">

    .node {
      cursor: pointer;
    }

    .node circle {
      fill: #fff;
      stroke: steelblue;
      stroke-width: 1.5px;
    }

    .node text {
      font: 10px sans-serif;
    }

    .link {
      fill: none;
      stroke: #ccc;
      stroke-width: 1.5px;

    }


  </style>
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
          
          <li class="active" ><a href="<?= BASE_URL ?>/visualization">Visualization<span class="sr-only">(current)</span></a></li>

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

<div class="contents">

 <h2>Visualization</h2>
 <div id="visual_and_forms">
 <span class="error">
  <?php
  if(isset($_SESSION['vizError'])) {
  if($_SESSION['vizError'] != '') {
  echo $_SESSION['vizError'];
  $_SESSION['vizError'] = '';
}
}
?>
</span>

  <!-- shows up when the title was clicked  -->
  <div id="forms">
  <form id="editPostTitleForm" method="POST" action="<?= BASE_URL ?>/visualization/editPostTitle" style="display: none;">
    <label>Blog Post Title: <input type="text" name="postTitle" value="" style="width: 300px;"></label>
    <input type="hidden" name="postID" value="">
    <input type="submit" name="submit" value="Edit" class="formButton">
  </form>
  <form id="deletePostForm" method="POST" action="<?= BASE_URL ?>/visualization/deletePost" style="display: none;">
    <input type="hidden" name="postID" value="">
    <input type="submit" name="submit" value="Delete" class="formButton">
  </form>
  </div>
  <div id="viz">

  </div>
</div>
<!-- only shows when in session. User can create a post. -->
<?php if (isset($_SESSION['username'])) {?>
<div id="visual_create">
  <form class = "submitPost"  id="createFrom" method="POST" action="<?= BASE_URL ?>/visualization/create">
    <!-- title -->
    Title:<br>
    <input type="text" name="title" id ="title_box"><br>
    <!-- location -->
    <label for="location">Location:</label><br/>
    <input id="location" type="text" size="30">
    <input type="hidden" id="cityLat" name="cityLat" />
    <input type="hidden" id="cityLng" name="cityLng" />  
    <br />
    <!-- content -->
    Content:<br />
    <textarea name="content" cols="40" rows="5" id="content_box"></textarea>
    <br />
    <!-- submit buttton when done -->
    <input type="submit" class="Buttons" name ="submitButton" value="Submit">
  </form>
</div>
<?php } ?>
<!-- Drawing a pie chart for number of likes -->
<div id="piechart"></div>
<!-- javascript for the chart -->
<!-- Getting info from posts -->
<?php 
$entry = "";
foreach($posts as $post) {
$title = $post->get('title');
$vote = $post->get('vote');
$entry .= "['". $title ."',". $vote ."],";}

?>
<!-- Creating a new chart with Google Chart -->
<script type="text/javascript">
  google.load("visualization", "1", {packages:["corechart"]});
  google.setOnLoadCallback(drawChart);
  
  function drawChart() {
   
    var data = google.visualization.arrayToDataTable([
      ['Title', 'Likes'],
      <?php echo $entry ?>
      ]);
    
    var options = {
      title: 'Liked Posts'
    };
    
    var chart = new google.visualization.PieChart(document.getElementById('piechart'));
    
    chart.draw(data, options);
  }
</script>



</div>




<!-- <ul class="footer">
 <li><a href="<?= BASE_URL ?>">Index</a></li>
 <li><a href="#">About</a></li>
 <li><a href="#">Q&amp;A</a></li>
 <li><a href="#">Contact</a></li>

</ul> -->

</div>

</body>

</html>