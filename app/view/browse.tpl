<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Undiscovered Adventure</title>
    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/browse.css">


    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/header.css">
    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/footer.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js">
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
    <!-- login Form -->
    <div id="login">
        <?php include(dirname(__DIR__).'/view/sidebar.php'); ?>
    </div>


<!-- contents made with table -->
<div class="contents">


   <div class="contents">
    <table>
        <thead>

            <tr>
                <td>
                    <div class="post" id="first">
                        <div class="pic"></div>
                        <div class="text">
                            <div class="title"><a href="#">
                                Market Offerings in Melbourne</a>
                            </div>
                            <div class="info">
                                <div class="fav">fav: 15</div>
                                <div class="view">view: 400</div>
                            </div>
                            <div class="para">
                                One of the best thing about is the market area. I love walking into a market and explore.
                            </div>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="post" id="second">
                        <div class="pic"></div>
                        <div class="text">
                            <div class="title"><a href="#">
                                The city where I live</a>
                            </div>
                            <div class="info">
                                <div class="fav">fav: 15</div>
                                <div class="view">view: 400</div>
                            </div>
                            <div class="para">
                                Living in a city area is nice, but there are definitely pros and cons.
                            </div>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="post" id="third">
                        <div class="pic"></div>
                        <div class="text">
                            <div class="title"><a href="#">
                                Beautiful Architecture Tour</a>
                            </div>
                            <div class="info">
                                <div class="fav">fav: 15</div>
                                <div class="view">view: 400</div>
                            </div>
                            <div class="para">
                                As an architecture student, it's important for me to see and experience buildings. 
                            </div>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="post" id="fourth">
                        <div class="pic"></div>
                        <div class="text">
                            <div class="title"><a href="#">
                                Places I have been </a>
                            </div>
                            <div class="info">
                                <div class="fav">fav: 15</div>
                                <div class="view">view: 400</div>
                            </div>
                            <div class="para">
                                One of the best thing about is the market area. I love walking into a market and explore.
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="post" id="first2">
                        <div class="pic"></div>
                        <div class="text">
                            <div class="title"><a href="#">
                                Market Offerings in Melbourne</a>
                            </div>
                            <div class="info">
                                <div class="fav">fav: 15</div>
                                <div class="view">view: 400</div>
                            </div>

                            <div class="para">
                                One of the best thing about is the market area. I love walking into a market and explore.
                            </div>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="post" id="second2">
                        <div class="pic"></div>
                        <div class="text">
                            <div class="title"><a href="#">
                                The city where I live</a>
                            </div>
                            <div class="info">
                                <div class="fav">fav: 15</div>
                                <div class="view">view: 400</div>
                            </div>
                            <div class="para">
                                Living in a city area is nice, but there are definitely pros and cons.
                            </div>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="post" id="third2">
                        <div class="pic"></div>
                        <div class="text">
                            <div class="title"><a href="#">
                                Beautiful Architecture Tour</a>
                            </div>
                            <div class="info">
                                <div class="fav">fav: 15</div>
                                <div class="view">view: 400</div>
                            </div>
                            <div class="para">
                                As an architecture student, it's important for me to see and experience buildings.
                            </div>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="post" id="fourth2">
                        <div class="pic"></div>
                        <div class="text">
                            <div class="title"><a href="#">
                                Places I have been </a>
                            </div>
                            <div class="info">
                                <div class="fav">fav: 15</div>
                                <div class="view">view: 400</div>
                            </div>
                            <div class="para">
                                One of the best thing about is the market area. I love walking into a market and explore what the region has to offer.
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="post" id="first3">
                        <div class="pic"></div>
                        <div class="text">
                            <div class="title"><a href="#">
                                Market Offerings in Melbourne</a>
                            </div>
                            <div class="info">
                                <div class="fav">fav: 15</div>
                                <div class="view">view: 400</div>
                            </div>
                            <div class="para">
                                One of the best thing about is the market area. I love walking into a market and explore.
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="post" id="second3">
                            <div class="pic"></div>
                            <div class="text">
                                <div class="title"><a href="#">
                                    The city where I live</a>
                                </div>
                                <div class="info">
                                    <div class="fav">fav: 15</div>
                                    <div class="view">view: 400</div>
                                </div>
                                <div class="para">
                                    Living in a city area is nice, but there are definitely pros and cons.
                                </div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="post" id="third3">
                            <div class="pic"></div>
                            <div class="text">
                                <div class="title"><a href="#">
                                    Beautiful Architecture Tour</a>
                                </div>
                                <div class="info">
                                    <div class="fav">fav: 15</div>
                                    <div class="view">view: 400</div>
                                </div>
                                <div class="para">
                                    As an architecture student, it's important for me to see and experience buildings.
                                </div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="post" id="fourth3">
                            <div class="pic"></div>
                            <div class="text">
                                <div class="title"><a href="#">
                                    Places I have been </a>
                                </div>
                                <div class="info">
                                    <div class="fav">fav: 15</div>
                                    <div class="view">view: 400</div>
                                </div>
                                <div class="para">
                                    One of the best thing about is the market area. I love walking into a market and explore.
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </thead>
        </table>
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
