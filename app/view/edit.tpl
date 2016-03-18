<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Undiscovered Adventure</title>
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/posts.css">
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/header.css">
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/footer.css">
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js">
  </script>
  <script src="<?= BASE_URL ?>/public/js/index.js"></script>


</script>


<!--    <script src="/js/home.js"></script>-->
</head>

<body>

  <div class="header">
    <div class="header_content">
      <h1> Undiscovered Adventure </h1>
      <ul class="navbar">
        <li><a href="<?= BASE_URL ?>/browse">Browse</a></li>
        <li><a href="<?= BASE_URL ?>/posts">Posts</a></li>
        <li><a href="<?= BASE_URL ?>/mapPage">Map</a></li>
        <li><a href="<?= BASE_URL ?>/photos">Photos</a></li>
        <li>
          <form class="search">
            <input type="text" id="search_bar" placeholder="Seoul, Korea" required>
            <input type="button" id="search_button" value="Let's go!">
          </form>
        </li>
      </ul>


    </div>
  </div>

  <div class="contents">
    <!-- form for editing a post -->
    <form class = "editPost"  method="POST" action="<?= BASE_URL ?>/posts/<?= $postID ?>/submit" onsubmit="return confirm('Are you sure you want to submit?');">
      <!-- title -->
      Title:<br>
      <input type="text" name="edit_title" id ="title_box"  value="<?php echo $post->get('title'); ?>"><br>
      <!-- content -->
      Content:<br>
      <textarea name="edit_content" cols="40" rows="5" id="content_box"  ><?php echo $post->get('content'); ?></textarea>
      <!-- submit button -->
      <input type="submit" class="Buttons" name ="submitButton" value="Submit">
    </form>



  </div>


  <ul class="footer">
    <li><a href="<?= BASE_URL ?>">Index</a></li>
    <li><a href="#">About</a></li>
    <li><a href="#">Q&amp;A</a></li>
    <li><a href="#">Contact</a></li>

  </ul>


</body>

</html>