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
    <script src="<?= BASE_URL ?>/public/js/mapPage.js"></script>
   

    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABQlT55ZLiU7jOIhZAAU6EFhp4v219z7s&callback=initMap">
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
    <a class="post_title" href="#">1. My Trip to Seoul 2K15</a>
    <p class="post_detail">This is my first time visiting Asia. Korea was amazing and exceptional. Good food, good people, good atmostphere. I absolutely loved everything about the country. I would like to share my experience.. Day 1, my friend(Korean American) and I landed in Incheon. Then, we took a bus to get into the city area. The trip took about an hour or so. Thankfully, there was no tr ...</p>

    <a class="post_title" href="#">2. Living in Seoul</a>
    <p class="post_detail">I have lived in Seoul for 5 years. A few of probably knows that I lived in Japan for 3 years as well. While I lived in Japan, I made a couple of trips to Korea and I enjoyed it very much. Of course, that is not the main reason why I moved to Seoul. But yes, I ended up here. Living in Seoul is very difficult than it seems.1. The language is different. Not that I don't want to learn Korean ... </p>

    <a class="post_title" href="#">3. My Favorite City</a>
    <p class="post_detail">I have lived in Seoul for 5 years. A few of probably knows that I lived in Japan for 3 years as well. While I lived in Japan, I made a couple of trips to Korea and I enjoyed it very much. Of course, that is not the main reason why I moved to Seoul. But yes, I ended up here. Living in Seoul is very difficult than it seems.1. The language is different. Not that I don't want to learn Korean ... </p>
    <a class="post_title" href="#">4. Street Food Tour in Seoul</a>
    <p class="post_detail">I have lived in Seoul for 5 years. A few of probably knows that I lived in Japan for 3 years as well. While I lived in Japan, I made a couple of trips to Korea and I enjoyed it very much. Of course, that is not the main reason why I moved to Seoul. But yes, I ended up here. Living in Seoul is very difficult than it seems.1. The language is different. Not that I don't want to learn Korean ... </p>

    <a class="post_title" href="#">5. The city never sleeps</a>
    <p class="post_detail">I have lived in Seoul for 5 years. A few of probably knows that I lived in Japan for 3 years as well. While I lived in Japan, I made a couple of trips to Korea and I enjoyed it very much. Of course, that is not the main reason why I moved to Seoul. But yes, I ended up here. Living in Seoul is very difficult than it seems.1. The language is different. Not that I don't want to learn Korean ... </p>



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