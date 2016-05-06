<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Undiscovered Adventure</title>


  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
  <script src="<?= BASE_URL ?>/public/js/index.js"></script>
  <script src="<?= BASE_URL ?>/public/js/ajax.js"></script>

  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/navbar.css">
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 

  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/upload.css">



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



    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div class="container center_div">

  <!-- shows up the title from database -->

  <h2 class = "title"><?php 
    $author_id = $post->get('author_id');
    $author = AppUser::loadById($author_id);
    $author_name = $author->get('user_name');
    echo "Title: ".$post->get('title')."<br />By: ".$author_name; ?></h2>
    <!--vote -->
    <h3><?php 
      echo $post->get('vote')." people liked this  ";
      ?> 
      <!-- like button can only be seen by user logged in -->
      <?php if(isset($_SESSION['username'])) {
      if (!PostLikers::hasLiked($post->get('id'), $_SESSION['user_id'])) { 
      //PostLikers::like($post->get('id'), $_SESSION['user_id']);?>
      <a href="" onclick="ajaxLike(<?php echo $post->get('id') ?>)" class="likeButton">Like</a>  <?php
    } elseif (PostLikers::hasLiked($post->get('id'), $_SESSION['user_id'])) {
    //PostLikers::unlike($post->get('id'), $_SESSION['user_id']);?>
    <a href="" onclick="ajaxUnlike(<?php echo $post->get('id') ?>)" class="likeButton">Unlike</a> <?php
  }
}
else{
echo  "<br>";
echo "Like this post? Log in to like this post!";
}
?>


</h3>
<!-- shows up content from database -->
<p class="content"> <?php echo $post->get('content'); ?></p>
<!-- edit and delete button only can be seen when logged in and it's your post or you are an admin-->
<?php if(isset($_SESSION['username']) && ($_SESSION['user_id'] == $post->get('author_id') || ($_SESSION['usergroup']) == 5)) { ?>


  <div class="form-group">

<form name="editForm" id="editform" method="POST" action="<?= BASE_URL ?>/posts/<?= $post->get('id') ?>/edit">
    <!-- submit after done editing -->
    <input type="submit"  class="btn btn-primary" name="editButton" value="Edit">
</form>


  </div>
  <!-- when trying to delete -->
  <div class="form-group">

    <form name="deleteForm" id="deleteform" method="POST" action="<?= BASE_URL ?>/posts/<?= $postID ?>/delete" onsubmit="return confirm('Are you sure you want to delete?');">

   <input type="submit"  class="btn btn-primary" name="deleteButton" value="Delete">

</form>
</div>

   </form>
 </div>
<?php
}
?>


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