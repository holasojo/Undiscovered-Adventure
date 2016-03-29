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
    <script src="<?= BASE_URL ?>/app/view/ajax.js"></script>


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
            <a name="pageName" >
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

    <!-- shows up the title from database -->

    <h2 class = "title"><?php 
        $author_id = $post->get('author_id');
        $author = AppUser::loadById($author_id);
        $author_name = $author->get('user_name');
        echo "Title: ".$post->get('title')."<br />By: ".$author_name; ?></h2>
    <!--vote -->
    <h3><?php 
    echo $post->get('vote')." people liked this  ";
    ?> <a href="" onclick="ajaxLike(<?php echo $post->get('id') ?>)" class="likeButton">Like</a>
    </h3>
    <!-- shows up content from database -->
    <p class="content"> <?php echo $post->get('content'); ?></p>

    <!-- edit and delete button only can be seen when logged in -->
    <?php if(isset($_SESSION['username']) && $_SESSION['user_id'] == $post->get('author_id')) { ?>
    <form name="editForm" id="editform" method="POST" action="<?= BASE_URL ?>/posts/<?= $postID ?>/edit">
    <!-- submit after done editing -->
       <input type="submit" class="Buttons" name ="editButton" value="Edit">
   </form>
   <!-- when trying to delete -->
   <form name="deleteForm" id="deleteform" method="POST" action="<?= BASE_URL ?>/posts/<?= $postID ?>/delete" onsubmit="return confirm('Are you sure you want to delete?');">

       <input type="submit" class="Buttons" name ="deleteButton" value="Delete">

   </form>
   <?php
}
?>


</div>


<ul class="footer">
   <li><a href="<?= BASE_URL ?>">Index</a></li>
  <li><a href="#">About</a></li>
  <li><a href="#">Q&amp;A</a></li>
  <li><a href="#">Contact</a></li>

</ul>


</body>

</html>