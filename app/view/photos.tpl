<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Undiscovered Adventure</title>
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/browse.css">
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/header.css">
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/footer.css">
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABQlT55ZLiU7jOIhZAAU6EFhp4v219z7s&libraries=places"></script>
  <script type="text/javascript" src="https://www.google.com/jsapi"></script>
  <script src="<?= BASE_URL ?>/public/js/uploadLocation.js"></script>
  <script type="text/javascript" src="//d3js.org/d3.v3.min.js"></script>
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/visual.js"></script>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    $(document).ready(function(){
      drawCollapsibleTree("<?= BASE_URL ?>/photos/json/");
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
  <div class="wrapper">
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
        <a name="pageName" ></a>
        <label>Username: <input type="text" name="uname"></label>
        <label>Password: <input type="password" name="pw"></label>
        <input type="submit" name="submit" value="Log in">
      </form>

      <?php
    } else {
    ?>
    <!-- when logged in -->
    <p>Logged in as <strong><?= $_SESSION['username'] ?></strong>. <a href="<?= BASE_URL ?>/logout">Log out?</a></p>
    <br> <a href="<?= BASE_URL ?>/upload">Upload?</a> 

    <?php
  }
  ?>
</div>

</div>
</div>

<div class="contents">

 <h2>Visualization</h2>
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
<div id="visual_and_forms">
  <!-- shows up when the title was clicked  -->
  <form id="editPostTitleForm" method="POST" action="<?= BASE_URL ?>/photos/editPostTitle" style="display: none;">

    <label>Blog Post Title: <input type="text" name="postTitle" value="" style="width: 300px;"></label>
    <input type="hidden" name="postID" value="">
    <input type="submit" name="submit" value="Edit">
  </form>
  <form id="deletePostForm" method="POST" action="<?= BASE_URL ?>/photos/deletePost" style="display: none;">
    <input type="hidden" name="postID" value="">
    <input type="submit" name="submit" value="Delete">
  </form>
  <div id="viz">

  </div>
</div>
<!-- only shows when in session. User can create a post. -->
<?php if (isset($_SESSION['username'])) {?>
<div id="visual_create">
  <form class = "submitPost"  id="createFrom" method="POST" action="<?= BASE_URL ?>/vizCreate">
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




<ul class="footer">
 <li><a href="<?= BASE_URL ?>">Index</a></li>
 <li><a href="#">About</a></li>
 <li><a href="#">Q&amp;A</a></li>
 <li><a href="#">Contact</a></li>

</ul>

</div>

</body>

</html>