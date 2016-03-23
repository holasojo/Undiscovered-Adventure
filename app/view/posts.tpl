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
            <!--<a name="pageName" >-->
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


    <!-- getting posts from the database and display as list view using a loop -->
    <ul class ='posts'>
        <?php
        foreach($posts as $post) {
        $author_id = $post->get('author_id');
        $author = AppUser::loadById($author_id);
        $author_name = $author->get('user_name');
        $postID = $post->get('id'); 
        $postTitle = $post->get('title');
        $postContent = $post->get('content');
        $stringCut = $postContent;
        if(strlen($postContent)>200){
        $stringCut = substr($postContent, 0, 300);
    }


    echo '

    <li class ="post">
        <a class ="title" href="'.BASE_URL.'/posts/'.$postID.'">Title: '.$postTitle.'<br />  By: '.$author_name.'</a>
        <p> <br class = "content">'.$stringCut.'...<a href="'.BASE_URL.'/posts/'.$postID.'">Read More</a></p>
    </li>
    ';



}
?>
</ul>


</div>


<ul class="footer">
  <li><a href="<?= BASE_URL ?>">Index</a></li>
  <li><a href="#">About</a></li>
  <li><a href="#">Q&amp;A</a></li>
  <li><a href="#">Contact</a></li>

</ul>


</body>

</html>