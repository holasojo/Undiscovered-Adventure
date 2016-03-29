<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Undiscovered Adventure</title>
    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/mapPage.css">
    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/header.css">
    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/footer.css">

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js">
    </script>
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABQlT55ZLiU7jOIhZAAU6EFhp4v219z7s&callback=initMap">
    </script>

    <script src="<?= BASE_URL ?>/public/js/mapPage.js"></script>
   



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
        <!-- when not logged in, user can input username and pw -->
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
<!-- examples -->
    <ul class ='posts'>
        <?php
        foreach($posts as $post) {
        $author_id = $post->get('author_id');
        $author = AppUser::loadById($author_id);
        $author_name = $author->get('user_name');
        $postID = $post->get('id'); 
        $postTitle = $post->get('title');
        $postContent = $post->get('content');
        $lat = $post->get('latitude');
        $lng = $post->get('longitude');
        $stringCut = $postContent;
        if(strlen($postContent)>200){
        $stringCut = substr($postContent, 0, 300);
    }


    echo '

    <li class ="post">
        <a class ="post_title" href="'.BASE_URL.'/posts/'.$postID.'">Title: '.$postTitle.'<br />  By: '.$author_name.'</a>
        <p><br class = "post_detail">'.$stringCut.'...<a href="'.BASE_URL.'/posts/'.$postID.'">Read More</a></p>
        

<!-- 
        <input type="hidden" id="lat" value= "<?php echo $lat ?>" />
        <input type="hidden" id="lng" value="<?php echo $lng ?>" /> -->
    </li>
    ';



}
?>
<script type="text/javascript">
var lat = "<?= $lat ?>";
var lng = "<?= $lng ?>";
</script>
<script type="text/javascript" src="<?= BASE_URL ?>/public/js/mapPage.js"></script>

</ul>




<!-- shows map -->



</div>
<div id="map">
</div>

<!-- footer -->

<ul class="footer">
 <li><a href="<?= BASE_URL ?>">Index</a></li>
  <li><a href="#">About</a></li>
  <li><a href="#">Q&amp;A</a></li>
  <li><a href="#">Contact</a></li>

</ul>


</body>

</html>